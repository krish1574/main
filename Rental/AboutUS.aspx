<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUS.aspx.cs" Inherits="Rental.AboutUS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Aether Abodes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
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

        .about-container {
            padding: 40px 20px;
            margin: 40px auto;
            max-width: 900px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .about-section {
            margin-bottom: 30px;
        }

        .about-section h2 {
            color: #007bff;
            margin-bottom: 20px;
        }

        .about-section p {
            line-height: 1.8;
            color: #555;
        }

        .team-member {
            text-align: center;
            margin-bottom: 20px;
        }

        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
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
            <asp:HyperLink ID="PropertyLink" runat="server" NavigateUrl="~/PropertyListings.aspx">Properties</asp:HyperLink>
            <asp:HyperLink ID="AboutLink" runat="server" NavigateUrl="~/AboutUS.aspx">About Us</asp:HyperLink>
            <asp:HyperLink ID="ContactLink" runat="server" NavigateUrl="~/Contact.aspx">Contact Us</asp:HyperLink>
        </div>
    </div>
    <div class="navbar-links">
        <asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
        <asp:HyperLink ID="RegisterLink" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
    </div>
</header>

        <div class="container about-container">
            <h1>About Aether Abodes</h1>

            <div class="about-section">
                <h2>Our Story</h2>
                <p>Aether Abodes was born from a passion for creating exceptional living experiences. We understand that finding the perfect rental property is more than just a transaction; it's about discovering a place you can truly call home. Our journey began with a vision to connect people with properties that match their unique lifestyles and needs.</p>
            </div>

            <div class="about-section">
                <h2>Our Mission</h2>
                <p>Our mission is to provide a seamless and enjoyable rental experience. We strive to offer a curated selection of high-quality properties, transparent communication, and personalized service. We believe in building lasting relationships with our clients, both property owners and renters, based on trust and mutual respect.</p>
            </div>

            <div class="about-section">
                <h2>Our Vision</h2>
                <p>Our vision is to be the leading platform in the rental industry, setting the standard for innovation, customer satisfaction, and community building. We aspire to create a future where finding a home is effortless, and property management is efficient, contributing to a better living experience for everyone.</p>
            </div>

            <div class="about-section">
                <h2>Meet Our Team</h2>
                <div class="row">
                    <div class="col-md-4 team-member">
                        <img src="krish.jpg" alt="Team Member 1" />
                        <h3>Krish Vaghela</h3>
                    </div>
                    <div class="col-md-4 team-member">
                        <img src="oza.jpg" alt="Team Member 2" />
                        <h3>Meet Oza</h3>
                    </div>
                    <div class="col-md-4 team-member">
                        <img src="jay roognwla.jpg" alt="Team Member 3" />
                        <h3>Jay Rangoonwala</h3>
                    </div>
                    <div class="col-md-4 team-member">
                        <img src="jainil.jpg" alt="Team Member 3" />
                        <h3>Jainil Tailor</h3>
                    </div>
                    <div class="col-md-4 team-member">
                        <img src="daksh.jpg" alt="Team Member 3" />
                        <h3>DakshSinh Parmar</h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="container">
                <p>&copy; <%= DateTime.Now.Year %> Aether Abodes. All rights reserved.</p>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>