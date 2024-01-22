<div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion bg-light" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Home</div>
                        <a class="nav-link" href="<?= $main_url ?>index.php">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>
                        <hr class="mb-0">
                        <div class="sb-sidenav-menu-heading">MAIN MENU</div>
                        <a class="nav-link" href="<?= $main_url ?>user/add-user.php">
                            <div class="sb-nav-link-icon"></div>
                            User
                        </a>
                        <a class="nav-link" href="<?= $main_url ?>index.php">
                            <div class="sb-nav-link-icon"></div>
                            Ganti Password
                        </a>
                        <hr class="mb-0">
                        <div class="sb-sidenav-menu-heading">Data</div>
                        <a class="nav-link" href="<?= $main_url ?>index.php">
                            <div class="sb-nav-link-icon"></div>
                            Master Data
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                <!-- <i class="fa-solid fa-minus"></i> -->
                                <p>Obyek Investigasi</p>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                <!-- <i class="far fa-circle nav-icon text-sm"></i> -->
                                <p>Hasil Pemeriksaan</p>
                                </a>
                            </li>
                        </ul>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                <!-- <i class="far fa-circle nav-icon text-sm"></i> -->
                                <p>Keterangan</p>
                                </a>
                            </li>
                        </ul>
                        <a class="nav-link" href="<?= $main_url ?>index.php">
                            <div class="sb-nav-link-icon"></div>
                            Laporan
                        </a>
                        <hr class="mb-0">
                    </div>
                </div>
                <div class="sb-sidenav-footer border">
                    <div class="small">Logged in as:</div>
                    <?= "Admin"?>
                </div>
            </nav>
        </div>