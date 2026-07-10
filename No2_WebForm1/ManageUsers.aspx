<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="WebForm.ManageUsers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8" />
   <title>Add New User</title>
   <style>
       body {
          font-family: Arial, sans-serif;
          background-color: #2f4f4f4;
          display: flex;
          justify-content: center;
          align-items: center;
          min-height: 100vh;
          margin: 0;
       }
      .form-container {
          background-color: #ffffff;
          padding: 36px 40px;
          border-radius: 8px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.15);
          width: 380px;
       }
       h2 {
          margin: 0 0 24px 0;
          font-size: 20px;
          color: #333333;
          border-bottom: 2px solid #0078d4;
          padding-bottom: 10px;
       }
       .form-group {  
          margin-bottom: 18px;
       }
       label {
          display: block;
          font-size: 13px;
          font-weight: bold;
          color: #555555;
          margin-bottom: 5px;
       }
       .required {
          color: #d93025;
          margin-left: 2px;
       }
       input[type="text"],
       input[type="number"] {
          width: 100%;
          padding: 8px 10px;
          border: 1px solid #cccccc;
          border-radius: 4px;
          font-size: 14px;
          box-sizing: border-box;
          transition: border-color 0.2s;
       }
       input[type="text"]:focus,
       input[type="number"]:focus {
          border-color: #0078d4;
          outline: none;
       }
       .validator-msg {
          color: #d93025;
          font-size: 12px;
          margin-top: 4px;
          display: block;
       }
       .btn-submit {
          width: 100%;
          padding: 10px;
          background-color: #0078d4;
          color: #ffffff;
          border: none;
          border-radius: 4px;
          font-size: 15px;
          cursor: pointer;
          margin-top: 8px;
       }
       .btn-submit:hover {
          background-color: #005ea2;
       }          
       message {
          margin-top: 16px;
          padding: 10px 12px;
          border-radius: 4px;
          font-size: 13px;
          display: none;
       }
       .message.success {
          background-color: #dff6dd;
          color: #1efe1e;
          border: 1px solid #b2dfb2;
       }
       .message.error {
          background-color: #fde7e9;
          color: #a80000;
          border: 1px solid #f4b8bb;
       }
      .nav-link {
          display: block;
          text-align: center;
          margin-top: 16px;
          font-size: 13px;
          color: #0078d4;
          text-decoration: none;
      }
      .nav-link:hover { text-decoration: underline; }
   </style>
</head>
<body>
   <form id="fraAddüser" runat="server">
      <div class="form-container">
         <h2>Add New User</h2>
         
         <div class="form-group">
             <label for "tatllanrilame">User Name <span class="required">*</span></label>
             <asp:TextBox ID="txtUserName" runat="server" MaxLength 20" CeeClass"/>
             <asp:RequiredFieldValidator
                ID-"rfvUserName" runat="server"
                ControlToValidate="txtUseriiame"
                ErrorMessage "User Name is required."
                CanCiana validator-mag"
                Display "Dynamic"/>
             <asp:RegularExpressionValidator
                ID-"revUserName" runat="server"
                ControlToValidate="txtUserName"
                ValidationExpression" [^\),(0,19)$"
                ErrorMessage "User Name must not exceed 20 characters."
                CssClaas validator-mag"
                Display "Dynamic" />
         </div>

         <div class="form-group">
             <label for="txtUserNo">User No <span class="required">*</span></label>
             <asp:TextBox ID="txtUserNo" runat="server" />
             <asp:RequiredFieldValidator
                ID="rfvUserNo" runat="server"
                ControlToValidate="txtUserNo"
                ErrorMessage "User No is required."
                CssClass="validator-msg"
                Display "Dynamic" />
             <asp: RangeValidator
                ID="rvUserNo" runat="server"
                ControlToValidate="txtUserNo"
                Type "Integer"
                MinimumValue="-2147483648"
                MaximumValue="2147483647"
                ErrorMessage "User No must be a valid integer."
                CssClass="validator-msg"
                Display "Dynamic" />
         </div>

         <asp:Button ID="btnSubmit" runat="server" Text="Add User"
            CssClass="btn-submit" OnClick="btnSubmit Click" />
         
         <asp:Panel ID="pniMessage" runat="server" CssClass="message" style="display:none;">
            <asp:Label ID="lblMessage" runat="server" />
         </asp: Panel>
         <a href="ManageUsers.aspx" class="nav-link">View All Users &rsaquo;</a>
      </div>
   </form>
</body>
</html>
