using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace customerProfile
{
    public partial class RulesManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            FormView1.Visible = true;
            Button1.Visible = false;
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            FormView1.Visible = false;
       
            GridView1.Visible = true;
            Button1.Visible = true;

        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            FormView1.Visible = false;

            GridView1.Visible = true;
            Button1.Visible = true;
            Response.Redirect(Request.Url.AbsoluteUri);

        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}