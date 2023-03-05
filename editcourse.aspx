<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="editcourse.aspx.cs" Inherits="editcourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="course_id" HeaderText="course_id" />
                    <asp:BoundField DataField="college_id" HeaderText="College_id" />
                    <asp:BoundField DataField="college_name" HeaderText="College" />
                    <asp:BoundField DataField="course_name" HeaderText="Course_name" />
                    <asp:BoundField DataField="fees" HeaderText="Fees" />
                    <asp:BoundField DataField="duration" HeaderText="Duration" />
                    <asp:ButtonField CommandName="select" Text="Select" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <table style="width: 100%">
                <tr>
                    <td style="width: 180px">&nbsp;</td>
                    <td style="width: 452px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 180px">
                        <asp:Label ID="Label1" runat="server" Text="Course_id"></asp:Label>
                    </td>
                    <td style="width: 452px">
                        <asp:TextBox ID="txtcourseid" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 180px">
                        <asp:Label ID="Label2" runat="server" Text="College_id"></asp:Label>
                    </td>
                    <td style="width: 452px">
                        <asp:TextBox ID="txtcollegeid" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 180px">
                        <asp:Label ID="Label3" runat="server" Text="Fees"></asp:Label>
                    </td>
                    <td style="width: 452px">
                        <asp:TextBox ID="txtfees" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 180px">
                        <asp:Label ID="Label4" runat="server" Text="Duration"></asp:Label>
                    </td>
                    <td style="width: 452px">
                        <asp:TextBox ID="txtduration" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 180px; height: 31px;"></td>
                    <td style="width: 452px; height: 31px;"></td>
                    <td style="height: 31px"></td>
                </tr>
                <tr>
                    <td style="width: 180px">
                        <asp:Button ID="btnupdate" runat="server" Height="50px" OnClick="btnupdate_Click" Text="Update" Width="100px" />
                    </td>
                    <td style="width: 452px">
                        <asp:Button ID="btndelete" runat="server" Height="50px" OnClick="btndelete_Click" Text="Delete" Width="100px" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 180px">
                        <asp:Label ID="lblmessage" runat="server"></asp:Label>
                    </td>
                    <td style="width: 452px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</asp:Content>

