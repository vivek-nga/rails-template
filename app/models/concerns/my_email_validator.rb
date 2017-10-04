class MyEmailValidator < ActiveModel::Validator
	def validate(record)
		unless record.email =~ /gmail/
			record.errors[:email] << 'Email must be gmail domain only'
		end
		
	end
end