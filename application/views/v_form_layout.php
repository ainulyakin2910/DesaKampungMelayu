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
                                        <div class="jenis-surat-content <?= isset($this->session->flashdata('old_input')['kategori_surat']) ? ($this->session->flashdata('old_input')['kategori_surat'] == 'surat_keterangan' ? '' : 'd-none') : 'd-none' ?>" id="jenis-<?= str_replace(' ', '_', strtolower($kategoriSuratOption)) ?>">
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
                                                            <h5 class="text-center mt-2">Surat Penghasilan Orang Tua</h5>
                                                        </div>
                                                        <div class="card-footer text-right">
                                                            <button type="button" data-choosed="<?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_penghasilan_orang_tua' ? 'true' : 'false') : 'false' ?>" data-status="surat_penghasilan_orang_tua" class="btn-choose-jenis_surat btn <?= isset($this->session->flashdata('old_input')['letter_type']) ? ($this->session->flashdata('old_input')['letter_type'] == 'surat_penghasilan_orang_tua' ? 'btn-primary' : 'btn-outline-primary') : 'btn-outline-primary' ?> w-100">Pilih</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>

                                    <hr>
                                    <div class="d-flex justify-content-center" style="gap: 6px;">
                                        <button type="button" class="btn btn-primary" onclick="step2Prev()">Previous</button>
                                        <button type="button" class="btn btn-primary" id="btn-next-step-2" disabled onclick="step2Next()">Next</button>
                                    </div>
                                </div>
                                <form action="<?= base_url('form/pengajuansurat') ?>" method="POST" id="form-pengajuan-surat" enctype="multipart/form-data">
                                    <div id="test-l-3" role="tabpanel" class="bs-stepper-pane text-center" aria-labelledby="stepper1trigger3">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="card-header">
                                                    <h4 class="text-center">Form Pengajuan Surat</h4>
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
                                                                <label for="nik">NIK</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="form-group">
                                                                <input type="number" class="form-control" id="nik" name="nik" required placeholder="NIK" value="<?= isset($this->session->flashdata('old_input')['nik']) ? $this->session->flashdata('old_input')['nik'] : '' ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-3">
                                                            <div style="text-align: left;">
                                                                <label for="name">Nama</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" id="name" name="name" required placeholder="Nama" value="<?= isset($this->session->flashdata('old_input')['name']) ? $this->session->flashdata('old_input')['name'] : '' ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-3">
                                                            <div style="text-align: left;">
                                                                <label for="religion">Agama</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="form-group">
                                                                <select class="form-select" name="religion" id="religion" required>
                                                                    <option selected disabled>Pilih Agama</option>
                                                                    <option value="Islam" <?= isset($this->session->flashdata('old_input')['religion']) ? ($this->session->flashdata('old_input')['religion'] == 'Islam' ? 'selected' : '') : ''  ?>>Islam</option>
                                                                    <option value="Kristen" <?= isset($this->session->flashdata('old_input')['religion']) ? ($this->session->flashdata('old_input')['religion'] == 'Kristen' ? 'selected' : '') : ''  ?>>Kristen</option>
                                                                    <option value="Katolik" <?= isset($this->session->flashdata('old_input')['religion']) ? ($this->session->flashdata('old_input')['religion'] == 'Katolik' ? 'selected' : '') : ''  ?>>Katolik</option>
                                                                    <option value="Hindu" <?= isset($this->session->flashdata('old_input')['religion']) ? ($this->session->flashdata('old_input')['religion'] == 'Hindu' ? 'selected' : '') : ''  ?>>Hindu</option>
                                                                    <option value="Budha" <?= isset($this->session->flashdata('old_input')['religion']) ? ($this->session->flashdata('old_input')['religion'] == 'Budha' ? 'selected' : '') : ''  ?>>Budha</option>
                                                                    <option value="Konghucu" <?= isset($this->session->flashdata('old_input')['religion']) ? ($this->session->flashdata('old_input')['religion'] == 'Konghucu' ? 'selected' : '') : ''  ?>>Konghucu</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-3">
                                                            <div style="text-align: left;">
                                                                <label for="marital_status">Status Perkawinan</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="form-group">
                                                                <select class="form-select" name="marital_status" id="marital_status" required>
                                                                    <option selected disabled>Pilih Status Perkawinan</option>
                                                                    <option value="Kawin" <?= isset($this->session->flashdata('old_input')['marital_status']) ? ($this->session->flashdata('old_input')['marital_status'] == 'Kawin' ? 'selected' : '') : ''  ?>>Kawin</option>
                                                                    <option value="Belum Kawin" <?= isset($this->session->flashdata('old_input')['marital_status']) ? ($this->session->flashdata('old_input')['marital_status'] == 'Belum Kawin' ? 'selected' : '') : ''  ?>>Belum Kawin</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-3">
                                                            <div style="text-align: left;">
                                                                <label for="letter_type">Jenis Surat</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="form-group">
                                                                <select class="form-select" name="letter_type" id="letter_type">
                                                                    <?php if (isset($this->session->flashdata('old_input')['letter_type'])) { ?>
                                                                        <option value="<?= $this->session->flashdata('old_input')['letter_type'] ?>"><?= ucwords(str_replace('_', ' ', $this->session->flashdata('old_input')['letter_type'])) ?></option>
                                                                    <?php } ?>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-3">
                                                            <div style="text-align: left;">
                                                                <label for="no_hp">No HP</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="form-group">
                                                                <input type="number" class="form-control" id="no_hp" name="no_hp" required placeholder="Nomor HP" value="<?= isset($this->session->flashdata('old_input')['no_hp']) ? $this->session->flashdata('old_input')['no_hp'] : '' ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-3">
                                                            <div style="text-align: left;">
                                                                <label for="gender">Jenis Kelamin</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="form-group">
                                                                <select class="form-select" name="gender" id="gender" required>
                                                                    <option selected disabled>Pilih Jenis Kelamin</option>
                                                                    <option value="L" <?= isset($this->session->flashdata('old_input')['gender']) ? ($this->session->flashdata('old_input')['gender'] == 'L' ? 'selected' : '') : ''  ?>>Laki-laki</option>
                                                                    <option value="P" <?= isset($this->session->flashdata('old_input')['gender']) ? ($this->session->flashdata('old_input')['gender'] == 'P' ? 'selected' : '') : ''  ?>>Perempuan</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-3">
                                                            <div style="text-align: left;">
                                                                <label for="pob">Tempat Lahir</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" id="pob" name="pob" required placeholder="Tempat Lahir" value="<?= isset($this->session->flashdata('old_input')['pob']) ? $this->session->flashdata('old_input')['pob'] : '' ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-3">
                                                            <div style="text-align: left;">
                                                                <label for="dob">Tanggal Lahir</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="form-group">
                                                                <input type="date" class="form-control" id="dob" name="dob" required placeholder="Tanggal Lahir" value="<?= isset($this->session->flashdata('old_input')['dob']) ? $this->session->flashdata('old_input')['dob'] : '' ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-3">
                                                            <div style="text-align: left;">
                                                                <label for="job">Pekerjaan</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" id="job" name="job" required placeholder="Pekerjaan" value="<?= isset($this->session->flashdata('old_input')['job']) ? $this->session->flashdata('old_input')['job'] : '' ?>">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-lg-3">
                                                            <div style="text-align: left;">
                                                                <label for="address">Alamat</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <div class="form-group">
                                                                <textarea type="number" class="form-control" id="address" name="address" required rows="3" placeholder="Alamat"><?= isset($this->session->flashdata('old_input')['address']) ? $this->session->flashdata('old_input')['address'] : '' ?></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-4">
                                                        <div class="col-lg-3">
                                                            <div style="text-align: left;">
                                                                <label for="ktp">Foto KTP</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-9 d-flex justify-content-start">
                                                            <input type="file" class="form-control-file" id="ktp" name="ktp" required accept=".jpg,.jpeg,.png">
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
                                    </div>

                                    <input type="hidden" name="kategori_surat" id="kategori_surat" value="<?= isset($this->session->flashdata('old_input')['kategori_surat']) ? $this->session->flashdata('old_input')['kategori_surat'] : '' ?>">
                                </form>
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
        stepper2 = new Stepper(document.querySelector('#stepper2'), {
            linear: false
        })
        stepper3 = new Stepper(document.querySelector('#stepper3'), {
            linear: false,
            animation: true
        })
        stepper4 = new Stepper(document.querySelector('#stepper4'))

        var stepperFormEl = document.querySelector('#stepperForm')
        stepperForm = new Stepper(stepperFormEl, {
            animation: true
        })

        var btnNextList = [].slice.call(document.querySelectorAll('.btn-next-form'))
        var stepperPanList = [].slice.call(stepperFormEl.querySelectorAll('.bs-stepper-pane'))
        var inputMailForm = document.getElementById('inputMailForm')
        var inputPasswordForm = document.getElementById('inputPasswordForm')
        var form = stepperFormEl.querySelector('.bs-stepper-content form')

        btnNextList.forEach(function(btn) {
            btn.addEventListener('click', function() {
                stepperForm.next()
            })
        })

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

        if (<?= isset($this->session->flashdata('old_input')['gender']) ? 'true' : 'false' ?>) {
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
        document.getElementById('letter_type').innerHTML = '';
        document.getElementById('letter_type').insertAdjacentHTML('beforeend',
            `
                            <option value="${btnChooseJenisSurat.dataset.status}">${btnChooseJenisSurat.dataset.status.split('_').map((e) => e[0].toUpperCase() + e.substring(1)).join(' ')}</option>
                        `);

        stepper1.next();
    }
</script>