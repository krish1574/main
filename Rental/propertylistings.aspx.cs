using System;
using System.Collections.Generic;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Rental
{
    public partial class propertylistings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPropertiesFromDatabase();
            }
        }

        private void LoadPropertiesFromDatabase()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString; // Replace with your connection string name

            List<Property> properties = new List<Property>();

            string query = @"
                SELECT PropertyID, PropertyName, Address, CoverPhoto, Remarks, Price
                FROM Properties
                WHERE IsApproved = 1"; // Only approved properties

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            Property property = new Property
                            {
                                PropertyID = Convert.ToInt32(reader["PropertyID"]), // Add PropertyID
                                Title = reader["PropertyName"].ToString(),
                                Location = reader["Address"].ToString(),
                                ImageUrl = reader["CoverPhoto"].ToString(),
                                Description = reader["Remarks"].ToString(),
                                BHK2Price = "₹" + reader["Price"].ToString(), // Assuming Price is for 2BHK
                                BHK3Price = "₹" + (Convert.ToDecimal(reader["Price"]) * 1.25m).ToString(), // Example: 25% more for 3BHK
                                // You might need to adjust the price logic based on your database structure
                            };
                            properties.Add(property);
                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception (log it, display an error message, etc.)
                        // Example: lblError.Text = "Error loading properties: " + ex.Message;
                        Console.WriteLine("Error loading properties: " + ex.Message);
                    }
                }
            }

            foreach (var property in properties)
            {
                HtmlGenericControl colDiv = new HtmlGenericControl("div");
                colDiv.Attributes["class"] = "col-md-4"; // Adjust as needed

                HtmlGenericControl cardDiv = new HtmlGenericControl("div");
                cardDiv.Attributes["class"] = "property-card";

                HtmlImage img = new HtmlImage();
                img.Src = property.ImageUrl;

                HtmlGenericControl cardBodyDiv = new HtmlGenericControl("div");
                cardBodyDiv.Attributes["class"] = "property-card-body";

                HtmlGenericControl title = new HtmlGenericControl("h5");
                title.InnerText = property.Title;

                HtmlGenericControl location = new HtmlGenericControl("p");
                location.InnerText = property.Location;

                HtmlGenericControl details = new HtmlGenericControl("p");
                details.InnerText = property.Description;

                HtmlAnchor link = new HtmlAnchor();
                // Pass the property ID in the query string
                link.HRef = "PropertyDetails.aspx?PropertyID=" + property.PropertyID;
                link.InnerText = "View Details";
                link.Attributes["class"] = "btn btn-primary";

                cardBodyDiv.Controls.Add(title);
                cardBodyDiv.Controls.Add(location);
                cardBodyDiv.Controls.Add(details);
                cardBodyDiv.Controls.Add(link);

                cardDiv.Controls.Add(img);
                cardDiv.Controls.Add(cardBodyDiv);
                colDiv.Controls.Add(cardDiv);

                propertyList.Controls.Add(colDiv);
            }
        }

        public class Property
        {
            public int PropertyID { get; set; } // Add PropertyID
            public string ImageUrl { get; set; }
            public string Title { get; set; }
            public string Location { get; set; }
            public string BHK2Price { get; set; }
            public string BHK3Price { get; set; }
            public string Nearby { get; set; }
            public string Description { get; set; }
            public string Builder { get; set; }
            public bool NewBooking { get; set; }
        }
    }
}