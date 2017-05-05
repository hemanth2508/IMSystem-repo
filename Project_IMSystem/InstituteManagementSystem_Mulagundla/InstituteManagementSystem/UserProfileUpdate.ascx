<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserProfileUpdate.ascx.cs" Inherits="UserProfileUpdate" %>
<script>
    function CheckConfirmPassword() {
        var textPassword = document.getElementById('<%=txtPassword.ClientID%>').value;
        var textConfirmPassword = document.getElementById('<%=txtConfirmPassword.ClientID%>').value;
        if (textPassword.trim() != "") {
            if (textConfirmPassword.trim() != textPassword.trim()) {
                alert("password is not matched");
                document.getElementById('<%=txtConfirmPassword.ClientID%>').focus();
            }
            
        }

    }
</script>
 <table>
           <tr>
               <td Class="DisplayTextStyle">First Name</td>
               <td>
                   <asp:TextBox ID="txtFName" runat="server" CssClass="TextBoxClass" Width="262px"></asp:TextBox>
<%--                           <asp:regularexpressionvalidator ID="Regularexpressionvalidator1" runat="server" errormessage="name is required" ControlToValidate="txtFName" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:regularexpressionvalidator>--%>

               </td>
           </tr>
            <tr>
               <td Class="DisplayTextStyle">Last Name</td>
               <td>
                   <asp:TextBox ID="txtLName" runat="server" CssClass="TextBoxClass" Width="262px"></asp:TextBox>
               </td>
           </tr>
           
           <tr>
               <td Class="DisplayTextStyle">Phone NUmber</td>
               <td>
                   <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="TextBoxClass" Width="262px"></asp:TextBox>
               </td>
           </tr>
      <tr>
               <td Class="DisplayTextStyle">Address</td>
               <td>
                   <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Height="49px" Width="262px" CssClass="TextBoxClass"></asp:TextBox>
               </td>
           </tr>
      <tr>
               <td Class="DisplayTextStyle">Security Question</td>
               <td>
                   <%--<asp:TextBox ID="txtSecurityQuestion" runat="server"></asp:TextBox>--%>
                   <asp:DropDownList ID="txtSecurityQuestion" runat="server" CssClass="TextBoxClass" Height="16px" Width="262px">
                        <asp:ListItem>Select Security Question</asp:ListItem>
                       <asp:ListItem>What is your first TV</asp:ListItem>
                       <asp:ListItem>What is your pet name</asp:ListItem>
                       <asp:ListItem>What is the first computer you own</asp:ListItem>
                       <asp:ListItem>Who is your best friend</asp:ListItem>
                       
                   </asp:DropDownList>
               </td>
           </tr>
        <tr>
               <td Class="DisplayTextStyle">Security Answer</td>
               <td>
                   <asp:TextBox ID="txtSecurityQuestionAnswer" runat="server" Width="262px" CssClass="TextBoxClass"></asp:TextBox>
               </td>
           </tr>

             <tr>
               <td Class="DisplayTextStyle">Qualification</td>
               <td>
                   <asp:TextBox ID="txtQualification" runat="server" CssClass="TextBoxClass" Width="262px"></asp:TextBox>
               </td>
           </tr>
            
                  <tr>
               <td Class="DisplayTextStyle">Password</td>
               <td>
                   <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="TextBoxClass" Width="262px"></asp:TextBox>
               </td>
           </tr>
                  <tr>
               <td Class="DisplayTextStyle">ConfirmPassword</td>
               <td>
                   <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="TextBoxClass" Width="262px" onblur="return CheckConfirmPassword();"></asp:TextBox>
               </td>
           </tr>
        <tr>
               <td Class="DisplayTextStyle">Comments</td>
               <td>
                   <asp:TextBox ID="txtComments" runat="server"  TextMode="MultiLine" Height="101px" Width="262px" CssClass="TextBoxClass"></asp:TextBox>
               </td>
           </tr>
       </table>
