<?php 

require_once "../inc_koneksi.php";

//jika tombol simpan ditekan
if (isset($_POST['simpan'])){
    // ambil value elemen yang diposting
    $username   = trim(htmlspecialchars($_POST['username']));
    $nama       = trim(htmlspecialchars($_POST['nama']));
    $level      = $_POST['level'];
    $password   = 1234;
    $pass       = password_hash($password, PASSWORD_DEFAULT);


    //cek username
    $cekusername = mysqli_query($koneksi, "SELECT * FROM users WHERE username = '$username'");
    if (mysqli_num_rows($cekusername) > 0) {
        header("location:add-user.php?msg=cancel");
        return;
    }

    mysqli_query($koneksi, "INSERT INTO users VALUES(null,'$username','$nama','$pass','$level')");

    header("location:add-user.php?msg=added");
    return;
}




?>