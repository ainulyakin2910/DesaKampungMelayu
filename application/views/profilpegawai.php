<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>
<div class="marketing">
    <?php $this->load->view('template/pathway') ?>
    <div class="featurette-divider"></div>
    <div class="container">

        <div class="row">
            <?php $row = $statis->row_array() ?>
            <!-- Blog Entries Column -->
            <div class="col-md-8">

                <h3 class="p-title"><?php echo $row['judul'] ?> <span style="color:#DC3545;"></span></h3>

                <?php if (!empty($pegawai->result())) { ?>
                    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <div class="container py-5">
                            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
                                <h1 class="mb-0">Foto Pegawai</h1>
                            </div>
                            <div class="row g-5">
                                <?php
                                foreach ($pegawai->result() as $p) : ?>

                                    <div class="col-md-4 wow slideInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: slideInUp;">
                                        <div class="team-item bg-light rounded overflow-hidden">
                                            <div class="team-img position-relative overflow-hidden">
                                                <img class="img-fluid w-100" style="height: 200px; object-fit: cover; object-position: center" src="<?php echo base_url() . 'assets/images/pegawai/' . $p->photo ?>" alt="">
                                            </div>
                                            <div class="text-center py-4">
                                                <h4 class="text-primary"><?= $p->name ?></h4>
                                                <p class="text-uppercase m-0"><?= $p->position ?></p>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>

                            </div>
                        </div>
                    </div>
                <?php } ?>

                <!-- Post Content -->
                <div>
                    <?php echo $row['isi'] ?>
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