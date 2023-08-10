<?php
class LayananSurat extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        if ($this->session->userdata('masuk') != TRUE) {
            $url = base_url('administrator');
            redirect($url);
        };
        $this->load->model('m_identitas');
        $this->load->model('m_identitas');
        $this->load->model('m_layanansurat');
        $this->load->model('m_identitas');
        $this->load->library('upload');
    }

    function index()
    {
        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['data'] = $this->m_layanansurat->get_all_layanansurat();
        $this->load->view('admin/v_layanansurat', $x);
    }
    public function slugify($string)
    {
        //remove prepositions
        $preps = array('in', 'at', 'on', 'by', 'into', 'off', 'onto', 'from', 'to', 'with', 'a', 'an', 'the');
        $pattern = '/\b(?:' . join('|', $preps) . ')\b/i';
        $string = preg_replace($pattern, '', $string);

        // replace non letter or digits by -
        $string = preg_replace('~[^\\pL\d]+~u', '-', $string);

        // trim
        $string = trim($string, '-');

        // transliterate
        //$string = iconv('utf-8', 'us-ascii//TRANSLIT', $string);

        // lowercase
        $string = strtolower($string);

        // remove unwanted characters
        $string = preg_replace('~[^-\w]+~', '', $string);

        if (empty($string)) {
            return 'n-a';
        }

        return $string;
    }

    function hapus_layanansurat()
    {
        $kode = strip_tags($this->input->post('kode'));
        $this->m_layanansurat->hapus_layanansurat($kode);
        echo $this->session->set_flashdata('msg', 'success-hapus');
        redirect('admin/layanansurat');
    }
}
