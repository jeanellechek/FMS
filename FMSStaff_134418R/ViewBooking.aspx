<%@ Page Title="" Language="C#" MasterPageFile="~/FMS_Master.master" AutoEventWireup="true" CodeFile="ViewBooking.aspx.cs" Inherits="ViewBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>View Booking</h1>
    <asp:SqlDataSource ID="bookingSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FacilityDBConnectionString %>" 
        SelectCommand="SELECT Booking.id, Booking.Location, Booking.BookingDate, Booking.Purpose, EndTime.EndTime, StartTime.StartTime, Resource.Description, Booking.StaffId, Staff.StaffName FROM Booking INNER JOIN StartTime ON Booking.StartTimeID = StartTime.id INNER JOIN EndTime ON Booking.EndTimeID = EndTime.id INNER JOIN Staff ON Booking.StaffId = Staff.StaffId INNER JOIN Resource ON Booking.Location = Resource.Location"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" 
        DataSourceID="bookingSqlDataSource">
        <Columns>
            <asp:BoundField DataField="StaffId" HeaderText="StaffId" 
                SortExpression="StaffId" />
            <asp:BoundField DataField="Location" HeaderText="Location" 
                SortExpression="Location" />
            <asp:BoundField DataField="BookingDate" DataFormatString="{0:d}" 
                HeaderText="BookingDate" SortExpression="BookingDate" />
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
    </asp:Content>

