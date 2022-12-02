using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ruralCompany
{
    public partial class Home : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["rC"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string action = "";
        int userId, serviceId, serviceProviderId;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
                Response.Redirect("CustLogin.aspx");
            else
                bindGridView("NoFilter", con);
            
        }

        void bindGridView(string action, SqlConnection con)
        {
            using (con)
            using (SqlCommand cmd = new SqlCommand("servicesGrid", con))
            {
                cmd.CommandText = "servicesGrid";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", action);
                cmd.Parameters.AddWithValue("@service", DropDownList_Service.SelectedValue);
                cmd.Parameters.AddWithValue("@city", TextBox_FilterBy.Text);
                cmd.Parameters.AddWithValue("@name", TextBox_FilterBy.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                DataTable data = new DataTable();
                sda.Fill(data);
                GridView_SearchResults.DataSource = data;
                GridView_SearchResults.DataBind();
            }
            
        }


        protected void Button_Search_Click(object sender, EventArgs e)
        {
            SqlConnection con3 = new SqlConnection(cs);
            if (DropDownList_Service.SelectedIndex != 0)
            {
                if (DropDownList_FilterBy.SelectedValue == "1")
                {
                    if (TextBox_FilterBy.Text != string.Empty)
                    {
                        bindGridView("FilterByServiceAndName", con3);
                    }
                    else
                    {
                        bindGridView(action = "FilterByService", con3);
                    }
                }
                else if (DropDownList_FilterBy.SelectedValue == "2")
                {
                    if (TextBox_FilterBy.Text != string.Empty)
                    {
                        bindGridView(action = "FilterByServiceAndCity", con3);
                    }
                    else
                    {
                        bindGridView(action = "FilterByService", con3);
                    }
                }
                else
                {
                    bindGridView(action = "FilterByService", con3);
                }
            }

            else if(DropDownList_Service.SelectedIndex == 0)
            {
                if (DropDownList_FilterBy.SelectedValue == "1")
                {
                    if (TextBox_FilterBy.Text != string.Empty)
                    {
                        bindGridView(action = "FilterByName", con3);
                    }
                    else
                    {
                        bindGridView(action = "NoFilter", con3);
                    }
                }
                else
                {
                    if (TextBox_FilterBy.Text != string.Empty)
                    {
                        bindGridView(action = "FilterByCity", con3);
                    }
                    else
                    {
                        bindGridView(action = "NoFilter", con3);
                    }
                }
            }
        }

       

        protected void Button_Steps_Click(object sender, EventArgs e)
        {
            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
        }

        protected void GridView_SearchResults_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label_Name.Text = GridView_SearchResults.SelectedRow.Cells[1].Text;
            Label_Serv.Text = GridView_SearchResults.SelectedRow.Cells[3].Text;
            


        }

        int getIds(string action)
        {
            using(SqlConnection con1 = new SqlConnection(cs))
            using(SqlCommand cmd = new SqlCommand("getIdsForBooking", con1))
            {
                cmd.CommandText = "getIdsForBooking";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", action);
                cmd.Parameters.AddWithValue("@email", Session["email"]);
                cmd.Parameters.AddWithValue("@serviceName", Label_Serv.Text);
                cmd.Parameters.AddWithValue("@serviceProviderName", Label_Name.Text);
                cmd.Parameters.AddWithValue("@serviceProviderEmail", "");
                con1.Open();
                int id = Convert.ToInt32(cmd.ExecuteScalar());
                
                return id;
            }
            
        }

        protected void Button_Book_Click(object sender, EventArgs e)
        {
            serviceId = getIds(action = "GetServiceId");
            userId = getIds(action = "GetUserId");
            serviceProviderId = getIds(action = "GetServiceProviderId");

            using (SqlConnection con2 = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("bookingscrud", con2))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "Insert");
                cmd.Parameters.AddWithValue("@serviceId", serviceId);
                cmd.Parameters.AddWithValue("@userId", userId);
                cmd.Parameters.AddWithValue("@serviceProviderId", serviceProviderId);
                cmd.Parameters.AddWithValue("@description", Request.Form["TextArea_Description"]);
                cmd.Parameters.AddWithValue("@status", "");
                cmd.Parameters.AddWithValue("@dateTime", "");
                con2.Open();
                cmd.ExecuteNonQuery();
                
                Response.Write("Booking added successfully!!");
            }
                
        }
    }
}