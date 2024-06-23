<?php
App::uses('AppController', 'Controller');
App::uses('BlowfishPasswordHasher', 'Controller/Component/Auth');

class UsersController extends AppController
{

    public $components = array('Session', 'Flash');


    public function beforeFilter(){
        parent::beforeFilter();
        $this->Auth->allow('register', 'logout', 'register_success', 'users');
    }

	public function login(){
		if ($this->request->is('post')) {
			if ($this->Auth->login()) {
				$user = $this->Auth->user();
				$this->User->id = $user['user_id'];
				$this->User->saveField('last_login_time', date('Y-m-d H:i:s'));
	
				$userData = $this->User->find('first', array(
					'conditions' => array('User.user_id' => $user['user_id'])
				));
				$this->Session->write('userData', $userData['User']);
				$this->redirect($this->Auth->redirectUrl('index'));
			} else {
				$this->Flash->error(__('Invalid username or password, try again'));
			}
		}
	}
		
    public function logout(){
        $this->Session->destroy();
        return $this->redirect($this->Auth->logout());
    }

    public function index(){
        $this->User->recursive = 0;
        $this->set('users', $this->paginate());
    }

    public function view($id = null) {
		$this->set('user', $this->User->find('first', array(
			'conditions' => array('User.user_id' => $id)
		)));
	}
	
    public function register() {
		if ($this->request->is('post')) {
			$this->User->create();
			$data = $this->request->data;
			$data['User']['last_login_time'] = date('Y-m-d H:i:s');
	
			if ($this->User->save($data)) {
				$user_id = $this->User->id;
				$user = $this->User->find('first', array(
					'conditions' => array('User.user_id' => $user_id)
				));
	
				$this->Auth->login($user['User']);
				$this->Session->write('userData', $user['User']);
				$this->Flash->success(__('The user has been saved'));
				return $this->redirect(array('controller' => 'users', 'action' => 'success_register', $user_id));
			} else {
				$this->Flash->error(__('The user could not be saved. Please, try again.'));
			}
		}
	}
	

    public function success_register($user_id){

    }

    public function delete($id = null){
        $this->autoRender = false;
        $this->request->allowMethod('post');
        $this->User->id = $id;
        if (!$this->User->exists()) {
            throw new NotFoundException(__('Invalid user'));
        }
        if ($this->User->delete()) {
            $this->Flash->success(__('User deleted'));
            return $this->redirect(array('action' => 'index'));
        }
        $this->Flash->error(__('User was not deleted'));
        return $this->redirect(array('action' => 'index'));
    }

    public function unique_email(){
        $this->autoRender = false;
        if ($this->request->is('ajax')) {
            $email = $this->request->data['email'];
            $this->loadModel('User');
            
            try {
                $isUnique = $this->User->isUnique(array('email' => $email));
    
                $this->response->body(json_encode(['unique' => $isUnique]));
                $this->response->type('json');
            } catch (Exception $e) {
                $this->response->body(json_encode(['error' => $e->getMessage()]));
                $this->response->type('json');
            }
        }
    }
    
    public function update_email(){
        $this->autoRender = false;
        if ($this->request->is('ajax')) {
            if (!isset($this->request->data['user_id'])) {
                $response = ['success' => false, 'message' => 'User ID not provided'];
            } else {
                $id = $this->request->data['user_id'];
                $newEmail = $this->request->data['email'];
                
                $this->loadModel('User');
                $this->User->id = $id;
                
                try {
                    if (!$this->User->exists()) {
                        throw new NotFoundException(__('Invalid user'));
                    }
                    
                    if ($this->User->saveField('email', $newEmail)) {
                        $response = ['success' => true, 'email' => $newEmail]; // Include updated email in response
                    } else {
                        throw new Exception('Unable to update email');
                    }
                } catch (NotFoundException $e) {
                    $response = ['success' => false, 'message' => $e->getMessage()];
                } catch (Exception $e) {
                    $response = ['success' => false, 'message' => $e->getMessage()];
                }
            }
            
            $this->response->body(json_encode($response));
            $this->response->type('json');
        }
    }
    
    
    
