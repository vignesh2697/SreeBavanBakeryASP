<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="Bakery.Employees" %>

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
    <form id="form1" method="post" runat="server" name="contact-us" action="Employees.aspx">
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
                                    <a class="nav-link" href="Accounts.aspx">Accounts</a>
                                </div>
                                <div class="nav-item active">
                                    <a class="nav-link" href="Employees.aspx">Employees<span class="sr-only">(current)</span></a>
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
                                <h2>Employees</h2>
                            </div>
                            <div class="row">
                                <div class="col-md-3 form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Employee Name:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <asp:TextBox ID="txt_employeeName" runat="server" placeholder="Enter Employee Name" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-3 form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Mobile No:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <asp:TextBox ID="txt_mobileNo" runat="server" placeholder="Enter Mobile No" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                </div>
                                <div class="col-md-3 form-group">
                                    <asp:Label ID="Label6" runat="server" Text="DOB:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <asp:TextBox ID="dtp_DOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                </div>
                                <div class="col-md-3 form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Create Password:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <asp:TextBox ID="txt_Pwd" runat="server" placeholder="Enter password" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 form-group align-self-sm-auto">
                                    <asp:Label ID="Label7" runat="server" Text="Employee Photo:" Font-Bold="True" ForeColor="Black" Font-Size="Medium"></asp:Label>
                                    <asp:Image ID="pictureBox1" runat="server" CssClass="img-2" BorderStyle="Groove" BorderWidth="1" Width="100px" ImageUrl='~/img/login.png' />
                                    <asp:FileUpload ID="OpenFileDialog" runat="server" onchange="imagepreview(this);" CssClass=" form-control-sm" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 text-center btn-group-sm">
                                    <asp:Button ID="btn_Save" runat="server" Text="Save" CssClass="btn btn-primary btn-shadow btn-lg" type="submit" OnClick="btn_Save_Click" />
                                    <asp:Button ID="btn_Delete" runat="server" Text="Delete" CssClass="btn btn-warning btn-shadow btn-lg" type="submit" OnClick="btn_Delete_Click" />
                                </div>
                                <div class="col-md-12">
                                    <asp:GridView ID="dgv_employeeList" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="dgv_employeeList_PageIndexChanging"
                                        OnSelectedIndexChanged="dgv_employeeList_SelectedIndexChanged" OnRowCommand="dgv_employeeList_RowCommand"
                                        CssClass="table table-sm table-condensed table-hover"
                                        AutoGenerateSelectButton="True" BackColor="White"
                                        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                                        EmptyDataText="Record Not Found..." DataKeyNames="Emp ID,Emp Photo"
                                        AllowPaging="True" PageSize="2" Font-Size="10pt">
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
                                            <asp:BoundField DataField="Emp ID" HeaderText="Emp ID" Visible="false" ReadOnly="True" />
                                            <asp:BoundField DataField="Emp Name" HeaderText="Emp Name" ReadOnly="True" />
                                            <asp:BoundField DataField="DOB" HeaderText="DOB" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
                                            <asp:BoundField DataField="Mobile No" HeaderText="Mobile No" ReadOnly="True" />
                                            <asp:BoundField DataField="Password" HeaderText="Password" ReadOnly="True" />
                                            <asp:ImageField DataImageUrlField="Emp Photo" HeaderText="Emp Photo" ReadOnly="True">
                                                <ControlStyle Height="50px" Width="50px" />
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