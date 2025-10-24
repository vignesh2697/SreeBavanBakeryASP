using System;
using System.Collections;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bakery
{
    public partial class Products : System.Web.UI.Page
    {
        string qry = "";
        string sourcePath = "";
        string oldFilePath = "";

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
                string qry = @"sp_fetchProduct";
                MainClass.LoadData(qry, dgv_productList);
                //load comboBox
                string qry1 = @"sp_fetchCategory";
                MainClass.CBFill(qry1, cmb_categoryName);
                cmb_categoryName.Items.Insert(0, new ListItem("Select Category", ""));
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(ViewState["Id"]);

                string fpath = @"~/Images/";

                string[] allowedFileExtensions = { ".jpg", ".jpeg", ".png" };
                string fileExtension = Path.GetExtension(OpenFileDialog.FileName.ToLower());
                string newFilePath = fpath + txt_productName.Text + fileExtension;

                if (ViewState["oldFilePath"] != null) { oldFilePath = ViewState["oldFilePath"].ToString(); }
                else { oldFilePath = ""; }

                sourcePath = Path.GetFileName(OpenFileDialog.FileName);
                string browsePath = Path.Combine(fpath, sourcePath);
                DateTime d = Convert.ToDateTime(dtp_expiryDate.Text);

                //Product image upload to the localpath
                if (OpenFileDialog.HasFile && ViewState["oldFilePath"] != null) //Update
                {
                    if (allowedFileExtensions.Contains(fileExtension))
                    {
                        if (File.Exists(Server.MapPath(oldFilePath)))
                        {
                            if (File.Exists(Server.MapPath(browsePath)))
                            {
                                File.Delete(Server.MapPath(oldFilePath));
                                OpenFileDialog.PostedFile.SaveAs(Server.MapPath(fpath) + txt_productName.Text + fileExtension);
                            }
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('File Extension is not allowed. Allowed only .jpg, .jpeg, .png')", true);
                    }
                }
                else if (ViewState["oldFilePath"] != null) //Update
                {
                    if (File.Exists(Server.MapPath(oldFilePath)))
                    {
                        if (ViewState["oldFileName"].ToString() != txt_productName.Text)
                        {
                            string fileExt = Path.GetExtension(oldFilePath);
                            string newFPath = newFilePath + fileExt;
                            File.Move(Server.MapPath(oldFilePath), Server.MapPath(newFPath));
                            newFilePath = newFPath;
                        }
                        else
                        {
                            newFilePath = oldFilePath;
                        }
                    }
                }
                else if (OpenFileDialog.HasFile) //Add
                {
                    if (allowedFileExtensions.Contains(fileExtension))
                    {
                        if (!Directory.Exists(Server.MapPath(fpath)))
                        {
                            Directory.CreateDirectory(Server.MapPath(fpath));
                        }
                        OpenFileDialog.PostedFile.SaveAs(Server.MapPath(fpath) + txt_productName.Text + fileExtension);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('File Extension is not allowed. Allowed only .jpg, .jpeg, .png')", true);
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please select an image')</script>");
                }

                //Data upload to the database
                if (id == 0) //Add
                {
                    qry = @"sp_insertProduct @productName,@categoryID,@cost,@quantity,@expiryDate,@productImage";
                }
                else //Update
                {
                    qry = @"sp_updateProduct @ID,@productName,@categoryID,@cost,@quantity,@expiryDate,@productImage";
                }

                //Hashtable
                ht.Add("@ID", id);
                ht.Add("@productName", txt_productName.Text);
                ht.Add("@categoryID", cmb_categoryName.SelectedValue);
                ht.Add("@cost", Convert.ToDouble(txt_Cost.Text));
                ht.Add("@quantity", Convert.ToInt32(txt_Quantity.Text));
                ht.Add("@expiryDate", d);
                ht.Add("@productImage", newFilePath);

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
                    ViewState["oldFilePath"] = null;
                    ViewState["oldFileName"] = null;
                    LoadData();
                }
                else
                {
                    id = 0;
                    ht.Clear();
                    ViewState["Id"] = null;
                    ViewState["oldFilePath"] = null;
                    ViewState["oldFileName"] = null;
                    LoadData();
                    Response.Write("<script>alert('Please fill all the data')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(ViewState["Id"]);

                //Delete image to the localpath
                string qry = "";
                if (File.Exists(Server.MapPath(oldFilePath))) //Delete
                {
                    File.Delete(Server.MapPath(oldFilePath));
                }

                //Delete data to the database
                if (id != 0) //Delete
                {
                    qry = @"sp_deleteProduct @id";
                }

                //Hashtable
                ht.Add("@ID", id);

                if (MainClass.SQL(qry, ht) > 0)
                {
                    Response.Write("<script>alert('Deleted Successfully')</script>");
                    id = 0;
                    ht.Clear();
                    ViewState["Id"] = null;
                    ViewState["oldFilePath"] = null;
                    LoadData();
                }
                else
                {
                    Response.Write("<script>alert('Delete UnSuccessfull')</script>");
                    id = 0;
                    ht.Clear();
                    ViewState["Id"] = null;
                    ViewState["oldFilePath"] = null;
                    LoadData();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btn_addCate_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Category.aspx");
        }

        protected void dgv_productList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow selectedRow = dgv_productList.SelectedRow;

                txt_productName.Text = selectedRow.Cells[3].Text;
                txt_Cost.Text = selectedRow.Cells[5].Text;
                txt_Quantity.Text = selectedRow.Cells[6].Text;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void dgv_productList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = dgv_productList.DataKeys[rowIndex].Values[0];
                ViewState["oldFilePath"] = dgv_productList.DataKeys[rowIndex].Values[1];
                ViewState["oldFileName"] = dgv_productList.DataKeys[rowIndex].Values[2];
            }
        }

        protected void dgv_productList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                dgv_productList.PageIndex = e.NewPageIndex;
                LoadData();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}