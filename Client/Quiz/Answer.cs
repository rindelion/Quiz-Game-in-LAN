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
    public partial class Answer : Form
    {
        public Answer()
        {
            InitializeComponent();
        }

        public Answer(string question, bool answer, string ghichu)
        {
            InitializeComponent();
            ans = answer;
            quest = question;
            truth = ghichu;
        }

        public delegate void delPassData(TcpClient socket, NetworkStream network);

        public void funData(TcpClient socket, NetworkStream network)
        {
            client = socket;
            stream = network;
            //connect();
        }

        private bool ans;
        private string quest;
        private string truth;
        TcpClient client = new TcpClient();
        NetworkStream stream;

        //public void connect()
        //{
        //    Thread listen = new Thread(receive);
        //    listen.Start();
        //}

        //public void receive()
        //{
        //    try
        //    {
        //        while (true)
        //        {
        //            string text;
        //            byte[] data = new byte[1024 * 5000];
        //            int recvByte = stream.Read(data, 0, data.Length);
        //            text = Encoding.UTF8.GetString(data);
        //            truth = text;
        //        }
        //    }
        //    catch
        //    {
        //        close();
        //    }
        //}

        //public void close()
        //{
        //    stream.Close();
        //    client.Close();
        //}

        private void ShowAnswer()
        {
            if (ans == true)
                RoW.Text = "Ñuùng roài !!! UwU";
            else
                RoW.Text = "Sai roài !!! Leâu leâu";
            //Gửi tín hiệu để nhận giải thích là TRT
            //Server chỉ trả về nội dung giải thích, không cần gửi mã đầu
            //byte[] data = Encoding.UTF8.GetBytes("TRT\n");
            //stream.Write(data, 0, data.Length);
            Truth.Text = truth;
        }

        private void Answer_Load(object sender, EventArgs e)
        {
            this.Visible = true;
            this.ShowInTaskbar = true;
            ShowAnswer();
            this.Refresh();
            Thread.Sleep(5000);
            this.Close();
        }
    }
}
