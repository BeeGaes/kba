<?php 

require_once "../inc_koneksi.php";

$keluhan_bahan_awal = mysqli_query($koneksi, "SELECT * FROM formulir_KBA WHERE id = 1");
// $data = mysqli_fetch_array($keluhan_bahan_awal);
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - Keluhan Bahan Awal</title>
        <link href="<?= $main_url ?>asset/sb-admin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container mt-5">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                        <form action="proceslogin.php" method="POST">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="username" name="username" type="text" pattern="[A-Za-z0-9]{3,}" title="kombinasi angka dan huruf minimal 3 karakter" placeholder="username" autocomplete="off" required />
                                                <label for="username">Username</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" type="password" placeholder="Password" minlength="4" name="password" required/>
                                                <label for="inputPassword">Password</label>
                                            </div>
                                            <button type="submit" name="login" class="btn btn-primary col-12 rounded-pill my-2">Login</button>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="text-muted small">Copyright &copy; Keluhan Bahan Awal <?= date("Y") ?></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<?= $main_url ?>asset/sb-admin/js/scripts.js"></script>
    </body>
</html>
