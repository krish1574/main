<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Rental.Contact" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
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

        .contact-container {
            padding: 40px 20px;
            margin: 40px auto;
            max-width: 900px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .contact-form {
            margin-top: 20px;
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

        <div class="container contact-container">
            <h2>Contact Us</h2>

            <div class="contact-form">
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                <div class="form-group">
                    <label for="txtName">Name:</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtEmail">Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtMessage">Message:</label>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"></asp:TextBox>
                </div>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
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