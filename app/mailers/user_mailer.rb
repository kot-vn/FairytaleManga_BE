class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reader_activation.subject
  #
  def reader_activation(reader)
      @reader = reader
      mail to: reader.email , subject: "Ok"
  end
end
