<?php
/**
 * Routes configuration
 *
 * In this file, you set up routes to your controllers and their actions.
 * Routes are very important mechanism that allows you to freely connect
 * different URLs to chosen controllers and their actions (functions).
 *
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link          https://cakephp.org CakePHP(tm) Project
 * @package       app.Config
 * @since         CakePHP(tm) v 0.2.9
 * @license       https://opensource.org/licenses/mit-license.php MIT License
 */
 
/**
 * Here, we are connecting '/' (base path) to controller called 'Pages',
 * its action called 'display', and we pass a param to select the view file
 * to use (in this case, /app/View/Pages/home.ctp)...
 */
	Router::connect('/', array('controller' => 'users', 'action' => 'login'));
	Router::connect('/users/view/*', array('controller' => 'users', 'action' => 'view'));
	Router::connect('/users/unique_email', array('controller' => 'users', 'action' => 'unique_email'));
	Router::connect('/users/update_email', array('controller' => 'users', 'action' => 'update_email'));
	Router::connect('/users/check_password', array('controller' => 'users', 'action' => 'check_password'));
	Router::connect('/users/change_password', array('controller' => 'users', 'action' => 'change_password'));
	Router::connect('/users/save_image', array('controller' => 'users', 'action' => 'save_image'));
	Router::connect('/users/edit', array('controller' => 'users', 'action' => 'edit'));
	Router::connect('/users/update', array('controller' => 'users', 'action' => 'update'));
	Router::connect('/users/get_users', array('controller' => 'users', 'action' => 'get_users'));

	Router::connect('/messages', array('controller' => 'messages', 'action' => 'index'));
	Router::connect('/send_message', array('controller' => 'messages', 'action' => 'send_mssage'));
	Router::connect('/add_message', array('controller' => 'messages', 'action' => 'send_message'));
	Router::connect('/delete_message', array('controller' => 'messages', 'action' => 'delete_message'));
	Router::connect('/message_thread', array('controller' => 'messages', 'action' => 'message_thread'));
	Router::connect('/delete_message_thread', array('controller' => 'messages', 'action' => 'delete_message_thread'));
	Router::connect('/messages/get_messages', array('controller' => 'messages', 'action' => 'get_messages'));
	Router::connect('/search_message', array('controller' => 'messages', 'action' => 'search_message'));
	Router::connect('/show_more_messages', array('controller' => 'messages', 'action' => 'show_more_messages'));


	
/**
 * ...and connect the rest of 'Pages' controller's URLs.
 */
	

/**
 * Load all plugin routes. See the CakePlugin documentation on
 * how to customize the loading of plugin routes.
 */
	CakePlugin::routes();

/**
 * Load the CakePHP default routes. Only remove this if you do not want to use
 * the built-in default routes.
 */
	require CAKE . 'Config' . DS . 'routes.php';
