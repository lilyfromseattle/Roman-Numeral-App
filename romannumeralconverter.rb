require 'rubygems'
require 'sinatra'


get '/' do
  erb :layout
end

get '/css/main.css' do
  css :main
end

get '/oldromannumerals' do
  erb :oldromannumerals
end

post '/oldromannumerals' do
 
  def old_roman_numerals(num)
    numstring = num.to_s
	numarray1 = numstring.split(//)
    numarray = Array.new

	ones = numarray1[-1].to_i
	tens = numarray1[-2].to_i
	hundreds = numarray1[-3].to_i
	thousands = numarray1[-4].to_i

	#Ones Place

	if ones >= 5
		for number in 1..(ones%5) 
			numarray.push("I")
		end
        numarray.push("V")
	else
		for number in 1..ones 
			numarray.push("I")
		end
	end

	#Tens Place

	if tens < 5
		for number in 1..tens
			numarray.push("X")
		end

	else
		for number in 1..(tens%5)
			numarray.push("X")
		end
        numarray.push("L")
	end

	#Hundreds Place

	if hundreds < 5
		for number in 1..hundreds
		numarray.push("C")
		end

	else

		for number in 1..(hundreds%5)
			numarray.push("C")
		end
        numarray.push("D")
	end

	#Thousands Place

	for number in 1..thousands
		numarray.push("M")
	end
numarray.reverse.join
end
@str = "<font face = centurygothic color = olive size = 5em>Your number in roman numerals is: '#{old_roman_numerals(params[:oldromannumerals])}'.</font>"
end

get '/romannumerals' do
  erb :romannumerals
end

post '/romannumerals' do
def new_roman_numerals(num)
    numstring = num.to_s
    numarray1 = numstring.split(//)
    numarray = Array.new

	ones = numarray1[-1].to_i
	tens = numarray1[-2].to_i
	hundreds = numarray1[-3].to_i
	thousands = numarray1[-4].to_i

	#Ones Place	
	if ones == 4
		numarray.push("V")
		numarray.push("I")
	
		
    elsif ones >= 5 and ones < 9
    	for number in 1..(ones%5) 
			numarray.push("I")
		end
         numarray.push("V")   

    elsif ones <= 3
        for number in 1..ones 
			numarray.push("I")
        end

	elsif ones == 9
		numarray.push("X")
		numarray.push("I")

	end

	#Tens Place
	if tens == 4
		numarray.push("L")
		numarray.push("X")
		
        
    elsif tens < 4
        for number in 1..tens 
    		numarray.push("X")
        end
		
    elsif tens >= 5 and tens < 9
    	for number in 1..(tens%5) 
			numarray.push("X")
		end
		numarray.push("L")


	elsif tens == 9
		numarray.push("C")
		numarray.push("X")

	end

	#Hundreds Place
	if hundreds == 4
		numarray.push("D")
		numarray.push("C")

    
    elsif hundreds < 4
        for number in 1..hundreds 
        	numarray.push("C")
        end
		
    elsif hundreds >= 5 and hundreds < 9

    	for number in 1..(hundreds%5) 
			numarray.push("C")
		end
	    numarray.push("D")

	elsif hundreds == 9
		numarray.push("M")
		numarray.push("C")

	end

	#Thousands Place

	for number in 1..thousands
		numarray.push("M")
	end

    numarray.reverse.join

  end

@str = "<font face = centurygothic color = olive size = 5em>Your number in roman numerals is: '#{new_roman_numerals(params[:romannumerals])}'.</font>"
end

get '/converter' do
	erb :converter
end

post '/converter' do


	def new_roman_numerals(num)
	    numstring = num.to_s
	    numarray1 = numstring.split(//)
	    numarray = Array.new

		ones = numarray1[-1].to_i
		tens = numarray1[-2].to_i
		hundreds = numarray1[-3].to_i
		thousands = numarray1[-4].to_i

		#Ones Place	
		if ones == 4
			numarray.push("V")
			numarray.push("I")
		
			
	    elsif ones >= 5 and ones < 9
	    	for number in 1..(ones%5) 
				numarray.push("I")
			end
	         numarray.push("V")   

	    elsif ones <= 3
	        for number in 1..ones 
				numarray.push("I")
	        end

		elsif ones == 9
			numarray.push("X")
			numarray.push("I")

		end

		#Tens Place
		if tens == 4
			numarray.push("L")
			numarray.push("X")
			
	        
	    elsif tens < 4
	        for number in 1..tens 
	    		numarray.push("X")
	        end
			
	    elsif tens >= 5 and tens < 9
	    	for number in 1..(tens%5) 
				numarray.push("X")
			end
			numarray.push("L")


		elsif tens == 9
			numarray.push("C")
			numarray.push("X")

		end

		#Hundreds Place
		if hundreds == 4
			numarray.push("D")
			numarray.push("C")

	    
	    elsif hundreds < 4
	        for number in 1..hundreds 
	        	numarray.push("C")
	        end
			
	    elsif hundreds >= 5 and hundreds < 9

	    	for number in 1..(hundreds%5) 
				numarray.push("C")
			end
		    numarray.push("D")

		elsif hundreds == 9
			numarray.push("M")
			numarray.push("C")

		end

		#Thousands Place

		for number in 1..thousands
			numarray.push("M")
		end

	    numarray.reverse.join

	end
	
	@str = "<font face = centurygothic color = olive size = 5em>Your number in roman numerals is: '#{new_roman_numerals(params[:converter])}'.</font>"

end





