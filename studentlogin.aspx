<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="studentlogin.aspx.cs" Inherits="studentlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <table style="width: 100%">
            <tr>
                <td style="width: 265px">
                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                </td>
                <td style="width: 322px">
                    <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername" ErrorMessage="Enter username"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 265px">
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                </td>
                <td style="width: 322px">
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="Enter password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 265px">&nbsp;</td>
                <td style="width: 322px">
                    <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Login" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 265px">&nbsp;</td>
                <td style="width: 322px">
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 265px">&nbsp;</td>
                <td style="width: 322px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

