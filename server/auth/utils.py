import smtplib
from email.message import EmailMessage
import os

def send_html_verification_email(to_email, code):
    sender_email = "dev.test.jalen@gmail.com"
    sender_password = os.getenv("APP_PASS")

    msg = EmailMessage()
    msg['Subject'] = 'Your Verification Code'
    msg['From'] = sender_email
    msg['To'] = to_email

    # Plain text fallback
    msg.set_content(f'Your verification code is: {code}')

    # HTML content
    html = f"""\
    <html>
      <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px;">
        <div style="max-width: 600px; margin: auto; background-color: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
          <h2 style="color: #333;">Verification Code</h2>
          <p style="font-size: 16px; color: #555;">
            Please use the following code to verify your email address:
          </p>
          <div style="font-size: 28px; font-weight: bold; color: #4CAF50; margin: 20px 0;">
            {code}
          </div>
          <p style="font-size: 14px; color: #999;">
            This code will expire in 15 minutes. If you didn't request this, you can ignore this email.
          </p>
        </div>
      </body>
    </html>
    """
    msg.add_alternative(html, subtype='html')

    # Send the email
    server = smtplib.SMTP_SSL('smtp.gmail.com', 465)

    server.login(sender_email, sender_password)
    server.send_message(msg)
    server.quit()