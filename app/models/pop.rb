class Pop < ApplicationRecord
  before_save :check_exclusivity
  before_save :scrape_price

  def total
    self.ppg_price * self.quantity
  end

  def net
    net = ((self.ppg_price * self.quantity) - (self.amount_paid * self.quantity)).round(2)
    if net < 0
      "<span class='text-danger'>($#{net * -1})</span>".html_safe
    else
      "$#{net}".html_safe
    end
  end

  private

  def check_exclusivity
    if self.exclusivity.blank?
      self.exclusive = false
    else
      self.exclusive = true
    end
  end

  def scrape_price
    doc = Nokogiri::HTML(open(self.ppg_url))
    self.ppg_price = doc.at_css(".itmValue").text.strip.partition("$").last.partition(".").first
  end

end
