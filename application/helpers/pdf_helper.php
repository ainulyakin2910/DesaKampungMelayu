<?php

function generate_pdf($html, $filename, $paper = 'A4', $orientation = 'portrait')
{
    require_once APPPATH . 'third_party/dompdf/autoload.inc.php';

    $dompdf = new Dompdf\Dompdf();
    $dompdf->loadHtml($html);
    $dompdf->setPaper($paper, $orientation);
    $dompdf->render();
    $dompdf->stream($filename . '.pdf', ['Attachment' => 0]);
}