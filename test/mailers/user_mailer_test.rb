require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "reader_activation" do
    mail = UserMailer.reader_activation
    assert_equal "Reader activation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
