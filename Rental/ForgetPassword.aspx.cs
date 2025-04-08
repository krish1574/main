using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using BCrypt.Net;

namespace Rental
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void resetPasswordButton_Click(object sender, EventArgs e)
        {
            string email = emailTextBox.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                ShowError("Email is required.");
                return;
            }

            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Email", email);

                        int userCount = (int)command.ExecuteScalar();

                        if (userCount > 0)
                        {
                            string newPassword = GenerateRandomPassword();
                            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(newPassword);

                            string updateQuery = "UPDATE Users SET PasswordHash = @PasswordHash WHERE Email = @Email";

                            using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection))
                            {
                                updateCommand.Parameters.AddWithValue("@PasswordHash", hashedPassword);
                                updateCommand.Parameters.AddWithValue("@Email", email);

                                updateCommand.ExecuteNonQuery();
                            }

                            SendPasswordResetEmail(email, newPassword);
                            successLabel.Text = "A new password has been sent to your email.";
                            successLabel.Visible = true;
                            errorLabel.Visible = false;

                        }
                        else
                        {
                            ShowError("Email not found.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError("Password reset failed: " + ex.Message);
            }
        }

        private void ShowError(string message)
        {
            errorLabel.Text = message;
            errorLabel.Visible = true;
            successLabel.Visible = false;
        }

        private string GenerateRandomPassword()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            var password = new char[8];
            for (int i = 0; i < password.Length; i++)
            {
                password[i] = chars[random.Next(chars.Length)];
            }
            return new string(password);
        }

        private void SendPasswordResetEmail(string toEmail, string newPassword)
        {
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient(ConfigurationManager.AppSettings["SmtpServer"]);
                mail.From = new MailAddress(ConfigurationManager.AppSettings["SmtpUser"]);
                mail.To.Add(toEmail);
                mail.Subject = "Password Reset";
                mail.Body = "Your new password is: " + newPassword;

                SmtpServer.Port = int.Parse(ConfigurationManager.AppSettings["SmtpPort"]);
                SmtpServer.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["SmtpUser"], ConfigurationManager.AppSettings["SmtpPassword"]);
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
            }
            catch (Exception ex)
            {
                ShowError("Failed to send email: " + ex.ToString()); // show full error.
            }
        }
    }
}