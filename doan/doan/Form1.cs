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

    }
}
