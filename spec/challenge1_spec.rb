require 'spec_helper'

require_relative '../challenge_1/challenge_1'

RSpec.describe Challenge1 do 
   describe '.identity function' do 
      pnew = Proc.new {|x| x}
      it 'returns whatever is passed' do
         expect(Challenge1.id {pnew[2]}.call).to eql pnew.call(2)
      end
   end

   describe '.compose function' do 
      method_1 = Proc.new {|x| x+1} 
      method_2 = Proc.new {|y| y*2} 
      a = 10
      context 'composing two different function' do 
    	composition = Challenge1.compose(method_1, method_2)

	it 'compose method_1 into method_2' do 
	   expect(composition.call(3)).to eql 7
	end
      end 
     
      context 'composing with identity' do 
      	truthy_composition = Challenge1.compose_respects_id(method_1, a)

	it 'Truthy comosition with identity' do 
	   expect(truthy_composition).to be true
	end 
      end 
   end 


end
