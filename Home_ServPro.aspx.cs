using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ruralCompany
{
    public partial class Home_ServPro : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["rC"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        int bookid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
                Response.Redirect("CustLogin.aspx");
            if (Convert.ToString(Session["role"]) != "Provider")
                Response.Redirect("Home.aspx");
            else
                bindGridView(con);
        }
        void bindGridView(SqlConnection con)
        {
            using (con)
            using (SqlCommand cmd = new SqlCommand("bookingsGrid_ServPro", con))
            {
                cmd.CommandText = "bookingsGrid_ServPro";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@serviceProviderId", Session["servProId"]);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                DataTable data = new DataTable();
                sda.Fill(data);
                GridView_MyBookings.DataSource = data;
                GridView_MyBookings.DataBind();
            }

        }

        protected void GridView_MyBookings_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label_DateTime.Text = GridView_MyBookings.SelectedRow.Cells[9].Text;
        }

        protected void Button_Accept_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con1 = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand("bookingscrud", con1))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@action", "UpdateStatus");
                    cmd.Parameters.AddWithValue("@serviceId", "");
                    cmd.Parameters.AddWithValue("@userId", "");
                    cmd.Parameters.AddWithValue("@serviceProviderId", "");
                    cmd.Parameters.AddWithValue("@description", "");
                    cmd.Parameters.AddWithValue("@status", 'A');
                    cmd.Parameters.AddWithValue("@dateTime", Label_DateTime.Text);
                    con1.Open();
                    cmd.ExecuteNonQuery();

                    Response.Write("Status updated successfully!!");
                    bindGridView(con1);
                }
            }
            finally
            {

            }
        }

        protected void Button_Completed_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con2 = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand("bookingscrud", con2))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@action", "UpdateStatus");
                    cmd.Parameters.AddWithValue("@serviceId", "");
                    cmd.Parameters.AddWithValue("@userId", "");
                    cmd.Parameters.AddWithValue("@serviceProviderId", "");
                    cmd.Parameters.AddWithValue("@description", "");
                    cmd.Parameters.AddWithValue("@status", 'C');
                    cmd.Parameters.AddWithValue("@dateTime", Label_DateTime.Text);
                    con2.Open();
                    cmd.ExecuteNonQuery();

                    Response.Write("Status updated successfully!!");
                    bindGridView(con2);
                    Label_Rating.Visible = DropDownList_Rating.Visible = Label_Comments.Visible =
                        TextBox_Comments.Visible = Button_Submit.Visible = true;
                }
            }
            finally
            {

            }
        }

        protected void Button_Reject_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con3 = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand("bookingscrud", con3))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@action", "UpdateStatus");
                    cmd.Parameters.AddWithValue("@serviceId", "");
                    cmd.Parameters.AddWithValue("@userId", "");
                    cmd.Parameters.AddWithValue("@serviceProviderId", "");
                    cmd.Parameters.AddWithValue("@description", "");
                    cmd.Parameters.AddWithValue("@status", 'R');
                    cmd.Parameters.AddWithValue("@dateTime", Label_DateTime.Text);
                    con3.Open();
                    cmd.ExecuteNonQuery();

                    Response.Write("Status updated successfully!!");
                    bindGridView(con3);
                }
            }
            finally
            {

            }
        }

        int getBookingId()
        {
            using (SqlConnection con4 = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("select bookingid from bookings where dateTime ='" + Label_DateTime.Text+"'", con4))
            {
                con4.Open();
                bookid = Convert.ToInt32(cmd.ExecuteScalar());
                return bookid;
            }
        }

        protected void Button_Submit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con4 = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("reviewsproc", con4))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "SeekerReview");
                cmd.Parameters.AddWithValue("@bookingId", getBookingId());
                cmd.Parameters.AddWithValue("@seekerRating", DropDownList_Rating.SelectedValue);
                cmd.Parameters.AddWithValue("@seekerReview", TextBox_Comments.Text);
                cmd.Parameters.AddWithValue("@providerRating", "");
                cmd.Parameters.AddWithValue("@providerReview", "");
                con4.Open();
                cmd.ExecuteNonQuery();
                
                Response.Write("Review updated successfully!!");
            }
        }
    }
}