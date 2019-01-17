module Challenge1
  def self.id(&block)
    return block
  end

  def self.compose(func_1, func_2)
     f1, f2 = [func_1, func_2].map do |func|
       case func      
       when Proc, Method
          func
       when String, Symbol
          method(func)
       else
          raise ArgumentError, 'Functions must be proc, labmda or method object' \
                              "#{func.class} was submited"
       end
     end
     lambda { |*args| f1[f2[*args]] }
  end
  
  def self.compose_respects_id(func, a)
     identity = id {a}
     lambda_x = lambda { func [identity.call] }
     puts lambda_x.call
     lambda_y = compose(func, identity)
     puts lambda_y.call
     lambda_z = compose(identity, func)
     puts lambda_z.call
     return (lambda_x == lambda_y && lambda_x == lambda_z)
  end 
end


