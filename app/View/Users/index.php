<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<?php echo $this->Html->css('home'); ?>
<div class="container">
    <div class="row align-items-center header-row">
        <div class="col-md-1 offset-md-8 text-right">
            <?php
            $userData = CakeSession::read('userData');
            if (isset($userData['user_id'])) {
                echo $this->Html->link(
                    'Profile',
                    array(
                        'controller' => 'users',
                        'action' => 'view',
                    ),
                    array('class' => 'btn btn-primary ml-auto custom-btn')
                );
            } else {
                echo 'User data is missing or incomplete.';
            }
            ?>
        </div>
        <div class="col-md-1 text-right">
            <?php
            echo $this->Html->link('Messages', array('controller' => 'messages', 'action' => 'index'), array('class' => 'btn btn-info ml-auto custom-btn'));
            ?>
        </div>
        <div class="col-md-1 text-right">
            <?php
            echo $this->Html->link('Logout', array('controller' => 'users', 'action' => 'logout'), array('class' => 'btn btn-secondary custom-btn'));
            ?>
        </div>
    </div>
    <div class="row">
        <div class="mt-5 welcome-message">
            <h1>Welcome to the Message Board, <?php echo $_SESSION['userData']['name'] ?>!</h1>
        </div>
    </div>
</div>
