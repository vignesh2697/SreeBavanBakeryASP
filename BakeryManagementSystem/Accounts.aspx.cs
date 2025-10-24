using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Bakery
{
    public partial class Accounts : System.Web.UI.Page
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
                qry = @"sp_fetchBill";
                MainClass.LoadData(qry, dgv_billList);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void dgv_billList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgv_billList.PageIndex = e.NewPageIndex;
            LoadData();
        }

        protected void dgv_billList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string script = "$('#mymodal').modal('show');";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);

                var id = Convert.ToInt32(ViewState["Id"]);
                var cname = dgv_billList.SelectedRow.Cells[3].Text;
                var date = dgv_billList.SelectedRow.Cells[4].Text;
                var amt = dgv_billList.SelectedRow.Cells[5].Text;
                var pm = dgv_billList.SelectedRow.Cells[6].Text;

                lbl_BillID.Text = id.ToString();
                lbl_PurDate.Text = date.ToString();
                lbl_CusName.Text = cname;
                lbl_TotAmt.Text = amt;
                lbl_PayMode.Text = pm;

                qry = @"sp_fetchBillDetail " + id + "";

                DataTable dt = MainClass.GetData(qry);
                dgv_billDetail.DataSource = dt;
                dgv_billDetail.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void dgv_billList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                ViewState["Id"] = dgv_billList.DataKeys[rowIndex].Values[0];
            }
        }
    }
}