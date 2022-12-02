using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace ruralCompany
{
    public partial class CustLogin : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["rC"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        int serviceProviderId;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["email"] = null; 

        }

        private string Encrypt(string clearText)
        {
            string encryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(encryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        int getServiceProviderId()
        {
            int id;
            using (SqlConnection con1 = new SqlConnection(cs))
            using (SqlCommand cmd1 = new SqlCommand("getIdsForBooking", con1)){
                
                cmd1.CommandText = "getIdsForBooking";
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@action", "GetServiceProviderIdUsingEmail");
                cmd1.Parameters.AddWithValue("@email", "");
                cmd1.Parameters.AddWithValue("@serviceName", "");
                cmd1.Parameters.AddWithValue("@serviceProviderName", "");
                cmd1.Parameters.AddWithValue("@serviceProviderEmail", Session["email"]);
                con1.Open();
                id = Convert.ToInt32(cmd1.ExecuteScalar());
                return id;
            }
            
            
        }

        protected void login_Click(object sender, EventArgs e)
        {
            
            string query = "select roleId from users where email='" + TextBox_un.Text + "' and password='" + Encrypt(TextBox_pass.Text) + "'";
            using(con)
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        var role = (int)dr[0];
                        if (role == 2)
                        {
                            Session["email"] = TextBox_un.Text;
                            Response.Redirect("Home.aspx");
                        }
                        else if (role == 3)
                        {
                            Session["email"] = TextBox_un.Text;
                            Session["role"] = "Provider";
                            serviceProviderId = getServiceProviderId();
                            Session["servProId"] = serviceProviderId;
                            Response.Redirect("Home_ServPro.aspx");
                        }
                    }
                }
                else
                {
                    Label1.Text = "Invalid username and/or password!!";
                    Label1.Visible = true;
                }
                dr.Close();
            }
            
            
        }
    }
}