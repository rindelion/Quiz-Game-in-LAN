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
    public partial class Multi : Form
    {
        public Multi()
        {
            InitializeComponent();
        }

        public Multi(string name, string ID)
        {
            InitializeComponent();
            Mname = name;
            MID = ID;
        }

        public delegate void delPassData(TcpClient socket, NetworkStream network);

        public void funData(TcpClient socket, NetworkStream network)
        {
            client = socket;
            stream = network;
            connect();
            ShowQuestion();
            Timer();
        }

        private bool tf;
        private bool endgame = false;
        private int quest = 10;
        private int lives = 5;
        private string question;
        private string answer;
        private int right;
        private System.Windows.Forms.Timer aTimer;
        private int counter = 60;
        private string Mname;
        private string MID;
        private string[] tmp;
        TcpClient client = new TcpClient();
        NetworkStream stream;

        public void connect()
        {
            Thread listen = new Thread(receive);
            listen.Start();
            Thread message = new Thread(receiveMess);
            message.Start();
        }

        //hàm nhận dữ liệu
        //khi nhận câu hỏi thì định dạng server gửi là QTN%TN/TL%mã câu hỏi%nội dung câu hỏi
        //khi nhận đáp án thì định dạng server gửi là ASR%A%B%C%D%đáp án đúng 
        //khi mạng tất cả người chơi bằng 0, server gửi một tín hiệu EGE
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
                    if (text.StartsWith("QTN") == true || text.StartsWith("ASR") == true || text.StartsWith("LIF") == true)
                        tmp = text.Split('%');
                    if (text.StartsWith("EGE") == true)
                        endgame = true;
                }
            }
            catch
            {
                close();
            }
        }

        public void receiveMess()
        {
            try
            {
                while (true)
                {
                    string text;
                    byte[] data = new byte[1024 * 5000];
                    int recvByte = stream.Read(data, 0, data.Length);
                    text = Encoding.UTF8.GetString(data);
                    InfoMessage(text);
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

        private void Timer()
        {
            aTimer = new System.Windows.Forms.Timer();
            aTimer.Tick += new EventHandler(aTimer_Tick);
            aTimer.Interval = 1000;
            aTimer.Start();
            timer.Text = counter.ToString();
        }

        private void aTimer_Tick(object sender, EventArgs e)
        {
            counter--;
            timer.Text = counter.ToString();
            if (counter == 0)
            {
                aTimer.Stop();
                counter = 60;
                timer.Text = "0";
                if (answer == null)
                    lives--;
                Lives();
                Thread.Sleep(1000);
                if (lives != 0 && quest != 0)
                {
                    Answer();
                    ShowQuestion();
                    Timer();
                }
                else
                {
                    Answer();
                    while (endgame == false) ;
                    GameOver();
                }
            }
        }

        private void Answer()
        {
            this.Hide();
            Answer ans = new Answer(question, tf, tmp[10]);
            delPassData del = new delPassData(ans.funData);
            del(client, stream);
            ans.ShowDialog();
            this.Show();
        }

        private void GameOver()
        {
            this.Hide();
            this.ShowInTaskbar = false;
            //Gửi tín hiệu để gửi số câu đúng là RGT%số câu đúng
            //Server nhận vào tính toán điểm (mỗi câu đúng 10đ)
            byte[] data = Encoding.UTF8.GetBytes("RGT%" + right + '\n');
            stream.Write(data, 0, data.Length);
            Leaderboard leaderboard = new Leaderboard(MID);
            delPassData del = new delPassData(leaderboard.funData);
            del(client, stream);
            leaderboard.ShowDialog();
            this.Close();
        }

        private void ShowQuestion()
        {
            answer = null;
            //Gửi tín hiệu để nhận câu hỏi là QTN
            byte[] data = Encoding.UTF8.GetBytes("QTN\n");
            stream.Write(data, 0, data.Length);
            while (tmp == null) ;
            question = tmp[2];
            txtQuestion.Text = tmp[3];
            if (tmp[1] == "TN")
            {
                bttA.Visible = true;
                bttB.Visible = true;
                bttC.Visible = true;
                bttD.Visible = true;
                txtAnswer.Visible = false;
                bttSubmit.Visible = false;
            }
            else
            {
                bttA.Visible = false;
                bttB.Visible = false;
                bttC.Visible = false;
                bttD.Visible = false;
                txtAnswer.Visible = true;
                bttSubmit.Visible = true;
            }
            //Gửi tín hiệu để nhận đáp án là ASR
            data = Encoding.UTF8.GetBytes("ASR\n");
            stream.Write(data, 0, data.Length);
            while (tmp == null) ;
            bttA.Text = tmp[1];
            bttB.Text = tmp[2];
            bttC.Text = tmp[3];
            bttD.Text = tmp[4];
            picLives1.Image = Quiz.Properties.Resources.hangman_1;
            picLives2.Image = Quiz.Properties.Resources.hangman_1;
            picLives3.Image = Quiz.Properties.Resources.hangman_1;
            picLives4.Image = Quiz.Properties.Resources.hangman_1;
        }

        private void Lives()
        {
            //Gửi tín hiệu để nhận số mạng của người chơi là LIF
            //Server trả về danh sách mạng còn lại của người chơi LIF%mạng 1&mạng 2%mạng 3%mạng 4
            byte[] data = Encoding.UTF8.GetBytes("LIF\n");
            stream.Write(data, 0, data.Length);
            while (tmp == null) ;
            int i = 1;
            int life;
            life = Int32.Parse(tmp[i]);
            switch (life)
            {
                case 4:
                    picLives1.Image = Quiz.Properties.Resources.hangman_2;
                    break;
                case 3:
                    picLives1.Image = Quiz.Properties.Resources.hangman_3;
                    break;
                case 2:
                    picLives1.Image = Quiz.Properties.Resources.hangman_4;
                    break;
                case 1:
                    picLives1.Image = Quiz.Properties.Resources.hangman_5;
                    break;
                case 0:
                    picLives1.Image = Quiz.Properties.Resources.hangman_6;
                    break;
            }
            i++;
            life = Int32.Parse(tmp[i]);
            switch (lives)
            {
                case 4:
                    picLives2.Image = Quiz.Properties.Resources.hangman_2;
                    break;
                case 3:
                    picLives2.Image = Quiz.Properties.Resources.hangman_3;
                    break;
                case 2:
                    picLives2.Image = Quiz.Properties.Resources.hangman_4;
                    break;
                case 1:
                    picLives2.Image = Quiz.Properties.Resources.hangman_5;
                    break;
                case 0:
                    picLives2.Image = Quiz.Properties.Resources.hangman_6;
                    break;
            }
            i++;
            life = Int32.Parse(tmp[i]);
            switch (lives)
            {
                case 4:
                    picLives3.Image = Quiz.Properties.Resources.hangman_2;
                    break;
                case 3:
                    picLives3.Image = Quiz.Properties.Resources.hangman_3;
                    break;
                case 2:
                    picLives3.Image = Quiz.Properties.Resources.hangman_4;
                    break;
                case 1:
                    picLives3.Image = Quiz.Properties.Resources.hangman_5;
                    break;
                case 0:
                    picLives3.Image = Quiz.Properties.Resources.hangman_6;
                    break;
            }
            i++;
            life = Int32.Parse(tmp[i]);
            switch (lives)
            {
                case 4:
                    picLives4.Image = Quiz.Properties.Resources.hangman_2;
                    break;
                case 3:
                    picLives4.Image = Quiz.Properties.Resources.hangman_3;
                    break;
                case 2:
                    picLives4.Image = Quiz.Properties.Resources.hangman_4;
                    break;
                case 1:
                    picLives4.Image = Quiz.Properties.Resources.hangman_5;
                    break;
                case 0:
                    picLives4.Image = Quiz.Properties.Resources.hangman_6;
                    break;
            }
            picLives1.Refresh();
            picLives2.Refresh();
            picLives3.Refresh();
            picLives4.Refresh();
        }

        public void InfoMessage(string message)
        {
            ListViewItem item = new ListViewItem();
            item.Text = message;

            if (txtData.InvokeRequired)
            {
                txtData.Invoke(new MethodInvoker(delegate ()
                {
                    txtData.Items.Add(item);
                }));
            }
            else
                txtData.Items.Add(item);
        }

        private void bttA_Click(object sender, EventArgs e)
        {
            answer = "A";
            quest--;
            if (answer == tmp[5])
            {
                right++;
                tf = true;
            }
            else
            {
                lives--;
                tf = false;
            }
            //Gửi tín hiệu để báo số mạng còn lại của người chơi LIV%mạng
            //Server nhận và khi nào tất cả mạng người chơi là 0 thì gửi tín hiệu EGE
            byte[] data = Encoding.UTF8.GetBytes("LIV%" + lives + '\n');
            stream.Write(data, 0, data.Length);
        }

        private void bttB_Click(object sender, EventArgs e)
        {
            answer = "B";
            quest--;
            if (answer == tmp[5])
            {
                right++;
                tf = true;
            }
            else
            {
                lives--;
                tf = false;
            }
            byte[] data = Encoding.UTF8.GetBytes("LIV%" + lives + '\n');
            stream.Write(data, 0, data.Length);
        }

        private void bttC_Click(object sender, EventArgs e)
        {
            answer = "C";
            quest--;
            if (answer == tmp[5])
            {
                right++;
                tf = true;
            }
            else
            {
                lives--;
                tf = false;
            }
            byte[] data = Encoding.UTF8.GetBytes("LIV%" + lives + '\n');
            stream.Write(data, 0, data.Length);
        }

        private void bttD_Click(object sender, EventArgs e)
        {
            answer = "D";
            quest--;
            if (answer == tmp[5])
            {
                right++;
                tf = true;
            }
            else
            {
                lives--;
                tf = false;
            }
            byte[] data = Encoding.UTF8.GetBytes("LIV%" + lives + '\n');
            stream.Write(data, 0, data.Length);
        }

        private void bttSubmit_Click(object sender, EventArgs e)
        {
            answer = txtAnswer.Text;
            quest--;
            if (answer == tmp[5])
            {
                right++;
                tf = true;
            }
            else
            {
                lives--;
                tf = false;
            }
            byte[] data = Encoding.UTF8.GetBytes("LIV%" + lives + '\n');
            stream.Write(data, 0, data.Length);
        }

        private void bttSend_Click(object sender, EventArgs e)
        {
            Byte[] data = Encoding.UTF8.GetBytes(Mname + ": " + txtChat.Text + '\n');
            stream.Write(data, 0, data.Length);
            txtChat.Clear();
        }

        private void Multi_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
                bttSend.PerformClick();
        }

        private void bttExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
