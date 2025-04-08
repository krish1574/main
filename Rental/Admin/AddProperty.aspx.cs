using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Text.RegularExpressions;

namespace Rental.Admin
{
    public partial class AddProperty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialization logic if needed
        }

        protected void btnAddProperty_Click(object sender, EventArgs e)
        {
            // 1. Validate Input Fields
            if (string.IsNullOrWhiteSpace(txtPropertyName.Text))
            {
                lblMessage.Text = "Property Name is required.";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtOwnerName.Text))
            {
                lblMessage.Text = "Owner Name is required.";
                return;
            }

            if (!string.IsNullOrWhiteSpace(txtAge.Text) && !int.TryParse(txtAge.Text, out _))
            {
                lblMessage.Text = "Invalid Age format.";
                return;
            }

            string coverPhotoPath = "";
            if (fileUploadCoverPhoto.HasFile)
            {
                string fileName = Path.GetFileName(fileUploadCoverPhoto.FileName);
                string fileExtension = Path.GetExtension(fileName).ToLower();

                if (fileExtension != ".jpg" && fileExtension != ".jpeg" && fileExtension != ".png")
                {
                    lblMessage.Text = "Invalid file type. Please upload a .jpg, .jpeg, or .png file.";
                    return;
                }

                if (fileUploadCoverPhoto.PostedFile.ContentLength > 2097152) // 2MB limit
                {
                    lblMessage.Text = "File size exceeds 2MB.";
                    return;
                }

                try
                {
                    coverPhotoPath = Server.MapPath("~/Uploads/") + fileName;
                    fileUploadCoverPhoto.SaveAs(coverPhotoPath);
                    coverPhotoPath = "~/Uploads/" + fileName;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error uploading file: " + ex.Message;
                    return;
                }
            }
            else
            {
                lblMessage.Text = "Cover Photo is required.";
                return;
            }

            if (!decimal.TryParse(txtPrice.Text, out decimal price) || price <= 0)
            {
                lblMessage.Text = "Invalid Price format.";
                return;
            }

            if (!int.TryParse(txtSquareFT.Text, out int squareFT) || squareFT <= 0)
            {
                lblMessage.Text = "Invalid Square Feet format.";
                return;
            }

            if (!int.TryParse(txtRoom.Text, out int room) || room <= 0)
            {
                lblMessage.Text = "Invalid Room format.";
                return;
            }

            if (!int.TryParse(txtBathroom.Text, out int bathroom) || bathroom <= 0)
            {
                lblMessage.Text = "Invalid Bathroom format.";
                return;
            }

            if (!DateTime.TryParse(txtFromDate.Text, out DateTime fromDate))
            {
                lblMessage.Text = "Invalid From Date format.";
                return;
            }

            if (!DateTime.TryParse(txtToDate.Text, out DateTime toDate))
            {
                lblMessage.Text = "Invalid To Date format.";
                return;
            }

            if (fromDate >= toDate)
            {
                lblMessage.Text = "From Date must be before To Date.";
                return;
            }

            if (string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                lblMessage.Text = "Address is required.";
                return;
            }

            if (!float.TryParse(txtLongitude.Text, out float longitude))
            {
                lblMessage.Text = "Invalid Longitude format.";
                return;
            }

            if (!float.TryParse(txtLatitude.Text, out float latitude))
            {
                lblMessage.Text = "Invalid Latitude format.";
                return;
            }

            if (!Regex.IsMatch(txtOwnerMobile.Text, @"^\d{10}$"))
            {
                lblMessage.Text = "Invalid Mobile Number format.";
                return;
            }

            // 2. Database Connection and Insert Query
            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

            string insertQuery = @"
                INSERT INTO Properties (
                    PropertyName, PropertyOwnerName, PropertyAge, CoverPhoto, Remarks, IsApproved, Price, SquareFT, Room, Bathroom, FromDate, ToDate, Address, Longitude, Latitude, OwnerMobileNo
                ) VALUES (
                    @PropertyName, @OwnerName, @Age, @CoverPhoto, @Remarks, @IsApproved, @Price, @SquareFT, @Room, @Bathroom, @FromDate, @ToDate, @Address, @Longitude, @Latitude, @OwnerMobileNo
                )";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@PropertyName", txtPropertyName.Text);
                    command.Parameters.AddWithValue("@OwnerName", txtOwnerName.Text);
                    command.Parameters.AddWithValue("@Age", txtAge.Text);
                    command.Parameters.AddWithValue("@CoverPhoto", coverPhotoPath);
                    command.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
                    command.Parameters.AddWithValue("@IsApproved", chkIsApproved.Checked);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@SquareFT", squareFT);
                    command.Parameters.AddWithValue("@Room", room);
                    command.Parameters.AddWithValue("@Bathroom", bathroom);
                    command.Parameters.AddWithValue("@FromDate", fromDate);
                    command.Parameters.AddWithValue("@ToDate", toDate);
                    command.Parameters.AddWithValue("@Address", txtAddress.Text);
                    command.Parameters.AddWithValue("@Longitude", longitude);
                    command.Parameters.AddWithValue("@Latitude", latitude);
                    command.Parameters.AddWithValue("@OwnerMobile", txtOwnerMobile.Text);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        lblMessage.Text = "Property added successfully!";
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                    }
                }
            }
        }
    }
}