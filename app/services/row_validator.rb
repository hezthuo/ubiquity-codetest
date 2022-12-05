class RowValidator
	def initialize(file)
		@file = file
	end

	def validate_rows

		parsed_csv = CSV.parse(@file, col_sep: ",", row_sep: :auto, skip_blanks: true)
    
    parsed_csv.each_with_index do |row, index|
    	return true if validate(parsed_csv[index][3]) || !parsed_csv[index][3].empty?
		end
		false
	end
	
	# validate alphanumeric strings containing spaces
	def validate(str)
 		chars = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
 		chars << '-'
 		str.chars.detect {|ch| !chars.include?(ch)}.nil?
	end
end