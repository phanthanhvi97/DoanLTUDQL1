using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using doan.DAL;
namespace doan
{
    public partial class login : Form
    {
        public static string username;
        public static string password;
        public static int i = 0;
        public login()
        {
            InitializeComponent();
        }
        // Đăng nhập
        private void tbdnbttdongy_Click(object sender, EventArgs e)
        {
            UDQLDataContext ql = new UDQLDataContext();
            int i = ql.cau1(tbdntxtmatkhau.Text, tbdntxttaikhoan.Text);
            if (i == 0)
            {
                MessageBox.Show("mật khẩu không chính xác");
                return;
            }

            username = tbdntxttaikhoan.Text;
            password = tbdntxtmatkhau.Text;
            login.i = 1;
            this.Close();
        }
        private void tbdnbttthoat_Click(object sender, EventArgs e)
        {
            DialogResult r = MessageBox.Show("bạn có muốn thoát ?", "thông báo", MessageBoxButtons.YesNo);
            if (r == System.Windows.Forms.DialogResult.Yes)
                this.Close();
        }


        //tạo tài khoản
        private void tbtbtttao_Click(object sender, EventArgs e)
        {
            if (tbttxtmatkhau.Text != tbttxtnlmatkhau.Text)
            {
                MessageBox.Show(tbttxtmatkhau.Text + tbttxtnlmatkhau.Text);
                MessageBox.Show("mật khẩu không chính xác");
                return;
            }

            UDQLDataContext ql = new UDQLDataContext();
            int a = ql.cau3(tbttxtmatkhau.Text, tbttxttaikhoan.Text);
            if (a == 0)
            {
                MessageBox.Show("tài khoản tồn tại rồi");
                return;
            }


            username = tbttxttaikhoan.Text;
            password = tbttxtmatkhau.Text;
            login.i = 1;
            this.Close();

        }

        private void tbtbttthoat_Click(object sender, EventArgs e)
        {
            DialogResult r = MessageBox.Show("bạn có muốn thoát ?", "thông báo", MessageBoxButtons.YesNo);
            if (r == System.Windows.Forms.DialogResult.Yes)
                this.Close();
        }

    }
}
