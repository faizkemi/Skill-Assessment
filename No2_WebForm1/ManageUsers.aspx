<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="WebForm.ManageUsers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8" />
   <title>Manage Users</title>
   <style>
       body {
          font-family: Arial, sans-serif;
          background-color: #2f4f4f4;
          padding: 30px;
          margin: 0;
       }
      .page-container {
          max-width: 900px;
          margin: 0 auto;
          background-color: #ffffff;
          padding: 30px 36px;
          border-radius: 8px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.15);
       }
       .page-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          border-bottom: 2px solid #0078d4;
          padding-bottom: 12px;
          margin-bottom: 20px;
       }
       h2 {
          margin: 0;
          font-size: 20px;
          color: #333333;
       }
       .btn-add (
          padding: 8px 16px;
          background-color: #0078d4;
          color: #ffffff;
          border: none;
          border-radius: 4px;
          font-size: 13px;
          text-decoration: none;
          cursor: pointer;
       }
       .btn-add:hover { background-color: #005ea2;}

       /* Grid */
       .grid-table {
          width: 100%;
          border-collapse: collapse;
          font-size: 14px;
       }
      .grid-table th {
          background-color: #0078d4;
          color: #ffffff;
          padding: 10px 12px;
          text-align: left;
       }
       .grid-table td {
          padding: 9px 12px;
          border-bottom: 1px solid #e0e0e0;
          vertical-align: middle;
       }
       .grid-table tr:hover td { background-color: #f0f6ff; }
       .grid-table tr.edit-row td { background-color: #fffbe6; )

       /* Edit inputs inside grid /
       .grid-table input[type="text"],
       .grid-table input[type="number"] {
          width: 100%;
          padding: 5px 7px;
          border: 1px solid #aaa;
          border-radius: 3px;
          font-size: 13px;
          box-sizing: border-box;
       }          
       .grid-table input[type="text"]:focus,
       .grid-table input[type="number"]:focus {
          border-color: #0078d4;
          outline: none;
       }
       
       /* Action buttons */
       .btn-edit {
          padding: 4px 12px;
          background-color: #107c10:
          color: #fff;
          border: none;
          border-radius: 3px;
          cursor: pointer;
          font-size: 12px;
          margin-right: 4px;
       }
       .btn-edit:hover { background-color: #0b5e0b; }
       .btn-delete {
          padding: 4px 12px;
          background-color: #d93025;
          color: #fff;
          border: none;
          border-radius: 3px;
          cursor: pointer;
          font-size: 12px;
       }
       .btn-delete:hover { background-color: #a50e0e; }
       .btn-save {
          padding: 4px 12px;
          background-color: #0078d4;
          color: #fff;
          border: none;
          border-radius: 3px;
          cursor: pointer;
          font-size: 12px;
          margin-right: 4px;
       }
      .btn-save:hover {background-color: #005ea2; }
      .btn-cancel {
          padding: 4px 12px;
          background-color: #666;
          color: #fff;
          border: none;
          border-radius: 3px;
          cursor: pointer;
          font-size: 12px;
      }
      .btn-cancel:hover { background-color: #444: )

      /* Message */
      .message {
          padding: 10px 14px;
          border-radius: 4px;
          font-size: 13px;
          margin-bottom: 16px;
      }
      .message.success {
          background-color: #dff6dd;
          color: #1e6e1e;
          border: 1px solid #b2dfb2;
      }
      .message.error {
          background-color: #fde7e9;
          color: #a80000;
          border: 1px solid #f4b8bb;
      }
      .no-records {
          text-align: center;
          color: #888;
          padding: 20px;
      }
      .validator-msg (
          color: #d93025;
          font-size: 11px;
          display: block;
      }
   </style>
</head>
<body>
   <form id="fraManageUsers" runat="server">
      <div class="page-container">
         <div class="page-header">
            <h2>Manage Users</h2>
            <a href="AddUser.aspx" class="btn-add">+ Add New User</a>
         </div>

         <asp: Panel ID="pnlMessage" runat="server" Visible="false">
            <asp:Label ID="lblMessage" runat="server" />
         </asp:Panel>

         <asp:GridView ID="gvUsers" runat="server"
            AutoGenerateColumns="false"
            CssClass="grid-table"
            DataKeyNames="UserID"
            OnRowEditing="gvUsers_RowEditing"
            OnRowCancelingEdit="gvUsers RowCancelingEdit"
            OnRowUpdating="gvUsers RowUpdating"
            OnRowDeleting="gvUsers RowDeleting"
            Empty DataText="&lt;p class='no-records'&gt;No records found.$lt;/p&gt;">

            <Columns>
               <asp:BoundField DataField="UserID" HeaderText-"User ID" ReadOnly="true" />

               <asp:TemplateField HeaderText="User Name">
                   <ItemTemplate>
                      <asp:Label ID="lblUserName" runat="server" Text='<%#  Eval("UserName") %>' />                
                   </ItemTemplate>
                   <EditItemTemplate>
                      <asp:TextBox ID="txtEditUserName" runat ="server" Text='<%#  Eval("UserName") %>' Maxlength="20" /> 
                      <asp:RequiredFieldValidator runat="server"
                         ControlToValidate="txtEditUserName"
                         ErrorMessage "Required."
                         CasClass="validator-mag"
                         Display "Dynamic"
                         ValidationGroup "EditGroup" />
                   </EditItemTemplate>
               </asp:TemplateField>

               <asp:Templatefield HeaderText="User No">
                   <ItemTemplate>
                      <asp:Label ID="lblUserNo" runat="server" Text='<%#  Eval("UserN0") %>' />                
                   </ItemTemplate>
                   <EditItemTemplate>
                      <asp:TextBox ID="txtEditUserNo" runat="server" Text='<%#  Eval("UserNo") %>' />
                      <asp:RequiredFieldValidator runat="server"
                         ControlToValidate="txtEditUserNo"
                         ErrorMessage="Required."
                         CasClass="validator-msg"
                         Display "Dynamic"
                         ValidationGroup="EditGroup" />
                      <asp: RangeValidator runat="server"
                         ControlToValidate="txtEditUserNo"
                         Type "Integer"
                         MinimumValue="-2147483648"
                         MaximumValue="2147483647"
                         ErrorMessage "Must be a valid integer."
                         CssClass="validator-msg"
                         Display "Dynamic"
                         ValidationGroup="EditGroup" />
                   </EditItemTemplate>
               </asp:TemplateField>
            
               <asp:BoundField DataField="CreateDate" HeaderText="Create Date"
                   ReadOnly="true" DataFormatString="{0: yyyy-MM-dd HH:mm:ss)" />
               <asp:TemplateField HeaderText="Actions">
                   <ItemTemplate>
                      <asp:LinkButton ID="btnEdit" runat="server"
                         CommandName="Edit"
                         CssClass="btn-edit"
                         Text "Edit" />
                      <asp:LinkButton ID="btnDelete" runat="server"
                         CommandName="Delete"
                         CssClass="btn-delete"
                         Text "Delete"
                         OnClientClick="return confirm('Delete this user?');" />
                   </ItemTemplate>
                   <EditItemTemplate>
                      <asp:LinkButton ID="btnSave" runat="server"
                         CommandName="Update"
                         CssClass="btn-save"
                         Text="Save"
                         ValidationGroup "EditGroup" />
                      <asp:LinkButton ID="btnCancel" runat="server"
                         CommandName="Cancel"
                         CssClass="btn-cancel"
                         Text "Cancel"
                         CausesValidation="false" />
                   </EditItemTemplate>
               </asp:TemplateField>
            </Columns>
         </asp:GridView>
      </div>
   </form>
</body>
</html>
