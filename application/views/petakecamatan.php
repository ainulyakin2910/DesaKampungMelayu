<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>
<div class="marketing">
    <?php $this->load->view('template/pathway') ?>
    <div class="featurette-divider"></div>
    <div class="container">

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-8">

                <h3 class="p-title">Peta Desa Kampung Melayu <span style="color:#DC3545;"></span></h3>
                <!-- Post Content -->
                <div>

                </div>

                <hr>
            </div>

            <!-- Sidebar Widgets Column -->
            <div class="col-md-4">
                <?php $this->load->view('template/widget') ?>

            </div>

        </div>
    </div>

</div>
<!-- end feature yo-->
<!-- FOOTER -->
<?php $this->load->view('template/startup2/footer') ?>