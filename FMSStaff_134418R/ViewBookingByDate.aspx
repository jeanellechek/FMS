<%@ Page Title="" Language="C#" MasterPageFile="~/FMS_Master.master" AutoEventWireup="true" CodeFile="ViewBookingByDate.aspx.cs" Inherits="ViewBookingByDate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1>View Booking By Date</h1>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>

 Enter Date :<asp:TextBox ID="dateTextBox" runat="server"></asp:TextBox>
    <asp:CalendarExtender ID="dateTextBox_CalendarExtender" runat="server" 
        TargetControlID="dateTextBox" Format="dd/MM/yyy">
    </asp:CalendarExtender>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="viewBookingByDateSqlDataSource" 
        AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="StaffId" HeaderText="StaffId" 
                SortExpression="StaffId" />
            <asp:BoundField DataField="Location" HeaderText="Location" 
                SortExpression="Location" />
            <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" 
                SortExpression="BookingDate" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Purpose" HeaderText="Purpose" 
                SortExpression="Purpose" />
            <asp:BoundField DataField="StartTime" HeaderText="StartTime" 
                SortExpression="StartTime" />
            <asp:BoundField DataField="EndTime" HeaderText="EndTime" 
                SortExpression="EndTime" />
            <asp:BoundField DataField="StaffName" HeaderText="StaffName" 
                SortExpression="StaffName" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="viewBookingByDateSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FacilityDBConnectionString %>" 
        
        
        
        SelectCommand="SELECT Booking.StaffId, Booking.Location, Booking.BookingDate, Booking.Purpose, StartTime.StartTime, EndTime.EndTime, Staff.StaffName, Resource.Description FROM Booking INNER JOIN Staff ON Booking.StaffId = Staff.StaffId INNER JOIN Resource ON Booking.Location = Resource.Location INNER JOIN StartTime ON Booking.StartTimeId = StartTime.id INNER JOIN EndTime ON Booking.EndTimeId = EndTime.id WHERE (Booking.BookingDate = @BookingDate)">
        <SelectParameters>
            <asp:ControlParameter ControlID="dateTextBox" DbType="Date" Name="BookingDate" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

