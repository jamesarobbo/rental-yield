class Property < ActiveRecord::Base

	validates :email, presence: {message: "Please enter an email address"}
	validates_format_of :email, {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Please enter a valid email address"}

	validates :phone_number, presence: {message: "Please enter your phone number"}
	validates :postal_code, presence: {message: "Please enter the property's post code"}
	validates_format_of :postal_code, {:with => /^([A-PR-UWYZ]([0-9]{1,2}|([A-HK-Y][0-9]|[A-HK-Y][0-9]([0-9]|[ABEHMNPRV-Y]))|[0-9][A-HJKS-UW])\s?[0-9][ABD-HJLNP-UW-Z]{2}|(GIR\ 0AA)|(SAN\ TA1)|(BFPO\ (C\/O\ )?[0-9]{1,4})|((ASCN|BBND|[BFS]IQQ|PCRN|STHL|TDCU|TKCA)\ 1ZZ))$$/i, :multiline => true, message: "Please enter a valid postcode"}
	validates :property_price, numericality: {message: "Please enter a valid price (make sure to remove any commas or non-numerical characters)"}, allow_nil: false, length: {minimum: 4, message: "That's too low" }
	validates :property_rent, numericality: {message: "Please enter a valid monthly rent (make sure to remove any commas or non-numerical characters)"}, allow_nil: false, length: {minimum: 3, message: "That's too low (minimum is 100)" }

	before_save :remove_characters, :yearly_yield, :yearly_yield_percent
	before_create :remove_characters, :yearly_yield, :yearly_yield_percent

  after_validation :shorten_post_code	

  attr_accessor :property_type

	def remove_characters

		self.phone_number = self.phone_number.gsub(/\D/, '')
		
	end

	def yearly_yield

		self.yearly_yield = self.property_rent * 12

	end

	def yearly_yield_percent

		self.yearly_yield_percent = (self.yearly_yield.to_f/property_price) * 100
		
	end

  def shorten_post_code

    self.postal_code_short = self.postal_code.gsub(/\s.*/, '')

  end













end
