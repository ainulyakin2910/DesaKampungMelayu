<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>
<div class="marketing">
    <?php $this->load->view('template/pathway') ?>
    <div class="featurette-divider"></div>
    <div class="container">

        <div class="row">

            <div class="col-md-8">
                <h3 class="p-title mb-4">Bantuan <span style="color:#DC3545;"></span></h3>

                <?php foreach ($arr_bantuan as $bantuan) { ?>
                    <div class="mb-5">
                        <h4><?= $bantuan->name ?></h4>
                        <img src="<?= base_url() . 'assets/images/' . $bantuan->image ?>" style="width: 100%;" alt="bantuan-image">
                    </div>
                <?php } ?>
            </div>

            <div class="col-md-4">
                <?php $this->load->view('template/widget') ?>
            </div>
        </div>
    </div>

</div>
<!-- end feature yo-->
<!-- FOOTER -->
<?php $this->load->view('template/startup2/footer') ?>