    public function check_password(){
        $this->autoRender = false;
        if ($this->request->is('ajax')) {
            $id = $this->request->data['user_id'];
            $password = $this->request->data['password'];
    
            $this->loadModel('User');
            $user = $this->User->find('first', array(
                'conditions' => array(
                    'User.user_id' => $id,
                    'User.is_inactive' => 0
                )
            ));
    
            $isValid = false;
            if ($user) {
                $hasher = new BlowfishPasswordHasher();
                $isValid = $hasher->check($password, $user['User']['password']);
            }
    
            $this->response->body(json_encode(['valid' => $isValid]));
            $this->response->type('json');
        }
    }
    
    
    public function change_password(){
        $this->autoRender = false;
        $hasher = new BlowfishPasswordHasher();
        $password = $hasher->hash($this->request->data['password']);
        $user_id = $this->request->data['user_id'];
    
        $conditions = array(
            'User.user_id' => $user_id,
            'User.is_inactive' => 0
        );
        $data = array('User.password' => "'" . $password . "'");
        $this->User->updateAll($data, $conditions);
    
        if ($this->User->getAffectedRows() > 0) {
            $this->response->body(json_encode(['success' => true]));
        } else {
            $this->response->body(json_encode(['success' => false, 'message' => 'Password update failed']));
        }
        $this->response->type('json');
    }
    
    

    public function save_image() {
        $this->autoRender = false;
        if (!empty($this->request->form['image'])) {
            $file = $this->request->form['image'];
            if ($file['error'] === UPLOAD_ERR_OK) {
                $uploadDir = WWW_ROOT . 'img' . DS . 'profile_pic' . DS;
                $filename = uniqid() . '_' . $file['name'];
                $targetPath = $uploadDir . $filename;
                if (!is_dir($uploadDir)) {
                    mkdir($uploadDir, 0777, true);
                }
                if (move_uploaded_file($file['tmp_name'], $targetPath)) {
                    $imageURL = '/img/profile_pic/' . $filename;
                    $user_id = $this->Auth->user('user_id');
                    
                    $this->User->id = $user_id;
                    if ($this->User->exists()) {
                        if ($this->User->saveField('img_url', $imageURL)) {
                            $this->Session->write('userData.img_url', $imageURL);
                            echo json_encode(array('status' => 'success', 'message' => 'Image uploaded successfully', 'imageURL' => $imageURL));
                        } else {
                            echo json_encode(array('status' => 'error', 'message' => 'Failed to save image URL to the database'));
                        }
                    } else {
                        echo json_encode(array('status' => 'error', 'message' => 'User does not exist'));
                    }
                } else {
                    echo json_encode(array('status' => 'error', 'message' => 'Failed to move image to target directory'));
                }
            } else {
                echo json_encode(array('status' => 'error', 'message' => 'Failed to upload image', 'error_code' => $file['error']));
            }
        } else {
            echo json_encode(array('status' => 'error', 'message' => 'No image provided'));
        }
    }
    

    public function update() {
        $this->autoRender = false;
        if ($this->request->is('post')) {
            $userData = $this->request->data;
            $conditions = array('User.user_id' => $userData['user_id']);
            $fields = array(
                'name' => "'" . $userData['name'] . "'",
                'birthdate' => "'" . $userData['birthdate'] . "'",
                'gender' => "'" . $userData['gender'] . "'",
                'hobby' => "'" . $userData['hobby'] . "'",
            );
            if ($this->User->updateAll($fields, $conditions)) {
                $this->Session->write('userData.name', $userData['name']);
                $this->Session->write('userData.birthdate', $userData['birthdate']);
                $this->Session->write('userData.gender', $userData['gender']);
                $this->Session->write('userData.hobby', $userData['hobby']);
                echo json_encode(array('status' => 'success', 'message' => 'Profile updated successfully'));
            } else {
                echo json_encode(array('status' => 'error', 'message' => 'Profile update failed'));
            }
        }
    }    

    public function get_users(){
        $this->autoRender = false;
        if ($this->request->is('ajax')) {
            $term = $this->request->query('term');
            $user_id = $_SESSION['userData']['user_id'];
            $result = $this->User->query(
                "SELECT user_id AS id, name AS text, img_url FROM users WHERE (email LIKE ? OR name LIKE ?) AND user_id <> ?",
                array("%$term%", "%$term%", $user_id)
            );
            $response = [];
            foreach ($result as $user) {
                $response[] = [
                    'id' => $user['users']['id'],
                    'text' => $user['users']['text'],
                    'img_url' => $user['users']['img_url']
                ];
            }
            $this->response->type('json');
            echo json_encode(['users' => $response]);
        }
    }
}