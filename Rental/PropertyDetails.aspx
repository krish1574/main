<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PropertyDetails.aspx.cs" Inherits="Rental.PropertyDetailsFull" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Property Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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

        .footer {
            background-color: #f0f0f0;
            padding: 20px 0;
            text-align: center;
            color: #555;
        }

        .property-details-container {
            padding: 40px 20px;
            margin: 40px auto;
            max-width: 900px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .property-image {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 30px;
        }

        .property-title {
            font-size: 2.5em;
            margin-bottom: 10px;
            color: #333;
        }

        .property-location {
            font-size: 1.2em;
            color: #6c757d;
            margin-bottom: 20px;
        }

        .property-description {
            margin-bottom: 30px;
            line-height: 1.8;
            color: #555;
        }

        .property-price {
            font-size: 1.8em;
            font-weight: bold;
            color: #28a745;
            margin-bottom: 20px;
        }

        .property-details-list {
            list-style: none;
            padding: 0;
        }

        .property-details-list li {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .property-details-list i {
            margin-right: 10px;
            color: #007bff;
            font-size: 1.2em;
            width: 20px;
        }

        .property-details-list strong {
            font-weight: 600;
            color: #333;
            width: 120px;
            display: inline-block;
        }

        .btn-contact {
            background-color: #007bff;
            border-color: #007bff;
            transition: background-color 0.3s ease;
            padding: 12px 25px;
            font-size: 1em;
            border-radius: 5px;
        }

        .btn-contact:hover {
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


        <div class="container property-details-container">
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            <asp:Image ID="propertyImage" runat="server" CssClass="property-image" />
            <asp:Label ID="propertyName" runat="server" CssClass="property-title"></asp:Label><br />
            <asp:Label ID="propertyLocation" runat="server" CssClass="property-location"></asp:Label><br />
            <asp:Label ID="propertyDescription" runat="server" CssClass="property-description"></asp:Label><br />
            <asp:Label ID="propertyPrice" runat="server" CssClass="property-price"></asp:Label><br />

            <ul class="property-details-list">
                <li><i class="fas fa-calendar-alt"></i><strong>Age:</strong> <asp:Label ID="propertyAge" runat="server"></asp:Label> years</li>
                <li><i class="fas fa-ruler-combined"></i><strong>Square Feet:</strong> <asp:Label ID="propertySquareFeet" runat="server"></asp:Label> sq ft</li>
                <li><i class="fas fa-bed"></i><strong>Rooms:</strong> <asp:Label ID="propertyRooms" runat="server"></asp:Label></li>
                <li><i class="fas fa-bath"></i><strong>Bathrooms:</strong> <asp:Label ID="propertyBathrooms" runat="server"></asp:Label></li>
                <li><i class="fas fa-calendar-check"></i><strong>From Date:</strong> <asp:Label ID="propertyFromDate" runat="server"></asp:Label></li>
                <li><i class="fas fa-calendar-times"></i><strong>To Date:</strong> <asp:Label ID="propertyToDate" runat="server"></asp:Label></li>
                <li><i class="fas fa-map-marker-alt"></i><strong>Longitude:</strong> <asp:Label ID="propertyLongitude" runat="server"></asp:Label></li>
                <li><i class="fas fa-map-marker-alt"></i><strong>Latitude:</strong> <asp:Label ID="propertyLatitude" runat="server"></asp:Label></li>
                <li><i class="fas fa-mobile-alt"></i><strong>Owner Mobile:</strong> <asp:Label ID="propertyOwnerMobile" runat="server"></asp:Label></li>
                <li><i class="fas fa-user"></i><strong>Owner Name:</strong> <asp:Label ID="propertyOwnerName" runat="server"></asp:Label></li>
            </ul>

            <div style="text-align: center;">
                <asp:Button ID="btnContact" runat="server" Text="Contact Us" CssClass="btn btn-primary btn-contact" OnClick="btnContact_Click" />
            </div>

        </div>

        <div class="footer">
            <div class="container">
                <p>&copy; <%= DateTime.Now.Year %> My Property Rental. All rights reserved.</p>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>