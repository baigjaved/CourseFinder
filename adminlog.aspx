<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="adminlog.aspx.cs" Inherits="adminlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width: 100%">
            <tr>
                <td>
                    
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="ADMIN LOGIN" Font-Italic="True" Font-Underline="True"></asp:Label>
                    </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
            <td style="width: 407px">&nbsp;</td>
            <td style="width: 323px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 407px">
                <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
            </td>
            <td style="width: 323px">
                <asp:TextBox ID="txtusername1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername1" ErrorMessage="Enter username"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 407px">
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            </td>
            <td style="width: 323px">
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="Enter password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 407px; height: 33px;"></td>
            <td style="width: 323px; height: 33px;">
                <asp:Button ID="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Login" />
            </td>
            <td style="height: 33px"></td>
        </tr>
        <tr>
            <td style="width: 407px">&nbsp;</td>
            <td style="width: 323px">
                <asp:Label ID="lblmessage" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</form>
</asp:Content>

