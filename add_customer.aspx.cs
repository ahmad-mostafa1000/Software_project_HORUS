using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class add_customer : System.Web.UI.Page
    {
        Controller controller;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertCustomer_Click(object sender, EventArgs e)
        {
            controller = new Controller();

            if (UserName.Text == ""  || TextBox_Address.Text == "" || TextBox_Phone.Text == "")
            {
                FeedBack.Text = "PLEASE, MAKE SURE YOU ENTERED ALL VALUES RIGHT";
            }
            else
            {
                FeedBack.Text = "";
                string date =  Calendar1.SelectedDate.ToString("dd/MM/yyyy");

                int r = controller.Insert_Customer(UserName.Text, DropDownList_Gender.Text, date, TextBox_Address.Text, Convert.ToInt32(TextBox_Phone.Text));//????????????

                //case lw mfeesh 7aga d5lt mn el user
                if (r != 0)
                {
                    FeedBack.Text = "DONE";
                    //Working=false
                }
                else
                {
                    FeedBack.Text = "Contact Your DBMS Manager";
                }
            }
        }

        protected void DropDownList_Gender_CallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {

        }
    }
}