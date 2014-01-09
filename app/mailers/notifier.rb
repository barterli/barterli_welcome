class Notifier < ActionMailer::Base
  default from: "notice@barter.li"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.welocme_mail.subject
  #
  def welcome_mail(joiner)
    @asscociation_type = joiner.association_type
    mail to: joiner.email, subject: "Barter.li Registration"
  end
end
