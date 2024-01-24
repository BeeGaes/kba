<?php

 function insert($data){
     global $koneksi;

    $username    = strtolower(mysqli_real_escape_string($koneksi, $data['username']));
    $name        = mysqli_real_escape_string($koneksi, $data['nama']);
    $password    = mysqli_real_escape_string($koneksi, $data['password']);
    $password2   = mysqli_real_escape_string($koneksi, $data['password2']);
    $level       = mysqli_real_escape_string($koneksi, $data['level']);

    if ($password !== $password2) {
        echo "<script>
                alert('konfirmasi password tidak sesuai, user baru gagal diregistrasi !');
            </script>";
        return false;
    }

    $pass = password_hash($password, PASSWORD_DEFAULT);

    $cekusername = mysqli_query($koneksi, "SELECT username FROM users WHERE username = '$username'");
    if (mysqli_num_rows($cekusername) > 0) {
        echo "<script>
                alert('username sudah terpakai, user baru gagal diregistrasi !');
            </script>";
        return false;
    }

    $sqlUser = "INSERT INTO users value (null, '$username', '$name', '$pass', '$level')";
    mysqli_query($koneksi, $sqlUser);

    return mysqli_affected_rows($koneksi);
 }
?>