using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace Aline
{
    public partial class Guest : System.Web.UI.Page
    {
        public static SqlConnection conn = new SqlConnection("uid=rocky;Initial Catalog=PrePool;data Source=(local)");
        public static DataSet ds = new DataSet();
        public SqlDataAdapter adapter;

        public int count = 0;
        public CheckBox CheckBox1;
        public static List<CheckBox> checkedList = new List<CheckBox>();//tạo list để lưu những checkbox đã được check

        /// <summary>
        /// Load trang và hiển thị nội dung các câu hỏi
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ds.Clear();
                //query lấy hết data từ bảng Result và sort by ID
                string query = "SELECT * FROM [PrePool].[dbo].[Result] as Result order by len(Result.id),Result.id";
                adapter = new SqlDataAdapter(query, conn);
                adapter.Fill(ds, "result");
                dlView.DataSource = ds.Tables["result"];
                dlView.DataBind();
            }

        }

        /// <summary>
        /// xử lý sự kiện khi ấn nút submit, bao gồm nhập dữ liệu cho 2 bảng là User và UserResult
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (txtName.Text != null)
            {
                /*--khai báo tất cả các component từ việc nạp dữ liệu--*/
                //query cho bảng User dùng để add User
                string queryForAddUser = "select * from [PrePool].[dbo].[User]";
                //query cho bảng UserResult dùng để add UserResult
                string queryForAddUserInUserResult = "select * from [PrePool].[dbo].[UserResult]";
                SqlDataAdapter adapter1 = new SqlDataAdapter(queryForAddUser, conn);
                SqlDataAdapter adapter2 = new SqlDataAdapter(queryForAddUserInUserResult, conn);
                SqlCommandBuilder builder = new SqlCommandBuilder(adapter1);
                SqlCommandBuilder builder2 = new SqlCommandBuilder(adapter2);
                adapter1.Fill(ds, "User");
                adapter2.Fill(ds, "UserResult");

                //khai báo 2 trường name và mail trong table User
                string name = txtName.Text;
                string mail = txtEmail.Text;


                //add value cho bảng User
                DataRow newAdmin = ds.Tables["User"].NewRow();
                //add 2 collumn name va email (id tu tăng)
                newAdmin["name"] = name;
                newAdmin["email"] = mail;
                ds.Tables["User"].Rows.Add(newAdmin);
                adapter1.Update(ds.Tables["User"]);


                /*-- xu ly để lấy userId và resultId --*/
                //đổ lại vào table User
                adapter1.Fill(ds, "User");
                //lay vị trí của row vừa add
                int count = ds.Tables["User"].Rows.Count - 1;
                //xuat ra [id] cua row moi nhat - row vua add
                string userIdStringType = ds.Tables["User"].Rows[count]["id"].ToString();
                //userId
                int userId = Int32.Parse(userIdStringType);
                //resultId lấy từ text cua checkbox
                int resultId;


                //add value cho bang UserResult với từng chechbox được check                
                foreach (CheckBox cb in checkedList)
                {
                    DataRow newUserResult = ds.Tables["UserResult"].NewRow();
                    resultId = Int32.Parse(cb.Text);
                    //add 2 collumn resultId va userId
                    newUserResult["resultId"] = resultId;
                    newUserResult["userId"] = userId;
                    ds.Tables["UserResult"].Rows.Add(newUserResult);
                }
                adapter2.Update(ds.Tables["UserResult"]);
                //cảm ơn người dùng
                MsgBox("ありがとうございます");

            }
            //refresh lại trang mới
            checkedList.Clear();
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        /// <summary>
        /// Hiện ra Message Box
        /// </summary>
        /// <param name="msg"></param>
        public void MsgBox(String msg)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language='javascript'>alert('" + msg + "')</script>");
        }


        /// <summary>
        /// Xử lý sự kiện add vào checkedList khi ấn vào checkbox, loại ra khỏi list khi user uncheck
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox1 = (CheckBox)sender;
            //chỉ được check 5 câu hỏi, nếu vượt quá thì sẽ thông báo cho user và uncheck 
            if (checkedList.Count < 5)
            {
                if (CheckBox1.Checked == true)
                {
                    checkedList.Add(CheckBox1);
                }
                else
                {
                    checkedList.Remove(CheckBox1);
                }
            }
            else
            {
                MsgBox("Enough");
                CheckBox1.Checked = false;                
            }
        }
    }
}