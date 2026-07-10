using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebForm
{
  public partial class ManageUsers : System.Web.UI.Page
  {
      private string ConnectionString =>
         ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

      // Page Load
      protected void Page_Load(object sender, EventArgs e)
      {
         if (!IsPostBack)
            LoadUsers();
      }

      // Load all users into GridView
      private void LoadUsers()
      {
         try
         {
            DataTable dt = new DataTabel();

            using (SqlConnection conn = New SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand("usp_tbUser_Select", conn))
            {
               cmd.CommandType = CommandType.StoredProcedure;
               SqlAdapter adpter = new SqlDataAdapter(cmd);
               adapter.Fill(dt)
            }
            gvUsers.DataSource = dt;
            gvUsers.DataBind();
         }
         catch (SqlException ex)
         {
            ShowMessage($"Failed to load users: {ex.NMessage}", isSuccess: false);
         }
      }

      // Enter edit mode
      protected void gvUsers_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
      {
         gvUsers.EditIndex = e.NewEditIndex
         pnlMessage.Visible = false
         LoadUsers();
      }

      // Cancel edit mode
      protected void gvUsers_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
      {
         gvUsers.EditIndex = -1
         pnlMessage.Visible = false
         LoadUsers();
      }

      // Save edit - usp_tbUser_Update
      protected void gvUsers_RowUpdating(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
      {
          if (Page.IsValid)
             return;
          
          long userID = Convert.ToInt64(gvUsers.DataKeys[e.RowIndex].Value);
          
          System.Web.UI.WebControls.TextBox txtUserName = (System.Web.UI.WebControls.TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtEditUserName");
          System.Web.UI.WebControls.TextBox txtUserNo = (System.Web.UI.WebControls.TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtEditUserNot");
          
          if (txtUserName null || txtUserNo null)
             return;
             
          string newUserName txtUserName.Text.Trim();
          int newUserNo:
          
          if (!int.TryParse(txtUserNo.Text.Trim(), out newUserNo))
          {
             ShowMessage("User No must be valid integer.", isSuccess: false);
             return;
          }
          
          try
          {
             using (SqlConnection conn new SqlConnection (ConnectionString))
             using (SqlCommand and new SqlCommand("usp_tbUser_Update", conn))
             {
                cmd.CommandType CommandType.Stored Procedure;
                cmd.Parameters.Add("@UserID",   SqlDbType.BigInt).Value = userID;
                cmd.Parameters.Add("@UserName", SqlDbType.VarChar, 20).Value = newUserName;
                cmd.Parameters.Add("@UserNo",   SqlDbType. Int).Value = newUserNo;
                
                conn.Open();
                int affected = Convert.ToInt32(cmd.ExecuteScalar());
                gvUsers.EditIndex = -1;
                LoadUsers();
                
                string msg = affected > 0
                    ? $"UserID (userID) updated successfully." : "No record found for UserID (userID)";
                    ShowMessage(msg, iSSuccess: affected > 0)
             }
             catch (SqlException ex)
             {
                 ShowMessage($"Update failed: {ex.Message}", isSuccess: false);
             }
          }
      }

      // Delete row - usp_tbUser_Delete
      protected void gvUsers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
      {
         long userID = Convert.ToInt64(gvUsers.DataKeys[e.RowIndex].Value);

         try
          {
             using (SqlConnection conn new SqlConnection (ConnectionString))
             using (SqlCommand and new SqlCommand("usp_tbUser_Delete", conn))
             {
                cmd.CommandType CommandType.Stored Procedure;
                cmd.Parameters.Add("@UserID",   SqlDbType.BigInt).Value = userID;

                conn.Open();
                int affected = Convert.ToInt32(cmd.ExecuteScalar());
                gvUsers.EditIndex = -1;
                LoadUsers();
                
                string msg = affected > 0
                    ? $"UserID (userID) updated successfully." : "No record found for UserID (userID)";
                    ShowMessage(msg, iSSuccess: affected > 0)
             }
             catch (SqlException ex)
             {
                 ShowMessage($"Delete failed: {ex.Message}", isSuccess: false);
             }
             
          }
      }

      private void ShowMessage(string message, bool isSuccess)
      {
        lblMessage.Text = message;
        pnlMessage.CssClass = isSuccess ? "message success" : "message error";
        pnlMessage.Visible = true;
      }
  }
}
