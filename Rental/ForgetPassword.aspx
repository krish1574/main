<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Rental.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .forgot-password-container {
            width: 400px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-group label {
            color: #343a40;
            margin-bottom: 8px;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #dee2e6;
            padding: 10px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .error-message, .success-message {
            margin-top: 10px;
            text-align: center;
        }

        .error-message {
            color: red;
        }

        .success-message {
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="forgot-password-container">
            <h2 class="text-center mb-4">Forgot Password</h2>
            <div class="form-group">
                <label for="emailTextBox">Email:</label>
                <asp:TextBox ID="emailTextBox" runat="server" type="email" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="text-center">
                <asp:Button ID="resetPasswordButton" runat="server" Text="Reset Password" CssClass="btn btn-primary" OnClick="resetPasswordButton_Click" />
            </div>
            <asp:Label ID="errorLabel" runat="server" CssClass="error-message" Visible="false"></asp:Label>
            <asp:Label ID="successLabel" runat="server" CssClass="success-message" Visible="false"></asp:Label>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>