using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace doan
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        //sửa tham số
        private void tbsuabttthamsosua_Click(object sender, EventArgs e)
        {
            int i = 0;

            //số bệnh nhân
            if (tbsuatxtsobenhnhanngay.Text != "")
            {
                UDQLDataContext ql = new UDQLDataContext();
                int j = ql.cau5(int.Parse(tbsuatxtsobenhnhanngay.Text));
                if (j == 0)
                {
                    MessageBox.Show("k update đc");
                    return;
                }
                i++;
            }
            //tbsuatxtsoloaithuoc
            if (tbsuatxtsoloaithuoc.Text != "")
            {
                UDQLDataContext ql = new UDQLDataContext();
                int j = ql.cau6(int.Parse(tbsuatxtsoloaithuoc.Text));
                if (j == 0)
                {
                    MessageBox.Show("k up date đc");
                    return;
                }
                i++;
            }
            //tbsuatxtsoloaibenh
            if (tbsuatxtsoloaibenh.Text != "")
            {
                UDQLDataContext ql = new UDQLDataContext();
                int j = ql.cau8(int.Parse(tbsuatxtsoloaibenh.Text));
                if (j == 0)
                {
                    MessageBox.Show("k update được");
                    return;
                }
                i++;
            }
            //tbsuatxtsoloaidonvi
            if (tbsuatxtsoloaidonvi.Text != "")
            {
                UDQLDataContext ql = new UDQLDataContext();
                int j = ql.cau7(int.Parse(tbsuatxtsoloaidonvi.Text));
                if (j == 0)
                {
                    MessageBox.Show("k update được");
                    return;
                }
                i++;
            }
            //tbsuatxttienkham 
            if (tbsuatxttienkham.Text != "")
            {
                UDQLDataContext ql = new UDQLDataContext();
                int j = ql.cau10(int.Parse(tbsuatxttienkham.Text));
                if (j == 0)
                {
                    MessageBox.Show("k update được");
                    return;
                }
                i++;
            }
            //tbsuatxtsoCD
            if (tbsuatxtsoCD.Text != "")
            {
                UDQLDataContext ql = new UDQLDataContext();
                int j = ql.cau9(int.Parse(tbsuatxtsoCD.Text));
                if (j == 0)
                {
                    MessageBox.Show("k update được");
                    return;
                }
                i++;
            }

            if (i == 0)
            {
                tbsuadgv.DataSource = "";
                MessageBox.Show("chưa có thuộc tính nào cả");
                return;
            }
            else
            {
                UDQLDataContext ql = new UDQLDataContext();
                tbsuadgv.DataSource = from a in ql.ThamSos where 1 == 1 select new { a.TenLoai, a.SoLuong };
            }
        }
        //xóa tài khoản
        private void tbsuabttxoa_Click(object sender, EventArgs e)
        {
            DialogResult r = MessageBox.Show("bạn có chắc xóa tài khoản hiển tại?", "thông bảo", MessageBoxButtons.YesNo);
            if (r == System.Windows.Forms.DialogResult.Yes)
            {
                UDQLDataContext ql = new UDQLDataContext();
                int i = ql.cau4(login.password, login.username);
                if (i == 0)
                {
                    MessageBox.Show("mật khẩu không chính xác, xóa không được");
                    return;
                }

                load();
            }

        }
        //tbsuatxtsoluong thay đổi kiểm tra có phải là số k
        private void tbsuatxtsoluong_TextChanged(object sender, EventArgs e)
        {
            if (tbsuatxtsoluong.Text != "")
            {
                try
                {
                    int i = int.Parse(tbsuatxtsoluong.Text);
                }
                catch (Exception)
                {
                    MessageBox.Show("không phải số");
                    tbsuatxtsoluong.Text = tbsuatxtsoluong.Text.Remove(tbsuatxtsoluong.Text.Length - 1);
                }
            }
        }

        //tháng thay đổi
        private void textBox9_TextChanged(object sender, EventArgs e)
        {
            if (textBox9.Text != "")
            {
                try
                {
                    int i = int.Parse(textBox9.Text);
                }
                catch (Exception)
                {
                    MessageBox.Show("không phải số");
                    textBox9.Text = textBox9.Text.Remove(textBox9.Text.Length - 1);
                }
            }
        }
            //năm thay đổi
        private void textBox10_TextChanged(object sender, EventArgs e)
        {
            if (textBox10.Text != "")
            {
                try
                {
                    int i = int.Parse(textBox10.Text);
                }
                catch (Exception)
                {
                    MessageBox.Show("không phải số");
                    textBox10.Text = textBox10.Text.Remove(textBox10.Text.Length - 1);
                }
            }
        }

        // xóa mật khẩu
        private void tbsuabttthuocsua_Click(object sender, EventArgs e)
        {
            if (tbsuatxtsoluong.Text != null && tbsuatxtmathuoc.Text != null)
            {
                UDQLDataContext ql = new UDQLDataContext();
                int i = ql.cau11(tbsuatxtmathuoc.Text, int.Parse(tbsuatxtsoluong.Text));
                if (i == 0)
                {
                    MessageBox.Show("mật khẩu không chính xác, xóa không được");
                    return;
                }
                tbsuadgv.DataSource = from a in ql.Thuocs where 1 == 1 select new { a.MaThuoc, a.TenThuoc, a.MaDonVi, a.SlTon, a.Gia };
            }
            else
            {
                tbsuadgv.DataSource = "";
                MessageBox.Show("thiếu thông tin ");
            }


        }
        //xem doanh thu theo tháng
        private void tbxembttdoanhthu_Click(object sender, EventArgs e)
        {
            if (textBox10.Text != "" && textBox9.Text != "")
            {
                UDQLDataContext ql = new UDQLDataContext();
                tbxemdgv.DataSource = ql.cau18(int.Parse(textBox9.Text), int.Parse(textBox10.Text));
                tabxembttxuatdoanhthu.Enabled = !tabxembttxuatdoanhthu.Enabled;
            }
            else
            {
                tbxemdgv.DataSource = "";
                MessageBox.Show("không  đủ thông tin");
            }
        }
        // xem số lượng thuốc theo tháng
        // chưa làm xong
        private void tbxembttsoluongthuoc_Click(object sender, EventArgs e)
        {
            if (textBox10.Text != "" && textBox9.Text != "")
            {

                UDQLDataContext ql = new UDQLDataContext();
                tbxemdgv.DataSource = ql.cau19(int.Parse(textBox9.Text), int.Parse(textBox10.Text));
                tbxembttxuatdlthuoc.Enabled = !tbxembttxuatdlthuoc.Enabled;
                //câu này là câu 19
            }
            else
            {
                tbxemdgv.DataSource = "";
                MessageBox.Show("không  đủ thông tin");

            }
        }
        // xem hóa đơn của bệnh nhân
        private void tbxembttxemhoadon_Click(object sender, EventArgs e)
        {
            if (tbxemtxtmakb.Text != "" && tbxemtxttenbenhnhan.Text != "")
            {
                UDQLDataContext ql = new UDQLDataContext();
                tbxemdgv.DataSource = ql.cau17(tbxemtxtmakb.Text);
            }
            else
            {
                tbxemdgv.DataSource = "";
                MessageBox.Show("không đủ thông tin");
            }

        }
        // thêm danh sách khám bệnh
        private void tbthembttphieukham_Click(object sender, EventArgs e)
        {

            if (tbthemtxtphieumakb.Text != "")
            {
                if (tbthemtxtphieusoluong.Text == "")
                    tbthemtxtphieusoluong.Text = "0";
                UDQLDataContext ql = new UDQLDataContext();
                int i = ql.cau14(tbthemtxtphieumakb.Text, tbthemtxtphieumabn.Text, tbthemtxtphieumabenh.Text, tbthemtxtphieumathuoc.Text, int.Parse(tbthemtxtphieusoluong.Text), tbthemtxtphieumacd.Text);
                if (i == 0)
                {
                    MessageBox.Show("không thêm được do thiếu bệnh nhân");
                    return;
                }
                else if (i == 1)
                {
                    tbthemdgv.DataSource = from a in ql.DSKhamBenhs
                                           where a.MaKB == tbthemtxtphieumakb.Text
                                           select new
                                           {
                                               a.MaKB,
                                               a.MaBN,
                                               a.NgayKham,
                                               a.SoLuong,
                                               a.MaThuoc,
                                               a.MaCD,
                                               a.ThanhTien
                                           };
                    return;

                }
                else if (i == 2)
                {
                    MessageBox.Show("không thêm được do bã bệnh k đúng");
                    return;
                }
                else if (i == 3)
                {
                    MessageBox.Show("không thêm được do bã thuốc k đúng");
                    return;
                }
                else if (i == 4)
                {
                    MessageBox.Show("không thêm được do mã cách dùng k đúng");
                    return;
                }
                else if (i == 5)
                {
                    MessageBox.Show("không thêm được do bệnh nhân đã tồn tại");
                    return;
                }
                else if (i == 6)
                {
                    MessageBox.Show("không thêm được do vượt quá số bệnh nhân trên ngày");
                    return;
                }
            }
        }
        //xem doanh thu 
        private void tabxembttxuatdoanhthu_Click(object sender, EventArgs e)
        {
            if (textBox9.Text == "" || textBox10.Text == "")
            {
                MessageBox.Show("không đủ thông tin thống kê doanh thu. vui lòng điền tháng và ngày vào(bên thống kê)");
                textBox10.Text = "";
                textBox9.Focus();
            }
            else
            {
                UDQLDataContext ql = new UDQLDataContext();
                ql.cau23(int.Parse(textBox9.Text), int.Parse(textBox10.Text));
                OpenFileDialog chuc = new OpenFileDialog();// new thư mục 
                chuc.InitialDirectory = @"C:\";// hiển thị ổ đĩa
                chuc.ShowDialog();// Hiển thị file
            }
        }
        //xóa bệnh
        private void bbttxoa_Click(object sender, EventArgs e)
        {
            UDQLDataContext ql = new UDQLDataContext();
            int i = ql.cau28(btxtmabenh.Text);
            if (i == 1)
            {
                MessageBox.Show("mã bệnh không  tồn tại");
            }
            else
            {
                tvbdgv.DataSource = from a in ql.Benhs where 1 == 1 select new { a.MaBenh, a.TenBenh };
            }
        }
        //thêm đơn vị
        private void DVbttthem_Click(object sender, EventArgs e)
        {
            UDQLDataContext ql = new UDQLDataContext();
            int i = ql.cau31(DVtxtdonvi.Text, DVtxtten.Text);
            if (i == 1)
            {
                MessageBox.Show("bệnh đã đạt tới giới hạn tham số thuốc, cần tăng tham số");

            }
            else if (i == 2)
            {
                MessageBox.Show("mã bệnh đã tồn tại yêu cầu thay đổi mã");
            }
            else
            {
                CDvDVdgv.DataSource = from a in ql.DonVis where 1 == 1 select new { a.MaDonVi, a.TenDonVi };
            }
        }

        //radiobutton được check
        private void tbxemrdio_CheckedChanged(object sender, EventArgs e)
        {
            tbxemdanhsachkham.Enabled = !tbxemdanhsachkham.Enabled;
        }

        //xem danh sách bệnh nhân tab xem
        private void tbxembttxemdanhsachbenhnhan_Click(object sender, EventArgs e)
        {
            UDQLDataContext ql = new UDQLDataContext();
            tbxemdgv.DataSource = ql.cau15();
        }


    }
}
