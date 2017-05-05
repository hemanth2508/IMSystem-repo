<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="FacultyPage.aspx.cs" Inherits="FacultyPage" %>

<%@ Register Src="~/UserProfileUpdate.ascx" TagPrefix="uc1" TagName="UserProfileUpdate" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <section class="wrapper">
   <ul class="tabs">
    <li><a href="#tab1" class="DisplayTextStyle">Update</a></li>
    <li><a href="#tab2" class="DisplayTextStyle">Create Course</a></li>
    <li><a href="#tab3" class="DisplayTextStyle">Update Course</a></li>
  </ul>
  <div class="clr"></div>
  <section class="block">
    <article id="tab1">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                   <script type="text/javascript">
                       Sys.Application.add_load(BindControlEvents);
     </script>
                <fieldset>
      <table>
           <tr>
               <td><uc1:UserProfileUpdate runat="server" ID="UserProfileUpdate" /></td>
              
               <td>
                   <table>
                     <tr> 
                       <td class="DisplayTextStyle">Experience</td>
                       <td>
                          <%-- <input type="number"  ID="txtExperience" runat="server" class="TextBoxClass"  Width="262px" /> Years--%>
                           <asp:TextBox ID="txtExperience" runat="server" type="number"></asp:TextBox> Years
                       </td>
                     </tr>
                     <tr> 
                       <td class="DisplayTextStyle">Achivements</td>
                       <td>
                           <asp:TextBox ID="txtAchievements" runat="server" TextMode="MultiLine" CssClass="TextBoxClass" Width="262px" Height="101px"></asp:TextBox>
                       </td>

                     </tr>

                      
                   </table>
                   </td>
           </tr>
          <tr>
              <td>
                  <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label> </td>
              <td style="text-align:right"> <asp:Button ID="btnSubmtChnages" runat="server" Text="Save" OnClick="btnSubmtChnages_Click" CssClass="button" /></td>
          </tr>
          </table>
                    </fieldset>
                </ContentTemplate>
        </asp:UpdatePanel>
    </article>
    <article id="tab2">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
             <ContentTemplate>
                    <script type="text/javascript">
                        Sys.Application.add_load(BindControlEvents);
     </script>
                 <fieldset>
      <table>
           <tr>
               <td class="DisplayTextStyle">Course Name<span style="color:red">*</span></td>
               <td>
                   <asp:TextBox ID="txtCourseName" runat="server" CssClass="TextBoxClass"  ValidationGroup="tab2"></asp:TextBox>
               </td>
               <td>
                   <asp:RequiredFieldValidator ID="txtCourseNameValidator" ControlToValidate="txtCourseName" runat="server" ErrorMessage="Course Name is Required" ValidationGroup="tab2"></asp:RequiredFieldValidator>
