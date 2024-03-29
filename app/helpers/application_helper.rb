module ApplicationHelper

  def active?(path)
    return "active" if request.path == path
  end

  def states
    %w(AL AK AZ AR CA CO CT DC DE FL GA HI ID IL IN IA KS KY LA ME MA MI MN MO MS
      MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)
  end
end
