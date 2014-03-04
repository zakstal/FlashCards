require './flashtools'

module Maintools

	def make_card(cards, cat)
		file = cards
		quest = ''
		case cat
			when 'cat'
					quest = file[0]	if file[0] != nil	
			when 'quest'
					quest = file[1]
			when 'ans'	
					quest = file[2] 
			when 'fq'
					quest = file[3] 
			when 'fa'
					quest = file[4] 
			when 'all'
					quest = file
		end
		quest
	end

	def main_card_screen
			puts "\n\n\n\n\n\n\n\t____________________Optoins______________________"
			puts "\n\t-\ttype \'all\' to review all cards, or "
			puts "\n\t-\ttype \'cat\' to view all catagories"
			puts "\n\t-\tor choose a catagorie\n\n\n\n"
	end

	def choices
		choice = gets.chomp
		choice
	end

	def select_cards(*cards, cat)
		all = []
			cards[0].each do |card|
				car = make_card(card, 'cat')
				if car.include?(cat) or cat == 'all'	
					all << card
				end
			end
		puts "\n\n\t#{all.length} Cards"
	all
	end

	def show_cards(*cards)
		@total_score = 0
		all_cards = cards
		all_cards[0].each do |card|
			
					puts "-----------------------------------------------------------------------------\n\n"	
					cat = make_card(card, 'cat')
					puts "\n  Catagory: #{cat}"
			
			quest = make_card(card, 'quest')
				puts "\n\t\tQuestion:\n\n\t#{quest}\n\n\n\n"
					@total_score += give_grade_answer(card)
					 

					ans = make_card(card, 'ans')
					puts "\n\t\tAnswer:\n\n\t#{ans}"
					choice2 = choices

			fq = make_card(card, 'fq')
				puts "\n\t\ Follow Question:\n\n\t#{fq}" if fq != nil
					give_grade_answer(card) if fq != nil
						

					fa = make_card(card, 'fa')
					puts "\n\t\ Follow Answer:\n\n\t#{fa}" if fa != nil
					choice2 = choices if fa != nil
			
		end
		
			overall_score = (@total_score).percent_of((all_cards[0].count)*100)
			puts overall_score
		puts "your total score was #{overall_score}"
	end

	def match_choice(card, choice)
		match = 0
			answer = make_card(card, 'ans')
				words = choice.split(' ') if choice != nil
					words.each do |word|
						match += 1 if answer.include?(word)
					end
		match
	end

	def out_of(card, match)
			answer = make_card(card, 'ans')
			count = answer.split(' ').length
			 nice = "Nice!!!"
			 eh   = "...ehh..." 
			 total = (match).percent_of(count) if match != 0 or match != nil
			 puts "\t\n\n%#{total} right"
			 return total
			
	end


	def percent_of(n)
	    self.to_f / n.to_f * 100.0
	end


	def give_grade_answer(card)
			choice = choices
				match = match_choice(card, choice)
						out_of(card, match)
	end

	

	def find_cat(cards)
		cats = []
			cards.each do |card|
				card[0].to_s.scan(/\w+:/){|match| cats << "#{match.capitalize}"}
			end
		puts cats.uniq
	end
end