require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "welocme_mail" do
    mail = Notifier.welocme_mail
    assert_equal "Welocme mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
