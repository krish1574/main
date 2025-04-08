using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Rental
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRandomPropertyImages();
                CheckUserSession(); //Check if the user is logged in
            }
        }

        private void LoadRandomPropertyImages()
        {
            List<string> imageURLs = new List<string>
            {
                "https://images.unsplash.com/photo-1568605114967-8130f3a369fc",
                "https://images.unsplash.com/photo-1570129477492-45c003edd2be",
                "https://images.unsplash.com/photo-1523217582562-09d0879aeb2f",
                "https://images.unsplash.com/photo-1598971488126-251f28681c55",
                "https://images.unsplash.com/photo-1560448227-11880718dd28",
                "https://images.unsplash.com/photo-1568602495029-c197694259ba",
                "https://images.unsplash.com/photo-1549517041-bc7235d28590"
            };

            Random random = new Random();
            int index1 = random.Next(imageURLs.Count);
            int index2 = random.Next(imageURLs.Count);
            int index3 = random.Next(imageURLs.Count);

            PropertyImage1.Src = imageURLs[index1];
            PropertyImage2.Src = imageURLs[index2];
            PropertyImage3.Src = imageURLs[index3];
        }

        private void CheckUserSession()
        {
            if (Session["UserID"] != null)
            {
                // User is logged in
                LoginLink.Visible = false; //Hide login link
                RegisterLink.Visible = false; //hide register link.

                //Add a logout button or link.
                HyperLink logoutLink = new HyperLink();
                logoutLink.Text = "Logout";
                logoutLink.NavigateUrl = "Logout.aspx"; // create logout.aspx file
                logoutLink.CssClass = "navbar-links";
                headerDiv.Controls.Add(logoutLink);
            }
            else
            {
                //User is not logged in.
                //make sure the login and register links are visible.
                LoginLink.Visible = true;
                RegisterLink.Visible = true;
            }
        }

    }
}