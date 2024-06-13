FactoryBot.create(:user, email: "admin@admin.com", password: "admin123") unless User.find_by(email: "admin@admin.com")

10.times do
  bidder = FactoryBot.build(:bidder)
  bidder.inss_discount = InssDiscount.new(bidder.salary).discount
  bidder.save
end