using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace customerProfile
{
    public partial class RuleManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

     
        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            FormView1.Visible = false;
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            FormView1.Visible = false;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            FormView1.Visible = true;
        }
    }
}