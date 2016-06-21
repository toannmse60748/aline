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
    public partial class Admin : System.Web.UI.Page
    {
        public static SqlConnection conn = new SqlConnection("uid=rocky;Initial Catalog=PrePool;data Source=(local)");
        public static DataSet ds = new DataSet();
        public SqlDataAdapter adapter;
        public SqlDataAdapter adapter1;
        //câu query lấy column id va email trong bảng User và UserId trong bảng UserResult (bảng trung gian giữa 2 bảng User và bảng Result)
        public string query1 = 
            "SELECT DISTINCT bag2.id, " +
                    "(SELECT bag1.result  +',' AS [text()] " +
                    "FROM  (SELECT	User1.*,Result.id as result " + 
					        "FROM	[PrePool].[dbo].[Result] as Result, [PrePool].[dbo].[User] as User1, [PrePool].[dbo].[UserResult] as UserResult "+
					        "WHERE	User1.id = UserResult.userId and Result.id = UserResult.resultId)bag1 " +
                     "WHERE bag1.id=bag2.id " +
                     "FOR XML PATH('')) [result],[email],[name] "+
			                "FROM (SELECT	User1.*,Result.id as result " +
					                "FROM	[PrePool].[dbo].[Result] as Result,[PrePool].[dbo].[User] as User1, [PrePool].[dbo].[UserResult] as UserResult " +
					                "WHERE	User1.id = UserResult.userId and Result.id = UserResult.resultId) bag2";


        public string query = "select *  from [PrePool].[dbo].[Result] ";
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["user"] != null)
            //{
                //load tất cả các Admin lên bảng hiển thị
                if (!IsPostBack)
                {
                    ds.Clear();
                    adapter = new SqlDataAdapter(query1, conn);
                    adapter1 = new SqlDataAdapter(query, conn);    
                    adapter.Fill(ds, "User");                   

                    //đổ dữ liệu vào datalistAccount ở giao diện
                    dlAccount.DataSource = ds.Tables["User"];                    
                    dlAccount.DataBind();
                }
              
            //}
            //else
            //{
              //  Response.Redirect("Admin.aspx");
            //}
        }
    }
}