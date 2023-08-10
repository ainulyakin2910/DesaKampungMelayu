<?php
class M_userpenduduk extends CI_Model
{

    /**
     * Find by Username
     * 
     */
    function findByUsername($username)
    {
        $hsl = $this->db->query("SELECT * FROM tb_user_penduduk WHERE username = '$username'")->result();

        if (isset($hsl[0])) {
            return $hsl[0];
        } else {
            return null;
        }
    }

    /**
     * Find by No HP
     * 
     */
    function findByNoHP($no_hp)
    {
        $hsl = $this->db->query("SELECT * FROM tb_user_penduduk WHERE no_hp = '$no_hp'")->result();

        if (isset($hsl[0])) {
            return $hsl[0];
        } else {
            return null;
        }
    }

    /**
     * Find by No KTP
     * 
     */
    function findByNoKTP($no_ktp)
    {
        $hsl = $this->db->query("SELECT * FROM tb_user_penduduk WHERE no_ktp = '$no_ktp'")->result();

        if (isset($hsl[0])) {
            return $hsl[0];
        } else {
            return null;
        }
    }

    /**
     * Find by Token
     * 
     */
    function findByToken($token)
    {
        $hsl = $this->db->query("SELECT * FROM tb_user_penduduk WHERE token = '$token'")->result();

        if (isset($hsl[0])) {
            return $hsl[0];
        } else {
            return null;
        }
    }

    function get_all()
    {
        $hsl = $this->db->query("SELECT * FROM tb_user_penduduk ORDER BY nama_lengkap ASC");
        return $hsl;
    }

    function updateNama($nama, $no_ktp)
    {
        $this->db->query("UPDATE tb_user_penduduk SET nama_lengkap = '$nama' WHERE no_ktp = '$no_ktp'");
    }

    function updatePassword($password, $no_ktp)
    {
        $this->db->query("UPDATE tb_user_penduduk SET password = '$password' WHERE no_ktp = '$no_ktp'");
    }

    function updateToken($token, $no_ktp)
    {
        $this->db->query("UPDATE tb_user_penduduk SET token = '$token' WHERE no_ktp = '$no_ktp'");
    }
}
