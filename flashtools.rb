module FlashQuestions



	class Import

		def initialize(file)
			@file = file
		end
		def open_file
			
			@y = []
			the_file = File.open("#{@file}")
			the_line = the_file.read
			qa =  find(the_line)
			q_and_a(qa)
			return_file
			
		end	

		

		def find(file)
			ts = file
			questiong_answer = ts.to_s.split(/(?=\nQ\d)/)
			questiong_answer
		end

		def q_and_a(qa)
			qa.each do |q|
				bulk2(q)
			end
		end                                                                              

		def bulk2(qa)
			

			qa_etc = qa.split(/(?<cat>Q.+:)|A.+:|\tFollowQ\d+:|\tFollowA\d+:/)
			qa_etc.shift
				@y << qa_etc
		end	

		def return_file
		 @y.each do |line|
	  		
	  		line
		 end
		end
	end

end	