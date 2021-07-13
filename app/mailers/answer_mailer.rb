class AnswerMailer < ApplicationMailer
  def send_mail(answer)
    @answer = answer
    mail to: answer.contact.email, subject: '【お問い合わせの回答】'
  end
end
