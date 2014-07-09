module App
	class Main
		# class variable, 類似 singleton 的 variable
		@@x=nil

		# setter
		def self.x=(x)
			@@x=x
		end

		# getter
		def self.x
			@@x
		end

		def echo
			puts @@x+50
		end
	end
end

require './patch.rb'

App::Main.new.echo

puts 'start...'
