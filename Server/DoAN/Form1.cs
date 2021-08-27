using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Collections;
using System.Timers;
using System.Data.SqlClient;

namespace DoAN
{
    public partial class Form1 : Form
    {
        SqlConnection sqlconnect;
        public Form1()
        {
            InitializeComponent();
            sqlconnect = new SqlConnection(@"Data Source=... ;Initial Catalog=... ;Integrated Security=True");
            sqlconnect.Open();
        }

        IPEndPoint ipepServer;
        Socket listenerSocket;
        List<Socket> clientList = new List<Socket>();
        List<string> clientname = new List<string>();
        int dem = 0;
        public class sList
        {
            public List<Socket> listsockets = new List<Socket>();
            public List<string> DSCauhoi= new List<string>();
            public List<string> listname = new List<string>();
            public int[] ansright = new int[5];
            public int[] live = new int[5];
            public int RDY = 0;
            public int ID_ROOM = 0;
            public int Type = 4;
            public bool status = true;

        }
        sList[] lists= new sList[20];

        private void listen_Click(object sender, EventArgs e)
        {
            listen.Enabled = false;
            connect();
        }

        public void connect()
        {
            listenerSocket = new Socket(
                AddressFamily.InterNetwork,
                SocketType.Stream,
                ProtocolType.Tcp);
            ipepServer = new IPEndPoint(IPAddress.Any, 8080);
            listenerSocket.Bind(ipepServer);
            infoMessage("Server running on 192.168.43.24:8080");
            Thread Listen = new Thread(() =>
            {
                try
                {
                    while (true)
                    {
                        listenerSocket.Listen(10);
                        Socket clientSocket = listenerSocket.Accept();
                        clientList.Add(clientSocket);
                        
                        byte[] rec = new byte[1];
                        int recvByte = -1;
                        string text = "";
                        do
                        {
                            recvByte = clientSocket.Receive(rec);
                            text += Encoding.UTF8.GetString(rec);
                        } while (text[text.Length - 1] != '\n');
                        string[] stext = text.Split('%');

                        //stext[1] :là tên client
                        //lưu client vào database
                        // Random ID_USER
                        clientname.Add(stext[1]);

                        Random r = new Random();
                        int ID_user = r.Next(1, 1000);
                        AddUSer(ID_user, stext[1], clientSocket.RemoteEndPoint.ToString());

                        Thread recv = new Thread(receive);
                        infoMessage("New client connected form: " + clientSocket.RemoteEndPoint);
                        recv.IsBackground = true;
                        recv.Start(clientSocket);
                    }
                }
                catch
                {
                    listenerSocket = new Socket(
                        AddressFamily.InterNetwork,
                        SocketType.Stream,
                        ProtocolType.Tcp);
                    ipepServer = new IPEndPoint(IPAddress.Any, 8080);
                }
            });
            Listen.IsBackground = true;
            Listen.Start();
        }

        // Tìm vị trí socket của client
        private int FindPosSocket(Socket client)
        {
            int pos = 0;
            foreach(Socket socket in clientList)
            {
                if (socket != null && socket == client)
                    return pos;
                pos++;
            }
            
            return -1;
        }

        // Lưu thông tin người vào table USER
        // Kiểm tra ID_USER có tồn tại hay không.
        public void AddUSer(int ID_user, string name, string IP)
        {
            //if (CheckID_User(ID_user) == false)
            {
                string insert = "INSERT INTO [dbo].[USERS] ([ID_USER], [TEN], [SOMANG], [IP_USER]) VALUES (";
                insert += "'" + ID_user + "',N'" + name + "',5,'" + IP + "')";
                SqlCommand cmd = new SqlCommand(insert, sqlconnect);
                cmd.ExecuteNonQuery();
               // cmd.UpdatedRowSource;
            }
        }

        private void AddUserIntoRoom(int ID_ROOM, string ID_USER)
        {
            string insert = "INSERT INTO [dbo].[USERINROOM] ([ID_ROOM], [ID_USER]) VALUES (";
            insert += "'" + ID_ROOM + "',N'" + ID_USER + "')";
            SqlCommand cmd = new SqlCommand(insert, sqlconnect);
            cmd.ExecuteNonQuery();
        }

