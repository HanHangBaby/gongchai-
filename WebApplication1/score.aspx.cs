using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;



namespace gongchai
{
    public partial class score : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        } 
       
        #region  提交
        protected void Button1_Click(object sender, EventArgs e)
        {
            string connstr = "server=.;database=gongchai;Integrated Security=SSPI";
            SqlConnection conn = new SqlConnection(connstr);
           
           
           
            int time = int.Parse(TextBox2.Text);
            int nandu = int.Parse(TextBox3.Text);
           
            string cmdstr0 = string.Format("UPDATE T_mission SET time='{0}',status='{1}',total_points={2}*0.6+{3}*0.4 WHERE mission_name='{4}'",time,nandu, time, nandu, TextBox1.Text);
            string cmdstr1 = string.Format("UPDATE T_people SET points=points+T_mission.total_points FROM T_mission, T_people WHERE T_mission.mission_name = T_people.mission_name and T_people.mission_name ='{0}'", TextBox1.Text);
            string cmdstr2 = string.Format("UPDATE T_people SET mission_name ='{0}' WHERE mission_name ='{1}'", null, TextBox1.Text);
            string cmdstr3 = " delete from T_mission where mission_name='" + TextBox1.Text + "'";

            SqlCommand cmd0 = new SqlCommand(cmdstr0, conn);
            SqlCommand cmd1 = new SqlCommand(cmdstr1, conn);
            SqlCommand cmd2 = new SqlCommand(cmdstr2, conn);
            SqlCommand cmd3 = new SqlCommand(cmdstr3, conn);
            try
            {
                conn.Open();//打开数据库连接
                            //执行SQL语句并返回受影响的行数
                cmd0.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                cmd3.ExecuteNonQuery();
                GridView1.DataBind();//重新绑定gridview-起到刷新作用
                Response.Write("<script>alert('提交成功！')</script>");
            }

            catch (Exception err)
            {
                Response.Write("<script>alert('提交失败！')</script>");
            }
            finally
            {
                conn.Dispose();
            }
            Panel1.Visible = false;
        }
        #endregion

        protected void submit_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button btn = sender as Button;
            GridViewRow row = btn.Parent.Parent as GridViewRow;
            TextBox1.Text = row.Cells[0].Text;
          


        }

        protected void B_return_Click(object sender, EventArgs e)
        {
            Response.Redirect("start.aspx");
        }
    }
}