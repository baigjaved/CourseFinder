<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="studentreg.aspx.cs" Inherits="studentreg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <table style="width: 100%">
            <tr>
                <td style="width: 227px">
                    <asp:Label ID="Label1" runat="server" Text="Student ID"></asp:Label>
                </td>
                <td style="width: 481px">
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
                <td style="width: 469px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 227px">
                    <asp:Label ID="Label3" runat="server" Text="Student_Name"></asp:Label>
                </td>
                <td style="width: 481px">
                    <asp:TextBox runat="server" ID="txtname"></asp:TextBox>
                </td>
                <td style="width: 469px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ErrorMessage="Enter Firstname"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 227px">
                    <asp:Label ID="Label4" runat="server" Text="Student_Lastname"></asp:Label>
                </td>
                <td style="width: 481px">
                    <asp:TextBox ID="txtlastname" runat="server"></asp:TextBox>
                </td>
                <td style="width: 469px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlastname" ErrorMessage="Enter Lastname"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 227px">
                    <asp:Label ID="Label5" runat="server" Text="Username/Email"></asp:Label>
                </td>
                <td style="width: 481px">
                    <asp:TextBox ID="txtusername" runat="server" AutoPostBack="True" OnTextChanged="txtusername_TextChanged"></asp:TextBox>
                </td>
                <td style="width: 469px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtusername" ErrorMessage="Enter Username"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtusername" ErrorMessage="Enter username in correct format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 227px">
                    <asp:Label ID="Label6" runat="server" Text="Date Of Birth"></asp:Label>
                </td>
                <td style="width: 481px">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Full" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" Width="400px" SelectedDate="1999-01-01" VisibleDate="1990-01-01">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                        <DayStyle Width="14%" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                        <TodayDayStyle BackColor="#CCCC99" />
                    </asp:Calendar>
                </td>
                <td style="width: 469px">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 227px; height: 64px;">
                    <asp:Label ID="Label7" runat="server" Text="Gender"></asp:Label>
                </td>
                <td style="width: 481px; height: 64px;">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td style="width: 469px; height: 64px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Select Gender"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 227px">
                    <asp:Label ID="Label8" runat="server" Text="Address"></asp:Label>
                </td>
                <td style="width: 481px">
                    <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td style="width: 469px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtaddress" ErrorMessage="Enter Address"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 227px">
                    <asp:Label ID="Label9" runat="server" Text="Mobile No"></asp:Label>
                </td>
                <td style="width: 481px">
                    <asp:TextBox ID="txtmobileno" runat="server"></asp:TextBox>
                </td>
                <td style="width: 469px">
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtmobileno" ErrorMessage="Enter valid Mobile number" MaximumValue="9999999999" MinimumValue="6000000000"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 227px; height: 29px;">
                    <asp:Label ID="Label10" runat="server" Text="City"></asp:Label>
                </td>
                <td style="width: 481px; height: 29px;">
                    <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                </td>
                <td style="width: 469px; height: 29px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter City Name" ControlToValidate="txtcity"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 227px">
                    <asp:Label ID="Label11" runat="server" Text="Pincode"></asp:Label>
                </td>
                <td style="width: 481px">
                    <asp:TextBox ID="txtpincode" runat="server"></asp:TextBox>
                </td>
                <td style="width: 469px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtpincode" ErrorMessage="Enter Pincode"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 227px">
                    <asp:Label ID="Label12" runat="server" Text="Password"></asp:Label>
                </td>
                <td style="width: 481px">
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td style="width: 469px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtpassword" ErrorMessage="Enter Password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 227px">
                    <asp:Label ID="Label13" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td style="width: 481px">
                    <asp:TextBox ID="txtconfirmpassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td style="width: 469px">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtconfirmpassword" ErrorMessage="Password does not match"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 227px">&nbsp;</td>
                <td style="width: 481px">
                    <asp:Button ID="btnsubmit" runat="server" Height="39px" OnClick="btnsubmit_Click" Text="Submit" Width="85px" />
                </td>
                <td style="width: 469px">
                    <asp:Button ID="btncancel" runat="server" Height="43px" OnClick="btncancel_Click" Text="Cancel" Width="91px" />
                </td>
            </tr>
            <tr>
                <td style="width: 227px">&nbsp;</td>
                <td style="width: 481px">
                    <asp:Label ID="lblmessage" runat="server"></asp:Label>
                </td>
                <td style="width: 469px">&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