        private void AddUIR(string name, int ID_ROOM)
        {
            string insert = "SELECT ID_USER FROM USERS WHERE TEN = '" + name + "'";
            SqlCommand cmd = new SqlCommand(insert, sqlconnect);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            insert = "INSERT INTO [dbo].[USERINROOM] ([ID_ROOM], [ID_USER]) VALUES (";
            insert += "'" + ID_ROOM + "',N'" + dt.Rows[0][0].ToString() + "')";
            cmd = new SqlCommand(insert, sqlconnect);
            cmd.ExecuteNonQuery();
        }

        /*
        public bool CheckID_User(int ID_User)
        {
            string data = "SELECT * FROM USERS WHERE ID_USER = '" + ID_User + "'";
            SqlCommand cmd = new SqlCommand(data, sqlconnect);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(cmd); // Lưu dữ liệu lấy được vào đây
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt == null) return false;
            return true;
        }*/

        // Lấy câu hỏi từ database
        public string Getquestion(int i)
        {
            string macauhoi = LAYMCH();
            //DSCauhoi.Add(macauhoi);

            if (IsInList(macauhoi, i) == true)
            {
                while (IsInList(macauhoi, i) == true)
                {
                    macauhoi = LAYMCH();
                }
            }
            lists[i].DSCauhoi.Add(macauhoi);

            string getques = "SELECT LOAICAUHOI, MACAUHOI, CAUHOI, A, B, C, D, DATL, DAPAN, GHICHU " +
                "FROM BOCAUHOI " +
                "WHERE MACAUHOI = " + '\'' + macauhoi + '\'';
            SqlCommand cmd = new SqlCommand(getques, sqlconnect);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(cmd); // Lưu dữ liệu lấy được vào đây
            DataTable dt = new DataTable();
            da.Fill(dt);

            // Trả về câu hỏi lấy từ ROOMQUESTION tương ứng.
            string question = "";
            for (int j = 0; j < dt.Rows.Count; j++)
            {
                {
                    question += "QTN%";
                    question += dt.Rows[j][0].ToString() + "%";
                    question += dt.Rows[j][1].ToString() + "%";
                    question += dt.Rows[j][2].ToString() + "%";
                    question += dt.Rows[j][3].ToString() + "%";
                    question += dt.Rows[j][4].ToString() + "%";
                    question += dt.Rows[j][5].ToString() + "%";
                    question += dt.Rows[j][6].ToString() + "%";
                    question += dt.Rows[j][7].ToString() + "%";
                    question += dt.Rows[j][8].ToString() + "%";
                    question += dt.Rows[j][9].ToString();
                }
            }

            return question;
            //string data = "INSERT INTO ROOMQUESTION VALUES (STT, MACAUHOI, ID_ROOM, ID)";
        }
        private string LAYMCH()
        {
            List<string> ques_type = new List<string>();
            ques_type.Add("KHXH");
            ques_type.Add("KHTN");
            ques_type.Add("VH");
            ques_type.Add("DS");
            ques_type.Add("TA");

            Random type = new Random();
            int theloai = type.Next(0, 4);
            int stt = 0;

            Random num = new Random();
            string macauhoi = "";
            switch (theloai)
            {
                case 0:
                    stt = num.Next(1, 50);
                    macauhoi = ques_type[0];
                    break;
                case 1:
                    stt = num.Next(1, 82);
                    macauhoi = "TN";
                    break;
                case 2:
                    stt = num.Next(1, 25);
                    macauhoi = ques_type[2];
                    break;
                case 3:
                    stt = num.Next(1, 20);
                    macauhoi = ques_type[3];
                    break;
                case 4:
                    stt = num.Next(1, 5);
                    macauhoi = ques_type[4];
                    break;
            }

            if (stt < 10) macauhoi = macauhoi + '0' + stt.ToString();
            else macauhoi = macauhoi + stt.ToString();

            return macauhoi;
        }

