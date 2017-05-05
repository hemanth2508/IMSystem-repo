<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="UsersPage.aspx.cs" Inherits="UsersPage" %>
<%@ Register Src="~/UserProfileUpdate.ascx" TagPrefix="uc1" TagName="UserProfileUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <section class="wrapper">
   <ul class="tabs">
    <li><a href="#tab1">Update</a></li>
    <li><a href="#tab2">Enroll Course</a></li>
    <li><a href="#tab3">Selected Courses</a></li>
  </ul>
  <div class="clr"></div>
  <section class="block">
    <article id="tab1">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
      <table>
           <tr>
               <td><uc1:UserProfileUpdate runat="server" ID="UserProfileUpdate" /></td>
              
              
           </tr>
          <tr>
              <td colspan="2"> <asp:Button ID="btnSubmtChnages" runat="server" Text="Save" OnClick="btnSubmtChnages_Click" CssClass="button" /></td>
          </tr>
            <tr>
          <td colspan="2"> <asp:Label ID="lblUpdateErrorMessage" runat="server" Text="" CssClass="DisplayTextStyle"></asp:Label></td>
      </tr>
          </table>
                </ContentTemplate>
        </asp:UpdatePanel>
    </article>
    <article id="tab2">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
             <ContentTemplate>
            
           
            <table>
            <tr>
                <td>
                    <asp:GridView ID="GrdCoursesToEnroll" runat="server" AllowPaging="True" 
                        Enabled="true"  OnSelectedIndexChanged="GrdCoursesToEnroll_SelectedIndexChanged" selectedindex="-1" OnDataBound="GrdCoursesToEnroll_DataBound" AutoGenerateSelectButton="True">
                        
                        <SelectedRowStyle BackColor="#CCFFFF" BorderStyle="Double" />
                      <EditRowStyle BackColor="#e5ebf7" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="white" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
                <td>
                    <table>
                        <tr>
               <td class="DisplayTextStyle">Course Id</td>
               <td>
                   <asp:TextBox ID="txtUpdateCourseId" runat="server" ReadOnly="true"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="DisplayTextStyle">Course Name</td>
               <td>
                   <asp:TextBox ID="txtUpdateCourseName" runat="server" ReadOnly="true"></asp:TextBox>
               </td>
           </tr>
            <tr>
               <td class="DisplayTextStyle">Description</td>
               <td>
                   <asp:TextBox ID="txtUpdateDescription" runat="server" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
               </td>
           </tr>
           
           <tr>
               <td class="DisplayTextStyle">Fee</td>
               <td>
                   <asp:TextBox ID="txtUpdateFee" runat="server" ReadOnly="true"></asp:TextBox>
               </td>
           </tr>
      <tr>
               <td class="DisplayTextStyle">Start Date</td>
               <td>
                   <asp:TextBox ID="txtUpdateStartDate" runat="server" CssClass="calendercontrol" ReadOnly="true"></asp:TextBox>
               </td>
           </tr>
        <tr>
               <td class="DisplayTextStyle">End Date</td>
               <td>
                   <asp:TextBox ID="txtUpdateEndDate" runat="server" CssClass="calendercontrol" ReadOnly="true"></asp:TextBox>
               </td>
           </tr>
          <tr>
               
               <td colspan="2">
                   <asp:Button ID="btnEnroll" runat="server" Text="Enroll" OnClick="btnUpdate_Click" CssClass="button" />
               </td>
           </tr>
           
      <tr>
          <td colspan="2"> <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label></td>
      </tr>
       </table>
                </td>
            </tr>
        </table>
                  </ContentTemplate>
            </asp:UpdatePanel>
    </article>
      <article id="tab3">
           <asp:UpdatePanel ID="UpdatePanel4" runat="server">
             <ContentTemplate>
            
           
            <table>
            <tr>
                <td>
                    <asp:GridView ID="grdviewCources" runat="server" AllowPaging="True" 
                        Enabled="true"  OnSelectedIndexChanged="grdviewCources_SelectedIndexChanged" selectedindex="-1"  AutoGenerateSelectButton="True">
                        
                        <SelectedRowStyle BackColor="#CCFFFF" BorderStyle="Double" />
                      <EditRowStyle BackColor="#e5ebf7" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="white" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
                <td>
                    <table>
                        <tr>
               <td class="DisplayTextStyle">Course Id</td>
               <td>
                   <asp:TextBox ID="txtCancelCourseId" runat="server" ReadOnly="true"></asp:TextBox>
                   <asp:GridView ID="GridView2" runat="server" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                       <Columns>
                           <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" SortExpression="Id" />
                           <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                       </Columns>
                   </asp:GridView>
               </td>
           </tr>
           <tr>
               <td class="DisplayTextStyle">Course Name</td>
               <td>
                   <asp:TextBox ID="txtCancelCourseName" runat="server" ReadOnly="true"></asp:TextBox>
               </td>
           </tr>
            <tr>
               <td class="DisplayTextStyle">Description</td>
               <td>
                   <asp:TextBox ID="txtCancelDescription" runat="server" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
               </td>
           </tr>
           
           <tr>
               <td class="DisplayTextStyle">Fee</td>
               <td>
                   <asp:TextBox ID="txtCancelCoursfee" runat="server" ReadOnly="true"></asp:TextBox>
               </td>
           </tr>
        
          <tr>
               
               <td colspan="2" style="height: 42px">
                   <asp:Button ID="btnWithdraw" runat="server" Text="WithDraw From Course" OnClick="btnWithdraw_Click" CssClass="button" />
               </td>
           </tr>
           
     
       </table>
                </td>
            </tr>
                 <tr>
               <td colspan="2">
                   <asp:RadioButtonList ID="rbtPaymentOptions" runat="server" OnSelectedIndexChanged="rbtPaymentOptions_SelectedIndexChanged" AutoPostBack="True" RepeatDirection="Horizontal">
                       <asp:ListItem Text="Debit Card" Value="DC"></asp:ListItem>
                       <asp:ListItem Text="Credit Card" Value="CC"></asp:ListItem>
                       <asp:ListItem Text="Net Banking" Value="NB"></asp:ListItem>
                       <asp:ListItem Text="Pay Cash At the time of Joining" Value="PC"></asp:ListItem>
                   </asp:RadioButtonList>

               </td>
              
           </tr>
                 <tr>
          <td colspan="2"> <asp:Label ID="lblCancelCourse" runat="server" Text="Total fee"></asp:Label></td>
      </tr>
                      <tr>
          <td colspan="2"> <asp:Label ID="lbldiscount" runat="server" Text=""></asp:Label></td>
      </tr>
        </table>
                  </ContentTemplate>
            </asp:UpdatePanel>
      </article>
      <%-- <article id="tab3">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
             <ContentTemplate>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="grdviewCources" runat="server" AllowPaging="True" 
                        Enabled="true"  
                        selectedindex="-1" OnDataBound="grdviewCources_DataBound" >
                        
                        
                      
                    </asp:GridView>
                </td>
                
            </tr>
        </table>
            </ContentTemplate>
     </asp:UpdatePanel>
    </article>--%>
  </section>
</section>

    
</asp:Content>

