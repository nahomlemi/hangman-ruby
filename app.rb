words = File.open()


class Board
  incorrect_letter = Array.new
  
  def correct_words
    correct_words = ''
    return correct_words
  end

  def Board()
    puts incorrect_letter
    puts correct_words
  end
end

class Player
  player_input = ''
  def requre_input
  end
end

class Computer
  random_line = Math.floor(Math.random()*10000)
end

class Game
end









=begin
first import the google file
board class :- shows incorrect letter
                hangman drawing
                correct words and empty space

player class :- takes an impout from player and stores it
computer class :- selects a random word from google document
game class :- takes user input / checks if the imput is correct or not/ if the user is correct insert the letter to the board/else draw the hangman on the board

=end
