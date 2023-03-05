<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="editcollege.aspx.cs" Inherits="editcollege" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="865px" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="college_id" HeaderText="College_id" />
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="mobileno" HeaderText="Mobile No" />
                <asp:ImageField DataImageUrlField="image" HeaderText="Image">
                </asp:ImageField>
                <asp:ButtonField CommandName="select" HeaderText="Select" Text="Select" />
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
                <td style="width: 226px">&nbsp;</td>
                <td style="width: 394px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 226px">
                    <asp:Label ID="Label1" runat="server" Text="College_id"></asp:Label>
                </td>
                <td style="width: 394px">
                    <asp:TextBox ID="txtcollegeid" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 226px">
                    <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                </td>
                <td style="width: 394px">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 226px">
                    <asp:Label ID="Label3" runat="server" Text="Mobile No"></asp:Label>
                </td>
                <td style="width: 394px">
                    <asp:TextBox ID="txtmobileno" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 226px">&nbsp;</td>
                <td style="width: 394px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 226px">
                    <asp:Label ID="Label4" runat="server" Text="Image"></asp:Label>
                </td>
                <td style="width: 394px">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="250px" Width="250px" />
                </td>
            </tr>
            <tr>
                <td style="width: 226px">&nbsp;</td>
                <td style="width: 394px">
                    <asp:Button ID="btnupload" runat="server" Text="Upload" OnClick="btnupload_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 226px">&nbsp;</td>
                <td style="width: 394px">
                    <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" />
                </td>
                <td>
                    <asp:Button ID="btndelete" runat="server" Text="Delete" OnClick="btndelete_Click" />
                </td>
            </tr>
            <tr>
                <td style="width: 226px">
                    <asp:Label ID="lblmessage" runat="server"></asp:Label>
                </td>
                <td style="width: 394px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 226px">&nbsp;</td>
                <td style="width: 394px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

