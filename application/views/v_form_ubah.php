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
                <form action="<?= base_url('form/ubahpengajuanaction') ?>" method="POST" enctype="multipart/form-data" class="mt-4">
                    <input type="hidden" name="id" value="<?= $data->id ?>">

                    <?php if (in_array($data->letter_category, ['surat_pengantar_berkelakuan_baik', 'surat_pernyataan_belum_menikah'])) { ?>
                        <div class="row mb-3">
                            <div class="col-lg-3">
                                <div style="text-align: left;">
                                    <label for="keperluan">Digunakan Untuk</label>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="form-group">
                                    <textarea class="form-control" id="keperluan" name="keperluan" required rows="3" placeholder="Digunakan Untuk"><?= $data->keperluan ?></textarea>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if (in_array($data->letter_category, ['surat_keterangan_tidak_mampu', 'surat_keterangan_domisili', 'surat_keterangan_penghasilan_orang_tua'])) { ?>
                        <div class="row mb-3">
                            <div class="col-lg-3">
                                <div style="text-align: left;">
                                    <label for="melengkapi_persyaratan">Digunakan Untuk</label>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="form-group">
                                    <textarea class="form-control" id="melengkapi_persyaratan" name="melengkapi_persyaratan" required rows="3" placeholder="Digunakan Untuk"><?= $data->melengkapi_persyaratan ?></textarea>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if (in_array($data->letter_category, ['surat_keterangan_kematian', 'surat_keterangan_kelahiran'])) { ?>
                        <div class="row mb-3">
                            <div class="col-lg-3">
                                <div style="text-align: left;">
                                    <label for="nama_ibu">Nama Ibu</label>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="form-group">
                                    <input type="text" class="form-control" value="<?= $data->nama_ibu ?>" id="nama_ibu" name="nama_ibu" required placeholder="Nama Ibu" value="<?= isset($this->session->flashdata('old_input')['nama_ibu']) ? $this->session->flashdata('old_input')['nama_ibu'] : '' ?>">
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
                                    <input type="text" class="form-control" value="<?= $data->nama_ayah ?>" id="nama_ayah" name="nama_ayah" required placeholder="Nama Ayah" value="<?= isset($this->session->flashdata('old_input')['nama_ayah']) ? $this->session->flashdata('old_input')['nama_ayah'] : '' ?>">
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                    <?php if ($data->letter_category == 'surat_keterangan_kematian') { ?>
                        <div class="row mb-3">
                            <div class="col-lg-3">
                                <div style="text-align: left;">
                                    <label for="hari_meninggal">Meninggal Pada Hari</label>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="form-group">
                                    <select class="form-select" name="hari_meninggal" id="hari_meninggal" required>
                                        <option value="Senin" <?= $data->hari_meninggal == 'Senin' ? 'selected' : '' ?>>Senin</option>
                                        <option value="Selasa" <?= $data->hari_meninggal == 'Selasa' ? 'selected' : '' ?>>Selasa</option>
                                        <option value="Rabu" <?= $data->hari_meninggal == 'Rabu' ? 'selected' : '' ?>>Rabu</option>
                                        <option value="Kamis" <?= $data->hari_meninggal == 'Kamis' ? 'selected' : '' ?>>Kamis</option>
                                        <option value="Jumat" <?= $data->hari_meninggal == 'Jumat' ? 'selected' : '' ?>>Jum'at</option>
                                        <option value="Sabtu" <?= $data->hari_meninggal == 'Sabtu' ? 'selected' : '' ?>>Sabtu</option>
                                        <option value="Minggu" <?= $data->hari_meninggal == 'Minggu' ? 'selected' : '' ?>>Minggu</option>
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
                                    <input type="date" class="form-control" value="<?= $data->tanggal_meninggal ?>" id="tanggal_meninggal" name="tanggal_meninggal" required placeholder="Tanggal Meninggal" value="<?= isset($this->session->flashdata('old_input')['tanggal_meninggal']) ? $this->session->flashdata('old_input')['tanggal_meninggal'] : '' ?>">
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
                                    <input type="text" class="form-control" value="<?= $data->jam_meninggal ?>" id="jam_meninggal" name="jam_meninggal" required placeholder="Jam Meninggal" value="<?= isset($this->session->flashdata('old_input')['jam_meninggal']) ? $this->session->flashdata('old_input')['jam_meninggal'] : '' ?>">
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
                                    <textarea class="form-control" id="bertempat_di" name="bertempat_di" required rows="3" placeholder="Alamat"><?= $data->bertempat_di ?></textarea>
                                </div>
                            </div>
                        </div>
                        <hr>
                    <?php } ?>
                    <div class="row mb-4">
                        <div class="col-lg-3">
                            <div style="text-align: left;">
                                <label for="opsi_ttd">Opsi Tanda Tangan</label>
                            </div>
                        </div>
                        <div class="col-lg-9 d-flex justify-content-start">
                            <select name="opsi_ttd" id="opsi_ttd" class="form-control" required>
                                <option value="asli" <?= $data->opsi_ttd == 'asli' ? 'selected' : '' ?>>ASLI (Datang ke kantor)</option>
                                <option value="scan" <?= $data->opsi_ttd == 'scan' ? 'selected' : '' ?>>SCAN</option>
                            </select>
                        </div>
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