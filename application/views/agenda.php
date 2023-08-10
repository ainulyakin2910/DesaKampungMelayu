<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>
<div class="marketing">
    <?php $this->load->view('template/pathway') ?>
    <div class="featurette-divider"></div>
    <div class="container">

        <div class="row">

            <!-- Recent Post Start -->
            <div class="col-md-8">
                <div class="section-title section-title-sm position-relative pb-3 mb-4">
                    <h3 class="mb-0">Agenda</h3>
                </div>
                <?php foreach ($agenda->result() as $row) : ?>
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
        </div>
    </div>

</div>
<br>
<!-- end feature yo-->
<!-- FOOTER -->
<?php $this->load->view('template/startup2/footer') ?>