<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Rental.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rental - Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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
            background-color: #ffffff;
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

        .hero {
            text-align: center;
            padding: 100px 20px;
            color: #343a40;
            border-radius: 10px;
            margin: 40px auto;
            max-width: 800px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-image: url('propertybackground.jpg'); /* hero background image */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white; /* Make text readable against the background */
            position: relative; /* For overlay */
        }

        .hero h1 {
            font-size: 3.5em;
            margin-bottom: 20px;
            color: #007bff;
        }

        .hero p {
            font-size: 1.2em;
            max-width: 600px;
            margin: 0 auto 30px;
        }

        .feature {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }

        .feature:hover {
            transform: translateY(-5px);
        }

        .feature img {
            height: 80px;
            margin-bottom: 15px;
        }

        footer {
            text-align: center;
            padding: 20px 0;
            background-color: #f8f9fa;
            color: #343a40;
        }

        .property-section, .services-section {
            background-color: #ffffff;
            padding: 40px 20px;
            margin-top: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .property-card, .service-card {
            border: 1px solid #dee2e6;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .property-card:hover, .service-card:hover {
            transform: translateY(-5px);
        }

        .property-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .property-card-body, .service-card {
            padding: 20px;
        }

        .service-card img {
            height: 100px;
            margin-bottom: 15px;
            object-fit: contain;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="d-flex justify-content-between align-items-center">
            <div id="headerDiv" runat="server" class="d-flex align-items-center">
                <div class="logo">
                    <img src="logo.jpg" alt="Rental Logo" />
                </div>
                <div class="navbar-links">
                    <asp:HyperLink ID="HomeLink" runat="server" NavigateUrl="~/Home.aspx">Home</asp:HyperLink>
                    <asp:HyperLink ID="PropertyLink" runat="server" NavigateUrl="~/propertylistings.aspx">Properties</asp:HyperLink>
                    <asp:HyperLink ID="AboutLink" runat="server" NavigateUrl="~/AboutUS.aspx">About Us</asp:HyperLink>
                    <asp:HyperLink ID="ContactLink" runat="server" NavigateUrl="~/Contact.aspx">Contact Us</asp:HyperLink>
                </div>
            </div>
            <div class="navbar-links">
                <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
                <asp:HyperLink ID="RegisterLink" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
            </div>
        </header>

        <div class="hero">
            <h1>Find Your Dream Home Today</h1>
            
            <p>Discover a curated selection of rental properties tailored to your lifestyle.</p>
            <asp:Button ID="ExploreButton" runat="server" Text="Explore Listings" CssClass="btn btn-primary btn-lg" />
        </div>

        <div class="container mt-5">
            <div class="row justify-content-around">
                <div class="col-md-4 mb-4">
                    <div class="feature">
                        <img src="https://cdn-icons-png.flaticon.com/512/25/25694.png" alt="Wide Selection" />
                        <h3>Wide Selection</h3>
                        <p>Explore a variety of listings to find your perfect match.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="feature">
                        <img src="https://cdn-icons-png.flaticon.com/512/107/107115.png" alt="Easy Search" />
                        <h3>Easy Search</h3>
                        <p>Filter and find properties based on your specific needs.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="feature">
                        <img src="https://cdn-icons-png.flaticon.com/512/272/272719.png" alt="Secure Transactions" />
                        <h3>Secure Transactions</h3>
                        <p>Enjoy safe and reliable rental processes.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="property-section container">
            <h2>Featured Properties</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="property-card">
                        <img id="PropertyImage1" runat="server" alt="Property Image" />
                        <div class="property-card-body">
                            <h3>Luxury Apartment</h3>
                            <p>Downtown living with stunning city views.</p>
                            <p>Price: $2,500/month</p>
                            <a href="#" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="property-card">
                        <img id="PropertyImage2" runat="server" alt="Property Image" />
                        <div class="property-card-body">
                            <h3>Cozy Family Home</h3>
                            <p>Spacious house in a quiet, family-friendly area.</p>
                            <p>Price: $1,800/month</p>
                            <a href="#" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="property-card">
                        <img id="PropertyImage3" runat="server" alt="Property Image" />
                        <div class="property-card-body">
                            <h3>Modern Studio</h3>
                            <p>Perfect for singles or couples, close to amenities.</p>
                            <p>Price: $1,200/month</p>
                            <a href="#" class="btn btn-primary">View Details</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="services-section container">
            <h2>Our Services</h2>
            <div class="row justify-content-around">
                <div class="col-md-4">
                    <div class="service-card">
                        <img src="https://cdn-icons-png.flaticon.com/512/3081/3081919.png" alt="Property Management" />
                        <h3>Property Management</h3>
                        <p>Comprehensive management services for your property.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <img src="https://cdn-icons-png.flaticon.com/512/2873/2873347.png" alt="Tenant Screening" />
                        <h3>Tenant Screening</h3>
                        <p>Rigorous screening to ensure reliable tenants.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-card">
                        <img src="https://cdn-icons-png.flaticon.com/512/4819/4819349.png" alt="Maintenance" />
                        <h3>Maintenance</h3>
                        <p>Prompt and professional maintenance services.</p>
                    </div>
                </div>
            </div>
        </div>

        <footer class="mt-5">
            <p>&copy; <%= DateTime.Now.Year %> Rental Website. All rights reserved.</p>
        </footer>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>