require 'test_helper'

class CommentsMailerTest < ActionMailer::TestCase
  test "submitted" do
    mail = CommentsMailer.submitted("Newer")
    assert_equal "Newer", mail.subject
    assert_equal ["sv@gmail.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    #assert_match "Newer", mail.body.encoded
  end

end
