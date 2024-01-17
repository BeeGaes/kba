<?php
$host = "localhost";
$user = "root";
$pass ="";
$db ="kba";

$koneksi = mysqli_connect($host,$user,$pass,$db);
// if(!$koneksi){
//     die("Gagal terkoneksi");
// }else{
//     echo ("Koneksi berhasil");
// }

// url induk
$main_url = "http://localhost/Keluhan_Bahan_Awal/";