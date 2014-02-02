class MasterMind

	def initialize
		@secret = Code.new
	end

	def play

		10.times do
			puts "Guess the code:"
			
			@secret.parse_code(gets.chomp.downcase)
			
			return "You Win!" if @secret.win? 

			puts "#{@secret.check_order} colors are in the right order."
			puts "#{@secret.check_color_wrong_pos} colors are in the right order."

		end
		return "You lose!"

	end
end

class Code

	attr_accessor :color_code
	def color
		['g','b','y','o','r','p']
	end

	def generate_code
		ar = []
		4.times { ar << color.shuffle.sample }
		ar
	end

	def initialize
		@color_code = color
	end

	def parse_code(player_guess)
		@player_code = player_guess.split(//)
	end

	def check_color
		count = 0
		@color_code.each do |color| 
			count += @player_code.count(color)
		end
		count
	end

	def check_order
		count = 0
		(0..3).each do |color_ind| 
			count += 1 if @player_code[color_ind] == @color_code[color_ind]
		end
		count
	end

	def check_color_wrong_pos
		self.check_color - self.check_order
	end

	def win?
		@player_code == @color_code
	end
end