        private bool IsInList(string check, int i)
        {
            foreach (string item in lists[i].DSCauhoi)
            {
                if (check == item) return true;
            }
            return false;
        }

        int reqcount = 0; // Đếm số lượng yêu cầu câu hỏi được gửi đối với multi
        string question = "";
        //Code số câu hỏi

        int die = 0; //tính số client có mạng = 0

        public void receive(object obj)
        {
            Socket client = obj as Socket;
            byte[] recv = new byte[1];
            int recvByte = -1;
            try
            {
                while (true)
                {
                    string text = "";
                    do
                    {
                        recvByte = client.Receive(recv);
                        text += Encoding.UTF8.GetString(recv);
                    } while (text[text.Length - 1] != '\n');

                    if (text.StartsWith("NEWROOM%")) // Create ID Room and add client to room
                    {

                        // định dạng nhận từ client NEWROOM%tên người tạo
                        string[] temp = text.Split('%');
                        Random random = new Random();
                        int idroom = random.Next(1000, 9999);
                        int type = 1;

                        if (text.Contains("single") == false)
                        {
                            //check idroom in database                
                            Byte[] data = Encoding.UTF8.GetBytes("IDR%" + idroom.ToString());
                            //send newly created ID_ROOM to the Client
                            client.Send(data);
                            type = 4;
                        }

                        for (int i = 0; i < 20; i++)
                        {

                            if (lists[i] == null)
                            {
                                lists[i] = new sList();
                                lists[i].listname.Add(temp[1]);
                                clientList.Remove(client);
                                clientname.Remove(temp[1]);
                                lists[i].listsockets.Add(client);
                                lists[i].ID_ROOM = idroom;
                                i = 20;

                                string insert = "INSERT INTO [dbo].[ROOM] ([ID_ROOM], [TYPE_ROOM]) VALUES (";
                                insert += "'" + idroom + "',N'" + type + "')";
                                SqlCommand cmd = new SqlCommand(insert, sqlconnect);
                                cmd.ExecuteNonQuery();
                                //AddUIR(temp[1], idroom);
                            }

                        }
                    }
                    else if (text.StartsWith("QTN"))
                    {

                        int i = FindROOM(client);

                        if (reqcount % lists[i].listsockets.Count == 0)
                        {
                            question = Getquestion(i);
                            reqcount++;
                        }
                        else reqcount++;

                        infoMessage("S: " + question);

                        Byte[] data = Encoding.UTF8.GetBytes(question);
                        client.Send(data);

                        //định dạng server khi gửi là QTN%TN/TL%mã câu hỏi%nội dung câu hỏi
                    }

                    else if (text.StartsWith("SS"))
                    {
                        Byte[] data = Encoding.UTF8.GetBytes("SS");
                        client.Send(data);
                    }

                    else if (text.StartsWith("ROOMS")) //get ID ROOMS
                    {
                        string sdata = "";

                        for (int i = 0; i < 20; i++)//send all ID_ROOM to the Client
                        {

                            if (lists[i] != null && lists[i].ID_ROOM != 0)
                            {
                                //cấu trúc id%số người chơi hiện tại
                                sdata = lists[i].ID_ROOM.ToString() + "              " + lists[i].listsockets.Count.ToString() + "/4";
                                infoMessage(sdata);
                                Byte[] data = Encoding.UTF8.GetBytes(sdata);
                                client.Send(data);
                            }

                        }

                    }
                    else if (text.StartsWith("PLR") || text.StartsWith("ERRPLR"))//gửi tên người chơi trong Room
                    {
                        string data = "PLR";

                        int i = FindROOM(client);
                        //lấy tên client

                        int numberclient = lists[i].listname.Count;
                        foreach (string item in lists[i].listname)
                        {
                            data += "%" + item;
                        }

                        if (numberclient == 2) data += "%%";
                        if (numberclient == 3) data += "%";

                        Byte[] sdata = Encoding.UTF8.GetBytes(data);

                        foreach (Socket socket in lists[i].listsockets)
                        {
                            socket.Send(sdata);
                            infoMessage(data + socket.RemoteEndPoint.ToString());
                        }
                        client.Send(sdata);
                    }

                    else if (text.StartsWith("GO")) //trưởng phòng sẽ gửi nhãn này
                    {

                        for (int i = 0; i < 20; i++)
                        {
                            if (lists[i] != null)
                            {
                                foreach (Socket socket in lists[i].listsockets)
                                {
                                    if (socket != null && socket == client)
                                    {
                                        if (lists[i].listsockets.Count == lists[i].RDY)
                                        {
                                            lists[i].status = false;
                                            Byte[] data = Encoding.UTF8.GetBytes("GO%1");
                                            client.Send(data);
                                            foreach (Socket item in lists[i].listsockets)
                                            {
                                                if (item != null)
                                                {
                                                    item.Send(data);
                                                    infoMessage("S: " + item.RemoteEndPoint.ToString() + "   " + text);
                                                }
                                            }
                                        }
                                        else
                                        {
                                            Byte[] data = Encoding.UTF8.GetBytes("GO%0");
                                            client.Send(data);
                                        }
                                        break;
                                    }
                                }
                            }
                        }
                    }

                    else if (text.StartsWith("STS%"))//xác định trạng thái các client đã sẵn sàng hay chưa
                    {
                        //STS%name%0/1
                        infoMessage("C: " + text);
                        string[] sname = text.Split('%');
                        int z = Int32.Parse(sname[2]);
                        if (z == 1)
                        {
                            for (int i = 0; i < 20; i++)
                            {
                                if (lists[i] != null)
                                    foreach (Socket item in lists[i].listsockets)
                                    {
                                        if (item != null)
                                        {
                                            if (client == item)
                                            {
                                                lists[i].RDY += 1;
                                                int x = 1;
                                                foreach (Socket items in lists[i].listsockets)
                                                {
                                                    if (items != null)
                                                    {
                                                        Byte[] data = Encoding.UTF8.GetBytes("RDY%" + x.ToString());
                                                        item.Send(data);

                                                    }
                                                    x++;
                                                }
                                                break;
                                            }

                                        }
                                    }
                            }
                        }
                        else
                        {
                            int x = -1;
                            for (int i = 0; i < 20; i++)
                            {
                                if (lists[i] != null)
                                    foreach (Socket item in lists[i].listsockets)
                                    {
                                        if (item != null)
                                        {
                                            if (client == item)
                                            {
                                                lists[i].RDY -= 1;
                                                foreach (Socket items in lists[i].listsockets)
                                                {
                                                    if (items != null)
                                                    {
                                                        Byte[] data = Encoding.UTF8.GetBytes("STS%" + sname[1] + "%0");
                                                        item.Send(data);

                                                    }
                                                }
                                                x = i;
                                            }


                                        }
                                    }
                            }
                            if (x > -1)
                            {
                                lists[x].listsockets.Remove(client);
                                clientList.Add(client);
                            }
                        }
                    }
                    else if(text.StartsWith("ERRPLR"))
                    {
                        string data = "PLR";

                        int i = FindROOM(client);
                        //lấy tên client

                        int numberclient = lists[i].listname.Count;
                        foreach (string item in lists[i].listname)
                        {
                            data += "%" + item;
                        }

                        if (numberclient == 2) data += "%%";
                        if (numberclient == 3) data += "%";

                        Byte[] sdata = Encoding.UTF8.GetBytes(data);

                        foreach (Socket socket in lists[i].listsockets)
                        {
                            socket.Send(sdata);
                            infoMessage(data + socket.RemoteEndPoint.ToString());
                        }
                        client.Send(sdata);
                    }
                    else if (text.StartsWith("ERRQTN") == true)
                    {
                        Byte[] data = Encoding.UTF8.GetBytes(question);
                        client.Send(data);
                    }

                    else if (text.StartsWith("ERRTXT") == true)
                    {
                        chat(client, text);
                    }
                    else if(text.StartsWith("ERRGO"))
                    {
                        for (int i = 0; i < 20; i++)
                        {
                            if (lists[i] != null)
                            {
                                foreach (Socket socket in lists[i].listsockets)
                                {
                                    if (socket != null && socket == client)
                                    {
                                        if (lists[i].listsockets.Count == lists[i].RDY)
                                        {
                                            Byte[] data = Encoding.UTF8.GetBytes("GO%1");
                                            //client.Send(data);
                                            foreach (Socket item in lists[i].listsockets)
                                            {
                                                if (item != null)
                                                {
                                                    item.Send(data);
                                                    infoMessage("X: " + item.RemoteEndPoint.ToString() + "   " + text);
                                                }
                                            }
                                        }
                                        else
                                        {
                                            Byte[] data = Encoding.UTF8.GetBytes("GO%0");
                                            client.Send(data);
                                        }
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    else if (text.StartsWith("JOI%"))  //add client to existing ID_ROOM
                    {
                        string[] sLobby = text.Split('%');
                        int id = int.Parse(sLobby[1]);
                        int i;
                        
                        for (i = 0; i < 20; i++)
                        {
                            if (lists[i] != null && id == lists[i].ID_ROOM)
                            {
                                if (lists[i].listsockets.Count < lists[i].Type && lists[i].status==true)  //Allow client to add ROOM
                                {
                                    try
                                    {
                                    int j = FindPosSocket(client);
                                    lists[i].listsockets.Add(client);
                                    clientList.Remove(client);
                                    lists[i].listname.Add(clientname[j]);
                                    clientname.Remove(clientname[j]);
                                    }
                                        catch
                                    {
                                    MessageBox.Show("Lỗi");
                                    }

                                }
                                break;
                            }
                        }

                        if (i == 20)
                        {
                            Byte[] data = Encoding.UTF8.GetBytes("ERR");
                            client.Send(data);
                        }
                    }
                    else if(text.StartsWith("ERREGE"))
                    {
                        chat(client, "EGE");
                    }
                    else if (text.StartsWith("LIV"))
                    {
                        string[] sdata = text.Split('%');
                        int liv = Int32.Parse(sdata[1]);

                        for (int i = 0; i < 20; i++)
                        {
                            if (lists[i] != null)
                            {
                                int count = 0;
                                foreach (Socket socket in lists[i].listsockets)
                                {
                                    if (socket != null && socket == client)
                                    {
                                        lists[i].live[count] = liv;

                                        if (liv ==0)
                                            die++;

                                        //Nếu tất cả người chơi đều có số mạng là 0 thì gửi nhãn EGE để kết thúc
                                        //if ((die == lists[i].listsockets.Count - 1) && lists[i].listsockets.Count > 1)
                                        //    foreach (Socket items in lists[i].listsockets)
                                        //    {
                                        //        if (items != null)
                                        //        {
                                        //            Byte[] data = Encoding.UTF8.GetBytes("EGE");
                                        //            items.Send(data);
                                        //            infoMessage("S: " + items.RemoteEndPoint.ToString() + "   " + "EGE");
                                        //        }
                                        //    }
                                        //else 
                                        if (die == lists[i].listsockets.Count)
                                        {
                                            foreach (Socket items in lists[i].listsockets)
                                            {
                                                if (items != null)
                                                {
                                                    Byte[] data = Encoding.UTF8.GetBytes("EGE");
                                                    items.Send(data);
                                                    infoMessage("X: " + items.RemoteEndPoint.ToString() + "   " + "EGE");
                                                }
                                            }
                                            
                                        }
                                        
                                        i = 20;
                                    }
                                    count++;
                                }
                            }
                        }
                    }
                    else if(text.StartsWith("RGT"))
                    {
                        dem++;
                        string[] sdata = text.Split('%');
                        infoMessage(text);
                        int i = FindROOM(client);
                        int pos = 0;
                        foreach(Socket socket in lists[i].listsockets)
                        {
                            if (socket != null && socket == client)
                                lists[i].ansright[pos] = Int32.Parse(sdata[1]);
                            pos++;
                        }
                        
                    }
                    else if(text.StartsWith("LDR"))
                    {
                        
                        infoMessage("S: " + client.RemoteEndPoint.ToString() + "  " + text);
                        int i = FindROOM(client);
                        if(dem== lists[i].listsockets.Count)
                        {
                            int[] temp = new int[4]; // lưu vị trí điểm số theo thứ tự
                            for (int j = 0; j < lists[i].listsockets.Count; j++)
                                temp[j] = lists[i].ansright[j];

                            int[] temp1 = new int[4];

                            string data = "LDR%";
                            int z = 0;
                            for (int j = 0; j < lists[i].listsockets.Count; j++)
                            {
                                for (int k = 0; k < lists[i].listsockets.Count; k++)
                                    if (temp[z] < temp[k]) z = k;
                                temp1[j] = z;
                                temp[z] = -1;
                            }
                            for (int j = 0; j < lists[i].listsockets.Count; j++)
                            {
                                data += lists[i].listname[temp1[j]] + "%" + (lists[i].ansright[temp1[j]] * 7).ToString() + "%" + lists[i].ansright[temp1[j]].ToString() + "%";

                            }
                            data += "%%%%%%%%%";
                            Byte[] sdata = Encoding.UTF8.GetBytes(data);
                            foreach (Socket socket in lists[i].listsockets)
                                if (socket != null)
                                {
                                    socket.Send(sdata);
                                    infoMessage("S: " + socket.RemoteEndPoint.ToString() + "  " + data);
                                }
                        }
                       
                                

                    }

                    else if (text.StartsWith("LIF")|| text.StartsWith("ERRLIF"))
                    {
                        //trả về số mạng các người chơi trong phòng
                        int i = FindROOM(client);
                        
                        string data = "LIF";
                        for (int j = 0; j < lists[i].listsockets.Count; j++)
                        {
                            data += "%" + lists[i].live[j].ToString();
                        }

                        int numberclient = lists[i].listname.Count;
                        if (numberclient == 1) data += "%0%0%0";
                        if (numberclient == 2) data += "%0%0";
                        if (numberclient == 3) data += "%0";

                        Byte[] sdata = Encoding.UTF8.GetBytes(data);
                        
                        foreach (Socket socket in lists[i].listsockets)
                        {
                            if(socket!=null)
                            {
                                socket.Send(sdata);
                                infoMessage("S: " + data);
                            }
                        }
                    }
                    else
                    chat(client, text);
                    infoMessage("C: " + client.RemoteEndPoint + ": " + text);
                }
            }

            catch
            {
                int i = FindROOM(client);
                if (i == -1)
                    clientList.Remove(client);
                else
                {
                    int j = 0;
                    foreach (Socket socket in lists[i].listsockets)
                    {
                        if (socket != null && socket == client)
                            lists[i].listname.Remove(lists[i].listname[j]);
                        j++;
                    }
                    lists[i].listsockets.Remove(client);
                    if (lists[i].listsockets.Count == 0)
                    {
                        lists[i].DSCauhoi = null;
                        lists[i] = null;
                    }
                
                }
                client.Close();
            }
        }


        public int FindROOM(Socket socket)
        {
            //xác định client đang ở Room nào
            for(int i=0;i<20;i++)
            {
                if(lists[i]!=null)
                    foreach(Socket item in lists[i].listsockets)
                    {
                        if (item != null && item == socket)
                            return i;
                    }
            }
            return -1;
        }

        public void chat(Socket socket,string text)
        {
            int i = FindROOM(socket);
            Byte[] sdata = Encoding.UTF8.GetBytes(text);
            foreach(Socket item in lists[i].listsockets)
            {
                if(item!=null)
                {
                    item.Send(sdata);
                }
            }
        }

        public void close()
        {
            listenerSocket.Close();
            infoMessage("Client disconnected");
        }

        public void infoMessage(string message)
        {
            ListViewItem item = new ListViewItem();
            item.Text = message;

            if (listMessage.InvokeRequired)
            {
                listMessage.Invoke(new MethodInvoker(delegate ()
                {
                    listMessage.Items.Add(item);
                }));
            }
            else
            {
                listMessage.Items.Add(item);
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
