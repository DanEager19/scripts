<?php 
    require './model/db.php';
    require './model/mailing.php';
    $db = new DB;
    $db->createTable();
    if(isset($_POST['action'])) {
        $action = filter_input(INPUT_POST, 'action');
    } elseif (isset($_GET['action'])) {
        $action = filter_input(INPUT_POST, 'action');
    } else {
        $action = 'list-mailing';
    }

    if ($action === 'list-mailing') {
        $mailings = $db->readAll();
        $pageTitle = 'List Mailing';
        include 'view/list.php';
    } elseif ($action === 'show-create-mailing') {
        $pageTitle = 'Create Mailing';
        include 'view/create.php';
    } elseif($action === 'create-mailing') {
        $Address = filter_input(INPUT_POST, 'address');
        $City = filter_input(INPUT_POST, 'city');
        $State = filter_input(INPUT_POST, 'state');
        $Zipcode = filter_input(INPUT_POST, 'zipcode');
        $mailing = new Mailing($Address, $City, $State, $Zipcode);
        $db->create($mailing);
        $pageTitle = 'List Mailing';
        header('Location:.');
    } elseif ($action === 'show-update-mailing') {
        $pageTitle = 'Update Mailing';
        $id = filter_input(INPUT_POST, 'ID');
        $mailing = $db->read($id);
        include 'view/update.php';
    } elseif($action === 'update-mailing') {
        $id = filter_input(INPUT_POST, 'ID');
        $Address = filter_input(INPUT_POST, 'address');
        $City = filter_input(INPUT_POST, 'city');
        $State = filter_input(INPUT_POST, 'state');
        $Zipcode = filter_input(INPUT_POST, 'zipcode');
        $mailing = new Mailing($Address, $City, $State, $Zipcode);
        $mailing->setId($id);
        $db->update($mailing);
        $pageTitle = 'List Mailing';
        header('Location:.');
    } elseif ($action === 'show-delete-mailing') {
        $pageTitle = 'Delete Mailing';
        $id = filter_input(INPUT_POST, 'ID');
        $mailing = $db->read($id);
        include 'view/delete.php';
    } elseif ($action === 'delete-mailing') {
        $id = filter_input(INPUT_POST, 'ID');
        $mailing = $db->delete($id);
        $mailings = $db->readAll();
        $pageTitle = 'List Mailing';
        header('Location:.');
    }