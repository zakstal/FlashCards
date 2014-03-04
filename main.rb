require './flashtools'
require './mtools'

include FlashQuestions
include Maintools


				  im = Import.new("quest.txt")
				  cards = im.open_file



def flash_selection(cards)
		 		Maintools::main_card_screen
	choice = gets.chomp

		if 	choice == 'cat'
		 		 Maintools::find_cat(cards) 	
		 	choice = gets.chomp  		  
		end
cards_to_show(cards,choice)

end

def cards_to_show(cards, choice)
	use_these_cards = Maintools::select_cards(cards, choice)
 				  	  Maintools::show_cards(use_these_cards)
 	flash_selection(cards)
end
	cards = flash_selection(cards)
				 
