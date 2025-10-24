using System;
using System.Collections;
using System.Web.UI.WebControls;

namespace Bakery
{
    public partial class Customers : System.Web.UI.Page
    {
        string qry = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_Name.Text = "Hii, " + Session["userName"].ToString();
            if (!this.IsPostBack)
            {
                LoadData();
            }
        }

        Hashtable ht = new Hashtable();

        private void LoadData()
        {
            try
            {
                qry = @"sp_fetchCustomer";
                MainClass.LoadData(qry, GridView);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btn_saveCus_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(ViewState["Id"]);
                if (id == 0) //Save
                {
                    qry = @"sp_insertCustomer @cust_name,@mobileNumber";
                }
                else //Update
                {
                    qry = @"sp_updateCustomer @ID,@cust_name,@mobileNumber";
                }

                ht.Add("@ID", id);
                ht.Add("@cust_name", txt_customerName.Text);
                ht.Add("@mobileNumber", txt_mobileNo.Text);

                if (MainClass.SQL(qry, ht) > 0)
                {
                    if (id == 0)
                    {
                        Response.Write("<script>alert('Successfully Added')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Update Successfully')</script>");
                    }
                    id = 0;
                    ht.Clear();
                    ViewState["Id"] = null;
                    LoadData();
                }
                else
                {
                    id = 0;
                    ht.Clear();
                    ViewState["Id"] = null;
                    LoadData();
                    Response.Write("<script>alert('Please fill all the data')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btn_deleteCus_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(ViewState["Id"]);
                //Delete data to the database
                if (id != 0) //Delete
                {
                    qry = @"sp_deleteCustomer @ID";
                }

                //Hashtable
                ht.Add("@ID", id);

                if (MainClass.SQL(qry, ht) > 0)
                {
                    Response.Write("<script>alert('Deleted Successfully')</script>");
                    id = 0;
                    ht.Clear();
                    ViewState["Id"] = null;
                    LoadData();
                }
                else
                {
                    Response.Write("<script>alert('Delete UnSuccessfull')</script>");
                    id = 0;
                    ht.Clear();
                    ViewState["Id"] = null;
                    LoadData();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txt_customerName.Text = GridView.SelectedRow.Cells[3].Text.ToString();
                txt_mobileNo.Text = GridView.SelectedRow.Cells[4].Text.ToString();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                GridView.PageIndex = e.NewPageIndex;
                LoadData();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = GridView.DataKeys[rowIndex].Values[0];
            }
        }
    }
}