using System;
using System.Collections;

namespace Bakery
{
    public partial class Category : System.Web.UI.Page
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

        private void LoadData()
        {
            try
            {
                qry = @"sp_fetchCategory";
                MainClass.LoadData(qry, dgv_categoryList);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        Hashtable ht = new Hashtable();

        protected void btn_saveCate_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(ViewState["Id"]);
                if (id == 0) //Save
                {
                    qry = @"sp_insertCategory @category_name";
                }
                else //Update
                {
                    qry = @"sp_updateCategory @ID,@category_name";
                }

                //Hashtable
                ht.Add("@ID", id);
                ht.Add("@category_name", txt_categoryName.Text);

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
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btn_deleteCate_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(ViewState["Id"]);
                //Delete data to the database
                if (id != 0) //Delete
                {
                    qry = @"sp_deleteCategory @ID";
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
                    Response.Write("<script>alert('Deleted UnSuccessfull')</script>");
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

        protected void dgv_categoryList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ViewState["Id"] = dgv_categoryList.DataKeys[dgv_categoryList.SelectedIndex].Value;
                txt_categoryName.Text = dgv_categoryList.SelectedRow.Cells[3].Text;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}