class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(" ","").length

    @word_count = @text.split.count

    @occurrences = @text.split.count(@special_word)
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f


    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
    @monthly_apr = @apr /100 / 12
    @months = @years * 12
    # I cant get this to work and it's making me insane...@monthly_payment = @principal (@monthly_apr(1 + @monthly_apr)**@months / (1+ @monthly_apr)**@months - 1
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds / 60
    @hours = @minutes / 60
    @days = @hours / 24
    @weeks = @days / 7
    @years = @weeks / 52
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)


    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.length

    @minimum = @sorted_numbers.first

    @maximum = @sorted_numbers.last

    @range = @sorted_numbers.last.to_i - @sorted_numbers.first.to_f

    @mid = (@count - 1) / 2.0

    @median = (@sorted_numbers[@mid.floor] + @sorted_numbers[@mid.ceil]) / 2.0

    @sum = @numbers.inject(:+)

    @mean = @sum / @count

    @variance = @sorted_numbers.inject {|sum,x| sum+(x-@mean)**2}/@count

    @standard_deviation = Math.sqrt(@variance)
    ##something is off with my variance and SD but I'm not sure what...

    @freq = @numbers.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

    @mode = @numbers.max_by { |v| @freq[v] }

    end
end
