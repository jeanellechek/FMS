<%@ Page Title="" Language="C#" MasterPageFile="~/FMS_Master.master" AutoEventWireup="true" CodeFile="ViewBookingByResourceType.aspx.cs" Inherits="ViewBookingByResource" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>View Booking Resource Type</h1>

        Type:<asp:TextBox ID="resourceTypeTextBox" runat="server"></asp:TextBox>
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="viewBookingSqlDataSource" AllowPaging="True" 
        AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="StaffId" HeaderText="StaffId" 
                    SortExpression="StaffId" />
                <asp:BoundField DataField="Location" HeaderText="Location" 
                    SortExpression="Location" />
                <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" 
                    SortExpression="BookingDate" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Purpose" 
                    HeaderText="Purpose" SortExpression="Purpose" />
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
        <asp:SqlDataSource ID="viewBookingSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FacilityDBConnectionString %>" 
            
        SelectCommand="SELECT Booking.StaffId, Booking.Location, Booking.BookingDate, Booking.Purpose, StartTime.StartTime, EndTime.EndTime, Staff.StaffName, Resource.Description FROM Booking INNER JOIN Staff ON Booking.StaffId = Staff.StaffId INNER JOIN Resource ON Booking.Location = Resource.Location INNER JOIN StartTime ON Booking.StartTimeId = StartTime.id INNER JOIN EndTime ON Booking.EndTimeId = EndTime.id WHERE (Resource.type = @type)">
            <SelectParameters>
                <asp:ControlParameter ControlID="resourceTypeTextBox" Name="type" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    
</asp:Content>

