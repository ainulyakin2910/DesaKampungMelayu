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

    <div class="content pt-0 pb-5">
        <div class="container">
            <div class="row">
                <div class="col-md-3">

                </div>
                <div class="col-md-6 contents">
                    <?php
                    if ($this->session->flashdata('error')) {
                        echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Error!</strong> ' . $this->session->flashdata('error') . '
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>';
                    }
                    ?>
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div class="mb-4">
                                <h3 class="text-center">Mendaftar</h3>
                            </div>
                            <?php if (!$nik) { ?>
                                <form action="<?= site_url('form/register') ?>" method="post">
                                    <div class="form-group first mb-3">
                                        <label for="nik">No KTP</label>
                                        <input type="text" class="form-control" name="nik" id="nik" value="<?= isset($this->session->flashdata('old_input')['nik']) ? $this->session->flashdata('old_input')['nik'] : '' ?>">
                                        <label class="label-wa" style="font-style: italic; font-size:15px;">*Masukkan Data sesuai KTP anda </label>
                                    </div>
                                    <button type="submit" class="btn btn-block btn-primary">Periksa No KTP</button>
                                </form>
                            <?php } else { ?>
                                <form action="<?= site_url('form/registeraction') ?>" method="post">
                                    <?php echo validation_errors(); ?>
                                    <input type="hidden" class="form-control" name="no_ktp" id="no_ktp" placeholder="Minimal 16 Angka" value="<?= isset($this->session->flashdata('old_input')['no_ktp']) ? $this->session->flashdata('old_input')['no_ktp'] : $nik ?>">
                                    <div>
                                        <label for="password">Password</label>
                                        <div class="form-group last mb-4">
                                            <input type="password" class="form-control" name="password" id="password" autocomplete="new-password" placeholder="Password">
                                        </div>
                                    </div>
                                    <div>
                                        <label for="password_confirmation">Password Konfirmasi</label>
                                        <div class="form-group last mb-4">
                                            <input type="password" class="form-control" name="password_confirmation" id="password_confirmation" autocomplete="new-password" placeholder="Password Konfirmasi">
                                        </div>
                                    </div>
                                    <hr>
                                    <h6 style="text-align: center;">Pertanyaan konfirmasi, digunakan untuk verifikasi identitas anda</h6>
                                    <div>
                                        <label for="dimana_anda_lahir">Dimana Anda Lahir?</label>
                                        <div class="form-group last mb-4">
                                            <input type="text" class="form-control" name="dimana_anda_lahir" id="dimana_anda_lahir" placeholder="Tempat lahir anda">
                                        </div>
                                    </div>
                                    <div>
                                        <label for="siapa_nama_sahabat_anda">Siapa nama sahabat dekat anda?</label>
                                        <div class="form-group last mb-4">
                                            <input type="text" class="form-control" name="siapa_nama_sahabat_anda" id="siapa_nama_sahabat_anda" placeholder="Nama sahabat">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-block btn-primary">Daftar</button><br>
                                </form>
                            <?php } ?>
                            <p class="text-center">Sudah punya akun ?</p>
                            <p class="text-center"><a href="<?= site_url('form/login') ?>" class="login">Masuk</a></p>
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