using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace customerProfile
{
    public partial class ControlAddRule : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["IVRCPRConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand com = new SqlCommand();
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "AddRule";
            com.Connection = con;
            com.Parameters.AddWithValue("@RuleRank", txtRank.Text);
            com.Parameters.AddWithValue("@POSCode", ddlPOS.SelectedValue);
            com.Parameters.AddWithValue("@RuleLabel", txtRule.Text);
            com.Parameters.AddWithValue("@RuleDescription", txtDescrip.Text);
            com.Parameters.AddWithValue("@MetricName", ddlMetric.SelectedValue);
            com.Parameters.AddWithValue("@RuleOperatorName", ddlOp.SelectedValue);
            com.Parameters.AddWithValue("@MetricValue", txtValue.Text);
            com.Parameters.AddWithValue("@RuleStartDateTime", calStart.SelectedDate);
            com.Parameters.AddWithValue("@RuleEndDateTime", calEnd.SelectedDate);
            com.Parameters.AddWithValue("@MenuTemplateName", ddlMenu.SelectedValue);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();

            Response.Redirect(Request.Url.AbsoluteUri);

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}