<%--                           <asp:regularexpressionvalidator ID="Regularexpressionvalidator1" runat="server" errormessage="name is required" ControlToValidate="txtCourseName" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$"></asp:regularexpressionvalidator>--%>

               </td>
           </tr>
            <tr>
               <td class="DisplayTextStyle">Description&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                   <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="TextBoxClass" ValidationGroup="tab2"></asp:TextBox>
               </td>
                 <td>
                   <asp:RequiredFieldValidator ID="txtDescriptionValidator" ControlToValidate="txtDescription" runat="server" ErrorMessage="Description is Required" ValidationGroup="tab2"></asp:RequiredFieldValidator>
               </td>
           </tr>
           
           <tr>
               <td class="DisplayTextStyle">Fee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                   <%--<input type="number"  ID="txtFee" runat="server" required="required"/>--%>
                   <asp:TextBox ID="txtFee" runat="server"  type="number"   ValidationGroup="tab2"></asp:TextBox>
               </td>
               <td>
                   <asp:RequiredFieldValidator ID="txtFeeValidator" runat="server" ControlToValidate="txtFee" ErrorMessage="Fee is Required" ValidationGroup="tab2"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td class="DisplayTextStyle">No Of Seats&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                  <%-- <input type="number"  ID="txtNoOfSeats" runat="server" required="required"/>--%>
                   <asp:TextBox ID="txtNoOfSeats" runat="server"  type="number"  ValidationGroup="tab2"></asp:TextBox>
               </td>
                <td>
                   <asp:RequiredFieldValidator ID="txtNoOfSeatsValidator" runat="server" ControlToValidate="txtNoOfSeats"  ErrorMessage="No Of Seats is Required" ValidationGroup="tab2"></asp:RequiredFieldValidator>
               </td>
           </tr>
      <tr>
               <td class="DisplayTextStyle">Start Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                  <%-- <input id="txtStartDate"  type="date" name="txtStartDate" runat="server" max="2020-12-31" data-date-format="MM-dd-yyyy">--%>
                   <asp:TextBox ID="txtStartDate" type="date" runat="server" CssClass="calendercontrol"  ValidationGroup="tab2" ></asp:TextBox>
               </td>
           <td>
                   <asp:RequiredFieldValidator ID="txtStartDateValidator" runat="server" ControlToValidate="txtStartDate" ValidationGroup="tab2" ErrorMessage="Start Date is Required"></asp:RequiredFieldValidator>
               </td>
           </tr>
        <tr>
               <td class="DisplayTextStyle">End Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                   <%--<input id="txtEndDate" type="date" name="txtEndDate" runat="server" max="2020-12-31"  class="datepicker" >--%>
                   <asp:TextBox ID="txtEndDate" runat="server" CssClass="calendercontrol" ValidationGroup="tab2"></asp:TextBox>
               </td>
             <td>
                   <asp:RequiredFieldValidator ID="txtEndDateValidator" runat="server"  ControlToValidate="txtEndDate"  ErrorMessage=">End Dateis Required" ValidationGroup="tab2"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td class="DisplayTextStyle">Start Time&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                   <%--<input type="text" id="txtStartTime" runat="server"  class="datepicker" />--%>
                   <asp:TextBox ID="txtStartTime" runat="server" CssClass="calendercontrol"  ValidationGroup="tab2"></asp:TextBox>
               </td>
                <td>
                   <asp:RequiredFieldValidator ID="txtStartTimeValidator" runat="server" ControlToValidate="txtStartTime" ErrorMessage=">Start Time Required" ValidationGroup="tab2"></asp:RequiredFieldValidator>
               </td>
           </tr>
           <tr>
               <td class="DisplayTextStyle">End Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                    <%--<input type="text" id="txtEndTime" runat="server"  class="datepicker"/>--%>
                   <asp:TextBox ID="txtEndTime" runat="server" CssClass="calendercontrol" ValidationGroup="tab2" ></asp:TextBox>
               </td>
                <td>
                   <asp:RequiredFieldValidator ID="txtEndTimeValidator" runat="server" ControlToValidate="txtEndTime"  ErrorMessage=">End Time Required" ValidationGroup="tab2"></asp:RequiredFieldValidator>
               </td>
           </tr>
          <tr>
               <td colspan="2">
                   <asp:Label ID="lblCourseStatus" runat="server" Text=""></asp:Label>
               </td>
               <td style="text-align:right">
                   <asp:Button ID="btnCreate" runat="server" Text="Button"   OnClick="btnCreate_Click" CssClass="button" ValidationGroup="tab2"/>
                   <%--<asp:Button ID="btnCreate" runat="server" Text="Create"  OnClick="btnCreate_Click" CssClass="button"/>--%>
               </td>
           </tr>
           
      
       </table>
                     </fieldset>
            </ContentTemplate>
            </asp:UpdatePanel>
    </article>
    <article id="tab3">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
             <ContentTemplate>
                    <script type="text/javascript">
                        Sys.Application.add_load(BindControlEvents);
     </script>
                 <fieldset>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="grdviewCources" runat="server" AllowPaging="True" 
                        Enabled="true"  
                        OnSelectedIndexChanged="grdviewCources_SelectedIndexChanged" selectedindex="-1" OnDataBound="grdviewCources_DataBound" AutoGenerateSelectButton="True">
                        
                        <SelectedRowStyle BackColor="#CCFFFF" BorderStyle="Double" />
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
                <td>
                    <table>
                        <tr>
               <td class="DisplayTextStyle">Course Id</td>
               <td>
                   <asp:TextBox ID="txtUpdateCourseId" runat="server" ReadOnly="true" CssClass="TextBoxClass"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="DisplayTextStyle">Course Name <span style="color:red">*</span></td>
               <td>
                   <asp:TextBox ID="txtUpdateCourseName" runat="server" CssClass="TextBoxClass"></asp:TextBox>
               </td>
           </tr>
            <tr>
               <td class="DisplayTextStyle">Description&nbsp;&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                   <asp:TextBox ID="txtUpdateDescription" runat="server" TextMode="MultiLine" CssClass="TextBoxClass"></asp:TextBox>
               </td>
           </tr>
           
           <tr>
               <td class="DisplayTextStyle">Fee<span style="color:red">*</span></td>
               <td>
                <%--   <input type="number" ID="txtUpdateFee"  runat="server" class="TextBoxClass"/>--%>
                   <asp:TextBox ID="txtUpdateFee"  runat="server"  type="number" ></asp:TextBox>
               </td>
           </tr>
                         <tr>
               <td class="DisplayTextStyle">No Of Seats&nbsp;&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                <%--   <input type="number"  ID="txtUpdateNumber" runat="server"/>--%>
                   <asp:TextBox ID="txtUpdateNumber" runat="server" type="number"></asp:TextBox>
               </td>
           </tr>
      <tr>
               <td class="DisplayTextStyle">Start Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                   <asp:TextBox ID="txtUpdateStartDate" runat="server" CssClass="calendercontrol" type="date"></asp:TextBox>
               </td>
           </tr>
        <tr>
               <td class="DisplayTextStyle">End Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                   <asp:TextBox ID="txtUpdateEndDate" runat="server" CssClass="calendercontrol" type="date"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="DisplayTextStyle">Start Time&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                 <%--  <input type="text" id="txtUpdateStartTime" runat="server"  class="datepicker" />--%>
                   <asp:TextBox ID="txtUpdateStartTime" runat="server" CssClass="calendercontrol" type="time"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="DisplayTextStyle">End Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:red">*</span></td>
               <td>
                   <%-- <input type="text" id="txtUpdateEndTime" runat="server"  class="datepicker"/>--%>
                   <asp:TextBox ID="txtUpdateEndTime" runat="server" CssClass="calendercontrol" type="time" ></asp:TextBox>
               </td>
           </tr>
          <tr>
              
               
               <td colspan="2" style="text-align:center">
                   <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CssClass="button"/>
               </td>
           </tr>
           
       <tr>
              <td colspan="2">
                  <asp:Label ID="lblCoureseUpdateLabel" runat="server" Text=""></asp:Label></td>
               
             
           </tr>
       </table>
                </td>
            </tr>
        </table>
                     </fieldset>
            </ContentTemplate>
     </asp:UpdatePanel>
    </article>
  </section>
</section>

 
      
       
    
   

</asp:Content>

