using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class LOG_IN : System.Web.UI.Page
    {
        Controller controller;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void button_login_Click(object sender, EventArgs e)
        {
            if (textBox_username.Text == "" && textBox_pass.Text == "")
            {
                //  MessageBox.Show("Please enter username & password");
                feedback.Text = "Please enter username & password";
                return;
            }
            else if (textBox_username.Text == "")
            {

                feedback.Text = "Please enter username ";
                return;
            }
            else if (textBox_pass.Text == "")
            {

                feedback.Text = "Please enter password ";
                return;
            }
            
            controller = new Controller();
            DataTable usertable = controller.CheckUserPass(Convert.ToInt32(textBox_username.Text), textBox_pass.Text);
            string userType;
            if (usertable == null)
            {
                feedback.Text = "Password or Username isn't correct";
                return;
            }
            else
            {
                userType = (usertable.Rows[0][0]).ToString();
            }

            if (userType == "Admin")//Admin
            {
                Server.Transfer("Manager.aspx", true);
            }
            else if (userType == "Customer")
            {
                Server.Transfer("Customer.aspx", true);
            }
            else//chef 7aqer
            {
                //Server.Transfer("Manager.aspx", true);
            }
        }
    }
}