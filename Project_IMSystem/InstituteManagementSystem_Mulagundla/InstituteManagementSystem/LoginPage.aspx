<%@ Page Title="" Language="C#" MasterPageFile="~/InstituteMainMaster.master" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bodycorners">
       <table style="width:100%;height:100%">
           <tr>
               <td style="width:80%">
                   <img src="Images/Computer02_000.gif" />
               </td>
               <td>
                   <div class="Logincorners" title="Login Here" >
                       <table>
                           <tr>
                               <td colspan="2" class="DisplayTextStyle">Login Here</td>
                           </tr>
                           <tr>
                               <td class="DisplayTextStyle">User Id</td>
                               <td> <asp:TextBox ID="txtUserId" CssClass="TextBoxClass"  runat="server"></asp:TextBox> </td>
                           </tr>
                             <tr>
                               <td class="DisplayTextStyle">Password</td>
                               <td> <asp:TextBox ID="txtPassword" runat="server" CssClass="TextBoxClass" TextMode="Password"></asp:TextBox> </td>
                           </tr>
                           <tr>
                           <td colspan="2" style="text-align:right">
                               <asp:Button ID="btnLogin" runat="server" CssClass="button DisplayTextStyle" Text="Login" OnClick="btnLogin_Click" />
                           </td>
                           </tr>
                            <tr>
                           <td colspan="2" style="text-align:right">
                               <asp:Label ID="lblError" runat="server" Text="Label" Visible="false"></asp:Label>
                           </td>
                           </tr>
                           <tr>
                               <td colspan="2" style="text-align:center">
                                   <%--<button class="button" style="width:180px" id="register">SignUp Here</button>--%>
                               <asp:Button ID="btnRegister" runat="server" CssClass="button DisplayTextStyle" Text="SignUp Here" Width="180px" OnClick="btnRegister_Click"/>
                                   <div id="RegisterUser" class="">
                                       <table>
                                           <tr>
                                              
                                               <td >  <input type="text" name="txtFName" placeholder="First name" class ="TextBoxClass" required="required"/><br></td>
                                           </tr>
                                           <tr>
                                              <td> <input type="text" name="txtLName" placeholder="Last name" class ="TextBoxClass" required="required"/></td>
                                           </tr>
                                           <tr>
                                              <td> <input type="email" name="txtEmailId" placeholder="Email Id; This will be your UserId" class ="TextBoxClass"required="required"/></td>
                                           </tr>
                                            <tr>
                                              <td> <input type="password" name="txtPassword" placeholder="Password" class ="TextBoxClass"required="required"/></td>
                                           </tr>
                                            <tr>
                                              <td> <input type="password" name="txtConfirmPassword" placeholder="Confirm Password" class ="TextBoxClass"required="required"/></td>
                                           </tr>
                                           
                                           <tr>
                                                <td> <input type="text" name="txtQualification" placeholder="Qualification" class ="TextBoxClass"required="required"/></td>
                                           </tr>
                                           <tr>
                                                <td> <input type="checkbox" id="chkIsFaculty" />Joioning As Faculty?</td>
                                           </tr>
                                       </table>
                                   </div>
                           </td>
                           </tr>
                       </table>
                   </div>

               </td>
           </tr>
           <tr>
              <td>
                   <marquee direction="up" height="90" SCROLLDELAY=300>
                      <%-- C# Classes commence from Next week<br />
                       Java Classes commence from Next week<br />
                       SAP Classes commence from Next week<br />
                       SQL Server Classes commence from Next week<br />
                       Oracle Classes commence from Next week<br />
                       Share Point Classes commence from Next week<br />--%>
                       <asp:Literal ID="lt2" runat="server"></asp:Literal></marquee>
              </td>
           </tr>
       </table>
    </div>
</asp:Content>



