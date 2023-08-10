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
                                <h3 class="text-center text-primary">Login</h3>
                            </div>
                            <form action="<?= base_url('form/loginaction') ?>" method="post">
                                <div>
                                    <label for="no_ktp">No KTP</label>
                                    <div class="form-group first">
                                        <input type="number" placeholder="No KTP" class="form-control" name="no_ktp" id="no_ktp" autocomplete="off" value="<?= isset($this->session->flashdata('old_input')['no_ktp']) ? $this->session->flashdata('old_input')['no_ktp'] : '' ?>">
                                    </div><br>
                                </div>

                                <div>
                                    <label for="password">Password</label>
                                    <div class="form-group last mb-4">
                                        <input type="password" placeholder="Password" class="form-control" name="password" id="password" autocomplete="new-password">
                                        <p style="text-align: right;" class="mt-2">
                                            <a href="<?= base_url('form/lupakatasandi') ?>" class="small">Lupa kata sandi</a>
                                        </p>
                                    </div>
                                </div>


                                <div>
                                    <button type="submit" class="btn btn-block btn-primary">Login</button>
                                    <p class="text-center">Belum punya akun ?</p>
                                    <p class="text-center"><a href="<?= site_url('form/register') ?>" class="forgot-pass text-decoration-none text-primary">Daftar</a></p>
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