<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>

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

    <div class="container">
        <div class="row mb-4">
            <div class="col">
                <?php
                if ($this->session->flashdata('success')) {
                    echo '<div class="alert alert-success">' . $this->session->flashdata('success') . '</div>';
                }
                ?>
                <h3>Selamat Datang : <?= $this->session->userdata('auth_penduduk')->nama_lengkap ?></h3>
                <a href="<?php echo base_url() . 'form/ubah'; ?>" class="btn btn-info">Ubah Data</a>
                <button onclick="document.getElementById('form-logout').submit()" class="btn btn-danger">Logout</button>

                <form method="POST" action="<?= site_url('form/logout') ?>" id="form-logout">
                </form>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <form action="<?= base_url('form/ubahaction') ?>" method="POST" enctype="multipart/form-data" class="mt-4">
                    <input type="hidden" name="id" value="<?= $data->id ?>">
                    <div class="form-group mb-3">
                        <label>No KTP <span class="text-danger">*</span></label>
                        <input type="text" name="nik" value="<?= $data->nik ?>" class="form-control" required readonly>
                    </div>
                    <div class="form-group mb-3">
                        <label>Nama <span class="text-danger">*</span></label>
                        <input type="text" name="nama" value="<?= $data->nama ?>" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label>Tempat Lahir <span class="text-danger">*</span></label>
                        <input type="text" name="tempat_lahir" value="<?= $data->tempat_lahir ?>" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label>Tanggal Lahir <span class="text-danger">*</span></label>
                        <input type="date" name="tanggal_lahir" value="<?= $data->tanggal_lahir ?>" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label>Jenis Kelamin <span class="text-danger">*</span></label>
                        <select name="jenis_kelamin" required class="form-control">
                            <option value="L" <?= $data->jenis_kelamin == 'L' ? 'selected' : '' ?>>Laki-Laki</option>
                            <option value="P" <?= $data->jenis_kelamin == 'P' ? 'selected' : '' ?>>Perempuan</option>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label>Alamat <span class="text-danger">*</span></label>
                        <input type="text" name="alamat" value="<?= $data->alamat ?>" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label>Agama <span class="text-danger">*</span></label>
                        <input type="text" name="agama" value="<?= $data->agama ?>" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label>Status <span class="text-danger">*</span></label>
                        <select name="status" required class="form-control">
                            <option value="SUDAH MENIKAH" <?= $data->status == 'SUDAH MENIKAH' ? 'selected' : '' ?>>SUDAH MENIKAH</option>
                            <option value="BELUM MENIKAH" <?= $data->status == 'BELUM MENIKAH' ? 'selected' : '' ?>>BELUM MENIKAH</option>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label>Pekerjaan <span class="text-danger">*</span></label>
                        <input type="text" name="pekerjaan" value="<?= $data->pekerjaan ?>" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label>Kewarganegaraan <span class="text-danger">*</span></label>
                        <input type="text" name="kewarganegaraan" value="<?= $data->kewarganegaraan ?>" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label>Nomor HP <span class="text-danger">*</span></label>
                        <input type="text" name="no_hp" value="<?= $data->no_hp ?>" class="form-control" required>
                    </div>
                    <div class="form-group mb-3">
                        <label>Foto KTP <span class="text-danger">*</span></label>
                        <input type="file" name="foto_ktp" class="form-control">
                    </div>
                    <div class="form-group d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary btn-lg"><i class="zmdi zmdi-mail-send"></i> Kirim</button>
                    </div>
                </form>
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
    <?php $this->load->view('template/startup2/footer') ?>
    <script>
        const isLargerThanMobileScreen = ($(window).width() > 480) ? true : false;

        if (isLargerThanMobileScreen) {
            $(function() {
                $("#table-list").DataTable();
            });
        } else {
            $(function() {
                $("#table-list").DataTable({
                    scrollX: true,
                });
            });
        }
    </script>