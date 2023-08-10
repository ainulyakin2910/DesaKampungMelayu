<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bs-stepper@1.7.0/dist/css/bs-stepper.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
    .alert.alert-danger p {
        color: unset !important;
        font-size: .85rem;
        margin-bottom: unset;
    }

    @media screen and (max-width: 768px) {
        .bs-stepper-label {
            font-size: .6rem;
        }

        .bs-stepper-circle {
            font-size: .8rem;
        }
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
                <button class="btn btn-danger" onclick="document.getElementById('form-logout').submit()">Logout</button>

                <form method="POST" action="<?= site_url('form/logout') ?>" id="form-logout">
                </form>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-12">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="<?php echo base_url() . 'form'; ?>">Form Pengajuan Surat</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo base_url() . 'form/pengaduan'; ?>">Form Pengaduan Masyarakat</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<?php echo base_url() . 'form/list'; ?>">List Pengajuan Surat</a>
                    </li>
                </ul>
                <div class="card mb-5">
                    <div class="mb-5 p-4 bg-white shadow-sm">
                        <h3>Form Pengajuan Surat</h3>
                        <div id="stepper1" class="bs-stepper linear">
                            <div class="bs-stepper-header" role="tablist">
                                <div class="step active" data-target="#test-l-1">
                                    <button type="button" class="step-trigger" role="tab" id="stepper1trigger1" aria-controls="test-l-1" aria-selected="true">
                                        <span class="bs-stepper-circle">1</span>
                                        <span class="bs-stepper-label">Kategori Surat</span>
                                    </button>
                                </div>
                                <div class="bs-stepper-line"></div>
                                <div class="step" data-target="#test-l-2">
                                    <button type="button" class="step-trigger" role="tab" id="stepper1trigger2" aria-controls="test-l-2" aria-selected="false" disabled="disabled">
                                        <span class="bs-stepper-circle">2</span>
                                        <span class="bs-stepper-label">Jenis Surat</span>
                                    </button>
                                </div>
                                <div class="bs-stepper-line"></div>
                                <div class="step" data-target="#test-l-3">
                                    <button type="button" class="step-trigger" role="tab" id="stepper1trigger3" aria-controls="test-l-3" aria-selected="false" disabled="disabled">
                                        <span class="bs-stepper-circle">3</span>
                                        <span class="bs-stepper-label">Form Pengajuan Surat</span>
                                    </button>
                                </div>
                            </div>
                            <div class="bs-stepper-content">
                                <div id="test-l-1" role="tabpanel" class="bs-stepper-pane active dstepper-block" aria-labelledby="stepper1trigger1">
                                    <div class="row">
                                        <div class="col-lg-4 mt-3 mb-lg-0">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="text-center">
                                                        <span style="font-size: 4rem;" class="material-symbols-outlined">
                                                            description
                                                        </span>
                                                    </div>
                                                    <h4 class="text-center mt-3">Surat Keterangan</h4>
                                                </div>
                                                <div class="card-footer text-right">
                                                    <button type="button" data-choosed="<?= isset($this->session->flashdata('old_input')['kategori_surat']) ? ($this->session->flashdata('old_input')['kategori_surat'] == 'surat_keterangan' ? 'true' : 'false') : 'false' ?>" data-status="surat_keterangan" class="btn-choose-kategori_surat btn <?= isset($this->session->flashdata('old_input')['kategori_surat']) ? ($this->session->flashdata('old_input')['kategori_surat'] == 'surat_keterangan' ? 'btn-primary' : 'btn-outline-primary') : 'btn-outline-primary' ?> w-100">Pilih</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 mt-3 mb-lg-0">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="text-center">
                                                        <span style="font-size: 4rem;" class="material-symbols-outlined">
                                                            file_present
                                                        </span>
                                                    </div>
                                                    <h4 class="text-center mt-3">Surat Pengantar</h4>
                                                </div>
                                                <div class="card-footer text-right">
                                                    <button type="button" data-choosed="<?= isset($this->session->flashdata('old_input')['kategori_surat']) ? ($this->session->flashdata('old_input')['kategori_surat'] == 'surat_pengantar' ? 'true' : 'false') : 'false' ?>" data-status="surat_pengantar" class="btn-choose-kategori_surat btn <?= isset($this->session->flashdata('old_input')['kategori_surat']) ? ($this->session->flashdata('old_input')['kategori_surat'] == 'surat_pengantar' ? 'btn-primary' : 'btn-outline-primary') : 'btn-outline-primary' ?> w-100">Pilih</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 mt-3 mb-lg-0">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="text-center">
                                                        <span style="font-size: 4rem;" class="material-symbols-outlined">
                                                            fact_check
                                                        </span>
                                                    </div>
                                                    <h4 class="text-center mt-3">Surat Pernyataan</h4>
                                                </div>
                                                <div class="card-footer text-right">
                                                    <button type="button" data-choosed="<?= isset($this->session->flashdata('old_input')['kategori_surat']) ? ($this->session->flashdata('old_input')['kategori_surat'] == 'surat_pernyataan' ? 'true' : 'false') : 'false' ?>" data-status="surat_pernyataan" class="btn-choose-kategori_surat btn <?= isset($this->session->flashdata('old_input')['kategori_surat']) ? ($this->session->flashdata('old_input')['kategori_surat'] == 'surat_pernyataan' ? 'btn-primary' : 'btn-outline-primary') : 'btn-outline-primary' ?> w-100">Pilih</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="d-flex justify-content-center">
                                        <button type="button" disabled class="btn btn-primary" id="btn-next-step-1" onclick="step1Next()">Next</button>
                                    </div>
                                </div>
                                <div id="test-l-2" role="tabpanel" class="bs-stepper-pane" aria-labelledby="stepper1trigger2">

                                    <?php foreach (['Surat Keterangan', 'Surat Pengantar', 'Surat Pernyataan'] as $kategoriSuratOption) { ?>

                                        <?php if ($kategoriSuratOption == 'Surat Keterangan') { ?>
                                            <div class="jenis-surat-content <?= isset($this->session->flashdata('old_input')['kategori_surat']) ? ($this->session->flashdata('old_input')['kategori_surat'] == str_replace(' ', '_', strtolower($kategoriSuratOption)) ? '' : 'd-none') : 'd-none' ?>" id="jenis-<?= str_replace(' ', '_', strtolower($kategoriSuratOption)) ?>">
                                                <div class="row">
                                                    <div class="col-lg-3 mb-3">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="text-center">
                                                                    <span style="font-size: 3rem;" class="material-symbols-outlined">
                                                                        assignment
                                                                    </span>
                                                                </div>
                                                                <h5 class="text-center mt-2">Surat Keterangan Tidak Mampu</h5>
                                                            </div>
                                                            <div class="card-footer text-right">
                                                                <button type="button" data-choosed="<?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_keterangan_tidak_mampu' ? 'true' : 'false') : 'false' ?>" data-status="surat_keterangan_tidak_mampu" class="btn-choose-jenis_surat btn <?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_keterangan_tidak_mampu' ? 'btn-primary' : 'btn-outline-primary') : 'btn-outline-primary' ?> w-100">Pilih</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 mb-3">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="text-center">
                                                                    <span style="font-size: 3rem;" class="material-symbols-outlined">
                                                                        home_pin
                                                                    </span>
                                                                </div>
                                                                <h5 class="text-center mt-2">Surat Keterangan Domisili</h5>
                                                            </div>
                                                            <div class="card-footer text-right">
                                                                <button type="button" data-choosed="<?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_keterangan_domisili' ? 'true' : 'false') : 'false' ?>" data-status="surat_keterangan_domisili" class="btn-choose-jenis_surat btn <?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_keterangan_domisili' ? 'btn-primary' : 'btn-outline-primary') : 'btn-outline-primary' ?> w-100">Pilih</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 mb-3">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="text-center">
                                                                    <span style="font-size: 3rem;" class="material-symbols-outlined">
                                                                        map
                                                                    </span>
                                                                </div>
                                                                <h5 class="text-center mt-2">Surat Keterangan Kematian</h5>
                                                            </div>
                                                            <div class="card-footer text-right">
                                                                <button type="button" data-choosed="<?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_keterangan_kematian' ? 'true' : 'false') : 'false' ?>" data-status="surat_keterangan_kematian" class="btn-choose-jenis_surat btn <?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_keterangan_kematian' ? 'btn-primary' : 'btn-outline-primary') : 'btn-outline-primary' ?> w-100">Pilih</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 mb-3">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="text-center">
                                                                    <span style="font-size: 3rem;" class="material-symbols-outlined">
                                                                        child_care
                                                                    </span>
                                                                </div>
                                                                <h5 class="text-center mt-2">Surat Keterangan Kelahiran</h5>
                                                            </div>
                                                            <div class="card-footer text-right">
                                                                <button type="button" data-choosed="<?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_keterangan_kelahiran' ? 'true' : 'false') : 'false' ?>" data-status="surat_keterangan_kelahiran" class="btn-choose-jenis_surat btn <?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_keterangan_kelahiran' ? 'btn-primary' : 'btn-outline-primary') : 'btn-outline-primary' ?> w-100">Pilih</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 mb-3">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="text-center">
                                                                    <span style="font-size: 3rem;" class="material-symbols-outlined">
                                                                        money
                                                                    </span>
                                                                </div>
                                                                <h5 class="text-center mt-2">Surat Keterangan Penghasilan Orang Tua</h5>
                                                            </div>
                                                            <div class="card-footer text-right">
                                                                <button type="button" data-choosed="<?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_keterangan_penghasilan_orang_tua' ? 'true' : 'false') : 'false' ?>" data-status="surat_keterangan_penghasilan_orang_tua" class="btn-choose-jenis_surat btn <?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_keterangan_penghasilan_orang_tua' ? 'btn-primary' : 'btn-outline-primary') : 'btn-outline-primary' ?> w-100">Pilih</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>

                                        <?php if ($kategoriSuratOption == 'Surat Pengantar') { ?>
                                            <div class="jenis-surat-content <?= isset($this->session->flashdata('old_input')['kategori_surat']) ? ($this->session->flashdata('old_input')['kategori_surat'] == str_replace(' ', '_', strtolower($kategoriSuratOption)) ? '' : 'd-none') : 'd-none' ?>" id="jenis-<?= str_replace(' ', '_', strtolower($kategoriSuratOption)) ?>">
                                                <div class="row">
                                                    <div class="col-lg-3 mb-3">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="text-center">
                                                                    <span style="font-size: 3rem;" class="material-symbols-outlined">
                                                                        assignment
                                                                    </span>
                                                                </div>
                                                                <h5 class="text-center mt-2">Surat Pengantar Berkelakuan Baik</h5>
                                                            </div>
                                                            <div class="card-footer text-right">
                                                                <button type="button" data-choosed="<?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_pengantar_berkelakuan_baik' ? 'true' : 'false') : 'false' ?>" data-status="surat_pengantar_berkelakuan_baik" class="btn-choose-jenis_surat btn <?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_pengantar_berkelakuan_baik' ? 'btn-primary' : 'btn-outline-primary') : 'btn-outline-primary' ?> w-100">Pilih</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>

                                        <?php if ($kategoriSuratOption == 'Surat Pernyataan') { ?>
                                            <div class="jenis-surat-content <?= isset($this->session->flashdata('old_input')['kategori_surat']) ? ($this->session->flashdata('old_input')['kategori_surat'] == str_replace(' ', '_', strtolower($kategoriSuratOption)) ? '' : 'd-none') : 'd-none' ?>" id="jenis-<?= str_replace(' ', '_', strtolower($kategoriSuratOption)) ?>">
                                                <div class="row">
                                                    <div class="col-lg-3 mb-3">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="text-center">
                                                                    <span style="font-size: 3rem;" class="material-symbols-outlined">
                                                                        assignment
                                                                    </span>
                                                                </div>
                                                                <h5 class="text-center mt-2">Surat Pernyataan Belum Menikah</h5>
                                                            </div>
                                                            <div class="card-footer text-right">
                                                                <button type="button" data-choosed="<?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_pernyataan_belum_menikah' ? 'true' : 'false') : 'false' ?>" data-status="surat_pernyataan_belum_menikah" class="btn-choose-jenis_surat btn <?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_pernyataan_belum_menikah' ? 'btn-primary' : 'btn-outline-primary') : 'btn-outline-primary' ?> w-100">Pilih</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>

                                    <?php } ?>

                                    <hr>
                                    <div class="d-flex justify-content-center" style="gap: 6px;">
                                        <button type="button" class="btn btn-primary" onclick="step2Prev()">Previous</button>
                                        <button type="button" class="btn btn-primary" id="btn-next-step-2" disabled onclick="step2Next()">Next</button>
                                    </div>
                                </div>
                                <div id="test-l-3" role="tabpanel" class="bs-stepper-pane text-center" aria-labelledby="stepper1trigger3">

                                    <?php foreach (['surat_keterangan_tidak_mampu', 'surat_keterangan_domisili', 'surat_keterangan_kematian', 'surat_keterangan_kelahiran', 'surat_keterangan_penghasilan_orang_tua', 'surat_pengantar_berkelakuan_baik', 'surat_pernyataan_belum_menikah'] as $mainKategoriSurat) { ?>

                                        <?php if ($mainKategoriSurat == 'surat_keterangan_tidak_mampu') { ?>
                                            <form action="<?= base_url('form/pengajuansurat') ?>" method="POST" id="form-pengajuan-surat" enctype="multipart/form-data" class="form-submit-surat d-none" data-id="<?= $mainKategoriSurat ?>">
                                                <input type="hidden" name="letter_category" value="<?= $mainKategoriSurat ?>">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card-header">
                                                            <h4 class="text-center">Form Pengajuan Surat</h4>
                                                            <h5 class="text-center"><?= ucwords(str_replace('_', ' ', $mainKategoriSurat)) ?></h5>
                                                        </div>
                                                        <div class="card-body mt-2">
                                                            <?php
                                                            if ($this->session->flashdata('error')) {
                                                                echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                                    <strong>Error!</strong> ' . $this->session->flashdata('error') . '
                                                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                    </div>';
                                                            }
                                                            ?>

                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="melengkapi_persyaratan">Digunakan Untuk</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <textarea class="form-control" id="melengkapi_persyaratan" name="melengkapi_persyaratan" required rows="3" placeholder="Digunakan Untuk"><?= isset($this->session->flashdata('old_input')['melengkapi_persyaratan']) ? $this->session->flashdata('old_input')['melengkapi_persyaratan'] : '' ?></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-4">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="opsi_ttd">Opsi Tanda Tangan</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9 d-flex justify-content-start">
                                                                    <select name="opsi_ttd" id="opsi_ttd" class="form-control" required>
                                                                        <option value="asli">ASLI (Datang ke kantor)</option>
                                                                        <option value="scan">SCAN</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="d-flex justify-content-center" style="gap: 6px;">
                                                    <button type="button" class="btn btn-primary mt-5" onclick="stepper1.previous()">Previous</button>
                                                    <button type="submit" class="btn btn-primary mt-5">Submit</button>
                                                </div>
                                                <input type="hidden" name="kategori_surat" id="kategori_surat" value="<?= isset($this->session->flashdata('old_input')['kategori_surat']) ? $this->session->flashdata('old_input')['kategori_surat'] : '' ?>">
                                            </form>
                                        <?php } else if ($mainKategoriSurat == 'surat_keterangan_domisili') { ?>
                                            <form action="<?= base_url('form/pengajuansurat') ?>" method="POST" id="form-pengajuan-surat" enctype="multipart/form-data" class="form-submit-surat d-none" data-id="<?= $mainKategoriSurat ?>">
                                                <input type="hidden" name="letter_category" value="<?= $mainKategoriSurat ?>">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card-header">
                                                            <h4 class="text-center">Form Pengajuan Surat</h4>
                                                            <h5 class="text-center"><?= ucwords(str_replace('_', ' ', $mainKategoriSurat)) ?></h5>
                                                        </div>
                                                        <div class="card-body mt-2">
                                                            <?php
                                                            if ($this->session->flashdata('error')) {
                                                                echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                                        <strong>Error!</strong> ' . $this->session->flashdata('error') . '
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                        </div>';
                                                            }
                                                            ?>
                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="melengkapi_persyaratan">Digunakan Untuk</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <textarea class="form-control" id="melengkapi_persyaratan" name="melengkapi_persyaratan" required rows="3" placeholder="Digunakan Untuk"><?= isset($this->session->flashdata('old_input')['melengkapi_persyaratan']) ? $this->session->flashdata('old_input')['melengkapi_persyaratan'] : '' ?></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-4">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="opsi_ttd">Opsi Tanda Tangan</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9 d-flex justify-content-start">
                                                                    <select name="opsi_ttd" id="opsi_ttd" class="form-control" required>
                                                                        <option value="asli">ASLI (Datang ke kantor)</option>
                                                                        <option value="scan">SCAN</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="d-flex justify-content-center" style="gap: 6px;">
                                                    <button type="button" class="btn btn-primary mt-5" onclick="stepper1.previous()">Previous</button>
                                                    <button type="submit" class="btn btn-primary mt-5">Submit</button>
                                                </div>
                                                <input type="hidden" name="kategori_surat" id="kategori_surat" value="<?= isset($this->session->flashdata('old_input')['kategori_surat']) ? $this->session->flashdata('old_input')['kategori_surat'] : '' ?>">
                                            </form>
                                        <?php } else if ($mainKategoriSurat == 'surat_keterangan_kematian') { ?>
                                            <form action="<?= base_url('form/pengajuansurat') ?>" method="POST" id="form-pengajuan-surat" enctype="multipart/form-data" class="form-submit-surat d-none" data-id="<?= $mainKategoriSurat ?>">
                                                <input type="hidden" name="letter_category" value="<?= $mainKategoriSurat ?>">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card-header">
                                                            <h4 class="text-center">Form Pengajuan Surat</h4>
                                                            <h5 class="text-center"><?= ucwords(str_replace('_', ' ', $mainKategoriSurat)) ?></h5>
                                                        </div>
                                                        <div class="card-body mt-2">
                                                            <?php
                                                            if ($this->session->flashdata('error')) {
                                                                echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                                        <strong>Error!</strong> ' . $this->session->flashdata('error') . '
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                        </div>';
                                                            }
                                                            ?>
                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="nama_ibu">Nama Ibu</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <input type="text" class="form-control" id="nama_ibu" name="nama_ibu" required placeholder="Nama Ibu" value="<?= isset($this->session->flashdata('old_input')['nama_ibu']) ? $this->session->flashdata('old_input')['nama_ibu'] : '' ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="nama_ayah">Nama Ayah</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <input type="text" class="form-control" id="nama_ayah" name="nama_ayah" required placeholder="Nama Ayah" value="<?= isset($this->session->flashdata('old_input')['nama_ayah']) ? $this->session->flashdata('old_input')['nama_ayah'] : '' ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="hari_meninggal">Meninggal Pada Hari</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <select class="form-select" name="hari_meninggal" id="hari_meninggal" required>
                                                                            <option value="" selected disabled>Pilih Hari</option>
                                                                            <option value="Senin">Senin</option>
                                                                            <option value="Selasa">Selasa</option>
                                                                            <option value="Rabu">Rabu</option>
                                                                            <option value="Kamis">Kamis</option>
                                                                            <option value="Jumat">Jum'at</option>
                                                                            <option value="Sabtu">Sabtu</option>
                                                                            <option value="Minggu">Minggu</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="tanggal_meninggal">Meninggal Pada Tanggal</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <input type="date" class="form-control" id="tanggal_meninggal" name="tanggal_meninggal" required placeholder="Tanggal Meninggal" value="<?= isset($this->session->flashdata('old_input')['tanggal_meninggal']) ? $this->session->flashdata('old_input')['tanggal_meninggal'] : '' ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="jam_meninggal">Meninggal Pukul</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <input type="text" class="form-control" id="jam_meninggal" name="jam_meninggal" required placeholder="Jam Meninggal" value="<?= isset($this->session->flashdata('old_input')['jam_meninggal']) ? $this->session->flashdata('old_input')['jam_meninggal'] : '' ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="bertempat_di">Bertempat Di</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <textarea class="form-control" id="bertempat_di" name="bertempat_di" required rows="3" placeholder="Alamat"><?= isset($this->session->flashdata('old_input')['bertempat_di']) ? $this->session->flashdata('old_input')['bertempat_di'] : '' ?></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row mb-4">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="opsi_ttd">Opsi Tanda Tangan</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9 d-flex justify-content-start">
                                                                    <select name="opsi_ttd" id="opsi_ttd" class="form-control" required>
                                                                        <option value="asli">ASLI (Datang ke kantor)</option>
                                                                        <option value="scan">SCAN</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="d-flex justify-content-center" style="gap: 6px;">
                                                    <button type="button" class="btn btn-primary mt-5" onclick="stepper1.previous()">Previous</button>
                                                    <button type="submit" class="btn btn-primary mt-5">Submit</button>
                                                </div>
                                                <input type="hidden" name="kategori_surat" id="kategori_surat" value="<?= isset($this->session->flashdata('old_input')['kategori_surat']) ? $this->session->flashdata('old_input')['kategori_surat'] : '' ?>">
                                            </form>
                                        <?php } else if ($mainKategoriSurat == 'surat_keterangan_kelahiran') { ?>
                                            <form action="<?= base_url('form/pengajuansurat') ?>" method="POST" id="form-pengajuan-surat" enctype="multipart/form-data" class="form-submit-surat d-none" data-id="<?= $mainKategoriSurat ?>">
                                                <input type="hidden" name="letter_category" value="<?= $mainKategoriSurat ?>">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card-header">
                                                            <h4 class="text-center">Form Pengajuan Surat</h4>
                                                            <h5 class="text-center"><?= ucwords(str_replace('_', ' ', $mainKategoriSurat)) ?></h5>
                                                        </div>
                                                        <div class="card-body mt-2">
                                                            <?php
                                                            if ($this->session->flashdata('error')) {
                                                                echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                                        <strong>Error!</strong> ' . $this->session->flashdata('error') . '
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                        </div>';
                                                            }
                                                            ?>

                                                            <p class="text-left">Anak Dari: </p>
                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="nama_ibu">Nama Ibu</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <input type="text" class="form-control" id="nama_ibu" name="nama_ibu" required placeholder="Nama Ibu" value="<?= isset($this->session->flashdata('old_input')['nama_ibu']) ? $this->session->flashdata('old_input')['nama_ibu'] : '' ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="nama_ayah">Nama Ayah</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <input type="text" class="form-control" id="nama_ayah" name="nama_ayah" required placeholder="Nama Ayah" value="<?= isset($this->session->flashdata('old_input')['nama_ayah']) ? $this->session->flashdata('old_input')['nama_ayah'] : '' ?>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row mb-4">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="opsi_ttd">Opsi Tanda Tangan</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9 d-flex justify-content-start">
                                                                    <select name="opsi_ttd" id="opsi_ttd" class="form-control" required>
                                                                        <option value="asli">ASLI (Datang ke kantor)</option>
                                                                        <option value="scan">SCAN</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="d-flex justify-content-center" style="gap: 6px;">
                                                    <button type="button" class="btn btn-primary mt-5" onclick="stepper1.previous()">Previous</button>
                                                    <button type="submit" class="btn btn-primary mt-5">Submit</button>
                                                </div>
                                                <input type="hidden" name="kategori_surat" id="kategori_surat" value="<?= isset($this->session->flashdata('old_input')['kategori_surat']) ? $this->session->flashdata('old_input')['kategori_surat'] : '' ?>">
                                            </form>
                                        <?php } else if ($mainKategoriSurat == 'surat_keterangan_penghasilan_orang_tua') { ?>
                                            <form action="<?= base_url('form/pengajuansurat') ?>" method="POST" id="form-pengajuan-surat" enctype="multipart/form-data" class="form-submit-surat d-none" data-id="<?= $mainKategoriSurat ?>">
                                                <input type="hidden" name="letter_category" value="<?= $mainKategoriSurat ?>">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card-header">
                                                            <h4 class="text-center">Form Pengajuan Surat</h4>
                                                            <h5 class="text-center"><?= ucwords(str_replace('_', ' ', $mainKategoriSurat)) ?></h5>
                                                        </div>
                                                        <div class="card-body mt-2">
                                                            <?php
                                                            if ($this->session->flashdata('error')) {
                                                                echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                                        <strong>Error!</strong> ' . $this->session->flashdata('error') . '
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                        </div>';
                                                            }
                                                            ?>

                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="melengkapi_persyaratan">Digunakan Untuk</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <textarea class="form-control" id="melengkapi_persyaratan" name="melengkapi_persyaratan" required rows="3" placeholder="Digunakan Untuk"><?= isset($this->session->flashdata('old_input')['melengkapi_persyaratan']) ? $this->session->flashdata('old_input')['melengkapi_persyaratan'] : '' ?></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-4">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="opsi_ttd">Opsi Tanda Tangan</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9 d-flex justify-content-start">
                                                                    <select name="opsi_ttd" id="opsi_ttd" class="form-control" required>
                                                                        <option value="asli">ASLI (Datang ke kantor)</option>
                                                                        <option value="scan">SCAN</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="d-flex justify-content-center" style="gap: 6px;">
                                                    <button type="button" class="btn btn-primary mt-5" onclick="stepper1.previous()">Previous</button>
                                                    <button type="submit" class="btn btn-primary mt-5">Submit</button>
                                                </div>
                                                <input type="hidden" name="kategori_surat" id="kategori_surat" value="<?= isset($this->session->flashdata('old_input')['kategori_surat']) ? $this->session->flashdata('old_input')['kategori_surat'] : '' ?>">
                                            </form>
                                        <?php } else if ($mainKategoriSurat == 'surat_pengantar_berkelakuan_baik') { ?>
                                            <form action="<?= base_url('form/pengajuansurat') ?>" method="POST" id="form-pengajuan-surat" enctype="multipart/form-data" class="form-submit-surat d-none" data-id="<?= $mainKategoriSurat ?>">
                                                <input type="hidden" name="letter_category" value="<?= $mainKategoriSurat ?>">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card-header">
                                                            <h4 class="text-center">Form Pengajuan Surat</h4>
                                                            <h5 class="text-center"><?= ucwords(str_replace('_', ' ', $mainKategoriSurat)) ?></h5>
                                                        </div>
                                                        <div class="card-body mt-2">
                                                            <?php
                                                            if ($this->session->flashdata('error')) {
                                                                echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                                        <strong>Error!</strong> ' . $this->session->flashdata('error') . '
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                        </div>';
                                                            }
                                                            ?>

                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="keperluan">Digunakan Untuk</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <textarea class="form-control" id="keperluan" name="keperluan" required rows="3" placeholder="Digunakan Untuk"><?= isset($this->session->flashdata('old_input')['keperluan']) ? $this->session->flashdata('old_input')['keperluan'] : '' ?></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row mb-4">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="opsi_ttd">Opsi Tanda Tangan</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9 d-flex justify-content-start">
                                                                    <select name="opsi_ttd" id="opsi_ttd" class="form-control" required>
                                                                        <option value="asli">ASLI (Datang ke kantor)</option>
                                                                        <option value="scan">SCAN</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="d-flex justify-content-center" style="gap: 6px;">
                                                    <button type="button" class="btn btn-primary mt-5" onclick="stepper1.previous()">Previous</button>
                                                    <button type="submit" class="btn btn-primary mt-5">Submit</button>
                                                </div>
                                                <input type="hidden" name="kategori_surat" id="kategori_surat" value="<?= isset($this->session->flashdata('old_input')['kategori_surat']) ? $this->session->flashdata('old_input')['kategori_surat'] : '' ?>">
                                            </form>
                                        <?php } else if ($mainKategoriSurat == 'surat_pernyataan_belum_menikah') { ?>
                                            <form action="<?= base_url('form/pengajuansurat') ?>" method="POST" id="form-pengajuan-surat" enctype="multipart/form-data" class="form-submit-surat d-none" data-id="<?= $mainKategoriSurat ?>">
                                                <input type="hidden" name="letter_category" value="<?= $mainKategoriSurat ?>">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="card-header">
                                                            <h4 class="text-center">Form Pengajuan Surat</h4>
                                                            <h5 class="text-center"><?= ucwords(str_replace('_', ' ', $mainKategoriSurat)) ?></h5>
                                                        </div>
                                                        <div class="card-body mt-2">
                                                            <?php
                                                            if ($this->session->flashdata('error')) {
                                                                echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                                        <strong>Error!</strong> ' . $this->session->flashdata('error') . '
                                                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                                        </div>';
                                                            }
                                                            ?>

                                                            <div class="row mb-3">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="keperluan">Digunakan Untuk</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9">
                                                                    <div class="form-group">
                                                                        <textarea class="form-control" id="keperluan" name="keperluan" required rows="3" placeholder="Digunakan Untuk"><?= isset($this->session->flashdata('old_input')['keperluan']) ? $this->session->flashdata('old_input')['keperluan'] : '' ?></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mb-4">
                                                                <div class="col-lg-3">
                                                                    <div style="text-align: left;">
                                                                        <label for="opsi_ttd">Opsi Tanda Tangan</label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-9 d-flex justify-content-start">
                                                                    <select name="opsi_ttd" id="opsi_ttd" class="form-control" required>
                                                                        <option value="asli">ASLI (Datang ke kantor)</option>
                                                                        <option value="scan">SCAN</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="d-flex justify-content-center" style="gap: 6px;">
                                                    <button type="button" class="btn btn-primary mt-5" onclick="stepper1.previous()">Previous</button>
                                                    <button type="submit" class="btn btn-primary mt-5">Submit</button>
                                                </div>
                                                <input type="hidden" name="kategori_surat" id="kategori_surat" value="<?= isset($this->session->flashdata('old_input')['kategori_surat']) ? $this->session->flashdata('old_input')['kategori_surat'] : '' ?>">
                                            </form>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- end feature yo-->
<!-- FOOTER -->
<?php $this->load->view('template/startup2/footer') ?>
<script src="https://cdn.jsdelivr.net/npm/bs-stepper@1.7.0/dist/js/bs-stepper.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        stepper1 = new Stepper(document.querySelector('#stepper1'))

        var btnNextList = [].slice.call(document.querySelectorAll('.btn-next-form'))
        var stepperPanList = [].slice.call(stepperFormEl.querySelectorAll('.bs-stepper-pane'))
        var inputMailForm = document.getElementById('inputMailForm')
        var inputPasswordForm = document.getElementById('inputPasswordForm')
        var form = stepperFormEl.querySelector('.bs-stepper-content form')

        stepperFormEl.addEventListener('show.bs-stepper', function(event) {
            form.classList.remove('was-validated')
            var nextStep = event.detail.indexStep
            var currentStep = nextStep

            if (currentStep > 0) {
                currentStep--
            }

            var stepperPan = stepperPanList[currentStep]

            if ((stepperPan.getAttribute('id') === 'test-form-1' && !inputMailForm.value.length) ||
                (stepperPan.getAttribute('id') === 'test-form-2' && !inputPasswordForm.value.length)) {
                event.preventDefault()
                form.classList.add('was-validated')
            }
        })
    })
</script>

<script>
    /**
     * Choose Kategori Surat
     * 
     */
    function makeButtonChoosekategoriSuratClickableChange() {
        const arrBtnChooseKategoriSurat = document.querySelectorAll('.btn-choose-kategori_surat');

        arrBtnChooseKategoriSurat.forEach((btnChooseKategoriSurat) => {
            btnChooseKategoriSurat.addEventListener('click', () => {
                if (btnChooseKategoriSurat.dataset.choosed != 'true') {
                    removeActiveFromAllButtonChooseKategoriSurat();
                    setButtonChooseKategoriSuratToSelected(btnChooseKategoriSurat);
                    isDisableOrNotBtnNextStep1();
                }
            });
        });
    }

    function isDisableOrNotBtnNextStep1() {
        const btnNextStep1Element = document.getElementById('btn-next-step-1');
        const btnChooseKategoriSurat = document.querySelector(".btn-choose-kategori_surat[data-choosed='true']");

        if (btnChooseKategoriSurat) {
            if (btnNextStep1Element.hasAttribute('disabled')) {
                btnNextStep1Element.removeAttribute('disabled');
            }
        } else {
            if (!btnNextStep1Element.hasAttribute('disabled')) {
                btnNextStep1Element.setAttribute('disabled', true);
            }
        }
    }

    function removeActiveFromAllButtonChooseKategoriSurat() {
        const arrBtnChooseKategoriSurat = document.querySelectorAll('.btn-choose-kategori_surat');

        arrBtnChooseKategoriSurat.forEach((btnChooseKategoriSurat) => {
            if (btnChooseKategoriSurat.dataset.choosed == 'true') {
                btnChooseKategoriSurat.dataset.choosed = 'false';

                if (btnChooseKategoriSurat.classList.contains('btn-primary')) {
                    btnChooseKategoriSurat.classList.remove('btn-primary');
                    btnChooseKategoriSurat.classList.add('btn-outline-primary');
                }
            }
        })
    };

    function setButtonChooseKategoriSuratToSelected(btnChooseKategoriSurat) {
        btnChooseKategoriSurat.dataset.choosed = true;

        if (btnChooseKategoriSurat.classList.contains('btn-outline-primary')) {
            btnChooseKategoriSurat.classList.remove('btn-outline-primary');
            btnChooseKategoriSurat.classList.add('btn-primary');
        }
    }

    /**
     * Choose Jenis Surat
     * 
     */
    function makeButtonChooseJenisSuratClickableChange() {
        const arrBtnChooseJenisSurat = document.querySelectorAll('.btn-choose-jenis_surat');

        arrBtnChooseJenisSurat.forEach((btnChooseJenisSurat) => {
            btnChooseJenisSurat.addEventListener('click', () => {
                if (btnChooseJenisSurat.dataset.choosed != 'true') {
                    removeActiveFromAllButtonChooseJenisSurat();
                    setButtonChooseJenisSuratToSelected(btnChooseJenisSurat);
                    isDisableOrNotBtnNextStep2();
                }
            });
        });
    }

    function isDisableOrNotBtnNextStep2() {
        const btnNextStep2Element = document.getElementById('btn-next-step-2');
        const btnChooseJenisSurat = document.querySelector(".btn-choose-jenis_surat[data-choosed='true']");

        if (btnChooseJenisSurat) {
            if (btnNextStep2Element.hasAttribute('disabled')) {
                btnNextStep2Element.removeAttribute('disabled');
            }
        } else {
            if (!btnNextStep2Element.hasAttribute('disabled')) {
                btnNextStep2Element.setAttribute('disabled', true);
            }
        }
    }

    function removeActiveFromAllButtonChooseJenisSurat() {
        const arrBtnChooseJenisSurat = document.querySelectorAll('.btn-choose-jenis_surat');

        arrBtnChooseJenisSurat.forEach((btnChooseJenisSurat) => {
            if (btnChooseJenisSurat.dataset.choosed == 'true') {
                btnChooseJenisSurat.dataset.choosed = 'false';

                if (btnChooseJenisSurat.classList.contains('btn-primary')) {
                    btnChooseJenisSurat.classList.remove('btn-primary');
                    btnChooseJenisSurat.classList.add('btn-outline-primary');
                }
            }
        })
    };

    function setButtonChooseJenisSuratToSelected(btnChooseJenisSurat) {
        btnChooseJenisSurat.dataset.choosed = true;

        if (btnChooseJenisSurat.classList.contains('btn-outline-primary')) {
            btnChooseJenisSurat.classList.remove('btn-outline-primary');
            btnChooseJenisSurat.classList.add('btn-primary');
        }
    }

    /**
     * Init
     * 
     */
    document.addEventListener('DOMContentLoaded', () => {
        makeButtonChoosekategoriSuratClickableChange();
        makeButtonChooseJenisSuratClickableChange();
        isDisableOrNotBtnNextStep1();
        isDisableOrNotBtnNextStep2();

        if (<?= $this->session->flashdata('error') != null ? 'true' : 'false' ?>) {
            stepper1.to(3);
        }
    });
</script>

<script>
    function step1Next() {
        const arrJenisSuratContentElement = document.querySelectorAll('.jenis-surat-content');
        const arrBtnChooseKategoriSurat = document.querySelectorAll('.btn-choose-kategori_surat');

        arrJenisSuratContentElement.forEach((e) => {
            if (!e.classList.contains('d-none')) {
                e.classList.add('d-none');
            }
        });

        arrBtnChooseKategoriSurat.forEach((btnChooseKategoriSurat) => {
            if (btnChooseKategoriSurat.dataset.choosed == 'true') {
                const el = document.getElementById(`jenis-${btnChooseKategoriSurat.dataset.status}`);

                if (el) {
                    if (el.classList.contains('d-none')) {
                        el.classList.remove('d-none');
                    }
                }

            }
        });

        document.getElementById('kategori_surat').value = document.querySelector(".btn-choose-kategori_surat[data-choosed='true']").dataset.status;

        stepper1.next()
    }

    function step2Prev() {
        const btn = document.getElementById('btn-next-step-2');
        removeActiveFromAllButtonChooseJenisSurat();

        if (!btn.hasAttribute('disabled')) {
            btn.setAttribute('disabled', true);
        }
        stepper1.previous();
    }

    function step2Next() {
        const btnChooseJenisSurat = document.querySelector(".btn-choose-jenis_surat[data-choosed='true']");
        const arrFormSubmitSurat = document.querySelectorAll('.form-submit-surat');

        console.log(btnChooseJenisSurat.dataset.status)

        Array.from(arrFormSubmitSurat).forEach((e) => {
            !e.classList.contains('d-none') ? e.classList.add('d-none') : ''

            console.log(btnChooseJenisSurat.dataset.status)
            console.log(e.dataset.id)

            if (btnChooseJenisSurat.dataset.status == e.dataset.id) {
                e.classList.contains('d-none') ? e.classList.remove('d-none') : ''
            }
        });

        stepper1.next();
    }
</script>