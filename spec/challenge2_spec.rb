require 'spec_helper'

require_relative '../challenge_2/challenge_2'

RSpec.describe Challenge2 do 
   describe 'memoization works fine' do
      def n_rand()
      	 lambda do |n|
            Random.new(n)
	 end
      end
   
      it 'same call cached and matches' do
         test_rand = Challenge2.memoize { n_rand }
	 expect(test_rand[3] == test_rand[3]).to be true
      end

      it 'different call don\'t match' do
         test_rand = Challenge2.memoize {n_rand }
     	 expect(test_rand[54] != test_rand[46]).to be true
      end 

    
   end 
end
 
