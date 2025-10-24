<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="Bakery.Billing" %>

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
    <form id="form1" method="post" runat="server" name="contact-us" action="Billing.aspx">
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
                                    <a class="nav-link" href="Billing.aspx">Billing<span class="sr-only">(current)</span></a>
                                </div>
                                <div class="nav-item">
                                    <a class="nav-link" href="Customers.aspx">Customers</a>
                                </div>
                                <div class="nav-item">
                                    <a class="nav-link" href="Products.aspx">Products</a>
                                </div>
                            </li>
                            <li class="d-flex flex-lg-row flex-column">
                                <div class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <asp:Label ID="lbl_Name" runat="server"></asp:Label></a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item text-center" href="user_Login.aspx">Logout</a>
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
                    <div class="col-lg-5">
                        <div class="section-content bg-white p-5 shadow">
                            <div class="heading-section text-center">
                                <h2>Billing</h2>
                            </div>
                            <asp:Label ID="Label7" runat="server" Text="Label" Visible="False"></asp:Label>
                            <div class="row">
                                <div class="col-md-8">
                                    <asp:Label ID="Label8" runat="server" Text="Product Name:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <asp:DropDownList ID="cmb_productList" CssClass="form-control dropdown-toggle" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cmb_productList_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 align-self-sm-auto">
                                    <asp:Image ID="pb_productImage" runat="server" CssClass="img-fluid" Height="60px" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8">
                                    <asp:Label ID="Label12" runat="server" Text="Category:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <asp:TextBox ID="txt_Category" runat="server" CssClass="form-control" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <asp:Label ID="Label9" runat="server" Text="Quantity:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <div class="form-group row">
                                        <div class="col-sm-12">
                                            <asp:TextBox ID="txt_Quantity" runat="server" placeholder="Quantity" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <asp:Label ID="Label10" runat="server" Text="Cost:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <div class="form-group row">
                                        <div class="input-group col-sm-12">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">₹</span>
                                            </div>
                                            <asp:TextBox ID="txt_Cost" runat="server" CssClass="form-control text-right" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <asp:Button ID="btn_Add" runat="server" Text="Add" CssClass="btn btn-primary btn-shadow btn-lg" type="submit" OnClick="btn_Add_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="section-content bg-white p-5 shadow">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:GridView ID="dgv_Billing" runat="server"
                                        CssClass="table table-sm table-condensed table-hover" BackColor="White"
                                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                        EmptyDataText="Record Not Found..."
                                        AllowPaging="True" PageSize="8"
                                        Font-Size="10pt" OnRowDataBound="dgv_Billing_RowDataBound">
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />

                                        <PagerStyle BackColor="#E0E0E0" ForeColor="#333333" HorizontalAlign="Right" CssClass="GridPager" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.N0">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txt_searchBox" runat="server" placeholder="Search" CssClass="form-control" OnTextChanged="txt_searchBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-6">
                                            <asp:DropDownList ID="cmb_cashOnline" CssClass="form-control" runat="server">
                                                <asp:ListItem Text="Please select" Value=""></asp:ListItem>
                                                <asp:ListItem Text="Cash" Value="Cash"></asp:ListItem>
                                                <asp:ListItem Text="Card" Value="Card"></asp:ListItem>
                                                <asp:ListItem Text="Online" Value="Online"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <asp:Table ID="Table1" runat="server" CssClass="table table-sm table-borderless">
                                        <asp:TableRow>
                                            <asp:TableCell>ID</asp:TableCell>
                                            <asp:TableCell>
                                                <asp:Label ID="txt_cusID" runat="server"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>Name</asp:TableCell>
                                            <asp:TableCell>
                                                <asp:Label ID="txt_cName" runat="server"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell>Mobile No</asp:TableCell>
                                            <asp:TableCell>
                                                <asp:Label ID="txt_cMNo" runat="server"></asp:Label>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-5">
                                            <asp:Label ID="Label2" runat="server" Text="Sub Total:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                        </div>
                                        <div class="input-group col-sm-7">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">₹</span>
                                            </div>
                                            <asp:TextBox ID="txt_Total" runat="server" CssClass="form-control text-right" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-5">
                                            <asp:Label ID="Label3" runat="server" Text="18% GST:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                        </div>
                                        <div class="input-group col-sm-7">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">₹</span>
                                            </div>
                                            <asp:TextBox ID="txt_GST" runat="server" CssClass="form-control text-right" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col-sm-5">
                                            <asp:Label ID="Label4" runat="server" Text="Total Amount:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                        </div>
                                        <div class="input-group col-sm-7">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">₹</span>
                                            </div>
                                            <asp:TextBox ID="txt_Final" runat="server" CssClass="form-control text-right" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <asp:Button ID="btn_Submit" runat="server" Text="Save" CssClass="btn btn-primary btn-shadow btn-lg" type="submit" OnClick="btn_Submit_Click" />
                                </div>
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