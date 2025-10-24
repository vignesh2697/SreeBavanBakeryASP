using Microsoft.Reporting.Map.WebForms.BingMaps;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;

namespace Bakery
{
    internal class MainClass
    {
        //Connection string
        public static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["bakeryConnection"].ConnectionString;
        public static SqlConnection con = new SqlConnection(ConnectionString);

        //User Validation

        public static DataTable GetDataER(string qry, Hashtable ht)
        {
            DataTable dt = null;
            try
            {
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.CommandType = CommandType.Text;
                foreach (DictionaryEntry item in ht)
                {
                    cmd.Parameters.AddWithValue(item.Key.ToString(), item.Value);
                }
                if (con.State == ConnectionState.Closed) { con.Open(); }
                dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (con.State == ConnectionState.Open) { con.Close(); }
            }
            catch (Exception)
            {
                //Response.Write(ex.Message);
                con.Close();
            }
            return dt;
        }

        //For Insert, Update, Delete

        public static int SQL(string qry, Hashtable ht)
        {
            int res = 0;
            try
            {
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.CommandType = CommandType.Text;

                foreach (DictionaryEntry item in ht)
                {
                    cmd.Parameters.AddWithValue(item.Key.ToString(), item.Value);
                }

                if (con.State == ConnectionState.Closed) { con.Open(); }
                res = cmd.ExecuteNonQuery();
                if (con.State == ConnectionState.Open) { con.Close(); }
            }
            catch (Exception)
            {
                //Response.Write(ex.Message);
                con.Close();
            }
            return res;
        }

        public static object GetScalarData(string qry, Hashtable ht)
        {
            object res = 0;
            try
            {
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.CommandType = CommandType.Text;

                foreach (DictionaryEntry item in ht)
                {
                    cmd.Parameters.AddWithValue(item.Key.ToString(), item.Value);
                }

                if (con.State == ConnectionState.Closed) { con.Open(); }
                res = cmd.ExecuteScalar();
                if (con.State == ConnectionState.Open) { con.Close(); }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
                con.Close();
            }
            return res;
        }

        //Get the datatable for edit

        public static DataTable GetData(string qry)
        {
            SqlCommand cmd = new SqlCommand(qry, con);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            return dt;
        }

        //Load Data into GridViewRow

        public static void LoadData(string qry, GridView gv)
        {
            gv.DataSource = GetData(qry);
            gv.DataBind();

            int count = 0;
            foreach (GridViewRow row in gv.Rows)
            {
                count++;
                row.Cells[1].Text = count.ToString();
            }
        }

        //Combobox fill

        public static void CBFill(string qry, DropDownList cb)
        {
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            cb.DataTextField = "name";
            cb.DataValueField = "id";
            cb.DataSource = dt;
            cb.DataBind();
            cb.SelectedIndex = -1;
        }

        //String Trim

        public static string stringTrim(TextBox txt)
        {
            string clearText = "";
            string maskedText = txt.Text;
            clearText = Regex.Replace(maskedText, @"\D", "");
            return clearText;
        }
    }
}