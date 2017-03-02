class AdminMailer < ApplicationMailer

  DEFAULT_SUBJECT = 'Photography Admin - '
  default to: 'mayursingh1220@gmail.com'

  def enquiry(enquiry)
    @enquiry = enquiry
    mail(
        subject: "#{DEFAULT_SUBJECT} Contact us enquiry"
    )
  end

end