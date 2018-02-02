<%@ Page Title="" Language="C#" MasterPageFile="~/FMS_Master.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Edit Profile</h1>
    <table class="style1">
    <tr>
            <td>
                Staff ID</td>
            <td>
                <asp:Label ID="staffLabel" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td>
                Staff Name</td>
            <td>
                <asp:TextBox runat="server" ID="staffNameTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="staffNameRequiredFieldValidator" runat="server" 
                    ControlToValidate="staffNameTextBox" Display="Dynamic" 
                    ErrorMessage="Please enter staff name." ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Password</td>
            <td>
                <asp:TextBox ID="passwordTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator" runat="server" 
                    ControlToValidate="passwordTextBox" ErrorMessage="Please enter password" 
                    ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="passwordCompareValidator" runat="server" 
                    ControlToValidate="passwordTextBox" ErrorMessage="Password do not match" 
                    ForeColor="Red" ControlToCompare="confirmPasswordTextBox">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                Confirm Password</td>
            <td>
                <asp:TextBox ID="confirmPasswordTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="confirmPasswordRequiredFieldValidator" 
                    runat="server" ControlToValidate="confirmPasswordTextBox" 
                    ErrorMessage="Please enter confirm password" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="confirmPasswordCompareValidator" runat="server" 
                    ControlToValidate="confirmPasswordTextBox" ErrorMessage="Password do not match" 
                    ForeColor="Red" ControlToCompare="passwordTextBox">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                Email Address</td>
            <td>
                <asp:TextBox ID="emailTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="emailRequiredFieldValidator" runat="server" 
                    ControlToValidate="emailTextBox" ErrorMessage="Please enter email address" 
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Phone Number</td>
            <td>
                <asp:TextBox ID="phoneNumberTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="phoneNumberRequiredFieldValidator" 
                    runat="server" ControlToValidate="phoneNumberTextBox" 
                    ErrorMessage="Please enter phone number" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Title</td>
            <td>
                <asp:DropDownList ID="titleDropDownList" runat="server">
                    <asp:ListItem Selected="True">Mr</asp:ListItem>
                    <asp:ListItem>Miss</asp:ListItem>
                    <asp:ListItem>Madam</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="titleRequiredFieldValidator" runat="server" 
                    ControlToValidate="titleDropDownList" ErrorMessage="Please choose title." 
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="updateButton" runat="server" onclick="updateButton_Click" 
                    Text="Update" />
            </td>
        </tr>
    </table>
    <asp:Label ID="messageLabel" runat="server"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary" runat="server" />
</asp:Content>

