<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<style>
    .alert.alert-danger p {
        color: unset !important;
        font-size: .85rem;
        margin-bottom: unset;
    }
</style>

<div class="marketing">
    <?php $this->load->view('template/pathway') ?>
    <div class="featurette-divider"></div>

    <?php
    if ($this->session->flashdata('success_msg')) {
        echo '<div class="alert alert-success">' . $this->session->flashdata('success_msg') . '</div>';
    }
    ?>

    <div class="container">
        <div class="row mb-4">
            <div class="col">
                <h3>Selamat Datang : <?= $this->session->userdata('auth_penduduk')->nama_lengkap ?></h3>
                <a href="<?php echo base_url() . 'form/ubah'; ?>" class="btn btn-info">Ubah Data</a>
                <button onclick="document.getElementById('form-logout').submit()" class="btn btn-danger">Logout</button>

                <form method="POST" action="<?= site_url('form/logout') ?>" id="form-logout">
                </form>
            </div>
            <?php
            if ($this->session->flashdata('error')) {
                echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <strong>Error!</strong> ' . $this->session->flashdata('error') . '
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>';
            }
            ?>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo base_url() . 'form'; ?>">Form Pengajuan Surat</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<?php echo base_url() . 'form/pengaduan'; ?>">Form Pengaduan Masyarakat</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo base_url() . 'form/list'; ?>">List Pengajuan Surat</a>
                    </li>
                </ul>
                <div class="card mb-5">
                    <div class="card-header">
                        <h4 class="mb-0 text-center">Form Pengaduan Masyarakat</h4>
                    </div>
                    <div class="card-body">
                        <?php
                        if ($this->session->flashdata('success')) {
                            echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Success!</strong> ' . $this->session->flashdata('success') . '
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>';
                        }
                        ?>

                        <form action="<?= base_url('form/pengaduanaction') ?>" method="POST" class="mt-4">
                            <div class="form-group mb-3">
                                <label for="judul">Judul Pengaduan <span class="text-danger">*</span></label>
                                <input type="text" name="judul" id="judul" class="form-control" required placeholder="Judul">
                            </div>
                            <div class="form-group mb-3">
                                <label for="isi">Isi Pengaduan <span class="text-danger">*</span></label>
                                <textarea name="isi" id="isi" class="form-control" placeholder="Isi" cols="30" rows="10"></textarea>
                            </div>
                            <div class="form-group mb-3">
                                <label for="tgl_kejadian">Tanggal Kejadian <span class="text-danger">*</span></label>
                                <input type="date" name="tgl_kejadian" id="tgl_kejadian" class="form-control" required placeholder="Tanggal Kejadian">
                            </div>
                            <div class="form-group mb-3">
                                <label for="lokasi_kejadian">Lokasi Kejadian <span class="text-danger">*</span></label>
                                <input type="text" name="lokasi_kejadian" id="lokasi_kejadian" class="form-control" required placeholder="Lokasi Kejadian">
                            </div>
                            <div class="form-group mb-3">
                                <label for="kategori_laporan">Kategori Laporan <span class="text-danger">*</span></label>
                                <select name="kategori_laporan" id="kategori_laporan" required class="form-control">
                                    <option value="">Pilih Kategori Laporan</option>
                                    <?php foreach (['Agama', 'Corona Virus', 'Ekonomi dan Keuangan', 'Kesehatan', 'Kesetaraan Gender', 'Ketenteraman, Ketertiban Umum, dan Pelindungan Masyarakat', 'Lingkungan Hidup dan Kehutanan', 'Pekerjaan Umum dan Penataan Ruang', 'Pembangunan Desa, Daerah Tertinggal, dan Transmigrasi', 'Pendidikan dan Kebudayaan', 'Pertanian dan Peternakan', 'Politik dan Hukum', 'Politisasi ASN', 'Sosial dan Kesejahteraan', 'SP4N-LAPOR!', 'Energi dan Sumber Daya Alam', 'Kekerasan di Satuan Pendidikan (Sekolah, Kampus, Lembaga Kursus)', 'Kependudukan', 'Ketenagakerjaan', 'Netralitas ASN', 'Pemulihan Ekonomi Nasional', 'Pencegahan dan Pemberantasan Penyalahgunaan dan Peredaran Gelap Narkotika dan Prekursor Narkotika (P4GN)', 'Peniadaan Mudik', 'Perhubungan', 'Perlindungan Konsumen', 'Teknologi Informasi dan Komunikasi', 'Topik Khusus', 'Topik Lainnya'] as $kategori) { ?>
                                        <option value="<?= $kategori ?>"><?= $kategori ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary btn-lg"><i class="zmdi zmdi-mail-send"></i> Kirim</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <?php
    if ($this->session->flashdata('flashpdf_form_pengajuan')) {
    ?>
        <iframe src="<?= site_url('form/downloadpdf?filename=' . $this->session->flashdata('flashpdf_form_pengajuan')) ?>" frameborder="0" style="display: none;"></iframe>
    <?php
    }
    ?>


    <!-- end feature yo-->
    <!-- FOOTER -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js" defer></script>
    <script>
        $(document).ready(function() {
            $('#kategori_laporan').select2();
        });
    </script>
    <?php $this->load->view('template/startup2/footer') ?>