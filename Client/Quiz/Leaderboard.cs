using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Quiz
{
    public partial class Leaderboard : Form
    {
        public Leaderboard()
        {
            InitializeComponent();
        }

        public Leaderboard(string name, int right)
        {
            InitializeComponent();
            no = right;
            Lname = name;
            Single();
        }

        public Leaderboard(string ID)
        {
            InitializeComponent();
            LID = ID;
        }

        public delegate void delPassData(TcpClient socket, NetworkStream network);

        public void funData(TcpClient socket, NetworkStream network)
        {
            client = socket;
            stream = network;
            connect();
            Multi();
        }

        private int no;
        private string Lname;
        private string LID;
        private string[] tmp;
        
        TcpClient client = new TcpClient();
        NetworkStream stream;

        public void connect()
        {
            Thread listen = new Thread(receive);
            listen.Start();
        }

        public void receive()
        {
            try
            {
                while (true)
                {
                    string text;
                    byte[] data = new byte[1024 * 5000];
                    int recvByte = stream.Read(data, 0, data.Length);
                    text = Encoding.UTF8.GetString(data);
                    tmp = text.Split('%');
                }
            }
            catch
            {
                close();
            }
        }

        public void close()
        {
            stream.Close();
            client.Close();
        }

        private void Single()
        {
            int point = no*10;
            name1.Text = Lname;
            point1.Text = point.ToString();
            right1.Text = no.ToString();
            rank1.Text = "1";
        }

        private void Multi()
        {
            //Gửi tín hiệu để nhận danh sách xếp hạng từ thấp đến cao do server sắp xếp là LDR
            //Server gửi về với định dạng tên người 1%điểm 1 (do server tính)%số câu đúng 1%tên người 2%điểm 2 (do server tính)%số câu đúng 2% ...
            byte[] data = Encoding.UTF8.GetBytes("LDR\n");
            stream.Write(data, 0, data.Length);
            name1.Text = tmp[0];
            point1.Text = tmp[1];
            right1.Text = tmp[2];
            rank1.Text = "1";
            name2.Text = tmp[3];
            point2.Text = tmp[4];
            right2.Text = tmp[5];
            rank2.Text = "2";
            name3.Text = tmp[6];
            point3.Text = tmp[7];
            right3.Text = tmp[8];
            rank3.Text = "3";
            name4.Text = tmp[9];
            point4.Text = tmp[10];
            right4.Text = tmp[11];
            rank4.Text = "4";
        }

        private void bttExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void bttNew_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
