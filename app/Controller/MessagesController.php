<?php
App::uses('AppController', 'Controller');

class MessagesController extends AppController
{
    public function index()
    {
        $messages = $this->Message->find('all');
        $this->set('messages', $messages);
    }

    public function view()
    {
        $this->loadModel('MessageThread');
        $messageThreadId = $this->request->query['messageThreadId'];
        $messages = $this->MessageThread->query("
            SELECT mt.*, m.*,DATE_FORMAT(m.created, '%M %e, %Y %h:%i %p') AS formatted_created_date, sender.*, receiver.*
            FROM message_thread AS mt 
            JOIN messages m 
            ON m.message_thread_id = mt.message_thread_id
            JOIN users AS sender
            ON sender.user_id = m.sender_id
            JOIN users AS receiver
            ON receiver.user_id = m.receiver_id
            WHERE mt.message_thread_id = $messageThreadId
            AND mt.is_deleted = 0 
            AND m.is_deleted = 0 
            ORDER BY m.message_id DESC
            LIMIT 5 
            OFFSET 0
            ");
        $message_thread = $this->MessageThread  ->query("
            SELECT mt.*, user_1.*, user_2.* 
            FROM message_thread AS mt
            JOIN users AS user_1
            ON mt.user_id_1 = user_1.user_id
            JOIN users AS user_2
            ON mt.user_id_2 = user_2.user_id 
            WHERE mt.message_thread_id = $messageThreadId 
            AND mt.is_deleted = 0
            AND user_1.is_inactive = 0
            AND user_2.is_inactive = 0
            ");
        $this->set('message_thread', $message_thread);
        $this->set('messages', $messages);
    }
        

    public function send_message()
    {
        $this->autoRender = false;
        $response = ['status' => 'error', 'message' => 'Invalid request'];
    
        if ($this->request->is('post')) {
            $this->loadModel('MessageThread');
            $this->loadModel('Message');
    
            $senderId = $this->request->data['sender_id'];
            $receiverId = $this->request->data['receiver_id'];
    
            if (!$senderId || !$receiverId) {
                $response['message'] = 'Sender and receiver IDs are required';
                $this->response->body(json_encode($response));
                return;
            }
    
            $existingThread = $this->MessageThread->find('first', [
                'conditions' => [
                    'OR' => [
                        ['MessageThread.user_id_1' => $senderId, 'MessageThread.user_id_2' => $receiverId],
                        ['MessageThread.user_id_1' => $receiverId, 'MessageThread.user_id_2' => $senderId],
                    ],
                    'MessageThread.is_deleted' => 0
                ]
            ]);
    
            $messageData = [
                'sender_id' => $senderId,
                'receiver_id' => $receiverId,
                'message_content' => $this->request->data['message_content'],
                'created' => date('Y-m-d H:i:s'),
                'is_deleted' => 0
            ];
    
            if ($existingThread) {
                $messageData['message_thread_id'] = $existingThread['MessageThread']['message_thread_id'];
            } else {
                $this->MessageThread->create();
                if ($this->MessageThread->save([
                    'user_id_1' => $senderId,
                    'user_id_2' => $receiverId,
                    'created' => date('Y-m-d H:i:s'),
                    'is_deleted' => 0
                ])) {
                    $messageData['message_thread_id'] = $this->MessageThread->getLastInsertId();
                } else {
                    $response['message'] = 'Failed to create a new message thread';
                    $this->response->body(json_encode($response));
                    return;
                }
            }
    
            $this->Message->create();
            if ($this->Message->save($messageData)) {
                $response = [
                    'status' => 'success',
                    'message' => $existingThread ? 'Message added to the existing thread' : 'New message thread and message created',
                    'message_id' => $this->Message->getLastInsertId()
                ];
            } else {
                $response['message'] = 'Failed to save the message';
            }
        }
    
        $this->response->type('json');
        $this->response->body(json_encode($response));
    }

    public function message_thread()
    {
        $this->autoRender = false;
        $this->loadModel('MessageThread');
        $userID = $_SESSION['userData']['user_id'];
        $thread_limit = 5;
        $threadCount = isset($this->request->data['threadCount']) ? $this->request->data['threadCount'] : 0;
        $results = $this->MessageThread->query("
            SELECT MessageThread.message_thread_id, LatestMessage.*, Sender.*, Receiver.*
            FROM message_thread AS MessageThread
                LEFT JOIN (
                SELECT message_thread_id, MAX(created) AS latest_created
                FROM messages
                WHERE messages.is_deleted = 0
                GROUP BY message_thread_id
            ) AS LatestMessages
            ON MessageThread.message_thread_id = LatestMessages.message_thread_id
            LEFT JOIN messages AS LatestMessage
            ON LatestMessages.message_thread_id = LatestMessage.message_thread_id
            AND LatestMessages.latest_created = LatestMessage.created
            LEFT JOIN users AS Sender
            ON LatestMessage.sender_id = Sender.user_id
            LEFT JOIN users AS Receiver
            ON LatestMessage.receiver_id = Receiver.user_id
            WHERE MessageThread.user_id_1 = $userID OR MessageThread.user_id_2 = $userID
            GROUP BY MessageThread.message_thread_id
            HAVING LatestMessage.message_id IS NOT NULL
            ORDER BY LatestMessage.message_id DESC
            LIMIT $thread_limit
            OFFSET $threadCount;
            ");
        $this->response->type('json');
        $this->response->body(json_encode($results));
    }

    public function delete_message()
    {
        $this->autoRender = false;
        if ($this->request->is('post')) {
            $this->loadModel('Message');
            $messageId = $this->request->data['message_id'];

            $this->Message->id = $messageId;
            if ($this->Message->saveField('is_deleted', 1)) {
                echo "success";
            } else {
                echo "error";
            }
        } else {
            echo "error";
        }
    }

    public function delete_message_thread()
    {
        $this->autoRender = false;
        if ($this->request->is('ajax')) {
            $this->loadModel('MessageThread');
            $messageThreadId = $this->request->data['message_thread_id'];

            $messagesResult = $this->Message->updateAll( // Corrected model name to 'Message'
                ['Message.is_deleted' => 1],
                ['Message.message_thread_id' => $messageThreadId]
            );

            $messageThreadResult = $this->MessageThread->updateAll(
                ['MessageThread.is_deleted' => 1],
                ['MessageThread.message_thread_id' => $messageThreadId]
            );

            if ($messagesResult && $messageThreadResult) {
                $response = ['status' => 'success', 'message' => 'Message thread and associated messages deleted successfully'];
            } else {
                $response = ['status' => 'error', 'message' => 'Failed to delete message thread and associated messages'];
            }

            $this->response->type('json');
            $this->response->body(json_encode($response));
        }
    }

    public function search_message()
    {
        $this->autoRender = false;
        if ($this->request->is('ajax')) {
            $this->loadModel('Message');
            $messageThreadId = $this->request->data['message_thread_id'];
            $search = $this->request->data['search'];

            $results = $this->Message->query("
                SELECT m.*, u1.name AS sender_name, DATE_FORMAT(m.created, '%M %e, %Y %l:%i%p') AS formatted_created_date
                FROM messages m
                JOIN users u1 ON m.sender_id = u1.user_id
                WHERE m.message_content LIKE ? AND m.message_thread_id = ? AND m.is_deleted = 0
            ", ['%' . $search . '%', $messageThreadId]);

            $this->response->type('json');
            $this->response->body(json_encode($results));
        } else {
            echo "Invalid Request";
        }
    }

    public function show_more_messages() {
        $this->autoRender = false;
    
        if ($this->request->is('ajax')) {
            try {
                $this->loadModel('MessageThread');
    
                $messageThreadId = $this->request->data['message_thread_id'];
                $bubbleNum = $this->request->data['numberOfBubbles'];
                $messageLimit = 10;
    
                $messages = $this->MessageThread->query("
                    SELECT mt.*, m.*, DATE_FORMAT(m.created, '%M %e, %Y %h:%i %p') AS formatted_created_date, sender.*, receiver.*,
                    CASE WHEN (
                        SELECT COUNT(*) 
                        FROM messages AS inner_m
                        WHERE inner_m.message_thread_id = mt.message_thread_id AND inner_m.is_deleted = 0
                    ) > $bubbleNum + $messageLimit THEN 1 ELSE 0 END AS moreMessages
                    FROM message_thread AS mt 
                    JOIN messages AS m ON m.message_thread_id = mt.message_thread_id
                    JOIN users AS sender ON sender.user_id = m.sender_id
                    JOIN users AS receiver ON receiver.user_id = m.receiver_id
                    WHERE mt.message_thread_id = $messageThreadId
                    AND mt.is_deleted = 0 
                    AND m.is_deleted = 0 
                    ORDER BY m.message_id DESC
                    LIMIT $messageLimit
                    OFFSET $bubbleNum
                ",);
    
                $this->response->body(json_encode($messages));
                $this->response->type('json');
            } catch (Exception $e) {
                $this->response->statusCode(500);
                $this->response->body(json_encode(['error' => $e->getMessage()]));
                $this->response->type('json');
            }
        } else {
            $this->response->statusCode(400);
            $this->response->body('Invalid Request');
            $this->response->type('text/plain');
        }
    }
}
