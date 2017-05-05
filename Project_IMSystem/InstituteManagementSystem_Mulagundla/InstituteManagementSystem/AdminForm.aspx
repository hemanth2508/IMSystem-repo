<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="AdminForm.aspx.cs" Inherits="AdminForm" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent1" Runat="Server">
   

         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <section class="wrapper">
   <ul class="tabs">
    <li><a href="#tab1" class="DisplayTextStyle">User Profiles</a></li>
    <li><a href="#tab2" class="DisplayTextStyle">Courses</a></li>
    
  </ul>
  <div class="clr"></div>
  <section class="block">
    <article id="tab1">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table>
                 <tr>
                    <td>
       <asp:GridView ID="gridSample" runat="server" AutoGenerateColumns="False" 
                         OnRowCommand="gridSample_RowCommand"
        DataKeyNames="LoginId" ForeColor="#333333"
                        GridLines="Horizontal" OnRowCancelingEdit="gridSample_RowCancelingEdit"
                        OnRowEditing="gridSample_RowEditing"
        OnRowUpdating="gridSample_RowUpdating"
       
        onrowdeleting="gridSample_RowDeleting" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" 
           Width="100%" AllowPaging="True" HorizontalAlign="Justify">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="" CommandName="Edit" ToolTip="Edit" 
                                        CommandArgument=''>Edit</asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                                        ToolTip="Delete" OnClientClick='return confirm("Are you sure you want to delete this entry?");'
                                        CommandArgument=''>Delete</asp:LinkButton>
                                </ItemTemplate>
                               
                                <EditItemTemplate>
                                  <asp:LinkButton ID="lnkUpdate" runat="server" Text="" CommandName="Update" ToolTip="Edit" 
                                        CommandArgument='' OnClientClick='return confirm("Are you sure you want to Update this entry?");'>Update</asp:LinkButton>
                                  <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                        ToolTip="Cancel" CommandArgument=''>Cancel</asp:LinkButton>
                              </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First Name">
                                
                                <ItemTemplate>
                                    <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("Fname") %>'></asp:Label>
                                </ItemTemplate>
                                
                            </asp:TemplateField>       
                            <asp:TemplateField HeaderText="Last Name">
                               
                                <ItemTemplate>
                                    <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LName") %>'></asp:Label>
                                </ItemTemplate>
                               
                            </asp:TemplateField>   
                            <asp:TemplateField HeaderText="Email">
                                
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                </ItemTemplate>
                                
                            </asp:TemplateField> 
 
                             <asp:TemplateField HeaderText="Phone">
                               
                                <ItemTemplate>
                                    <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                                </ItemTemplate>
                                
                            </asp:TemplateField>   
                            
                             <asp:TemplateField HeaderText="Qualification">
                               
                                <ItemTemplate>
                                    <asp:Label ID="lblQualification" runat="server" Text='<%# Bind("Qualification") %>'></asp:Label>
                                </ItemTemplate>
                                
                            </asp:TemplateField>  
                            
                             <asp:TemplateField HeaderText="Status">
                               
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>

                                    <asp:CheckBox ID="chkStatus" runat="server" Checked='<%# Bind("Status") %>'/>
                                    
                                   
                                </EditItemTemplate>
                            </asp:TemplateField>                           
                        </Columns>
                        <EditRowStyle BackColor="#e5ebf7" />
                        
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#e5ebf7" Font-Bold="True" ForeColor="white" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblErrorMessageUsers" runat="server" Text=""></asp:Label>

                    </td>
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
                   <asp:GridView ID="grdviewCourses" runat="server" AutoGenerateColumns="False" 
                         OnRowCommand="gridSample_RowCommand"
        DataKeyNames="CourseId,FacultyId" CellPadding="4" ForeColor="#333333"
                        GridLines="None" OnRowCancelingEdit="grdviewCourses_RowCancelingEdit"
                        OnRowEditing="grdviewCourses_RowEditing"
        OnRowUpdating="grdviewCourses_RowUpdating"
        onrowdeleting="grdviewCourses_RowDeleting" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="" CommandName="Edit" ToolTip="Edit" 
                                        CommandArgument=''>Edit</asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                                        ToolTip="Delete" OnClientClick='return confirm("Are you sure you want to delete this entry?");'
                                        CommandArgument=''>Delete</asp:LinkButton>
                                </ItemTemplate>
                               
                                <EditItemTemplate>
              <asp:LinkButton ID="lnkUpdate" runat="server" Text="" CommandName="Update" ToolTip="Edit" 
                                        CommandArgument='' OnClientClick='return confirm("Are you sure you want to Update this entry?");'>Update</asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel"
                                        ToolTip="Cancel" 
                                        CommandArgument=''>Cancel</asp:LinkButton>
          </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Course Name">
                                
                                <ItemTemplate>
                                    <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("CourseName") %>'></asp:Label>
                                </ItemTemplate>
                                
                            </asp:TemplateField>       
                            <asp:TemplateField HeaderText="Fee">
                               
                                <ItemTemplate>
                                    <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("Fees") %>'></asp:Label>
                                </ItemTemplate>
                               
                            </asp:TemplateField>   
                            <asp:TemplateField HeaderText="Description">
                                
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                </ItemTemplate>
                                
                            </asp:TemplateField> 
 
                             <asp:TemplateField HeaderText="Start Date">
                               
                                <ItemTemplate>
                                    <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("CourseStartDate") %>'></asp:Label>
                                </ItemTemplate>
                                
                            </asp:TemplateField>   
                            
                             <asp:TemplateField HeaderText="End Date">
                               
                                <ItemTemplate>
                                    <asp:Label ID="lblQualification" runat="server" Text='<%# Bind("CourseEndDate") %>'></asp:Label>
                                </ItemTemplate>
                                
                            </asp:TemplateField>  
                            
                             <asp:TemplateField HeaderText="Active Course">
                               
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>

                                    <asp:CheckBox ID="chkStatus" runat="server" Checked='<%# Bind("IsActive") %>'/>
                                    
                                   
                                </EditItemTemplate>
                            </asp:TemplateField>                           
                        </Columns>
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
           </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblErrorMessageCourse" runat="server" Text=""></asp:Label>

                    </td>
                </tr>
            
       </table>
            </ContentTemplate>
            </asp:UpdatePanel>
    </article>
    
  </section>
</section>


         

</asp:Content>

