class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail to:   ENV['MYADDRESS'], subject: '【お問い合わせを受け付けました】'
  end
end
