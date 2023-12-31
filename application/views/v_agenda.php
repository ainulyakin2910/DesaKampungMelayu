<?php $this->load->view('template/startup2/header');
$this->load->view('template/startup2/menu') ?>
<div class="marketing">
    <?php $this->load->view('template/pathway') ?>
    <div class="featurette-divider"></div>
    <div class="container">

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-8">

                <h1 class="mt-4"><?php echo $nama; ?></h1>

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

                <!-- Post Content -->
                <div>
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <th scope="row">Tanggal</th>
                                <td>:</td>
                                <td>
                                    <?php
                                    if ($startdate == $enddate) {
                                        echo ($startdate);
                                    } else {
                                        echo ($startdate . ' - ' . $enddate);
                                    }

                                    ?>
                                </td>

                            </tr>
                            <tr>
                                <th scope="row">Agenda</th>
                                <td>:</td>
                                <td><?php echo $deskripsi ?></td>

                            </tr>
                            <tr>
                                <th scope="row">Lokasi</th>
                                <td>:</td>
                                <td><?php echo $tempat ?></td>

                            </tr>
                            <tr>
                                <th scope="row">Keterangan</th>
                                <td>:</td>
                                <td><?php echo $ket ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>



            </div>
            <!-- end feature yo-->
            <!-- FOOTER -->
            <?php $this->load->view('template/startup2/footer') ?>