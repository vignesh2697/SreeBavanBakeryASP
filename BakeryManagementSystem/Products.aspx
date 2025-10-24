<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Bakery.Products" %>

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
    <form id="form1" method="post" runat="server" name="contact-us" action="Products.aspx">
        <div class="boxed-page">
            <nav id="navbar-header" class="navbar navbar-expand-lg">
                <div class="container">
                    <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
                        <a class="navbar-brand navbar-brand-center d-flex align-items-center only-desktop" href="#">
                            <img src="img/logo2.png" alt="" />
                        </a>
                        <ul class="navbar-nav d-flex justify-content-around">
                            <li class="d-flex flex-lg-row flex-column">
                                <div class="nav-item">
                                    <a class="nav-link" href="Billing.aspx">Billing</a>
                                </div>
                                <div class="nav-item">
                                    <a class="nav-link" href="Customers.aspx">Customers</a>
                                </div>
                                <div class="nav-item active">
                                    <a class="nav-link" href="Products.aspx">Products<span class="sr-only">(current)</span></a>
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
                    <div class="col-lg-12">
                        <div class="section-content bg-white p-5 shadow">
                            <div class="heading-section text-center">
                                <h2>Products</h2>
                            </div>
                            <div class="row">
                                <div class="col-md-3 form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Product Name:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <asp:TextBox ID="txt_productName" runat="server" placeholder="Enter Product Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-3 form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Quantity:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <asp:TextBox ID="txt_Quantity" runat="server" placeholder="Quantity" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                </div>
                                <div class="col-md-3 form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Cost:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <asp:TextBox ID="txt_Cost" runat="server" placeholder="Product Cost" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-3 form-group">
                                    <asp:Label ID="Label4" runat="server" Text="Expiry Date:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <asp:TextBox ID="dtp_expiryDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row align-items-center">
                                <div class="col-md-3 form-group">
                                    <asp:Label ID="Label5" runat="server" Text="Category:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <div class=" input-group-append">
                                        <asp:DropDownList ID="cmb_categoryName" CssClass="form-control dropdown-toggle" runat="server" AutoPostBack="True"></asp:DropDownList>
                                        <asp:ImageButton ID="btn_addCate" runat="server" ImageAlign="Top" ImageUrl="~/img/Add properties.png" CssClass="btn btn-outline-info" Height="38" OnClick="btn_addCate_Click" />
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <asp:Label ID="Label6" runat="server" Text="Product Image:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <asp:FileUpload ID="OpenFileDialog" runat="server" onchange="imagepreview(this);" CssClass="form-control-sm" />
                                </div>
                                <div class="col-md-5 form-group align-self-sm-auto">
                                    <asp:Image ID="pictureBox1" runat="server" CssClass="img-fluid" Height="60px" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 text-center btn-group-sm">
                                    <asp:Button ID="btn_Save" runat="server" Text="Save" CssClass="btn btn-primary btn-shadow btn-lg" type="submit" OnClick="btn_Save_Click" />
                                    <asp:Button ID="btn_Delete" runat="server" Text="Delete" CssClass="btn btn-warning btn-shadow btn-lg" type="submit" OnClick="btn_Delete_Click" />
                                </div>
                                <div class="col-md-12">
                                    <asp:GridView ID="dgv_productList" runat="server" AutoGenerateColumns="False"
                                        CssClass="table table-sm table-condensed table-hover"
                                        AutoGenerateSelectButton="True" BackColor="White"
                                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                        EmptyDataText="Record Not Found..." DataKeyNames="ID,Product Image,Product Name"
                                        AllowPaging="True" PageSize="8"
                                        Font-Size="10pt" OnSelectedIndexChanged="dgv_productList_SelectedIndexChanged" OnPageIndexChanging="dgv_productList_PageIndexChanging" OnRowCommand="dgv_productList_RowCommand" RowStyle-HorizontalAlign="Center">
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />

                                        <PagerStyle BackColor="White" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                        <Columns>
                                            <asp:BoundField DataField="Sr" HeaderText="Sr" ReadOnly="True" />
                                            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" ReadOnly="True" />
                                            <asp:BoundField DataField="Product Name" HeaderText="Product Name" ReadOnly="True" />
                                            <asp:BoundField DataField="Category Name" HeaderText="Category Name" ReadOnly="True" />
                                            <asp:BoundField DataField="Cost" HeaderText="Cost" ReadOnly="True" />
                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True" />
                                            <asp:BoundField DataField="Expiry Date" HeaderText="Expiry Date" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
                                            <asp:ImageField DataImageUrlField="Product Image" HeaderText="Product Image" ReadOnly="True" ItemStyle-HorizontalAlign="Center">
                                                <ControlStyle Height="30px" />
                                            </asp:ImageField>
                                        </Columns>
                                    </asp:GridView>
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