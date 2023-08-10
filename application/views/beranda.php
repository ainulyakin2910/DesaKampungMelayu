<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/viewerjs/1.11.3/viewer.min.css" integrity="sha512-zdX1vpRJc7+VHCUJcExqoI7yuYbSFAbSWxscAoLF0KoUPvMSAK09BaOZ47UFdP4ABSXpevKfcD0MTVxvh0jLHQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
    .map-iframe-desa {
        width: 100%;
        height: 200px;
        margin-top: -2.7rem;
    }

    @media screen and (min-width: 768px) {
        .map-iframe-desa {
            height: 450px;
            margin-top: -2.7rem;
        }
    }
</style>

<?php $r = $statis->row_array() ?>

<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-7">
                <div class="section-title position-relative pb-3 mb-5">
                    <h1 class="mb-0">Kata Sambutan</h1>
                </div>
                <p class="mb-4"><?php echo limit_words($r['isi'], 20) . '...'; ?></p>
                <a href="<?php echo site_url('sambutan'); ?>" class="btn btn-primary py-3 px-5 mt-3 wow zoomIn" data-wow-delay="0.9s" style="visibility: visible; animation-delay: 0.9s; animation-name: zoomIn;">Selengkapnya</a>
            </div>
            <div class="col-lg-5" style="min-height: 500px;">
                <div class="position-relative h-100">
                    <img class="position-absolute w-100 h-100 rounded wow zoomIn" style="object-fit: cover; object-position: center" data-wow-delay="0.9s" src="<?php echo base_url(); ?>assets/images/sambutan/<?= $r['gambar'] ?>" style="object-fit: cover; visibility: visible; animation-delay: 0.9s; animation-name: zoomIn;">
                </div>
                <h3 class="text-center mt-4">Kepala Desa</h3>
            </div>
        </div>
    </div>
</div>



<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
    <div class="container py-5">

        <div class="row g-5">
            <!-- Blog list Start -->
            <div class="col-lg-8">
                <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
                    <h1 class="mb-0">Berita Terbaru</h1>
                </div>

                <div class="row g-5">
                    <?php
                    $b = $ber_pertama->row_array();
                    ?>

                    <div class="col-md-6 wow slideInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: slideInUp;">
                        <div class="blog-item bg-light rounded overflow-hidden">
                            <div class="blog-img position-relative overflow-hidden">
                                <img class="img-fluid" src="assets/images/<?php echo $b['gambar'] ?>" style="height: 230px; object-fit: cover; object-position: center;" alt="">
                            </div>
                            <div class="p-4">
                                <div class="d-flex mb-3">
                                    <small class="me-3"><i class="far fa-user text-primary me-2"></i><?php echo $b['nama'] ?></small>
                                    <small><i class="far fa-calendar-alt text-primary me-2"></i><?php echo $b['tanggal1'] ?></small>
                                </div>
                                <h4 class="mb-3"><?php echo $b['judul'] ?></h4>
                                <p><?php echo limit_words($b['isi'], 10) . '...'; ?></p>
                                <a class="text-uppercase" href="<?php echo site_url('berita/vw-' . $b['slug']); ?>">Lanjut Baca <i class="bi bi-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>

                    <?php foreach ($berita->result() as $row) : ?>
                        <div class="col-md-6 wow slideInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: slideInUp;">
                            <div class="blog-item bg-light rounded overflow-hidden">
                                <div class="blog-img position-relative overflow-hidden">
                                    <img class="img-fluid" src="assets/images/<?php echo $row->gambar ?>" style="height: 230px; object-fit: cover; object-position: center;" alt="">
                                </div>
                                <div class="p-4">
                                    <div class="d-flex mb-3">
                                        <small class="me-3"><i class="far fa-user text-primary me-2"></i><?php echo $row->nama ?></small>
                                        <small><i class="far fa-calendar-alt text-primary me-2"></i><?php echo $row->tanggal1 ?></small>
                                    </div>
                                    <h4 class="mb-3"><?php echo $row->judul ?></h4>
                                    <p><?php echo limit_words($row->isi, 10) . '...'; ?></p>
                                    <a class="text-uppercase" href="<?php echo site_url('berita/vw-' . $row->slug); ?>">Lanjut Baca <i class="bi bi-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>

                </div>
                <div class="row mt-4">
                    <div class="col d-flex justify-content-center">
                        <a href="<?php echo site_url('berita'); ?>" class="btn btn-primary py-3 px-5 mt-3 wow zoomIn" data-wow-delay="0.9s" style="visibility: visible; animation-delay: 0.9s; animation-name: zoomIn;">Lihat seluruh berita</a>
                    </div>
                </div>
            </div>
            <!-- Blog list End -->

            <!-- Sidebar Start -->
            <div class="col-lg-4">

                <!-- Recent Post Start -->
                <div class="mb-5 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
                    <div class="section-title section-title-sm position-relative pb-3 mb-4">
                        <h3 class="mb-0">Pengumuman</h3>
                    </div>

                    <?php foreach ($pengumuman->result() as $row) : ?>
                        <div class="d-flex rounded overflow-hidden mb-3">
                            <img class="img-fluid" src="assets/images/pengumuman.jpg" style="width: 100px; height: 100px; object-fit: cover;" alt="">
                            <a href="<?php echo site_url('pengumuman/vw:' . $row->slug); ?>" class="h5 fw-semi-bold d-flex flex-column justify-content-center align-items-start bg-light px-3 mb-0 w-100">
                                <?php echo $row->judul; ?>
                                <small style="font-size: .7rem;" class="mt-2"><i class="fa fa-calendar"></i> Posted <?php echo $row->tanggal1 ?> </small>
                            </a>
                        </div>
                    <?php endforeach; ?>
                    <a class="text-uppercase" href="<?php echo site_url('pengumuman'); ?>">Selengkapnya <i class="bi bi-arrow-right"></i></a>
                </div>
                <!-- Recent Post End -->

                <!-- Recent Post Start -->
                <div class="mb-5 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
                    <div class="section-title section-title-sm position-relative pb-3 mb-4">
                        <h3 class="mb-0">Agenda</h3>
                    </div>
                    <?php foreach ($agenda->result() as $row) : ?>
                        <div class="d-flex rounded overflow-hidden mb-1">
                            <div class="event_date bg-primary text-white p-3" style="width: 175px;">
                                <div class="event-date-wrap">
                                    <p><?php echo date("d", strtotime($row->startdate)); ?></p>
                                    <span><?php echo date("M. Y", strtotime($row->startdate)); ?></span>
                                </div>
                            </div>
                            <a href="<?php echo site_url('agenda/vw:' . $row->slug); ?>" class="h5 fw-semi-bold d-flex flex-column align-items-start justify-content-center bg-light px-3 mb-0 w-100">
                                <?php echo $row->nama ?>
                                <small style="font-size: .7rem;" class="mt-2"><i class="fa fa-calendar"></i> Posted <?php echo $row->tanggal1 ?> </small>
                            </a>
                        </div>
                    <?php endforeach; ?>
                    <a class="text-uppercase" href="<?php echo site_url('agenda'); ?>">Selengkapnya <i class="bi bi-arrow-right"></i></a>
                </div>
                <!-- Recent Post End -->
            </div>
            <!-- Sidebar End -->
        </div>
    </div>
