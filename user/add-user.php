<?php

require_once "../inc_koneksi.php";

$title = "Tambah User";
require_once "../template/header.php";
require_once "../template/navbar.php";
require_once "../template/sidebar.php";

if (isset($_GET['msg'])) {
    $msg = $_GET['msg'];
} else {
    $msg = '';
}

$alert = '';
if ($msg = 'cancel') {
    $alert = '<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <i class="fa-solid fa-xmark"></i> Tambah user gagal, username sudah ada..
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>';
}

?>

<div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">Tambah User</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="../index.php">Home</a></li>
                <li class="breadcrumb-item active">Tambah User</li>
            </ol>
            <form action="proses-user.php" method="POST" enctype="multipart/form-data">
                <?php
                    if ($msg !== '') {
                        echo $alert;
                    }
                ?>
                <div class="card">
                    <div class="card-header">
                        <span class="h5 my-2"><i class="fa-solid fa-square-plus"></i> Tambah User</span>
                        <button type="submit" name="simpan" class="btn btn-primary float-end"><i
                                class="fa-solid fa-floppy-disk"></i> Simpan</button>
                        <button type="reset" name="reset" class="btn btn-danger float-end me-1"><i
                                class="fa-solid fa-xmark"></i> Reset</button>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-8">
                                <div class="mb-3 row">
                                    <label for="username" class="col-sm-2 col-form-label">Username</label>
                                    <label for="" class="col-sm-1 col-form-label">:</label>
                                    <div class="col-sm-9" style="margin-left: -50px;">
                                        <input type="text" pattern="[A-Za-z0-9]{3,}"
                                            title="minimal 3 karakter kombinasi huruf besar huruf kecil dan angka"
                                            class="form-control border-0 border-bottom" id="username" name="username"
                                            maxlength="20">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="username" class="col-sm-2 col-form-label">Nama</label>
                                    <label for="" class="col-sm-1 col-form-label">:</label>
                                    <div class="col-sm-9" style="margin-left: -50px;">
                                        <input type="text" class="form-control border-0 border-bottom" id="nama"
                                            name="nama" maxlength="50">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="username" class="col-sm-2 col-form-label">Level</label>
                                    <label for="" class="col-sm-1 col-form-label">:</label>
                                    <div class="col-sm-9" style="margin-left: -50px;">
                                        <select name="level" id="level" class="form-select border-0 border-bottom">
                                            <option value="" selected>--Pilih Level--</option>
                                            <option value="Petugas Sampling">Petugas Sampling</option>
                                            <option value="Asman Lab">Asman Lab</option>
                                            <option value="Analis Lab">Analis Lab</option>
                                            <option value="Manager QC">Manager QC</option>
                                            <option value="GM QA">GM QA</option>
                                            <option value="GM QC">GM QC</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
    </main>
</div>


<?php

require_once "../template/footer.php";

?>