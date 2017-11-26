require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["radoslav@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match 'Dear Radoslav Genchev', mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["radoslav@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match 'Order#shipped', mail.body.encoded
  end

end
