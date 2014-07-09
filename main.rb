# ref: https://github.com/rails/rails/blob/master/railties/lib/rails/application.rb - Application -> config

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

		def get_jj
			puts @jj
		end

		def initialize

			# Rails 內採用的方法
			instance_variable_set("@jj", 789)
			
			# equal: @jj=789
		end
	end
end

require './patch.rb'

app = App::Main.new

app.echo
app.get_jj

puts 'start...'
