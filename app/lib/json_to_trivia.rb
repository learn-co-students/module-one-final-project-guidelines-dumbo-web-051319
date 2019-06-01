require 'json'
require 'rest-client'
require 'pry'
require 'tty-prompt'

def get_questions
  questions_raw = RestClient.get("https://opentdb.com/api.php?amount=5&difficulty=easy&type=boolean")
  JSON.parse(questions_raw)['results']
end


def run_game

  puts "\n 🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮YOU'VE ENTERED THE UPSIDE DOWN WORLD🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮"
  questions_arr = Array.new(get_questions)
  true_false = nil
    curr_question = get_question(questions_arr)
    answer_choices = get_answers(curr_question)
    play(curr_question, answer_choices)
    prompt = TTY::Prompt.new
    input = prompt.select("", %w(true false))

    correct_answer = curr_question['correct_answer']
    if input == correct_answer.downcase
      puts "\nYAASSSSS!"
      true_false = true
      # collect digimon
    else
      puts "\nNope HAHA"
      true_false = false
      #return to menu
    end
    puts " 🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮🎮 "
    puts "\n "

  true_false
end

def get_question(questions)
  i = rand(questions.length)
  question = questions[i]
end

def get_answers(question)  #combine correct and incorrect answer choices
  choices = Array.new(question['incorrect_answers'])
  i = rand(choices.length)
  choices.insert(i, question['correct_answer'])
end

def play(question, answers)
  puts "\n                                                The category is: #{question['category']}"
  puts "#{question['question']}"
  # answers.each { |answer| puts "- #{answer}" }
end
