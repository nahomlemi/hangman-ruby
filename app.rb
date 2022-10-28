
class Board
  @@incorrect_letter = Array.new
  @@correct_letter = Array.new  
  
  @@head = " O"
  @@left_hand = "/"
  @@torso = "|"
  @@right_hand = "\\"
  @@left_leg = "/"
  @@right_leg = " \\"
  @@rope = "
 _____|
 |    |"

  def board()
    puts '############################################################'
    p @@incorrect_letter
    puts @@rope
    if @@incorrect_letter.length == 1 && @@incorrect_letter[0] != nil
      puts @@head
    elsif @@incorrect_letter.length == 2
      puts @@head
      puts (" "+ @@torso)
    elsif @@incorrect_letter.length == 3
      puts @@head
      print @@left_hand
      puts @@torso
    elsif @@incorrect_letter.length == 4
      puts @@head
      print @@left_hand
      print @@torso
      puts @@right_hand
    elsif @@incorrect_letter.length == 5
      puts @@head
      print @@left_hand
      print @@torso
      puts @@right_hand
      puts @@left_leg
    elsif @@incorrect_letter.length == 6
      puts @@head
      print @@left_hand
      print @@torso
      puts @@right_hand
      print @@left_leg
      puts @@right_leg
    end
    print @@correct_letter
  end
end

class Computer < Board
  @@words_array = Array.new()
  @@random_word = ''
  
  def generate_random_word()
    f = File.open('google-10000-english-no-swears.txt')
    f.each{|word|
      @@words_array.push(word)
    }
    f.close()
    @@random_word = @@words_array[rand(0..9893)]
    puts @@random_word
    puts @@random_word.length

    (@@random_word.length-1).times do 
      @@correct_letter.push("_")
    end
  end
end

class Player < Computer
  @@player_input = ''
  def require_input()
    print "enter your guess: "
    @@player_input = gets.chomp
  end
end


class Game < Player
  def check_input()
  
    if @@random_word.split('').all?{|letter| letter != @@player_input}
      @@incorrect_letter.push(@@player_input)
    else
      @@random_word.split('').each_with_index {|letter,index|
        if letter == @@player_input
          if @@correct_letter.include?(letter)
            @@correct_letter[index] = @@player_input
          else
            @@correct_letter[index] = @@player_input
            break
          end
        
        end
      }
    end
  end

  def check_winner()
    @@correct_array = @@correct_letter
     if (@@correct_array.push("\n")) == @@random_word.split('')
      puts "\nYOU WON!"
      exit()
     else
      @@correct_array.pop()
     end
  end
  
  def play()
    generate_random_word()
    while @@incorrect_letter.length <6
      require_input()
      check_input()
      board()
      check_winner()
    end
  end
end

game = Game.new()
game.play()






























=begin

first import the google file
board class :- shows incorrect letter
                hangman drawing
                correct words and empty space

player class :- takes an impout from player and stores it
computer class :- selects a random word from google document
game class :- takes user input
              checks if the imput is correct or not
              if the user is correct insert the letter to the board
              else draw the hangman on the board


=end
