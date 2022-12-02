using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.IO;
using System.Text;

namespace ruralCompany
{
    public partial class Register : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["rC"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void submit_onclick(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("userscrud", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "insert");
            cmd.Parameters.AddWithValue("@name", TextBox_name.Text);
            cmd.Parameters.AddWithValue("@email", TextBox_email.Text);
            cmd.Parameters.AddWithValue("@mobile", TextBox_mobile.Text);
            cmd.Parameters.AddWithValue("@address", TextBox_address.Text);
            cmd.Parameters.AddWithValue("@zipcode", TextBox_zipcode.Text);
            cmd.Parameters.AddWithValue("@city", TextBox_city.Text);
            cmd.Parameters.AddWithValue("@locality", TextBox_locality.Text);
            cmd.Parameters.AddWithValue("@password", Encrypt(TextBox_password.Text));
            if (DropDownList_role.SelectedValue == "Seeker")
                cmd.Parameters.AddWithValue("@roleId", 2);
            else
                cmd.Parameters.AddWithValue("@roleId", 3);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}