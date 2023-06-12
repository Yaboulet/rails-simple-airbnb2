class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  def status_class
    if status == 0
      'Pending'
    elsif status == 1
      'Accepted'
    else status == 2
      'Refused'
    end
  end
end
