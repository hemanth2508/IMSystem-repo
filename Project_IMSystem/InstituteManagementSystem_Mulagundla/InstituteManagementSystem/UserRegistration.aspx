<%@ Page Title="" Language="C#" MasterPageFile="~/InstituteMainMaster.master" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bodycorners" style="padding-left:4px">
                                       <table>
                                           <tr>
                                              <td>First name</td>
                                               <td >  
                                                   <asp:TextBox id="txtFName" placeholder="First name" class ="TextBoxClass" required="required"  runat="server"/>

                                               </td>
                                               <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First name is required" ControlToValidate="txtFName"></asp:RequiredFieldValidator> 
                                                       <asp:regularexpressionvalidator ID="Regularexpressionvalidator2" runat="server" errormessage="Please give me only alphabets" ControlToValidate="txtFName" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:regularexpressionvalidator> </td>

                                              
                                           </tr>
                                           <tr>
                                                <td>Last name</td>
                                              <td> <asp:TextBox id="txtLName" placeholder="Last name" class ="TextBoxClass" required="required" runat="server"/></td>
                                               <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name is required" ControlToValidate="txtLName"></asp:RequiredFieldValidator>
                                                                                                          <asp:regularexpressionvalidator ID="Regularexpressionvalidator3" runat="server" errormessage="Please give me only alphabets" ControlToValidate="txtLName" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:regularexpressionvalidator> </td>

                                               
                                           </tr>
                                           <tr>
                                                <td>Email Id</td>
                                              <td> <asp:TextBox id="txtEmailId" placeholder="Email Id; This will be your UserId" class ="TextBoxClass" required="required" runat="server"/></td>
                                               <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email Id is required" ControlToValidate="txtLName"></asp:RequiredFieldValidator> 
                                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtEmailId" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                               </td>

                                           </tr>
                                            <tr>
                                                 <td>Password</td>
                                              <td> <asp:TextBox id="txtPassword" placeholder="Password" class ="TextBoxClass" required="required" runat="server"/></td>
                                                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword"></asp:RequiredFieldValidator> </td>
                                           </tr>
                                            <tr>
                                                 <td>Confirm Password</td>
                                              <td><asp:TextBox id="txtConfirmPassword" placeholder="Confirm Password" class ="TextBoxClass" required="required" runat="server"/></td>
                                                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confirm Password is required" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator> 
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password and Confirm password should be matched" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator></td>
                                           </tr>
                                           
                                           <tr>
                                                <td>Qualification</td>
                                                <td> <asp:TextBox id="txtQualification" placeholder="Qualification" class ="TextBoxClass" required="required" runat="server"/></td>
                                           </tr>
                                           <tr>
                                                <td>Joioning As Faculty?</td>
                                                <td>
                                                    <asp:CheckBox  id="chkIsFaculty" runat="server" /></td>
                                           </tr>
                                           <tr>
                                               <td>
                                                   <asp:Button ID="btnRegister" runat="server" Text="Register User" OnClick="btnRegister_Click" CssClass="button DisplayTextStyle" />
                                               </td>
                                               <td>
                                                   <asp:Button ID="btnGoToLogin" runat="server" Text="GoTo Login Page" OnClick="btnGoToLogin_Click" CssClass="button DisplayTextStyle"   />
                                               </td>
                                           </tr>
                                           <tr>
                                               <td colspan="3">
                                                   <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label> </td>
                                           </tr>
                                       </table>
                                   </div>
</asp:Content>

