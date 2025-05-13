import subprocess
from email.message import EmailMessage

def send_email(subject: str, body: str, to: str, sender: str) -> None:
    """
    Send an email using sendmail.

    Parameters:
    subject (str): Subject of the email.
    body (str): Body of the email.
    to (str): Recipient email address.
    sender (str): Sender email address.
    """

    # Create the email message
    msg = EmailMessage()
    msg.set_content(body)
    msg['Subject'] = subject
    msg['From'] = sender
    msg['To'] = to

    # Use sendmail to send the email
    try:
        with subprocess.Popen(["/usr/sbin/sendmail", "-t", "-oi"], stdin=subprocess.PIPE) as p:
            p.communicate(msg.as_bytes())
            if p.returncode != 0:
                print(f"Sendmail process returned code {p.returncode}")
                return
            print("Email sent successfully.")
            return
    except Exception as e:
        print(f"An error occurred: {e}")

# Example usage
send_email(
    subject="Test Email",
    body="This is a test email from Python.",
    to="...",
    sender="..."
)
