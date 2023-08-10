<!-- Recent Post Start -->
<div class="mb-5 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
    <div class="section-title section-title-sm position-relative pb-3 mb-4">
        <h3 class="mb-0">Berita</h3>
    </div>

    <?php foreach ($beritaterbaru->result() as $row) : ?>
        <div class="d-flex rounded overflow-hidden mb-3">
            <img class="img-fluid" src="<?php echo base_url() . 'assets/images/' . $row->gambar; ?>" style="width: 100px; height: 100px; object-fit: cover;" alt="">
            <a href="<?php echo site_url('berita/vw-' . $row->slug); ?>" class="h5 fw-semi-bold d-flex flex-column justify-content-center align-items-start bg-light px-3 mb-0 w-100">
                <?php echo $row->judul; ?>
                <?php echo date("M Y", strtotime($row->tanggal1)); ?></p>
            </a>
        </div>
    <?php endforeach; ?>
    <a class="text-uppercase" href="<?php echo site_url('berita'); ?>">Selengkapnya <i class="bi bi-arrow-right"></i></a>
</div>
<!-- Recent Post End -->

<!-- Recent Post Start -->
<div class="mb-5 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
    <div class="section-title section-title-sm position-relative pb-3 mb-4">
        <h3 class="mb-0">Pengumuman</h3>
    </div>

    <?php foreach ($pengumumanterbaru->result() as $row) : ?>
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
    <?php foreach ($agendaterbaru->result() as $row) : ?>
        <div class="d-flex rounded overflow-hidden mb-3">
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