<!-- ======= Header ======= -->
<?php $a = $identitas->row_array() ?>
<section id="topbar" class="topbar d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
        <div class="contact-info d-flex align-items-center">
            <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:<?php echo $a['telepon'] ?>"><?php echo $a['email'] ?></a></i>
            <i class="bi bi-phone d-flex align-items-center ms-4"><span><?php echo $a['telepon'] ?></span></i>
        </div>
    </div>
</section>
<!-- End Top Bar -->
<?php $iden = $iden->row_array() ?>
<header id="header" class="header d-flex align-items-center">

    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
        <a href="<?php echo base_url(); ?>" class="logo d-flex align-items-center">
            <!-- <h1>kampung melayu<span>.</span></h1> -->
            <img src="<?php echo base_url() . 'assetss/favicon/' . $iden['brand'] ?>" width="250" height="40" alt="">
        </a>
        <nav id="navbar" class="navbar">
            <ul>
                <li>
                    <a href="<?php echo base_url() . 'beranda'; ?>">Beranda</a>
                </li>
                <li class="dropdown">
                    <a href="#"><span>Profile</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                    <ul>
                        <li><a href="<?php echo base_url() . 'sambutan'; ?>">Sambutan Kepala Desa </a>
                        </li>
                        <li><a href="<?php echo base_url() . 'visimisi'; ?>">Visi Misi</a></li>
                        <li>
                            <a href="<?php echo base_url() . 'strukturorganisasi'; ?>">Struktur Organisasi</a>
                        </li>
                        <li>
                            <a href="<?php echo base_url() . 'profilpegawai'; ?>">Data Pegawai</a>
                        </li>
                        <li>
                            <a href="<?php echo base_url() . 'desa'; ?>">RT/RW</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#"><span>Berita</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                    <ul>
                        <li><a href="<?php echo base_url() . 'berita'; ?>">Berita</a></li>
                        <li><a href="<?php echo base_url() . 'agenda'; ?>">Agenda</a></li>
                        <li><a href="<?php echo base_url() . 'pengumuman'; ?>">Pengumuman</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#"><span>Pelayanan</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                    <ul>
                        <!-- 	<li><a href="<?php echo base_url() . 'alurpelayanan'; ?>">Alur Kegiatan</a></li>
						<li><a href="<?php echo base_url() . 'denahpelayanan'; ?>">Ketentuan Pelayanan</a></li> -->
                        <?php if ($this->session->has_userdata('auth_penduduk')) { ?>
                            <li><a href="<?php echo base_url() . 'form'; ?>">Pengajuan Surat/Pengaduan Masyarakat</a></li>
                        <?php } else { ?>
                            <li><a href="<?php echo base_url() . 'form/login'; ?>">Pengajuan Surat/Pengaduan Masyarakat</a></li>
                        <?php } ?>
                        <li><a href="<?php echo base_url() . 'APBDesa'; ?>">APBDesa</a></li>
                        <li><a href="<?php echo base_url() . '#'; ?>">Statistik Penduduk</a></li>

                    </ul>
                </li>
                <li>

                    <a href="<?php echo base_url() . 'potensi'; ?>">Potensi</a>
                </li>
                <li class="dropdown">
                    <a href="#"><span>Media</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                    <ul>
                        <li><a href="<?php echo base_url() . 'media/gallery'; ?>">Foto</a></li>
                        <li><a href="<?php echo base_url() . 'download'; ?>">Lembaga</a></li>
                    </ul>
                </li>
                <li>
                    <form action="<?php echo site_url('berita/search'); ?>" method="get">
                        <div class="row">
                            <div class="col"><input class="form-control mr-sm-2" type="text" placeholder="Cari disini..." aria-label="Search" name="keyword"></div>
                            <div class="col"><button class="btn btn-outline-light" type="submit">Cari</button></div>
                        </div>

                    </form>
                </li>
            </ul>

        </nav><!-- .navbar -->

        <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
        <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
</header><!-- End Header -->