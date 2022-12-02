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
    public partial class ManageServices_ServPro : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["rC"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string action, serviceName;
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
            using (SqlCommand cmd = new SqlCommand("manageServices_ServPro", con))
            {
                cmd.CommandText = "manageServices_ServPro";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", getIds(action = "GetUserId", ""));
                SqlDataAdapter sda = new SqlDataAdapter(cmd);

                DataTable data = new DataTable();
                sda.Fill(data);
                GridView_ManageServices.DataSource = data;
                GridView_ManageServices.DataBind();
            }
        }
        int getIds(string action, string serviceName)
        {
            using (SqlConnection con1 = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("getIdsForBooking", con1))
            {
                cmd.CommandText = "getIdsForBooking";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", action);
                cmd.Parameters.AddWithValue("@email", Session["email"]);
                cmd.Parameters.AddWithValue("@serviceName", serviceName);
                cmd.Parameters.AddWithValue("@serviceProviderName", "");
                cmd.Parameters.AddWithValue("@serviceProviderEmail", "");
                con1.Open();
                int id = Convert.ToInt32(cmd.ExecuteScalar());

                return id;
            }
        }
        protected void Button_AddService_Click(object sender, EventArgs e)
        {
            using (SqlConnection con2 = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("serviceProvidercrud", con2))
            {
                cmd.CommandText = "serviceProvidercrud";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", "");
                cmd.Parameters.AddWithValue("@serviceId", getIds(action = "GetServiceId", serviceName = DropDownList_Service.SelectedValue));
                cmd.Parameters.AddWithValue("@userId", getIds(action = "GetUserId", serviceName = DropDownList_Service.SelectedValue));
                cmd.Parameters.AddWithValue("@servProStatus", DropDownList_Status.SelectedValue);
                cmd.Parameters.AddWithValue("@rating", "");
                cmd.Parameters.AddWithValue("@action", "Insert");
                con2.Open();
                cmd.ExecuteNonQuery();
                Response.Write("Service added successfully.");
                bindGridView(con2);
            }
            
        }

        protected void GridView_ManageServices_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label_ServName.Text = GridView_ManageServices.SelectedRow.Cells[1].Text;
        }

        protected void Button_ChangeStatus_Click(object sender, EventArgs e)
        {
            using (SqlConnection con4 = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("serviceProvidercrud", con4))
            {
                cmd.CommandText = "serviceProvidercrud";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", "");
                cmd.Parameters.AddWithValue("@serviceId", getIds(action = "GetServiceId", Label_ServName.Text));
                cmd.Parameters.AddWithValue("@userId", getIds(action = "GetUserId", Label_ServName.Text));
                cmd.Parameters.AddWithValue("@servProStatus", "");
                cmd.Parameters.AddWithValue("@rating", "");
                cmd.Parameters.AddWithValue("@action", "UpdateStatus");
                con4.Open();
                cmd.ExecuteNonQuery();
                Response.Write("Status changed successfully.");
                bindGridView(con4);
            }
        }

        protected void Button_DeleteService_Click(object sender, EventArgs e)
        {
            using (SqlConnection con3 = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand("serviceProvidercrud", con3))
            {
                cmd.CommandText = "serviceProvidercrud";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", "");
                cmd.Parameters.AddWithValue("@serviceId", getIds(action = "GetServiceId", Label_ServName.Text));
                cmd.Parameters.AddWithValue("@userId", getIds(action = "GetUserId", Label_ServName.Text));
                cmd.Parameters.AddWithValue("@servProStatus", "");
                cmd.Parameters.AddWithValue("@rating", "");
                cmd.Parameters.AddWithValue("@action", "Delete");
                con3.Open();
                cmd.ExecuteNonQuery();
                Response.Write("Service deleted successfully.");
                bindGridView(con3);
            }
        }
    }
}