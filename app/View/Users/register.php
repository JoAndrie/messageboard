<div class="users form">
<?php echo $this->Form->create('User'); ?>
<fieldset>
    <legend><?php echo __('Add User'); ?></legend>
    <?php 
    echo $this->Form->input('name', array(
        'minlength' => 5,
        'maxlength' => 20,
        'required' => true,
        'class' => 'form-control'
    ));
    echo $this->Form->input('email', array(
        'required' => true,
        'class' => 'form-control'
    ));
    echo $this->Form->input('password', array(
        'label' => 'Password',
        'type' => 'password',
        'required' => true,
        'class' => 'form-control'
    ));
    echo $this->Form->input('password_confirm', array(
        'type' => 'password',
        'label' => 'Confirm Password',
        'required' => true,
        'class' => 'form-control'
    ));
    ?>
    
</fieldset>
<?php
echo $this->Form->end(array('label' => 'Register User', 'class' => 'btn btn-primary'));
echo $this->Html->link('Back to Login', '/', array('class' => 'button'));
?>

</div>