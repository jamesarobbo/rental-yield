class Property < ActiveRecord::Base

  validates :email, presence: {message: "Please enter an email address"}
  validates_format_of :email, {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Please enter a valid email address"}

  validates :phone_number, presence: {message: "Please enter your phone number"}
  validates :postal_code, presence: {message: "Please enter the property's post code"}
  validates_format_of :postal_code, {:with => /^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\ [0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$/, :multiline => true, message: "Please enter a valid postcode"}
  validates :property_price, numericality: {message: "Please enter a valid price (make sure to remove any commas or non-numerical characters)"}, allow_nil: false, length: {minimum: 4, message: "That's too low" }
  validates :property_rent, numericality: {message: "Please enter a valid monthly rent (make sure to remove any commas or non-numerical characters)"}, allow_nil: false, length: {minimum: 3, message: "That's too low (minimum is 100)" }
  validates :maintenance, numericality: {message: "Please enter a valid maintenance amount (make sure to remove any commas or non-numerical characters) "}, allow_nil: true


  before_save :remove_characters, :yearly_yield, :yearly_yield_percent
  before_create :remove_characters, :yearly_yield, :yearly_yield_percent

  before_validation :upcase_post_code
  after_validation :shorten_post_code	

  def remove_characters

    self.phone_number = self.phone_number.gsub(/\D/, '')

  end

  def yearly_yield
    if maintenance.nil?

    yearly_yield = (property_rent * 12)

    else

      yearly_yield = (property_rent * 12)-(maintenance * 12)
    end  


  end

  def yearly_yield_percent

    yearly_yield_percent = (yearly_yield.to_f/property_price) * 100

  end

  def upcase_post_code

    self.postal_code = self.postal_code.upcase

  end

  def shorten_post_code

    self.postal_code = self.postal_code.gsub(/\s.*/, '')

  end



end
