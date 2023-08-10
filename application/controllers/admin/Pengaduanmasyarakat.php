<?php
class Pengaduanmasyarakat extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if ($this->session->userdata('masuk') != true) {
            $url = base_url('administrator');
            redirect($url);
        };
        $this->load->model('m_identitas');
        $this->load->model('m_pengaduan');
    }

    public function index()
    {
        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['data'] = $this->m_pengaduan->get_all_pengaduan();

        $this->load->view('admin/v_pengaduan_masyarakat', $x);
    }
}
