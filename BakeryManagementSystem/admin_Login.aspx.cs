using System;
using System.Collections;
using System.Data;

namespace Bakery
{
    public partial class admin_Login : System.Web.UI.Page
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
                int aid = 0;
                string qry = "";
                string adminname = "";

                qry = @"sp_fetchAdminLogin @aname,@pwd";

                ht.Add("@aname", txt_adminName.Text);
                ht.Add("@pwd", txt_Password.Text);

                DataTable dt = MainClass.GetDataER(qry, ht);

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        aid = Convert.ToInt32(dr[0].ToString());
                        adminname = dr[1].ToString();
                    }
                    Session["userName"] = adminname;
                    Response.Write("<script>alert('Login Successfull');location.replace('/Accounts.aspx');</script>");
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