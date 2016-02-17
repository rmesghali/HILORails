class GameController < ApplicationController
  def try
    # If there is no random number stored in a cookie?
    if cookies[:randomnumber].nil?
      # Then assign the cookie a random number between 1 and 100
      cookies[:randomnumber] = Random.rand(1..100)
    end
    # We are setting our random number to be an integer derived from the random number generated above
    @randomnumber = cookies[:randomnumber].to_i

    @user_name = params[:user_name]



    if !params.has_key?(:guess)
      @result_string = ""
    else
      @guess = params[:guess].to_i
      # These are if statements that compare the user's guess to the random number generated and returns a hint to the user.  In this case it is too low.
      if @guess < @randomnumber
        @result_string = "Your number is too low, try again!"

      # If the guess is lower than the random number then the below message is given
      elsif @guess > @randomnumber
        @result_string = "Your number is too high, try again!"
      # # If the guess is equal to the random number then the user wins!
      else
        @result_string = "You Win!"
        cookies[:randomnumber] = Random.rand(1..100)
      end
    end



  end
end
