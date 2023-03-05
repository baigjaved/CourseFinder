<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/student.master" AutoEventWireup="true" CodeFile="selectcourse.aspx.cs" Inherits="selectcourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <table style="width: 100%">
            <tr>
                <td style="width: 492px">
                    <asp:Label ID="Label1" runat="server" Text="Course Type"></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>Professional</asp:ListItem>
                        <asp:ListItem>Non-Professional</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td style="width: 492px">
                    <asp:Label ID="Label2" runat="server" Text="Course name"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 492px">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Select Branch" OnClick="Button1_Click" />
                </td>
            </tr>
            <tr>
                <td style="width: 492px">
                    <asp:Label ID="Label3" runat="server" Text="Branch"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 492px">&nbsp;</td>
                <td>
                    <asp:Button ID="btnshow" runat="server" Text="Show colleges" OnClick="btnshow_Click" />
                </td>
            </tr>
            <tr>
                <td style="width: 492px">&nbsp;</td>
                <td>
                    <asp:Panel ID="Panel1" runat="server">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="College_id" HeaderText="College_ID" />
                                <asp:BoundField DataField="course_name" HeaderText="Name" />
                                <asp:BoundField DataField="city" HeaderText="City" />
                                <asp:BoundField DataField="email" HeaderText="Email ID" />
                                <asp:BoundField DataField="mobileno" HeaderText="Mobile No" />
                                <asp:BoundField DataField="nacc_grade" HeaderText="NACC_GRADE" />
                                <asp:BoundField DataField="fees" HeaderText="Fees" />
                                <asp:BoundField DataField="duration" HeaderText="Duration" />
                                <asp:ImageField DataImageUrlField="image" HeaderText="Image">
                                </asp:ImageField>
                                <asp:ButtonField HeaderText="Select" Text="Add to favourites" CommandName="select" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td style="width: 492px">
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

