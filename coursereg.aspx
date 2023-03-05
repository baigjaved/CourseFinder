<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="coursereg.aspx.cs" Inherits="coursereg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <table style="width: 100%">
            <tr>
                <td style="width: 203px">&nbsp;</td>
                <td style="width: 489px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">
                    <asp:Label ID="Label1" runat="server" Text="Course Type"></asp:Label>
                </td>
                <td style="width: 489px">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem>Professional</asp:ListItem>
                        <asp:ListItem>Non-Professional</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">
                    <asp:Label ID="Label2" runat="server" Text="Course Name"></asp:Label>
                </td>
                <td style="width: 489px">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">&nbsp;</td>
                <td style="width: 489px">
                    <asp:Button ID="btnselect" runat="server" Text="Select Branch" OnClick="btnselect_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">
                    <asp:Label ID="Label3" runat="server" Text="Branch"></asp:Label>
                </td>
                <td style="width: 489px">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">&nbsp;</td>
                <td style="width: 489px">
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:GridView ID="GridView1" runat="server" Width="636px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowCommand="GridView1_RowCommand">
                            <AlternatingRowStyle BackColor="Gainsboro" />
                            <Columns>
                                <asp:BoundField DataField="college_id" HeaderText="College_ID" />
                                <asp:BoundField DataField="name" HeaderText="Name" />
                                <asp:BoundField DataField="address" HeaderText="Address" />
                                <asp:BoundField DataField="city" HeaderText="City" />
                                <asp:BoundField DataField="email" HeaderText="Email" />
                                <asp:BoundField DataField="mobileno" HeaderText="Mobile No" />
                                <asp:BoundField DataField="nacc_grade" HeaderText="NACC_Grade" />
                                <asp:ImageField DataImageUrlField="image" HeaderText="Image">
                                    <ControlStyle Height="150px" Width="150px" />
                                </asp:ImageField>
                                <asp:ButtonField CommandName="select" Text="Select" />
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">
                    <asp:Label ID="Label4" runat="server" Text="College id"></asp:Label>
                </td>
                <td style="width: 489px">
                    <asp:TextBox ID="txtclgid" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">
                    <asp:Label ID="Label5" runat="server" Text="College name"></asp:Label>
                </td>
                <td style="width: 489px">
                    <asp:TextBox ID="txtclgname" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">
                    <asp:Label ID="Label6" runat="server" Text="City"></asp:Label>
                </td>
                <td style="width: 489px">
                    <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">
                    <asp:Label ID="Label7" runat="server" Text="Email id"></asp:Label>
                </td>
                <td style="width: 489px">
                    <asp:TextBox ID="txtemailid" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">
                    <asp:Label ID="Label8" runat="server" Text="Mobile No"></asp:Label>
                </td>
                <td style="width: 489px">
                    <asp:TextBox ID="txtmobileno" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px; height: 29px;">
                    <asp:Label ID="Label9" runat="server" Text="Fees"></asp:Label>
                </td>
                <td style="width: 489px; height: 29px;">
                    <asp:TextBox ID="txtfees" runat="server"></asp:TextBox>
                </td>
                <td style="height: 29px"></td>
            </tr>
            <tr>
                <td style="width: 203px">
                    <asp:Label ID="Label10" runat="server" Text="Duration"></asp:Label>
                </td>
                <td style="width: 489px">
                    <asp:TextBox ID="txtduration" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">
                    <asp:Label ID="Label11" runat="server" Text="Image"></asp:Label>
                </td>
                <td style="width: 489px">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="300px" Width="300px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">&nbsp;</td>
                <td style="width: 489px">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                </td>
                <td>
                    <asp:Button ID="btnclear" runat="server" Text="Clear" />
                </td>
            </tr>
            <tr>
                <td style="width: 203px">&nbsp;</td>
                <td style="width: 489px">
                    <asp:Label ID="lblmessage" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">&nbsp;</td>
                <td style="width: 489px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 203px">&nbsp;</td>
                <td style="width: 489px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

