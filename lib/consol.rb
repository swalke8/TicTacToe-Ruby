require 'real_consol'
require 'mock_consol'

class Consol
	def initialize(consol)
		@consol = consol
	end

	def get
		@consol.get
	end

	def put
		@consol.put
	end
end
