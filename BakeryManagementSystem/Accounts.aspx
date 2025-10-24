<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="Bakery.Accounts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>SREE BAVAN BAKERY</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <link rel="stylesheet" href="vendor/bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" href="vendor/select2/select2.min.css" />
    <link rel="stylesheet" href="vendor/owlcarousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="css/style.min.css" />
    <link rel="stylesheet" href="css/cusStyle.css" type="text/css" />
    <link rel="stylesheet" href="https://cdn.rawgit.com/noelboss/featherlight/1.7.13/release/featherlight.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/brands.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700|Josefin+Sans:300,400,700" />
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" method="post" runat="server" name="contact-us" action="Accounts.aspx">
        <div class="boxed-page">
            <nav id="navbar-header" class="navbar navbar-expand-lg">
                <div class="container">
                    <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
                        <a class="navbar-brand navbar-brand-center d-flex align-items-center only-desktop" href="#">
                            <img src="img/logo2.png" alt="" />
                        </a>
                        <ul class="navbar-nav d-flex justify-content-around">
                            <li class="d-flex flex-lg-row flex-column">
                                <div class="nav-item active">
                                    <a class="nav-link" href="Accounts.aspx">Accounts<span class="sr-only">(current)</span></a>
                                </div>
                                <div class="nav-item">
                                    <a class="nav-link" href="Employees.aspx">Employees</a>
                                </div>
                            </li>
                            <li class="d-flex flex-lg-row flex-column">
                                <div class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <asp:Label ID="lbl_Name" runat="server"></asp:Label></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item text-center" href="admin_Login.aspx">Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>

        <section id="gtco-reservation" class="bg-fixed bg-white section-padding overlay">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-content bg-white p-5 shadow">
                            <div class="heading-section text-center">
                                <h2>Accounts</h2>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:GridView ID="dgv_billList" runat="server" AutoGenerateColumns="false" OnRowCommand="dgv_billList_RowCommand"
                                        OnPageIndexChanging="dgv_billList_PageIndexChanging" OnSelectedIndexChanged="dgv_billList_SelectedIndexChanged"
                                        CssClass="table table-sm table-condensed table-hover"
                                        AutoGenerateSelectButton="True" BackColor="White"
                                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                        EmptyDataText="Record Not Found..." DataKeyNames="ID"
                                        AllowPaging="True" PageSize="10" Font-Size="10pt">
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <RowStyle HorizontalAlign="Center" />
                                        <PagerStyle BackColor="#E0E0E0" ForeColor="#333333" HorizontalAlign="Right" CssClass="GridPager" />
                                        <PagerSettings Position="Bottom" />
                                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                        <Columns>
                                            <asp:BoundField DataField="Sr" HeaderText="Sr" ReadOnly="True" />
                                            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" ReadOnly="True" />
                                            <asp:BoundField DataField="Cus Name" HeaderText="Cus Name" ReadOnly="True" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100" />
                                            <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy hh:mm tt}" ReadOnly="True" ItemStyle-Wrap="false" />
                                            <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:C}" ReadOnly="True" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100" />
                                            <asp:BoundField DataField="Pay Mode" HeaderText="Pay Mode" ReadOnly="True" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="Billed by" HeaderText="Billed by" ReadOnly="True" ItemStyle-HorizontalAlign="Center" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="modal fade" id="mymodal" data-backdrop="false" role="dialog">
                    <div class=" modal-dialog modal-dailog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Bill Detail</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <asp:Table ID="Table1" runat="server" CssClass="table table-sm table-condensed table-hover" CellPadding="2" CellSpacing="5" Font-Size="Small" HorizontalAlign="Center">
                                    <asp:TableHeaderRow HorizontalAlign="Center" BorderWidth="1" BorderStyle="Ridge" BorderColor="#999999">
                                        <asp:TableHeaderCell>Bill No</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Bill Date</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Cus Name</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Amount</asp:TableHeaderCell>
                                        <asp:TableHeaderCell>Pay Mode</asp:TableHeaderCell>
                                    </asp:TableHeaderRow>
                                    <asp:TableRow HorizontalAlign="Center" BorderWidth="1" BorderStyle="Ridge" BorderColor="#999999">
                                        <asp:TableCell>
                                            <asp:Label ID="lbl_BillID" runat="server"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lbl_PurDate" runat="server"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lbl_CusName" runat="server"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lbl_TotAmt" runat="server"></asp:Label>
                                        </asp:TableCell>
                                        <asp:TableCell>
                                            <asp:Label ID="lbl_PayMode" runat="server"></asp:Label>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <asp:GridView ID="dgv_billDetail" runat="server" AutoGenerateColumns="False"
                                    CssClass="table table-sm table-condensed table-hover" BackColor="White"
                                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                    CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                    EmptyDataText="Record Not Found..." DataKeyNames="ID"
                                    AllowPaging="True" PageSize="8"
                                    Font-Size="10pt">
                                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="#E0E0E0" ForeColor="#333333" HorizontalAlign="Right" CssClass="GridPager" />
                                    <PagerSettings Position="Bottom" />
                                    <RowStyle HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#242121" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Nos" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Items" HeaderText="Items" ReadOnly="True" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True" />
                                        <asp:BoundField DataField="Rate" HeaderText="Rate" DataFormatString="{0:C}" ReadOnly="True">
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="Button1" runat="server" Text="Close" type="button" class="btn btn-primary" data-dismiss="modal" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer class="mastfoot pb-5 bg-white section-padding pb-0">
            <div class="inner container">
                <div class="row">
                    <div class="col-md-12 d-flex align-items-center">
                        <p class="mx-auto text-center mb-0">Copyright 2025. All Right Reserved.</p>
                    </div>
                </div>
            </div>
        </footer>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="js/app.min.js "></script>
        <script src="js/myScript.js" type="text/javascript"></script>
        <script src="vendor/bootstrap/popper.min.js"></script>
        <script src="vendor/bootstrap/bootstrap.min.js"></script>
        <script src="vendor/select2/select2.min.js "></script>
        <script src="vendor/owlcarousel/owl.carousel.min.js"></script>
        <script src="vendor/stellar/jquery.stellar.js" type="text/javascript" charset="utf-8"></script>
        <script src="https://cdn.rawgit.com/noelboss/featherlight/1.7.13/release/featherlight.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
    </form>
</body>
</html>