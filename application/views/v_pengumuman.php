<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>
<div class="marketing">
    <?php $this->load->view('template/pathway') ?>
    <div class="featurette-divider"></div>
    <div class="container">

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-8">

                <h1 class="mt-4"><?php echo $judul; ?></h1>

                <!-- Author -->
                <p class="lead">
                    by
                    <i class="fa fa-user"></i> <?php echo $author; ?>
                </p>
                <hr>
                <div class="meta">
                    <div class="date"><i class="fa fa-calendar"></i> <?php echo $tanggal; ?></div>

                </div>
                <hr>
                <?php echo $isi; ?>
                <!-- Post Content -->
                <div class="blog-icons">
                    <div class="blog-share_block">
                    </div>
                </div>
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