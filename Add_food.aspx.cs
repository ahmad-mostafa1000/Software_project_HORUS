using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{

    public partial class Add_food : System.Web.UI.Page
    {
        Controller controller;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_addmeal_Click(object sender, EventArgs e)
        {
            controller = new Controller();

            if (TextBox1_food.Text == "" || TextBox2price.Text == "" || TextBox3time.Text == "")
            {
                feedback.Text = "PLEASE, MAKE SURE YOU ENTERED ALL VALUES RIGHT";
            }
            else
            {
                feedback.Text = "";

                int r = controller.add_meal(TextBox1_food.Text, Convert.ToSingle(TextBox2price.Text), Convert.ToSingle(TextBox3time.Text));//????????????

                if (r != 0)
                {
                    feedback.Text = "DONE";
                }
                else
                {
                    feedback.Text = "Contact Your DBMS Manager";
                }
            }
        }
    }
}