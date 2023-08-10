<?php
class M_bantuan extends CI_Model
{
    function get_all_bantuan()
    {
        $hsl = $this->db->query("SELECT tb_bantuan.id, tb_bantuan.name, tb_bantuan.image FROM tb_bantuan");
        return $hsl;
    }

    function getAll()
    {
        $hsl = $this->db->query("SELECT * FROM tb_bantuan");

        return $hsl;
    }

    function simpan_bantuan($bantuan, $gambar)
    {
        $hsl = $this->db->query("INSERT INTO tb_bantuan(name, image) VALUES ('$bantuan','$gambar')");
        return $hsl;
    }
    function get_berita_by_kode($kode)
    {
        $hsl = $this->db->query("SELECT tb_berita.*,DATE_FORMAT(tanggal,'%d/%m/%Y') AS tanggal FROM tb_berita where id='$kode'");
        return $hsl;
    }
    function update_bantuan($bantuan_id, $bantuan_nama, $gambar)
    {
        $hsl = $this->db->query("update tb_bantuan set name='$bantuan_nama', image='$gambar' where id='$bantuan_id'");
        return $hsl;
    }
    function update_bantuan_tanpa_img($bantuan_id, $bantuan_nama)
    {
        $hsl = $this->db->query("update tb_bantuan set name='$bantuan_nama' where id='$bantuan_id'");
        return $hsl;
    }
    function hapus_bantuan($kode)
    {
        $hsl = $this->db->query("delete from tb_bantuan where id='$kode'");
        return $hsl;
    }
}
