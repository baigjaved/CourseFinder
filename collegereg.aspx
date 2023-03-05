<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="collegereg.aspx.cs" Inherits="collegereg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <table style="width: 100%">
            <tr>
                <td style="background-color: #FFFFFF">
                    &nbsp;</td>
                </tr>
            <tr>
                <td style="width: 211px">&nbsp;</td>
                <td style="width: 311px">
                <asp:Label ID="Label9" runat="server" Font-Italic="True" Font-Names="Comic Sans MS" Font-Underline="True" Text="College Information" Font-Bold="True"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 211px">
                    <asp:Label ID="Label1" runat="server" Text="college_id"></asp:Label>
                </td>
                <td style="width: 311px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 211px">
                    <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                </td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 211px">
                    <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
                </td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtaddress" ErrorMessage="Enter Address"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 211px">
                    <asp:Label ID="Label4" runat="server" Text="City"></asp:Label>
                </td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcity" ErrorMessage="Enter city name"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 211px">
                    <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
                </td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="enter email id in correct format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 211px">
                    <asp:Label ID="Label6" runat="server" Text="Mobile No"></asp:Label>
                </td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtmobileno" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtmobileno" ErrorMessage="Enter mobile no" MaximumValue="9999999999" MinimumValue="6000000000"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 211px">
                    <asp:Label ID="Label7" runat="server" Text="nacc_grade"></asp:Label>
                </td>
                <td style="width: 311px">
                    <asp:TextBox ID="txtnaccgrade" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 211px">
                    <asp:Label ID="Label8" runat="server" Text="Image"></asp:Label>
                </td>
                <td style="width: 311px">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td>
                    <asp:ImageButton ID="Image1" runat="server" Height="200px" Width="200px" />
                </td>
            </tr>
            <tr>
                <td style="width: 211px">&nbsp;</td>
                <td style="width: 311px">
                    <asp:Button ID="btnupload" runat="server" Text="Upload" OnClick="btnupload_Click" />
                </td>
                <td>
                    <asp:Button ID="btncancel" runat="server" Text="Cancel" />
                </td>
            </tr>
            <tr>
                <td style="width: 211px">&nbsp;</td>
                <td style="width: 311px">
                    <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 211px">&nbsp;</td>
                <td style="width: 311px">
                    <asp:Label ID="lblmessage" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

