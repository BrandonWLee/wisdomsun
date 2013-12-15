class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def contact_email(name, from, to, subject, message)
    mail(from: from,
         to: to, 
         subject: "'#{subject}' from #{name}",
         body: message,
         content_type: "text/plain")
  end
end
