using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace user_defined
{
    public partial class user_defined : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

  
        protected void Btn_return_Click(object sender, EventArgs e)
        {
            Response.Redirect("start.aspx");
        }
        #region 保存
        protected void Btn_save_Click(object sender, EventArgs e)
        {
            string str_cnn = "server=.;database=gongchai;Integrated Security=SSPI";
            SqlConnection conn = new SqlConnection(str_cnn);

           
            conn.Open();
            String mission_name =Tb_workname.Text;
            String person_name =Tb_pername.Text ;
            string cmdstr = string.Format("update T_people set mission_name='{0}' where name='{1}'and mission_name is NULL ",mission_name, person_name);
           
            try
            {
                SqlCommand cmd = new SqlCommand(cmdstr, conn);
               
               
              if (cmd.ExecuteNonQuery()!=0)
                Response.Write("<script>alert('保存成功！')</script>");
                else
                Response.Write("<script>alert('保存失败！该人员有公差任务')</script>");
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
        #endregion
       
        protected void Btn_done_Click(object sender, EventArgs e)
        {
           
            Panel_2.Visible = true;
            string str_cnn = "server=.;database=gongchai;Integrated Security=SSPI";
            SqlConnection conn = new SqlConnection(str_cnn);
            conn.Open();


            String mission_name = Tb_workname.Text;
            String person_name = Tb_pername.Text;
            string sql = string.Format("select name,mission_name from T_people where mission_name='{0}'", mission_name);

            //设置SqlDataSource 执行sql语句
            SqlDataSource1.SelectCommand = sql;


            try
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                GridView1.DataBind();

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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Btn_confirm_Click(object sender, EventArgs e)
        {
            Panel_2.Visible = false;

            string str_cnn = "server=.;database=gongchai;Integrated Security=SSPI";
            SqlConnection conn = new SqlConnection(str_cnn);


            conn.Open();

            string cmdstr= string.Format("insert into T_mission(mission_name) values('{0}')", this.GridView1.Rows[0].Cells[1].Text);
            try
            {
                SqlCommand cmd = new SqlCommand(cmdstr, conn);
                cmd.ExecuteNonQuery();
               
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('操作失败！')</script>");
            }
            finally
            {
                conn.Dispose();
            }
        }

       
    }
}