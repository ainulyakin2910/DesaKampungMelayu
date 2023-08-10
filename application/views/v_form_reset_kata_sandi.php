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

    <?php
    if ($this->session->flashdata('success_msg')) {
        echo '<div class="alert alert-success">' . $this->session->flashdata('success_msg') . '</div>';
    }
    ?>

    <div class="content pt-0 pb-5">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6 contents">
                    <?php
                    if ($this->session->flashdata('success')) {
                        echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Success!</strong> ' . $this->session->flashdata('success') . '
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>';
                    }
                    ?>

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
                                <h3 class="text-center text-primary">Reset Kata Sandi</h3>
                            </div>
                            <form action="<?= base_url('form/resetkatasandiaction') ?>" method="post">
                                <input type="hidden" placeholder="No KTP" class="form-control" name="token" id="token" autocomplete="off" value="<?= $this->input->get('token') ?>">

                                <div>
                                    <label for="password">Password</label>
                                    <div class="form-group last mb-4">
                                        <input type="password" class="form-control" name="password" id="password" autocomplete="new-password" placeholder="Minimal 6 Karakter">
                                    </div>
                                </div>

                                <div>
                                    <label for="password_confirmation">Password Konfirmasi</label>
                                    <div class="form-group last mb-4">
                                        <input type="password" class="form-control" name="password_confirmation" id="password_confirmation" autocomplete="new-password" placeholder="Minimal 6 Karakter">
                                    </div>
                                </div>

                                <div>
                                    <button type="submit" class="btn btn-block btn-primary">Submit</button>
                                    <p class="text-center">Sudah punya akun ?</p>
                                    <p class="text-center"><a href="<?= site_url('form/login') ?>" class="login">Masuk</a></p>
                                </div>
                            </form>
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