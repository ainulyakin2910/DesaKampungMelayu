<?php
class M_penduduk extends CI_Model {
  function get_all() {
    return $this->db->query("SELECT tb_penduduk.* ,IF(jenis_kelamin='L','Laki-Laki','Perempuan') AS jenis_kelamin FROM tb_penduduk");
  }

  function simpan($data) {
    $nik = $data['nik'];
    $nama = $data['nama'];
    $tempat_lahir = $data['tempat_lahir'];
    $tanggal_lahir = $data['tanggal_lahir'];
    $jenis_kelamin = $data['jenis_kelamin'];
    $alamat = $data['alamat'];
    $agama = $data['agama'];
    $status = $data['status'];
    $pekerjaan = $data['pekerjaan'];
    $kewarganegaraan = $data['kewarganegaraan'];
    $no_hp = $data['no_hp'];

    return $this->db->query("INSERT INTO tb_penduduk (nik, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, alamat, agama, status, pekerjaan, kewarganegaraan, no_hp) VALUES ('$nik', '$nama', '$tempat_lahir', '$tanggal_lahir', '$jenis_kelamin', '$alamat', '$agama', '$status', '$pekerjaan', '$kewarganegaraan', '$no_hp')");
  }

  function update($data, $photo = null) {
    $nik = $data['nik'];
    $nama = $data['nama'];
    $tempat_lahir = $data['tempat_lahir'];
    $tanggal_lahir = $data['tanggal_lahir'];
    $jenis_kelamin = $data['jenis_kelamin'];
    $alamat = $data['alamat'];
    $agama = $data['agama'];
    $status = $data['status'];
    $pekerjaan = $data['pekerjaan'];
    $kewarganegaraan = $data['kewarganegaraan'];
    $no_hp = $data['no_hp'];

    if ($photo) {
      return $this->db->query("UPDATE tb_penduduk SET nama='$nama', tempat_lahir='$tempat_lahir', tanggal_lahir='$tanggal_lahir', jenis_kelamin='$jenis_kelamin', alamat='$alamat', agama='$agama', status='$status', pekerjaan='$pekerjaan', kewarganegaraan='$kewarganegaraan', no_hp='$no_hp', foto_ktp='$photo' WHERE nik='$nik'");
    }

    return $this->db->query("UPDATE tb_penduduk SET nama='$nama', tempat_lahir='$tempat_lahir', tanggal_lahir='$tanggal_lahir', jenis_kelamin='$jenis_kelamin', alamat='$alamat', agama='$agama', status='$status', pekerjaan='$pekerjaan', kewarganegaraan='$kewarganegaraan', no_hp='$no_hp' WHERE nik='$nik'");
  }

  function hapus($id) {
		return $this->db->query("DELETE FROM tb_penduduk where id='$id'");
	}

  function get_penduduk($nik) {
		return $this->db->query("SELECT * FROM tb_penduduk where nik='$nik'");
	}
}