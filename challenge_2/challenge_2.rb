module Challenge2
   def self.memoize(f=nil, &block)
      func = block || f.dup  
      # Initialze store for memoized function 
      @__memoized_results ||= {}

      # Initialize function hash 
      @__memoized_results[func.hash] = {}

      lambda do |*args|
	@__memoized_results[func.hash][args] ||= func[*args]
      end
   end
end
