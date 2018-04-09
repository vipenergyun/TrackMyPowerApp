class SharkPFrequencyMeasurement < ApplicationRecord
	before_save :default_values
	protected 
	def default_values
		self.freqy ||= 0
		self.pfactor ||= 0
	end 
end
