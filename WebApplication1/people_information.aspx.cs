using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;




namespace WebApplication2
{
    public partial class people_information : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region 添加
        protected void B_add_Click(object sender, EventArgs e)
        {
            String connstr = "server=.;database=gongchai;Integrated Security=SSPI";
            SqlConnection conn = new SqlConnection(connstr);   //建立数据库连接对象  
            string cmdstr = string.Format("INSERT INTO T_people(name,sex,major,points,mission_name) VALUES ('{0}','{1}','{2}','{3}','{4}')", TB_name.Text, TB_sex.Text, TB_major.Text, 0,null);
            SqlCommand cmd = new SqlCommand(cmdstr, conn);
            try
            {

                conn.Open();//打开数据库连接
                cmd.ExecuteNonQuery();//执行SQL语句并返回受影响的行数
                GridView1.DataBind();//重新绑定gridview-起到刷新作用
                Response.Write("<script>alert('添加成功！')</script>");
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('添加失败！姓名不能重复！')</script>");
            }
            finally
            {
                conn.Dispose();
              
            }
        }
        #endregion
        #region 选择
        protected void B_select_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow row = btn.Parent.Parent as GridViewRow;
          
            string name = row.Cells[0].Text;
            string sex = row.Cells[1].Text;
            string major = row.Cells[2].Text;
      
            TB_name.Text = name;
            TB_sex.Text = sex;
            TB_major.Text = major;
           
        }
        #endregion
        #region 删除
        protected void B_delete_Click(object sender, EventArgs e)
        {
            String connstr = "server=.;database=gongchai;Integrated Security=SSPI";
            SqlConnection conn = new SqlConnection(connstr);   //建立数据库连接对象  
            Button btn = sender as Button;
            GridViewRow row = btn.Parent.Parent as GridViewRow;
         

            string cmdstr = string.Format("delete  from T_people WHERE name='{0}'", row.Cells[0].Text);
            SqlCommand cmd = new SqlCommand(cmdstr, conn);
            try
            {

                conn.Open();//打开数据库连接
                cmd.ExecuteNonQuery();//执行SQL语句并返回受影响的行数
                GridView1.DataBind();//重新绑定gridview-起到刷新作用
                Response.Write("<script>alert('删除成功！')</script>");
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('删除失败！')</script>");
            }
            finally
            {
                conn.Dispose();
               
            }


        }
        #endregion
        #region 修改
        protected void B_modify_Click(object sender, EventArgs e)
        {
            String connstr = "server=.;database=gongchai;Integrated Security=SSPI";
            SqlConnection conn = new SqlConnection(connstr);   //建立数据库连接对象  
            Button btn = sender as Button;
            GridViewRow row = btn.Parent.Parent as GridViewRow;
            conn.Open();//打开连接
            //string cmdstr0 = string.Format("delete  from T_people WHERE name='{0}'", row.Cells[0].Text);
            string cmdstr = string.Format("UPDATE T_people SET sex = '{0}',major='{1}' where name='{2}'", TB_sex.Text, TB_major.Text, TB_name.Text);
            try
            {
                SqlCommand cmd = new SqlCommand(cmdstr, conn);
                cmd.ExecuteNonQuery();//执行SQL语句并返回受影响的行数
                GridView1.DataBind();
                Response.Write("<script>alert('修改成功！')</script>");
            }
            catch (Exception err)
            {
                Response.Write("<script>alert('修改失败！姓名无法修改，可通过删除/添加进行操作')</script>");
            }
            finally
            {
                conn.Dispose();
            }

        }
        #endregion

        protected void B_return_Click(object sender, EventArgs e)
        {
            Response.Redirect("start.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}