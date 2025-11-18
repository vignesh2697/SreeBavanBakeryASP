using System;
using System.Collections;
using System.Data;
using System.Web.UI.WebControls;

namespace Bakery
{
    public partial class Billing : System.Web.UI.Page
    {
        string qry = "";

        DataTable dt = new DataTable();
        Hashtable ht = new Hashtable();

        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_Name.Text = "Hii, " + Session["userName"].ToString();

            if (!this.IsPostBack)
            {
                LoadData();
                if (ViewState["Records"] == null)
                {
                    dt.Columns.Add("Product ID");
                    dt.Columns.Add("Product Name");
                    dt.Columns.Add("Cost");
                    dt.Columns.Add("Quantity");
                    dt.Columns.Add("Amount");
                    // Add more columns as needed

                    ViewState["Records"] = dt; // Store the empty DataTable in ViewState
                    dgv_Billing.DataSource = dt;
                    dgv_Billing.DataBind();
                }
            }
        }

        private void LoadData()
        {
            try
            {
                string qry = @"sp_fetchProductCB";
                MainClass.CBFill(qry, cmb_productList);
                cmb_productList.Items.Insert(0, new ListItem("--Please Select--", "0"));
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void cmb_productList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string qry = @"sp_fetchProductDetail " + cmb_productList.SelectedValue + "";
                DataTable dt = MainClass.GetData(qry);

                foreach (DataRow row in dt.Rows)
                {
                    txt_Category.Text = row[0].ToString();
                    txt_Cost.Text = row[1].ToString();
                    string img = row[2].ToString();
                    pb_productImage.ImageUrl = img;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            try
            {
                int productID = Convert.ToInt32(cmb_productList.SelectedValue);
                string productName = cmb_productList.SelectedItem.ToString();
                double cost = Convert.ToDouble(txt_Cost.Text.ToString());
                int quantity = Convert.ToInt32(txt_Quantity.Text.ToString());
                double amount = cost * quantity;

                dt = (DataTable)ViewState["Records"];
                dt.Rows.Add(productID, productName, cost, quantity, amount);

                ViewState["Records"] = dt; // Update ViewState
                dgv_Billing.DataSource = dt;
                dgv_Billing.DataBind();

                txt_Quantity.Text = "";

                double totalAmount = 0;
                foreach (GridViewRow dr in dgv_Billing.Rows)
                {
                    totalAmount += Convert.ToDouble(dr.Cells[5].Text.ToString());
                    txt_Total.Text = totalAmount.ToString();
                    txt_GST.Text = ((totalAmount * 18) / 100).ToString();
                    txt_Final.Text = (totalAmount + ((totalAmount * 18) / 100)).ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                qry = @"sp_insertBilling @billedby,@customerid,@totalamount,@cashoronline";

                //Hashtable

                ht.Add("@billedby", Session["empId"]);
                ht.Add("@customerid", Convert.ToInt32(txt_cusID.Text.ToString()));
                ht.Add("@totalamount", Convert.ToDouble(txt_Final.Text.ToString()));
                ht.Add("@cashoronline", cmb_cashOnline.SelectedValue.ToString());

                int billID = Convert.ToInt32(MainClass.GetScalarData(qry, ht));

                if (billID > 0)
                {
                    qry = "";
                    ht.Clear();
                    foreach (GridViewRow dr in dgv_Billing.Rows)
                    {
                        int productID = Convert.ToInt32(dr.Cells[1].Text.ToString());

                        if (productID > 0)
                        {
                            qry = @"sp_insertBillProduct @billid,@productid,@quantity,@amount";

                            //Hashtable
                            ht.Add("@billid", billID);
                            ht.Add("@productid", productID);
                            ht.Add("@quantity", Convert.ToInt32(dr.Cells[4].Text.ToString()));
                            ht.Add("@amount", Convert.ToDouble(dr.Cells[5].Text.ToString()));

                            if (MainClass.SQL(qry, ht) > 0) { ht.Clear(); }
                            else
                                Response.Write("Please Enter all data");
                        }
                    }
                }
                else
                {
                    ht.Clear();
                    Response.Write("Please Enter all data");
                }

                //List<Report> lst = new List<Report>();
                //lst.Clear();
                //for (int i = 0; i < dgv_Billing.Rows.Count; i++)
                //{
                //    Report reportprint = new Report
                //    {
                //        b_PName = dgv_Billing.Rows[i].Cells[0].Value.ToString(),
                //        b_Cost = Convert.ToDouble(dgv_Billing.Rows[i].Cells[1].Value.ToString()),
                //        b_Quantity = Convert.ToInt32(dgv_Billing.Rows[i].Cells[2].Value.ToString()),
                //        b_Amount = Convert.ToDouble(dgv_Billing.Rows[i].Cells[3].Value.ToString())
                //    };
                //    lst.Add(reportprint);
                //}
                //rs.Name = "DataSet1";
                //rs.Value = lst;
                //using (frmPrint frm = new frmPrint(receiptBindingSource.DataSource as List<Receipt>, lbl_billID.Text.ToString(), txt_cusID.Text.ToString(), txt_cName.Text.ToString(), cmb_cashOnline.Text.ToString(), txt_Total.Text.ToString(), txt_GST.Text.ToString(), txt_Final.Text.ToString()))
                //{
                //    frm.rpt_reportViewer.LocalReport.DataSources.Clear();
                //    frm.rpt_reportViewer.LocalReport.DataSources.Add(rs);
                //    frm.rpt_reportViewer.LocalReport.ReportEmbeddedResource = "Bakery.rptReport.rdlc";
                //    frm.ShowDialog();
                //}
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void txt_searchBox_TextChanged(object sender, EventArgs e)
        {
            try
            {
                qry = @"sp_fetchCustomerNM " + txt_searchBox.Text.ToString() + "";

                DataTable dt = MainClass.GetData(qry);

                if (txt_searchBox.Text.Length == 0)
                {
                    txt_cusID.Text = string.Empty;
                    txt_cName.Text = string.Empty;
                    txt_cMNo.Text = string.Empty;
                }
                else
                {
                    txt_cusID.Text = dt.Rows[0][0].ToString();
                    txt_cName.Text = dt.Rows[0][1].ToString();
                    txt_cMNo.Text = dt.Rows[0][2].ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void dgv_Billing_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Visible = false;
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Visible = false;
            }
        }
    }
}