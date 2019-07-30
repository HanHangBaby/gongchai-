using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace WebApplication2
{
    public partial class zidongxuanze : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region 查询
        protected void Button1_Click(object sender, EventArgs e)
        {

            string a ="all";
            string sql;
              
                Panel1.Visible = true;
            
            string str_cnn = "server=.;database=gongchai;Integrated Security=SSPI";
            SqlConnection conn = new SqlConnection(str_cnn);
                conn.Open();


                string major = DropDownList1.SelectedValue;
                string sex = DropDownList2.SelectedValue;
                string number = TextBox2.Text;
            if(sex==a)
               sql =string.Format("select top {0}* from T_people where major='{1}'order by T_people.points", number,major);
            else
                sql = string.Format("select top {0} * from T_people where major='{1}'and sex='{2}'and mission_name is NULL order by T_people.points", number, major, sex);
            //设置SqlDataSource 执行sql语句
            SqlDataSource1.SelectCommand = sql;


                try
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                   if(cmd.ExecuteNonQuery()==0) Response.Write("<script>alert('提交失败！')</script>");
                GridView1.DataBind();
                }
                catch (Exception err)
                {
                Response.Write("<script>alert('提交失败！')</script>");
            }
                finally
                {
                    conn.Dispose();
                }

            }
        #endregion


        #region 返回
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("start.aspx");
        }
        #endregion


        #region 保存
        protected void Button3_Click(object sender, EventArgs e)
        {

            int i;
            
               
                int number=  int.Parse(TextBox2.Text);
            
            for (i = 0; i < number; i++)
            {
                string str_cnn = "server=.;database=gongchai;Integrated Security=SSPI";
                SqlConnection conn = new SqlConnection(str_cnn);
                conn.Open();
                string cmdstr = string.Format("update T_people set mission_name='{0}' where name='{1}' ", TextBox1.Text, this.GridView1.Rows[i].Cells[0].Text);

                try
                {
                    SqlCommand cmd = new SqlCommand(cmdstr, conn);
                    cmd.ExecuteNonQuery();
                    // GridView1.DataBind();
                }
                catch (Exception err)
                {
                    Response.Write("<script>alert('保存失败！')</script>");
                }
                finally
                {
                    conn.Dispose();
                }
            }
            string str_cnn1= "server=.;database=gongchai;Integrated Security=SSPI";
          
            SqlConnection conn1 = new SqlConnection(str_cnn1);
            conn1.Open();
            string cmdstr1 = string.Format("insert into T_mission(mission_name) values('{0}')", TextBox1.Text);
           
            try
            {
                SqlCommand cmd = new SqlCommand(cmdstr1, conn1);
                cmd.ExecuteNonQuery();
               
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('保存失败！')</script>");
            }
            finally
            {
                conn1.Dispose();
            }


            Panel1.Visible = false;
            }

        #endregion
    }

}


