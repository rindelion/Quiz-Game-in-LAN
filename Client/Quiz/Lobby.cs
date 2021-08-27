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
    public partial class Lobby : Form
    {
        public Lobby()
        {
            InitializeComponent();
        }

        public Lobby(string name, string ID, int host)
        {
            InitializeComponent();
            txtID.Text = ID;
            LID = ID;
            ad = host;
            Lname = name;
        }

        public delegate void delPassData(TcpClient socket, NetworkStream network);

        public void funData(TcpClient socket, NetworkStream network)
        {
            client = socket;
            stream = network;
            connect();
        }

        TcpClient client = new TcpClient();
        NetworkStream stream;
        private string Lname;
        private string text;
        private string LID;
        private int ad;
        private int status = 0;
        private string[] tmp = { "PLR", "S1mple", "Na`vi", "is", "da best" };

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
                    byte[] data = new byte[1024 * 5000];
                    int recvByte = stream.Read(data, 0, data.Length);
                    text = Encoding.UTF8.GetString(data);
                    if (text.StartsWith("NPR") == true)
                    {
                        tmp = text.Split('%');
                        player();
                    }
                    if (text.StartsWith("RDY") == true)
                    {
                        tmp = text.Split('%');
                        ready();
                    }
                    if (text.StartsWith("GO") == true)
                    {
                        tmp = text.Split('%');
                        status = Int32.Parse(tmp[1]);
                    }
                    if (text.StartsWith("PLR") == true)
                    {
                        tmp = text.Split('%');
                        txtP1.Text = tmp[1];
                        txtP2.Text = tmp[2];
                        txtP3.Text = tmp[3];
                        txtP4.Text = tmp[4];
                    }
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

        private void player()
        {
            while (this.Visible == true)
            {
                //Khi có người chơi nào vào phòng thì server gửi tín hiệu với định dạng là NPR%vị trí người chơi%tên người chơi
                while (tmp == null) ;
                switch(tmp[1])
                {
                    case "2":
                        txtP2.Text = tmp[2];
                        break;
                    case "3":
                        txtP3.Text = tmp[2];
                        break;
                    case "4":
                        txtP4.Text = tmp[2];
                        break;

                }
                Thread.Sleep(1000);
            }
        }

        private void ready()
        {
            while(this.Visible == true)
            {
                //Khi có người chơi nào sẵn sàng thì server gửi tín hiệu với định dạng là RDY%vị trí người chơi sẵn sàng
                if (tmp[1] == "2")
                    ReadyP2.Enabled = true;
                else if (tmp[1] == "3")
                    ReadyP3.Enabled = true;
                else if (tmp[1] == "4")
                    ReadyP4.Enabled = true;
            }
        }

        private void unready()
        {
            while (this.Visible == true)
            {
                //Khi có người chơi nào hủy sẵn sàng thì server gửi tín hiệu với định dạng là RDY%vị trí người chơi hủy sẵn sàng
                if (tmp[1] == "2")
                    ReadyP2.Enabled = false;
                else if (tmp[1] == "3")
                    ReadyP3.Enabled = false;
                else if (tmp[1] == "4")
                    ReadyP4.Enabled = false;
            }
        }

        private void start()
        {
            Thread.Sleep(2000);
            this.Hide();
            this.ShowInTaskbar = false;
            Multi multi = new Multi(Lname, LID);
            delPassData del = new delPassData(multi.funData);
            del(client, stream);
            multi.ShowDialog();
            close();
            this.Close();
        }

        private void bttReady_Click(object sender, EventArgs e)
        {
            bttReady.Visible = false;
            bttCancel.Visible = true;
            //Gửi tín hiệu người chơi đã sẵn sàng là STS%tên%1
            //Server đánh dấu người chơi đó là sẵn sàng và khi có yêu cầu RDY thì gửi người chơi vừa sẵn sàng về
            Byte[] data = Encoding.UTF8.GetBytes("STS%" + Lname + "%1\n");
            stream.Write(data, 0, data.Length);
        }

        private void bttCancel_Click(object sender, EventArgs e)
        {
            bttCancel.Visible = false;
            bttReady.Visible = true;
            //Gửi tín hiệu người chơi hủy sẵn sàng là STS%tên%0
            //Server đánh dấu người chơi đó là chưa sẵn sàng
            Byte[] data = Encoding.UTF8.GetBytes("STS%" + Lname + "%0\n");
            stream.Write(data, 0, data.Length);
        }

        private void bttStart_Click(object sender, EventArgs e)
        {
            //Gửi tín hiệu bắt đầu là GO
            //Nếu tất cả người chơi đã sẵn sàng thì server trả về số 1, còn chưa thì trả về số 0
            Byte[] data = Encoding.UTF8.GetBytes("GO\n");
            stream.Write(data, 0, data.Length);
            if (status == 1)
            {
                bttStart.Enabled = false;
                start();
            }
            else
            {
                MessageBox.Show("Có người chơi chưa sẵn sàng.");
            }
        }

        private void Lobby_Load(object sender, EventArgs e)
        {
            if (ad == 1)
            {
                //chủ phòng gửi tín hiệu báo là đã sẵn sàng STS%tên%1
                Byte[] data = Encoding.UTF8.GetBytes("STS%" + Lname + "%1\n");
                stream.Write(data, 0, data.Length);
                txtP1.Text = Lname;
                bttReady.Visible = false;
                bttCancel.Visible = false;
                bttStart.Visible = true;
            }
            else
            {
                //người chơi kh là chủ phòng yêu cầu danh sách người chơi để hiện ra với tín hiệu PLR
                //server trả về danh sách người chơi với định dạng PLR%người 1%người 2 ...
                Byte[] data = Encoding.UTF8.GetBytes("PLR\n");
                stream.Write(data, 0, data.Length);
                bttReady.Visible = true;
                bttCancel.Visible = false;
                bttStart.Visible = false;
                Thread go = new Thread(() =>
                {
                    while (status == 0) ;
                    bttReady.Enabled = false;
                    bttCancel.Enabled = false;
                    start();
                });
            }
        }

        private void bttExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
