<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_form extends CI_Model {

    public function insert_data($data) {
        $this->db->insert('tb_form', $data);
    }
}
