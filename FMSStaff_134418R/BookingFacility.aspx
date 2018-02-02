<%@ Page Title="" Language="C#" MasterPageFile="~/FMS_Master.master" AutoEventWireup="true" CodeFile="BookingFacility.aspx.cs" Inherits="BookingFacility" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Booking Facility</h1>
    <table class="style1">
        <tr>
            <td>
                Location:</td>
            <td>
                <asp:DropDownList ID="locationDropDownList" runat="server" 
                    DataSourceID="resourceSqlDataSource" DataTextField="Description" 
                    DataValueField="Location">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="locationRequiredFieldValidator" runat="server" 
                    ControlToValidate="locationDropDownList" ErrorMessage="Please choose location." 
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Booking Date:</td>
            <td>
                <asp:TextBox ID="bookingDateTextBox" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="bookingDateTextBox_CalendarExtender" runat="server" 
                    TargetControlID="bookingDateTextBox" Format="dd/MM/yyyy">
                </asp:CalendarExtender>
                <asp:RequiredFieldValidator ID="BookingDateRequiredFiledValidator" 
                    runat="server" ControlToValidate="bookingDateTextBox" 
                    ErrorMessage="Please enter booking date." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Start Time:</td>
            <td>
                <asp:DropDownList ID="startTimeDropDownList" runat="server" 
                    DataSourceID="startTimeSqlDataSource" DataTextField="StartTime" 
                    DataValueField="id">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="startTimeRequiredFieldValidator" runat="server" 
                    ControlToValidate="startTimeDropDownList" 
                    ErrorMessage="Please choose start time." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                End Time:</td>
            <td>
                <asp:DropDownList ID="endTimeDropDownList" runat="server" 
                    DataSourceID="endTimeSqlDataSource" DataTextField="EndTime" DataValueField="id">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="endTimeRequiredFieldValidator" runat="server" 
                    ControlToValidate="endTimeDropDownList" ErrorMessage="Please choose end time." 
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Purpose:</td>
            <td>
                <asp:TextBox ID="purposeTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="purposeRequiredFieldValidator" runat="server" 
                    ControlToValidate="purposeTextBox" ErrorMessage="Please enter purpose." 
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
            <asp:SqlDataSource ID="resourceSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FacilityDBConnectionString %>" 
                    SelectCommand="SELECT [Location], [Description] FROM [Resource]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="startTimeSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FacilityDBConnectionString %>" 
                    SelectCommand="SELECT * FROM [StartTime]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="endTimeSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FacilityDBConnectionString %>" 
                    SelectCommand="SELECT * FROM [EndTime]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="bookingSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FacilityDBConnectionString %>" 
                    SelectCommand="SELECT * FROM [Booking]" 
                    
                    InsertCommand="INSERT INTO [Booking] ([StaffId], [Location], [BookingDate], [StartTimeId], [EndTimeId], [Purpose]) VALUES (@StaffId, @Location, @BookingDate, @StartTimeId, @EndTimeId, @Purpose)" 
                    ConflictDetection="CompareAllValues" 
                    DeleteCommand="DELETE FROM [Booking] WHERE [id] = @original_id AND [StaffId] = @original_StaffId AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL)) AND (([BookingDate] = @original_BookingDate) OR ([BookingDate] IS NULL AND @original_BookingDate IS NULL)) AND (([StartTimeId] = @original_StartTimeId) OR ([StartTimeId] IS NULL AND @original_StartTimeId IS NULL)) AND (([EndTimeId] = @original_EndTimeId) OR ([EndTimeId] IS NULL AND @original_EndTimeId IS NULL)) AND (([Purpose] = @original_Purpose) OR ([Purpose] IS NULL AND @original_Purpose IS NULL))" 
                    OldValuesParameterFormatString="original_{0}" 
                    UpdateCommand="UPDATE [Booking] SET [StaffId] = @StaffId, [Location] = @Location, [BookingDate] = @BookingDate, [StartTimeId] = @StartTimeId, [EndTimeId] = @EndTimeId, [Purpose] = @Purpose WHERE [id] = @original_id AND [StaffId] = @original_StaffId AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL)) AND (([BookingDate] = @original_BookingDate) OR ([BookingDate] IS NULL AND @original_BookingDate IS NULL)) AND (([StartTimeId] = @original_StartTimeId) OR ([StartTimeId] IS NULL AND @original_StartTimeId IS NULL)) AND (([EndTimeId] = @original_EndTimeId) OR ([EndTimeId] IS NULL AND @original_EndTimeId IS NULL)) AND (([Purpose] = @original_Purpose) OR ([Purpose] IS NULL AND @original_Purpose IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_StaffId" Type="String" />
            <asp:Parameter Name="original_Location" Type="String" />
            <asp:Parameter Name="original_BookingDate" Type="DateTime" />
            <asp:Parameter Name="original_StartTimeId" Type="Int32" />
            <asp:Parameter Name="original_EndTimeId" Type="Int32" />
            <asp:Parameter Name="original_Purpose" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="StaffId" SessionField="StaffId" Type="String" />
            <asp:ControlParameter ControlID="locationDropDownList" Name="Location" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="bookingDateTextBox" Name="BookingDate" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="startTimeDropDownList" Name="StartTimeId" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="endTimeDropDownList" Name="EndTimeId" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="purposeTextBox" Name="Purpose" 
                PropertyName="Text" Type="String" />
        </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StaffId" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="BookingDate" Type="DateTime" />
                    <asp:Parameter Name="StartTimeId" Type="Int32" />
                    <asp:Parameter Name="EndTimeId" Type="Int32" />
                    <asp:Parameter Name="Purpose" Type="String" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_StaffId" Type="String" />
                    <asp:Parameter Name="original_Location" Type="String" />
                    <asp:Parameter Name="original_BookingDate" Type="DateTime" />
                    <asp:Parameter Name="original_StartTimeId" Type="Int32" />
                    <asp:Parameter Name="original_EndTimeId" Type="Int32" />
                    <asp:Parameter Name="original_Purpose" Type="String" />
        </UpdateParameters>
                </asp:SqlDataSource>
                
                <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </asp:ToolkitScriptManager>
                <asp:Button ID="saveButton" runat="server" Text="Save" 
                    onclick="saveButton_Click" />
            </td>
        </tr>
    </table>
    <asp:Label ID="messageLabel" runat="server"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</asp:Content>

