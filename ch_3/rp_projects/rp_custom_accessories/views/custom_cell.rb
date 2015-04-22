# class CustomCell < PM::TableViewCell
# 	attr_accessor :speeding
# 	@speeding        = rmq.append(UILabel, :speeding)

#   def year_released=(year)
#     # Make the UILabel, but *only* if it doesn't exist yet.
#     @year_released_view ||= begin
#       label = add UILabel.alloc.initWithFrame([[ 75, 30 ], [ 100, 30 ]])
#       label.font = UIFont.fontWithName("Comic Sans", size:36.0)
#       label.backgroundColor = UIColor.blueColor # beautiful
#       label
#     end
#     # Now set the label text, regardless of if it's a new cell
#     # or an old one, freshly dequeued.
#     @year_released_view.text = "Released #{year}"
#     @year_released_view
#   end

#   def price=(price)
#     @price_view ||= add UILabel.alloc.initWithFrame([[ 200, 30 ], [ 100, 30 ]])
#     @price_view.text = "$#{price}"
#   end

#   def speeding= set_speed
#     @speeding.get.text = set_speed
#   end

# end