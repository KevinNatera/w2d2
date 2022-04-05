class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize ()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length,"_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end


  def self.random_word
      DICTIONARY.sample
  end


  def already_attempted?(letter)
      attempted_chars.include?(letter)
  end


  def get_matching_indices(letter)
    arr = []
    @secret_word.each_char.with_index do |char,i|
        arr << i if char == letter
    end
    arr
  end


  def fill_indices(letter,array)
      array.each do |i|
        @guess_word[i] = letter
      end
  end


  def try_guess(letter)
    if !already_attempted?(letter)
        @attempted_chars << letter
        indices = self.get_matching_indices(letter)
        self.fill_indices(letter,indices)
        @remaining_incorrect_guesses -= 1 if indices.length == 0
        true
    else
      p "that has already been attempted"
      false
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    input = gets.chomp
    self.try_guess(input)
  end


  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      true
    else
      false
    end
  end


  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      true
    else
      false
    end
  end

end
