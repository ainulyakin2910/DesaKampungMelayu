<?php
class M_pengaturan_layanan_surat extends CI_Model
{

    function firstData()
    {
        $hsl = $this->db->query("SELECT * FROM tb_pengaturan_layanan_surat");
        return $hsl;
    }
}
