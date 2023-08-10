<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!--Counter Inbox-->

        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">Menu Utama</li>
            <li class="<?php if ($this->uri->segment(2) == "dashboard") {
                            echo "active";
                        } ?>">
                <a href="<?php echo base_url() . 'admin/dashboard' ?>">
                    <i class="fa fa-home"></i> <span>Dashboard</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>
            <li class="treeview <?= ($this->uri->segment(2) == "penduduk") ? "active":'' ?>">
                <a href="#">
                    <i class="fa fa-server"></i>
                    <span>Master Data</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li class="<?php echo $this->uri->segment(2) == 'penduduk' ? 'active' : '' ?>">
                        <a href="<?php echo base_url() . 'admin/penduduk' ?>"><i class="fa fa-users"></i> Data Penduduk</a>
                    </li>
                </ul>
            </li>
            <li class="treeview <?php if ($this->uri->segment(2) == "profil" || $this->uri->segment(2) == "sambutan" || $this->uri->segment(2) == "visimisi" || $this->uri->segment(2) == "struktur" || $this->uri->segment(2) == "pegawai" || $this->uri->segment(2) == "desa") {
                                    echo "active";
                                } ?>">
                <a href="#">
                    <i class="fa fa-cog"></i>
                    <span>Profil</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li class="<?php echo $this->uri->segment(2) == 'sambutan' ? 'active' : '' ?>">
                        <a href="<?php echo base_url() . 'admin/sambutan' ?>"><i class="fa fa-user"></i> Sambutan Kepala Desa</a>
                    </li>
                    <li class="<?php echo $this->uri->segment(2) == 'visimisi' ? 'active' : '' ?>">
                        <a href="<?php echo base_url() . 'admin/visimisi' ?>"><i class="fa fa-thumb-tack"></i> Visi dan
                            Misi</a>
                    </li>
                    <li class="<?php if ($this->uri->segment(2) == "statistikpenduduk") {
                                    echo "active";
                                } ?>">
                        <a href="<?php echo base_url() . 'admin/statistikpenduduk' ?>"><i class="fa fa-bar-chart"></i> Statistik Penduduk</a>
                    </li>
                </ul>
            </li>
            <li class="treeview <?php if ($this->uri->segment(2) == "profil" || $this->uri->segment(2) == "sambutan" || $this->uri->segment(2) == "visimisi" || $this->uri->segment(2) == "struktur" || $this->uri->segment(2) == "pegawai" || $this->uri->segment(2) == "desa") {
                                    echo "active";
                                } ?>">
                <a href="#">
                    <i class="fa fa-university"></i>
                    <span>Pemerintahan</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li class="<?php if ($this->uri->segment(2) == "struktur") {
                                    echo "active";
                                } ?>">
                        <a href="<?php echo base_url() . 'admin/struktur' ?>"><i class="fa fa-sitemap"></i> Strukutur
                            Organisasi</a>
                    </li>
                    <li class="<?php if ($this->uri->segment(2) == "pegawai") {
                                    echo "active";
                                } ?>">
                        <a href="<?php echo base_url() . 'admin/pegawai' ?>"><i class="fa fa-users"></i> Data
                            Pegawai</a>
                    </li>
                    <li class="<?php if ($this->uri->segment(2) == "desa") {
                                    echo "active";
                                } ?>">
                        <a href="<?php echo base_url() . 'admin/desa' ?>"><i class="fa fa-flag"></i> RT / RW </a>
                    </li>
                    <li class="<?php if ($this->uri->segment(2) == "apbd") {
                                    echo "active";
                                } ?>">
                        <a href="<?php echo base_url() . 'admin/apbdes' ?>"><i class="fa fa-money"></i> APBDES</a>
                    </li>
                </ul>
            </li>
            <li class="treeview <?php if ($this->uri->segment(2) == "berita" || $this->uri->segment(2) == "kategori") {
                                    echo "active";
                                } ?>">
                <a href="#">
                    <i class="fa fa-newspaper-o"></i>
                    <span>Berita</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li class="<?php if ($this->uri->segment(2) == "berita" && $this->uri->segment(3) == null) {
                                    echo "active";
                                } ?>">
                        <a href="<?php echo base_url() . 'admin/berita' ?>"><i class="fa fa-list"></i> List Berita</a>
                    </li>
                    <li class="<?php if ($this->uri->segment(3) == "add_berita") {
                                    echo "active";
                                } ?>"><a href="<?php echo base_url() . 'admin/berita/add_berita' ?>"><i class="fa fa-thumb-tack"></i>
                            Post
                            Berita</a></li>
                    <li class="<?php if ($this->uri->segment(2) == "kategori") {
                                    echo "active";
                                } ?>"><a href="<?php echo base_url() . 'admin/kategori' ?>"><i class="fa fa-wrench"></i> Kategori</a>
                    </li>
                </ul>
            </li>
            <li class="treeview <?php if ($this->uri->segment(2) == "potensi") {
                                    echo "active";
                                } ?>">
                <a href="#">
                    <i class="fa fa-map-signs"></i>
                    <span>Potensi</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li class="<?php if ($this->uri->segment(2) == "potensi" && $this->uri->segment(3) == null) {
                                    echo "active";
                                } ?>">
                        <a href="<?php echo base_url() . 'admin/potensi' ?>"><i class="fa fa-list"></i> List Potensi</a>
                    </li>
                    <li class="<?php if ($this->uri->segment(3) == "add_potensi") {
                                    echo "active";
                                } ?>"><a href="<?php echo base_url() . 'admin/potensi/add_potensi' ?>"><i class="fa fa-globe"></i>
                            Post Potensi</a>
                    </li>
                </ul>
            </li>

            <li class="treeview <?php if ($this->uri->segment(2) == "identitas" || $this->uri->segment(2) == "waktu" || $this->uri->segment(2) == "slider" || $this->uri->segment(2) == "socmed") {
                                    echo "active";
                                } ?>">
                <a href="#">
                    <i class="fa fa-fort-awesome"></i>
                    <span>Identitas</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li class="<?php if ($this->uri->segment(2) == "identitas") {
                                    echo "active";
                                } ?>"><a href="<?php echo base_url() . 'admin/identitas' ?>"><i class="fa fa-list"></i>Identitas
                            Desa</a></li>
                    <li class="<?php if ($this->uri->segment(2) == "waktu") {
                                    echo "active";
                                } ?>"><a href="<?php echo base_url() . 'admin/waktu' ?>"><i class="fa fa-clock-o"></i>Waktu Buka</a>
                    </li>
                    <li class="<?php if ($this->uri->segment(2) == "slider") {
                                    echo "active";
                                } ?>"><a href="<?php echo base_url() . 'admin/slider' ?>"><i class="fa fa-image"></i>Slider</a></li>
                    <li class="<?php if ($this->uri->segment(2) == "socmed") {
                                    echo "active";
                                } ?>"><a href="<?php echo base_url() . 'admin/socmed' ?>"><i class="fa fa-link"></i>Social Media</a>
                    </li>


                </ul>
            </li>


            <li class="<?php if ($this->uri->segment(2) == "penggunalayanansurat") {
                            echo "active";
                        } ?>">
                <a href="<?php echo base_url() . 'admin/penggunalayanansurat' ?>">
                    <i class="fa fa-users"></i> <span>Pengguna Layanan Surat</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>

            <li class="<?php if ($this->uri->segment(2) == "layanansurat") {
                            echo "active";
                        } ?>">
                <a href="<?php echo base_url() . 'admin/layanansurat' ?>">
                    <i class="fa fa-envelope"></i> <span>Layanan Surat</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>

            <li class="<?php if ($this->uri->segment(2) == "pengaturanlayanansurat") {
                            echo "active";
                        } ?>">
                <a href="<?php echo base_url() . 'admin/pengaturanlayanansurat' ?>">
                    <i class="fa fa-cog"></i> <span>Pengaturan Layanan Surat</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>


            <li class="<?php if ($this->uri->segment(2) == "pengaduanmasyarakat") {
                            echo "active";
                        } ?>">
                <a href="<?php echo base_url() . 'admin/pengaduanmasyarakat' ?>">
                    <i class="fa fa-file-text"></i> <span>Pengaduan Masyarakat</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>

            <li class="<?php if ($this->uri->segment(2) == "agenda") {
                            echo "active";
                        } ?>">
                <a href="<?php echo base_url() . 'admin/agenda' ?>">
                    <i class="fa fa-calendar"></i> <span>Agenda</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>
            <!-- //Pegawai -->
            <li class="<?php if ($this->uri->segment(2) == "pegawai") {
                            echo "active";
                        } ?>">
                <a href="<?php echo base_url() . 'admin/pegawai_c' ?>">
                    <i class="fa fa-users"></i> <span>Pegawai</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>

            <li class="<?php if ($this->uri->segment(2) == "pengumuman") {
                            echo "active";
                        } ?>">
                <a href="<?php echo base_url() . 'admin/pengumuman' ?>">
                    <i class="fa fa-volume-up"></i> <span>Pengumuman</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>

            <li class="<?php if ($this->uri->segment(2) == "bantuan") {
                            echo "active";
                        } ?>">
                <a href="<?php echo base_url() . 'admin/bantuan' ?>">
                    <i class="fa fa-question-circle"></i> <span>Bantuan</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>

            <li class="header">Media</li>
            <li class="<?php if ($this->uri->segment(2) == "files") {
                            echo "active";
                        } ?>">
                <a href="<?php echo base_url() . 'admin/files' ?>">
                    <i class="fa fa-download"></i> <span>Download</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>
            <li class="treeview <?php if ($this->uri->segment(2) == "album" || $this->uri->segment(2) == "galeri" || $this->uri->segment(2) == "instagram") {
                                    echo "active";
                                } ?>">
                <a href="#">
                    <i class="fa fa-camera"></i>
                    <span>Gallery</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li class="<?php if ($this->uri->segment(2) == "album") {
                                    echo "active";
                                } ?>"><a href="<?php echo base_url() . 'admin/album' ?>"><i class="fa fa-clone"></i> Album</a></li>
                    <li class="<?php if ($this->uri->segment(2) == "galeri") {
                                    echo "active";
                                } ?>"><a href="<?php echo base_url() . 'admin/galeri' ?>"><i class="fa fa-picture-o"></i> Photos</a>
                    </li>
                    <li class="<?php if ($this->uri->segment(2) == "instagram") {
                                    echo "active";
                                } ?>"><a href="<?php echo base_url() . 'admin/instagram' ?>"><i class="fa fa-instagram"></i>Instagram</a></li>
                </ul>
            </li>
            <li class="<?php if ($this->uri->segment(2) == "pengguna") {
                            echo "active";
                        } ?>">
                <a href="<?php echo base_url() . 'admin/pengguna' ?>">
                    <i class="fa fa-users"></i> <span>Pengguna</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>
            <li class="header">Log Out</li>
            <li>
                <a href="<?php echo base_url() . 'admin/login/logout' ?>">
                    <i class="fa fa-sign-out"></i> <span>Log Out</span>
                    <span class="pull-right-container">
                        <small class="label pull-right"></small>
                    </span>
                </a>
            </li>


        </ul>
    </section>
    <!-- /.sidebar -->
</aside>