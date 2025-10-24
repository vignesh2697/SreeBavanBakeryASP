using System;
using System.Collections;
using System.Data;

namespace Bakery
{
    public partial class user_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                Session.Abandon();
            }
        }

        Hashtable ht = new Hashtable();

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            try
            {
                int empid = 0;
                string qry = "";
                string username = "";
                string photo = "";

                qry = @"sp_fetchEmployeeLogin @uname,@pwd";

                ht.Add("@uname", txt_userName.Text);
                ht.Add("@pwd", txt_Password.Text);

                DataTable dt = MainClass.GetDataER(qry, ht);

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        empid = Convert.ToInt32(dr[0].ToString());
                        username = dr[1].ToString();
                        photo = dr[2].ToString();
                    }
                    Session["userName"] = username;
                    Session["empId"] = empid;
                    Response.Write("<script>alert('Login Successfull');location.replace('/Billing.aspx');</script>");
                }
                else
                {
                    ht.Clear();
                    Response.Write("<script>alert('Login Failed');</script>");
                }
            }
            catch (Exception ex)
            {
                ht.Clear();
                Response.Write(ex.Message);
            }
        }
    }
}