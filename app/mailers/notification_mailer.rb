class NotificationMailer < ApplicationMailer
  default from: "no-reply@mcplawi.com"

  def registration_added
    mail(to: "wcarlsondev@gmail.com",
      subject: "A registration has been added for a MCPLAWI event!")
  end
end
