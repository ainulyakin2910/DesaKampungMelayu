    <div class="container-fluid position-relative p-0">
        <nav class="navbar navbar-expand-lg navbar-dark px-5 py-3 py-lg-0">
            <a href="<?php echo base_url(); ?>" class="navbar-brand p-0">
                <h1 class="m-0"><i class="fa fa-user-tie me-2"></i>Kampung Melayu</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a href="<?php echo base_url(); ?>" class="nav-item nav-link">Beranda</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Profile</a>
                        <div class="dropdown-menu m-0">
                            <a href="<?php echo base_url() . 'sambutan'; ?>" class="dropdown-item">Sambutan Kepala Desa</a>
                            <a href="<?php echo base_url() . 'visimisi'; ?>" class="dropdown-item">Visi & Misi</a>
                            <a href="<?php echo base_url() . 'statistikpenduduk'; ?>" class="dropdown-item">Statistik Penduduk</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pemerintahan</a>
                        <div class="dropdown-menu m-0">
                            <a href="<?php echo base_url() . 'strukturorganisasi'; ?>" class="dropdown-item">Struktur Organisasi</a>
                            <a href="<?php echo base_url() . 'profilpegawai'; ?>" class="dropdown-item">Data Pegawai</a>
                            <a href="<?php echo base_url() . 'desa'; ?>" class="dropdown-item">RT/RW</a>
                            <a href="<?php echo base_url() . 'apbdes'; ?>" class="dropdown-item">APBDesa</a>

                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Berita</a>
                        <div class="dropdown-menu m-0">
                            <a href="<?php echo base_url() . 'berita'; ?>" class="dropdown-item">Berita</a>
                            <a href="<?php echo base_url() . 'agenda'; ?>" class="dropdown-item">Agenda</a>
                            <a href="<?php echo base_url() . 'pengumuman'; ?>" class="dropdown-item">Pengumuman</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pelayanan</a>
                        <div class="dropdown-menu m-0">
                            <a href="<?= $this->session->has_userdata('auth_penduduk') ? base_url() . 'form' : base_url() . 'form/login' ?>" class="dropdown-item">Pengajuan Surat/Pengaduan Masyarakat</a>
                            <!-- <a href="<?= base_url() . 'form/pengaduan' ?>" class="dropdown-item">Pengaduan Masyarakat</a> -->
                        </div>
                    </div>

                    <a href="<?php echo base_url() . 'potensi'; ?>" class="nav-item nav-link">Potensi</a>

                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Media</a>
                        <div class="dropdown-menu m-0">
                            <a href="<?php echo base_url() . 'media/gallery'; ?>" class="dropdown-item">Foto</a>
                            <a href="<?php echo base_url() . 'download'; ?>" class="dropdown-item">File</a>
                        </div>
                    </div>
                    <a href="<?php echo base_url() . 'bantuan'; ?>" class="nav-item nav-link">Bantuan</a>
                    <a href="<?php echo base_url() . 'administrator'; ?>" class="nav-item nav-link"><i class="fas fa-user-cog" title="Login Admin"></i></a>
                </div>
            </div>
        </nav>

        <?php if ($this->uri->segment(1) == null) { ?>
            <div id="header-carousel" class="carousel slide carousel-fade pointer-event" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <?php foreach ($arr_slider->result() as $index => $slider) { ?>
                        <div class="carousel-item <?= $index == 0 ? 'active' : '' ?>">
                            <img class="w-100" src="<?= base_url('assets/images/slider/') . $slider->gambar ?>" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 900px;">
                                    <h5 class="text-white text-uppercase mb-3 animated slideInDown">Selamat Datang</h5>
                                    <h1 class="display-1 text-white mb-md-4 animated zoomIn">Desa Kampung Melayu</h1>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#header-carousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        <?php } else { ?>
            <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px; background-image: url('assets/images/background desa.jpg'); background-position: top center;">
                <div class="row py-5">
                    <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                        <h1 class="display-4 text-white animated zoomIn">

                            <?php if ($this->uri->segment(1) == 'berita' && $this->uri->segment(2)) { ?>
                                Berita
                            <?php } else if ($this->uri->segment(1) == 'visimisi' && $this->uri->segment(1)) { ?>
                                Visi & Misi
                            <?php } else if ($this->uri->segment(1) == 'strukturorganisasi' && $this->uri->segment(1)) { ?>
                                Struktur Organisasi
                            <?php } else if ($this->uri->segment(1) == 'profilpegawai' && $this->uri->segment(1)) { ?>
                                Data Pegawai
                            <?php } else if ($this->uri->segment(1) == 'desa' && $this->uri->segment(1)) { ?>
                                Petugas RT/RW
                            <?php } else if ($this->uri->segment(1) == 'apbdes' && $this->uri->segment(1)) { ?>
                                APBDesa <br> Anggaran Pendapatan dan Belanja Desa </br>
                            <?php } else if ($this->uri->segment(1) == 'statistikpenduduk' && $this->uri->segment(1)) { ?>
                                Statistik Penduduk
                            <?php } else if ($this->uri->segment(1) == 'agenda' && $this->uri->segment(1)) { ?>
                                Agenda
                            <?php } else { ?>
                                <?= ucfirst($this->uri->segment(1)) . ($this->uri->segment(2) ? ' ' . str_replace('-', ' ', ucfirst($this->uri->segment(2))) : '') ?></h1>
                    <?php } ?>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>