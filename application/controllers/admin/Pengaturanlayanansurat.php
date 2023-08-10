<?php
class Pengaturanlayanansurat extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if ($this->session->userdata('masuk') != true) {
            $url = base_url('administrator');
            redirect($url);
        };
        $this->load->model('m_identitas');
        $this->load->model('m_pengaturan_layanan_surat');
    }

    public function index()
    {
        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['data'] = $this->m_pengaturan_layanan_surat->firstData();

        $this->load->view('admin/v_pengaturan_layanan_surat', $x);
    }

    public function update()
    {
        /**
         * 
         * Load Dependency
         */
        $this->load->library('form_validation');
        $this->load->helper('security');

        /**
         * Validation Rules
         * 
         */
        $this->form_validation->set_rules('nama_penandatangan_surat', 'Nama penandatangan surat', 'required');
        $this->form_validation->set_rules('jabatan_penandatangan_surat', 'Jabatan penandatangan surat', 'required');
        $this->form_validation->set_rules('nomor_nip_penandatangan_surat', 'Nomor NIP penandatangan surat', 'required');

        if ($this->form_validation->run() == false) {

            /**
             * Failed Validation
             * 
             */
            $this->session->set_flashdata('error', validation_errors());
            $this->session->set_flashdata('old_input', $this->input->post());

            redirect('/admin/pengaturanlayanansurat');
        } else {
            $data = [
                'nama_penandatangan_surat' => $this->input->post('nama_penandatangan_surat'),
                'jabatan_penandatangan_surat' => $this->input->post('jabatan_penandatangan_surat'),
                'nomor_nip_penandatangan_surat' => $this->input->post('nomor_nip_penandatangan_surat')
            ];

            $this->db->update('tb_pengaturan_layanan_surat', $data, 'id=1');

            $this->session->set_flashdata('success', 'Pengaturan layanan surat telah diupdate');

            redirect('/admin/pengaturanlayanansurat');
        }
    }
}
