using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebForm
{
  public partial class AddUser : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
      if (!Page.IsValid)
        return;

      string userName = txtUserName.Text.Trim();
      int userNo;

      if (!int.TryParse(txtUserNo.Text.Trim(), out userNo))
      {
         ShowMessage("User No must be valid integer", isSuccess: false);
      }

      try
      {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        using (SqlConnection conn = new SqlConnection(connectionString))
        using (SqlCommand cmd = new SqlCommand("usp_tbUser_Inser", conn))
        {
          cmd.CommandType = CommandType.StoredProcedure;
          cmd.Parameters.Add("@UserName", SqlDbType.Varchar, 20).Value = userName;
          cmd.Parameters.Add("@UserNo", SqlDbType.Int).Value = userNo;

          conn.Open()
          object result = cmd.ExecuteScalar();
          long newUserID = Convert.ToInt64(result)

          ClearForm();
          ShowMEssage($"User added succesfully. New UserID: {newUserID}", isSuccess: true);
        }
      }
      catch (SqlException ex)
      {
        ShowMessage($"Database Error: {ex.Message}", isSuccess: false);
      }
      catch (Exception ex)
      {
        ShowMessage($"Unexpected error: {ex.Message}", isSuccess: false);
      }
    }

    private void ClearForm()
    {
      txtUserName.Text = string.Empty;
      txtUserNo.Text = string.Empty;
    }

    private void ShowMessage(string message, bool isSuccess)
    {
      lblMessage.Text   = message;
      string cssClass   = isSuccess ? "message success" : "message error";
      pnlMessage.CssClass = cssClass;
      pnlMessage.Style["display"] = "block";
    }
  }
}
