<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="propertylistings.aspx.cs" Inherits="Rental.propertylistings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rental - Property Listings</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #343a40;
            line-height: 1.6;
        }

        header {
            background-color: rgba(255, 255, 255, 0.9);
            color: #343a40;
            padding: 20px 30px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .logo img {
            height: 60px;
            margin-right: 20px;
        }

        .navbar-links a {
            color: #343a40;
            text-decoration: none;
            margin-left: 20px;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar-links a:hover {
            background-color: #e9ecef;
        }

        .property-list-container {
            padding: 40px 20px;
            margin-top: 40px;
        }

        .property-card {
            border: 1px solid #dee2e6;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .property-card:hover {
            transform: translateY(-5px);
        }

        .property-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .property-card-body {
            padding: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        footer {
            text-align: center;
            padding: 20px 0;
            background-color: rgba(255, 255, 255, 0.9);
            color: #343a40;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="d-flex justify-content-between align-items-center">
            <div id="headerDiv" runat="server" class="d-flex align-items-center">
                <div class="logo">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/a/a7/Apartment_Buildings_in_Seattle.jpg" alt="Rental Logo" />
                </div>
                <div class="navbar-links">
                    <asp:HyperLink ID="HomeLink" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
                    <asp:HyperLink ID="PropertyLink" runat="server" NavigateUrl="~/PropertyList.aspx">Properties</asp:HyperLink>
                    <asp:HyperLink ID="AboutLink" runat="server" NavigateUrl="~/About.aspx">About Us</asp:HyperLink>
                    <asp:HyperLink ID="ContactLink" runat="server" NavigateUrl="~/Contact.aspx">Contact Us</asp:HyperLink>
                </div>
            </div>
            <div class="navbar-links">
                <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
                <asp:HyperLink ID="RegisterLink" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
            </div>
        </header>

        <div class="container property-list-container">
            <h2>Property Listings</h2>
            <div id="propertyList" runat="server" class="row">
                </div>
        </div>

        <footer class="mt-5">
            <p>&copy; <%= DateTime.Now.Year %> Rental Website. All rights reserved.</p>
        </footer>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Optional: Add animation on scroll using animate.css
        $(window).scroll(function () {
            $('.property-card').each(function () {
                var position = $(this).offset().top;
                var scroll = $(window).scrollTop();
                if (position < scroll + 600) {
                    $(this).addClass('animate__animated animate__fadeInUp');
                }
            });
        });
    </script>
</body>
</html>