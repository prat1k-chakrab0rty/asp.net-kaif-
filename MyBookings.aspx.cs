using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace ruralCompany
{
    public partial class MyBookings : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["rC"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
                Response.Redirect("CustLogin.aspx");
            else
                bindGridView();
        }

        void bindGridView()
        {
            using(con)
            using (SqlCommand cmd = new SqlCommand("myBookings", con))
            {
                cmd.CommandText = "myBookings";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", Session["email"]);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                DataTable data = new DataTable();
                sda.Fill(data);
                GridView_MyBookings.DataSource = data;
                GridView_MyBookings.DataBind();
            }
            
        }
        protected void GridView_MyBookings_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_MyBookings.PageIndex = e.NewPageIndex;
            GridView_MyBookings.DataBind();
        }

        protected void GridView_MyBookings_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label_DateTime.Text = GridView_MyBookings.SelectedRow.Cells[3].Text;
            Label_Rating.Visible = DropDownList_Rating.Visible = Label_Comments.Visible =
                        TextBox_Comments.Visible = Button_Submit.Visible = true;
        }

        int getBookingId()
        {
            using (SqlConnection con4 = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("select bookingid from bookings where dateTime ='" + Label_DateTime.Text + "'", con4))
            {
                con4.Open();
                int id = Convert.ToInt32(cmd.ExecuteScalar());
                return id;
            }
        }

        protected void Button_Submit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con1 = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("reviewsproc", con1))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "ProviderReview");
                cmd.Parameters.AddWithValue("@bookingId", getBookingId());
                cmd.Parameters.AddWithValue("@seekerRating", "" );
                cmd.Parameters.AddWithValue("@seekerReview", "");
                cmd.Parameters.AddWithValue("@providerRating", DropDownList_Rating.SelectedValue);
                cmd.Parameters.AddWithValue("@providerReview", TextBox_Comments.Text);
                con1.Open();
                cmd.ExecuteNonQuery();

                Response.Write("Review updated successfully!!");
            }
        }
    }
}