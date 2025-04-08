using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace Rental
{
    public partial class PropertyDetailsFull : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPropertyDetails();
            }
        }

        private void LoadPropertyDetails()
        {
            int propertyId = 0;
            if (Request.QueryString["propertyId"] != null)
            {
                propertyId = Convert.ToInt32(Request.QueryString["propertyId"]);
                Console.WriteLine("Property ID: " + propertyId); // Debugging
            }
            else
            {
                Console.WriteLine("Property ID not found in query string."); // Debugging
                lblError.Text = "Property ID not found in query string.";
                return;
            }

            Property property = GetPropertyDetailsFromDatabase(propertyId);

            if (property != null)
            {
                propertyImage.ImageUrl = property.ImageUrl;
                propertyName.Text = property.Title;
                propertyLocation.Text = property.Location;
                propertyDescription.Text = property.Description;
                propertyPrice.Text = "₹" + property.Price.ToString();
                propertyAge.Text = property.Age.ToString();
                propertySquareFeet.Text = property.SquareFeet.ToString();
                propertyRooms.Text = property.Rooms.ToString();
                propertyBathrooms.Text = property.Bathrooms.ToString();
                propertyFromDate.Text = property.FromDate.ToShortDateString();
                propertyToDate.Text = property.ToDate.ToShortDateString();
                propertyLongitude.Text = property.Longitude.ToString();
                propertyLatitude.Text = property.Latitude.ToString();
                propertyOwnerMobile.Text = property.OwnerMobile;
                propertyOwnerName.Text = property.OwnerName;
            }
            else
            {
                propertyName.Text = "Property not found.";
                Console.WriteLine("Property object is null."); //debugging
                lblError.Text = "Property not found.";
            }
        }

        private Property GetPropertyDetailsFromDatabase(int propertyId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            Property property = null;

            string query = @"
                SELECT PropertyName, Address, CoverPhoto, Remarks, Price, PropertyAge, SquareFT, Room, Bathroom, FromDate, ToDate, Longitude, Latitude, OwnerMobileNo, PropertyOwnerName
                FROM Properties
                WHERE PropertyID = @PropertyID AND IsApproved = 1";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PropertyID", propertyId);

                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            property = new Property
                            {
                                Title = reader["PropertyName"].ToString(),
                                Location = reader["Address"].ToString(),
                                ImageUrl = reader["CoverPhoto"].ToString(),
                                Description = reader["Remarks"].ToString(),
                                Price = Convert.ToDecimal(reader["Price"]),
                                Age = Convert.ToInt32(reader["PropertyAge"]),
                                SquareFeet = Convert.ToInt32(reader["SquareFT"]),
                                Rooms = Convert.ToInt32(reader["Room"]),
                                Bathrooms = Convert.ToInt32(reader["Bathroom"]),
                                FromDate = Convert.ToDateTime(reader["FromDate"]),
                                ToDate = Convert.ToDateTime(reader["ToDate"]),
                                Longitude = Convert.ToDouble(reader["Longitude"]),
                                Latitude = Convert.ToDouble(reader["Latitude"]),
                                OwnerMobile = reader["OwnerMobileNo"].ToString(),
                                OwnerName = reader["PropertyOwnerName"].ToString()
                            };
                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Database error: " + ex.Message);
                        lblError.Text = "Database Error: " + ex.Message;
                    }
                }
            }
            return property;
        }

        protected void btnContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");
        }

        public class Property
        {
            public string ImageUrl { get; set; }
            public string Title { get; set; }
            public string Location { get; set; }
            public string Description { get; set; }
            public decimal Price { get; set; }
            public int Age { get; set; }
            public int SquareFeet { get; set; }
            public int Rooms { get; set; }
            public int Bathrooms { get; set; }
            public DateTime FromDate { get; set; }
            public DateTime ToDate { get; set; }
            public double Longitude { get; set; }
            public double Latitude { get; set; }
            public string OwnerMobile { get; set; }
            public string OwnerName { get; set; }
        }
    }
}