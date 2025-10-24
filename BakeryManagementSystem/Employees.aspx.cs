using System;
using System.Collections;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bakery
{
    public partial class Employees : System.Web.UI.Page
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
                qry = @"sp_fetchEmployee";
                MainClass.LoadData(qry, dgv_employeeList);
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

                string fpath = @"~/EmployeePhoto/";

                string[] allowedFileExtensions = { ".jpg",".jpeg" };
                string fileExtension = Path.GetExtension(OpenFileDialog.FileName.ToLower());
                string newFilePath = fpath + txt_employeeName.Text + fileExtension;

                if (ViewState["oldFilePath"] != null) { oldFilePath = ViewState["oldFilePath"].ToString(); }
                else { oldFilePath = ""; }

                sourcePath = Path.GetFileName(OpenFileDialog.FileName);
                string browsePath =Path.Combine( fpath , sourcePath);

                DateTime d = Convert.ToDateTime(dtp_DOB.Text);

                //Employee photo upload to the localpath
                if (OpenFileDialog.HasFile)
                {
                    if (allowedFileExtensions.Contains(fileExtension))
                    {
                        if (File.Exists(Server.MapPath(oldFilePath))) //Update
                        {
                            if (File.Exists(Server.MapPath(browsePath)))
                            {
                                File.Delete(Server.MapPath(oldFilePath));
                                OpenFileDialog.PostedFile.SaveAs(Server.MapPath(fpath) + txt_employeeName.Text + fileExtension);
                            }
                            else
                            {
                                newFilePath = oldFilePath;
                            }
                            ViewState["oldFilePath"] = null;
                        }
                        else //Add
                        {
                            if (!Directory.Exists(Server.MapPath(fpath)))
                            {
                                Directory.CreateDirectory(Server.MapPath(fpath));
                            }
                            OpenFileDialog.PostedFile.SaveAs(Server.MapPath(fpath) + txt_employeeName.Text + fileExtension);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('File Extension is not allowed. Allowed only .jpg and .jpeg')", true);
                    }
                }
                else
                    Response.Write("<script>alert('Please select an image')</script>");

                //Data upload to the database
                if (id == 0) //Add
                {
                    qry = @"sp_insertEmployee @uname,@pwd,@mobileNumber,@empPhoto,@dob";
                }
                else //Update
                {
                    qry = @"sp_updateEmployee @ID,@uname,@pwd,@mobileNumber,@empPhoto,@dob";
                }

                //Hashtable
                ht.Add("@ID", id);
                ht.Add("@uname", txt_employeeName.Text);
                ht.Add("@pwd", txt_Pwd.Text);
                ht.Add("@mobileNumber", txt_mobileNo);
                ht.Add("@empPhoto", newFilePath);
                ht.Add("@dob", d);

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
                    qry = @"sp_deleteEmployee @ID";
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

        protected void dgv_employeeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow selectedRow = dgv_employeeList.SelectedRow;

                txt_employeeName.Text = selectedRow.Cells[3].Text;
                dtp_DOB.Text = selectedRow.Cells[4].Text;
                txt_mobileNo.Text = selectedRow.Cells[5].Text;
                txt_Pwd.Text = selectedRow.Cells[6].Text;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void dgv_employeeList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = dgv_employeeList.DataKeys[rowIndex].Values[0];
                ViewState["oldFilePath"] = dgv_employeeList.DataKeys[rowIndex].Values[1];
            }
        }
    }
}