<?php

require_once "../inc_koneksi.php";

$title = "Formulir Keluhan Bahan Awal";
require_once "../template/header.php";
require_once "../template/navbar.php";
require_once "../template/sidebar.php";

if (isset($_GET['msg'])) {
    $msg = $_GET['msg'];
} else {
    $msg = '';
}


?>
<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">Formulir Keluhan Bahan Awal</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="../index.php">Home</a></li>
                <li class="breadcrumb-item active">Formulir KbA</li>
            </ol>
            <form action="proses-form-kba.php" method="POST" enctype="multipart/form-data">
                <?php
                    if ($msg !== '') {
                        echo $alert;
                    }
                ?>

    <?php
    require_once "template/footer.php";
?>
