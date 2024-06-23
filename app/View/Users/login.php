<div class="users form">
    <?php echo $this->Flash->render('auth'); ?>
    <?php echo $this->Form->create('User', array('url' => array('controller' => 'users', 'action' => 'login'))); ?>
    <fieldset>
        <legend><?php echo __('Login'); ?></legend>
        <?php
        echo $this->Form->input('email', array(
            'label' => 'Email',
            'required' => true
        ));
        echo $this->Form->input('password', array(
            'label' => 'Password',
            'required' => true,
            'type' => 'password'
        ));
        ?>
    </fieldset>
    <?php echo $this->Form->end(__('Login')); 
    
    echo $this->Html->link('Register', '/users/register', array('class' => 'button'));

    ?>

    
</div>