</div>

<div class="px-5">
    <div style="border-radius: 10px; background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('/assets/potensi/padi.jpg') center center;" class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
        <div class="row py-5">
            <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                <h1 class="display-4 text-white animated zoomIn">Potensi Desa</h1>
                <a href="<?php echo site_url('potensi'); ?>" class="btn btn-primary py-3 px-5 mt-3 wow zoomIn" data-wow-delay="0.9s" style="visibility: visible; animation-delay: 0.9s; animation-name: zoomIn;">Lihat Selengkapnya</a>
            </div>
        </div>
    </div>
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

        </div>
    </div>
</div>




<div class="container-fluid pb-5 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
    <div class="container pb-5">
        <div class="section-title text-center position-relative pb-3 mb-5 mx-auto" style="max-width: 600px;">
            <h1 class="mb-0">Peta Wilayah</h1>
        </div>
        <div class="row g-5 mb-5">
            <div class="col">
                <div class="section-header">
                    <h2>Peta Wilayah</h2>
                </div>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63752.847827305224!2d113.16739170163824!3d-2.9438907402475905!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2de25096b0d0c1e9%3A0xab7c883e913b80fa!2sKp.%20Melayu%2C%20Kec.%20Mendawai%2C%20Kabupaten%20Katingan%2C%20Kalimantan%20Tengah!5e0!3m2!1sid!2sid!4v1684317112132!5m2!1sid!2sid" class="map-iframe-desa" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/viewerjs/1.11.3/viewer.min.js" integrity="sha512-f8kZwYACKF8unHuRV7j/5ILZfflRncxHp1f6y/PKuuRpCVgpORNZMne1jrghNzTVlXabUXIg1iJ5PvhuAaau6Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    Array.from(document.querySelectorAll('.img-galeri')).forEach((e) => {
        const viewer = new Viewer(e);
    });
</script>

<?php $this->load->view('template/startup2/footer') ?>