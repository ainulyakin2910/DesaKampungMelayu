<?php
class Penggunalayanansurat extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        if ($this->session->userdata('masuk') != TRUE) {
            $url = base_url('administrator');
            redirect($url);
        };
        $this->load->model('m_identitas');
        $this->load->model('m_layanansurat');
        $this->load->model('M_userpenduduk');
        $this->load->library('upload');
    }

    function index()
    {
        $x['iden'] = $this->m_identitas->get_all_identitas();
        $x['data'] = $this->M_userpenduduk->get_all();
        $this->load->view('admin/v_penggunalayanansurat', $x);
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

    function changepassword()
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
        $this->form_validation->set_rules('username', 'Username', 'required');
        $this->form_validation->set_rules('new_password', 'Password', 'required|min_length[6]');

        if ($this->form_validation->run() == false) {

            /**
             * Failed Validation
             * 
             */
            $this->session->set_flashdata('error', validation_errors());

            redirect('admin/penggunalayanansurat');
        } else {
            /**
             * Password Confirmation not match
             * 
             */
            if ($this->input->post('new_password') != $this->input->post('new_password_confirmation')) {
                $this->session->set_flashdata('error', 'Password konfirmasi tidak cocok');

                redirect('admin/penggunalayanansurat');
            }

            $user = $this->M_userpenduduk->findByUsername($this->input->post('username'));

            if (!$user) {
                $this->session->set_flashdata('error', 'Username tidak cocok');

                redirect('admin/penggunalayanansurat');
            }

            $newPw = password_hash($this->input->post('new_password'), PASSWORD_DEFAULT);
            $this->M_userpenduduk->updatePassword($newPw, $this->input->post('username'));

            $this->session->set_flashdata('success', 'Kata sandi dari username ' . $this->input->post('username') . ' telah diubah');

            redirect('admin/penggunalayanansurat');
        }
    }
}
