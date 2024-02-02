<?php

function uploadimg($url = null){
    $namafile   = $_FILES['image']['name'];
    $ukuran     = $_FILES['image']['size'];
    $tmp        = $_FILES['image']['tmp_name'];

    // validasi file gambar yang boleh diupload
    $ekstensiGambarValid    = ['jpg', 'jpeg', 'png', 'gif'];
    $ekstensiGambar         = explode(',', $namafile);
    $ekstensiGambar         = strtolower(end($ekstensiGambar));
    if (!in_array($ekstensiGambar, $ekstensiGambarValid)) {
        if ($url != null) {
            echo '<script>
                alert("file yang anda upload bukan gambar, Data gagal diupdate !");
                document.location.href ="' . $url . '";
            </script>';
            die();
        } else {
            echo '<script>
                alert("file yang anda upload bukan gambar, Data gagal ditambahkan !");
            </script>';
            return false;
        }
    }

    // validasi ukuran gambar max 1 MB
    if ($ukuran > 1000000) {
        if ($url != null) {
            echo '<script>
                alert("Ukuran gambar melebihi 1 MB, Data gagal diupdate !");
                document.location.href ="' . $url . '";
            </script>';
            die();
        } else {
        echo '<script>
                alert("Ukuran gambar tidak boleh melebihi 1 MB");
            </script>';
            return false;
        }
    }

    $namaFileBaru = rand(10, 1000) . '-' . $namafile;

    move_uploaded_file($tmp, '../asset/image/' . $namaFileBaru);
    return $namaFileBaru;
}


function getData($sql) {
    global $koneksi;

    $result = mysqli_query($koneksi, $sql);
    $rows   = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }
    return $rows;
}

function userLogin() {
    $userActive = $_SESSION["ssUser"];
    $dataUser   = getData("SELECT * FROM tbl_user WHERE username = 
    '$userActive'")[0];
    return $dataUser;
}

function userMenu(){
    $uri_path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
    $uri_segments = explode('/', $uri_path);
    $menu = $uri_segments[2];
    return $menu;
}

function menuHome(){
    if (userMenu() == 'dashboard.php') {
        $result = 'active';
    } else {
        $result = null;
    }
    return $result;
}

function menuSetting(){
    if (userMenu() == 'user') {
        $result = 'menu-is-opening menu-open';
    } else {
        $result = null;
    }
    return $result;
}

function menuUser(){
    if (userMenu() == 'user') {
        $result = 'active';
    } else {
        $result = null;
    }
    return $result;
}

function menuMaster() {
    if (userMenu() == 'form_kba' or userMenu() == 'huls' or userMenu() == 'tanggapan') {
        $result = 'menu-is-opening menu-open';
    } else {
        $result = null;
    }
    return $result;
}

function menuForm_kba(){
    if (userMenu() == 'form_kba') {
        $result = 'active';
    } else {
        $result = null;
    }
    return $result;
}

function menuHuls(){
    if (userMenu() == 'huls') {
        $result = 'active';
    } else {
        $result = null;
    }
    return $result;
}

function menuTanggapan(){
    if (userMenu() == 'tanggapan') {
        $result = 'active';
    } else {
        $result = null;
    }
    return $result;
}
?>