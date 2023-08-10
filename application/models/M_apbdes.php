<?php
class M_apbdes extends CI_Model
{
    function get_all_apbdes()
    {
        $hsl = $this->db->query("SELECT tb_apbdes.*,DATE_FORMAT(tanggal,'%d/%m/%Y') AS tanggal1 FROM tb_apbdes ORDER BY tanggal DESC");
        return $hsl;
    }
    function tampil_apbdes()
    {
        $hsl = $this->db->query("SELECT tb_apbdes.id, tb_apbdes.judul, tb_apbdes.tanggal, tb_apbdes.file,tb_apbdes.gambar,tb_user.nama AS author, DATE_FORMAT(tanggal,'%d/%m/%Y') AS tanggal1 FROM tb_apbdes INNER join tb_user on tb_apbdes.tanggal = tb_user.id ORDER BY tb_apbdes.tanggal DESC");
        return $hsl;
    }

    function simpan_apbdes($judul, $file, $tanggal, $gambar)
    {
        $hsl = $this->db->query("insert into tb_apbdes(judul,file,tanggal,gambar,apbdes) values ('$judul','$file','$tanggal','$gambar',)");
        return $hsl;
    }
    function get_apbdes_by_kode($kode)
    {
        $hsl = $this->db->query("SELECT tb_apbdes.*,DATE_FORMAT(tanggal,'%d/%m/%Y') AS tanggal FROM tb_apbdes where id='$kode'");
        return $hsl;
    }
    function update_apbdes($id, $judul, $file, $tanggal, $gambar)
    {
        $hsl = $this->db->query("update tb_apbdes set judul='$judul',file='$file',tanggal='$tanggal',gambar='$gambar' where id='$id'");
        return $hsl;
    }
    function update_apbdes_tanpa_img($id, $judul, $file, $tanggal)
    {
        $hsl = $this->db->query("update tb_apbdes set judul='$judul',file='$file',tanggal='$tanggal' where id='$id'");
        return $hsl;
    }
    function hapus_apbdes($kode)
    {
        $hsl = $this->db->query("delete from tb_apbdes where id='$kode'");
        return $hsl;
    }

    //Front-End
    function get_apbdes()
    {
        // $hsl = $this->db->query("SELECT tb_apbdes.*,DATE_FORMAT(tanggal,'%d/%m/%Y') AS tanggal FROM tb_apbdes ORDER BY id DESC limit 4");
        // return $hsl;
        $this->db->select('*,DATE_FORMAT(tanggal,"%d %M %Y %h:%i ") AS tanggal1');
        $this->db->from('tb_apbdes');
        $this->db->order_by('tanggal', 'DESC');
        $this->db->limit(6);
        $hsl = $this->db->get();
        return $hsl;
    }
    function get_apbdes1()
    {
        // $hsl = $this->db->query("SELECT tb_apbdes.*,DATE_FORMAT(tanggal,'%d/%m/%Y') AS tanggal FROM tb_apbdes ORDER BY id DESC limit 4");
        // return $hsl;
        $this->db->select('*,DATE_FORMAT(tanggal,"%d %M %Y") AS tanggal1');
        $this->db->from('tb_apbdes');
        $this->db->order_by('tanggal', 'DESC');
        $this->db->limit(6);
        $hsl = $this->db->get();
        return $hsl;
    }

    function apbdes_perpage($offset, $limit)
    {
        $hsl = $this->db->query("SELECT tb_apbdes.*,DATE_FORMAT(tanggal,'%d %M %Y %h:%i') AS tanggal1 FROM tb_apbdes ORDER BY tanggal DESC limit $offset,$limit");
        return $hsl;
    }

    function apbdes()
    {
        $hsl = $this->db->query("SELECT tb_apbdes.*,DATE_FORMAT(tanggal,'%d/%m/%Y') AS tanggal1 FROM tb_apbdes ORDER BY tanggal DESC");
        return $hsl;
    }
    function get_apbdesd_by_kode($kode)
    {
        $hsl = $this->db->query("SELECT tb_apbdes.id, tb_apbdes.judul, tb_apbdes.tanggal, tb_apbdes.file, tb_apbdes.gambar,tb_user.nama AS author, DATE_FORMAT(tanggal,'%d %M %Y %h:%i') AS tanggal1 FROM tb_apbdes INNER join tb_user on tb_apbdes.tanggal = tb_user.id where tb_apbdes.id='$kode'");
        return $hsl;
    }

    function cari_apbdes($keyword)
    {
        $hsl = $this->db->query("SELECT tb_apbdes.*,DATE_FORMAT(tanggal,'%d/%m/%Y') AS tanggal1 FROM tb_apbdes WHERE judul LIKE '%$keyword%' LIMIT 5");
        return $hsl;
    }
}
