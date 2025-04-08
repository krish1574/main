<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProperty.aspx.cs" Inherits="Rental.Admin.AddProperty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel - Add Property</title>
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

        .admin-header {
            background-color: #f0f0f0;
            color: #333;
            padding: 15px 20px;
            border-bottom: 1px solid #ddd;
        }

        .admin-header h1 {
            font-size: 1.5em;
            margin: 0;
        }

        .admin-panel-container {
            padding: 40px 20px;
            margin-top: 40px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="date"],
        .form-group textarea,
        .form-group .form-control-file {
            width: 100%;
            padding: 10px;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-group textarea {
            resize: vertical;
        }

        .form-group .form-check {
            margin-top: 5px;
        }

        .form-group .form-check label {
            display: inline-block;
            margin-left: 5px;
            font-weight: normal;
        }

        .admin-panel-container .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            transition: background-color 0.3s ease;
        }

        .admin-panel-container .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        footer {
            text-align: center;
            padding: 20px 0;
            background-color: rgba(255, 255, 255, 0.9);
            color: #343a40;
        }

        .error-message {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="admin-header">
            <h1>Admin Panel - Add Property</h1>
        </div>

        <div class="container admin-panel-container">
            <div class="form-group">
                <asp:Label ID="lblPropertyName" runat="server" Text="Property Name:"></asp:Label>
                <asp:TextBox ID="txtPropertyName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblOwnerName" runat="server" Text="Property Owner Name:"></asp:Label>
                <asp:TextBox ID="txtOwnerName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblAge" runat="server" Text="Property Age:"></asp:Label>
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblCoverPhoto" runat="server" Text="Cover Photo:"></asp:Label>
                <asp:FileUpload ID="fileUploadCoverPhoto" runat="server" CssClass="form-control-file" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblRemarks" runat="server" Text="Remarks:"></asp:Label>
                <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group form-check">
                <asp:CheckBox ID="chkIsApproved" runat="server" CssClass="form-check-input" />
                <asp:Label ID="lblIsApproved" runat="server" Text="Is Approved" CssClass="form-check-label"></asp:Label>
            </div>

            <div class="form-group">
                <asp:Label ID="lblPrice" runat="server" Text="Price:"></asp:Label>
                <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblSquareFT" runat="server" Text="Square FT:"></asp:Label>
                <asp:TextBox ID="txtSquareFT" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblRoom" runat="server" Text="Room:"></asp:Label>
                <asp:TextBox ID="txtRoom" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblBathroom" runat="server" Text="Bathroom:"></asp:Label>
                <asp:TextBox ID="txtBathroom" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblFromDate" runat="server" Text="From Date:"></asp:Label>
                <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblToDate" runat="server" Text="To Date:"></asp:Label>
                <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblLongitude" runat="server" Text="Longitude:"></asp:Label>
                <asp:TextBox ID="txtLongitude" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblLatitude" runat="server" Text="Latitude:"></asp:Label>
                <asp:TextBox ID="txtLatitude" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblOwnerMobile" runat="server" Text="Owner Mobile No:"></asp:Label>
                <asp:TextBox ID="txtOwnerMobile" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <asp:Button ID="btnAddProperty" runat="server" Text="Add Property" CssClass="btn btn-primary" OnClick="btnAddProperty_Click" />
            <asp:Label ID="lblMessage" runat="server" Text="" CssClass="error-message"></asp:Label>
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