<%@ Page Title="" Language="C#" MasterPageFile="~/student.master" AutoEventWireup="true" CodeFile="coursefav.aspx.cs" Inherits="coursefav" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Height="516px" Width="1166px" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="ID" />
                <asp:BoundField DataField="course_type" HeaderText="Course Type" />
                <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                <asp:BoundField DataField="branch" HeaderText="Branch" />
                <asp:BoundField DataField="college_id" HeaderText="College ID" />
                <asp:BoundField DataField="college_name" HeaderText="College Name" />
                <asp:BoundField DataField="fees" HeaderText="Fees" />
                <asp:BoundField DataField="college_email" HeaderText="College Email" />
                <asp:ImageField DataImageUrlField="image" HeaderText="Image">
                </asp:ImageField>
                <asp:ButtonField CommandName="select" HeaderText="Remove" Text="Remove from favourites" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <table style="width: 100%">
            <tr>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="75px" ImageUrl="~/images/img_377947.png" Width="179px" OnClick="ImageButton1_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Confirm and send email"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>


