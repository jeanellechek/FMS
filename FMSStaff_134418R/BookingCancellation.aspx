<%@ Page Title="" Language="C#" MasterPageFile="~/FMS_Master.master" AutoEventWireup="true" CodeFile="BookingCancellation.aspx.cs" Inherits="SearchBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Booking Cancellation</h1>
<asp:SqlDataSource ID="BookingSqlDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FacilityDBConnectionString %>" 
        
        SelectCommand="SELECT Booking.Location, Booking.BookingDate, Booking.Purpose, Resource.Description, EndTime.EndTime, StartTime.StartTime, Booking.id FROM Booking INNER JOIN StartTime ON Booking.StartTimeID = StartTime.id INNER JOIN EndTime ON Booking.EndTimeID = EndTime.id INNER JOIN Resource ON Booking.Location = Resource.Location WHERE (Booking.StaffId = @StaffId)" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM Booking WHERE (id = @original_id)" 
        InsertCommand="INSERT INTO [Booking] ([StaffId], [Location], [BookingDate], [StartTimeID], [EndTimeID], [Purpose]) VALUES (@StaffId, @Location, @BookingDate, @StartTimeID, @EndTimeID, @Purpose)" 
        OldValuesParameterFormatString="original_{0}" 
        
        
        
        UpdateCommand="UPDATE [Booking] SET [StaffId] = @StaffId, [Location] = @Location, [BookingDate] = @BookingDate, [StartTimeID] = @StartTimeID, [EndTimeID] = @EndTimeID, [Purpose] = @Purpose WHERE [id] = @original_id AND [StaffId] = @original_StaffId AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL)) AND (([BookingDate] = @original_BookingDate) OR ([BookingDate] IS NULL AND @original_BookingDate IS NULL)) AND (([StartTimeID] = @original_StartTimeID) OR ([StartTimeID] IS NULL AND @original_StartTimeID IS NULL)) AND (([EndTimeID] = @original_EndTimeID) OR ([EndTimeID] IS NULL AND @original_EndTimeID IS NULL)) AND (([Purpose] = @original_Purpose) OR ([Purpose] IS NULL AND @original_Purpose IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="StaffId" Type="String" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="BookingDate" Type="DateTime" />
            <asp:Parameter Name="StartTimeID" Type="Int32" />
            <asp:Parameter Name="EndTimeID" Type="Int32" />
            <asp:Parameter Name="Purpose" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="StaffId" SessionField="StaffId" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="StaffId" Type="String" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="BookingDate" Type="DateTime" />
            <asp:Parameter Name="StartTimeID" Type="Int32" />
            <asp:Parameter Name="EndTimeID" Type="Int32" />
            <asp:Parameter Name="Purpose" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_StaffId" Type="String" />
            <asp:Parameter Name="original_Location" Type="String" />
            <asp:Parameter Name="original_BookingDate" Type="DateTime" />
            <asp:Parameter Name="original_StartTimeID" Type="Int32" />
            <asp:Parameter Name="original_EndTimeID" Type="Int32" />
            <asp:Parameter Name="original_Purpose" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" DataSourceID="BookingSqlDataSource" 
        AutoGenerateColumns="False" DataKeyNames="id">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="Location" HeaderText="Location" 
                SortExpression="Location" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
            <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" 
                SortExpression="BookingDate" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Purpose" HeaderText="Purpose" 
                SortExpression="Purpose" />
            <asp:BoundField DataField="StartTime" HeaderText="StartTime" 
                SortExpression="StartTime" />
            <asp:BoundField DataField="EndTime" HeaderText="EndTime" 
                SortExpression="EndTime" />
        </Columns>
    </asp:GridView>
</asp:Content>
