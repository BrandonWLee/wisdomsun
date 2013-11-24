class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_email(name, email, subject, message)
    mail(to: email, 
         subject: subject,
         body: message,
         content_type: "text/html")
  end
end
