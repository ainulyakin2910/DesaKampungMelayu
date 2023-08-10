<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/viewerjs/1.11.3/viewer.min.css" integrity="sha512-zdX1vpRJc7+VHCUJcExqoI7yuYbSFAbSWxscAoLF0KoUPvMSAK09BaOZ47UFdP4ABSXpevKfcD0MTVxvh0jLHQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<div id="wrap">

    <div class="marketing">
        <?php $this->load->view('template/pathway') ?>
        <!-- <div class="featurette-divider"></div> -->
        <section class="gallery-block compact-gallery">
            <div id="main" class="container clear-top">
                <div class="row">
                    <div class="col-sm-3 blog-sidebar">
                        <h5>KATEGORI</h5>
                        <ul>
                            <li class="active"><a href="<?php echo base_url('media/gallery') ?>">Gallery</a></li>
                            <li><a href="<?php echo base_url('media/instagram') ?>">Instagram</a></li>
                        </ul>

                    </div>
                    <div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                        <div class="container py-5">
                            <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
                                <h1 class="mb-0">Galeri</h1>
                            </div>
                            <div class="row g-5">
                                <?php
                                foreach ($galeri->result() as $row) : ?>
                                    <div class="col-lg-3 wow slideInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: slideInUp;">
                                        <div class="team-item bg-light rounded overflow-hidden">
                                            <div class="team-img position-relative overflow-hidden">
                                                <img class="img-fluid w-100 img-galeri" style="cursor: pointer; height: 200px; object-fit: cover; object-position: center" src="<?php echo site_url('assets/images/') . $row->gambar ?>" alt="">
                                            </div>
                                            <div class="text-center py-4">
                                                <h4 class="text-primary"><?php echo $row->judul ?></h4>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>

                                <div id="result" class="row no-gutters">

                                </div>
                            </div>
                        </div>

                    </div>
        </section>

    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/viewerjs/1.11.3/viewer.min.js" integrity="sha512-f8kZwYACKF8unHuRV7j/5ILZfflRncxHp1f6y/PKuuRpCVgpORNZMne1jrghNzTVlXabUXIg1iJ5PvhuAaau6Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    Array.from(document.querySelectorAll('.img-galeri')).forEach((e) => {
        const viewer = new Viewer(e);
    });
</script>

<!-- end feature yo-->
<!-- FOOTER -->
<?php $this->load->view('template/startup2/footer') ?>