def calc(input)
  return 0 if (input=="")
  
  # input.to_i
  
  delimiter = input.match /^\/\/[^\d]+/ 
  
  # input.split(/[\n,]/).map(&:to_i).inject(&:+) 
   input = input.split /[,\n#{delimiter.to_s.gsub(/[\/\/]/,'')}]/ 

# this works for basic errors
  # raise "negatives not allowed" if input.any?{|o| o.to_i < 0}    
  
  negatives = input.select{|o| o.to_i < 0}

  raise "negatives not allowed: #{negatives.join ','}" unless negatives.empty?

  input.map(&:to_i).inject(&:+)


end



describe 'calc' do
  it{expect(calc("")).to eq 0}
  it{expect(calc("0")).to eq 0}
  it{expect(calc("1")).to eq 1}
  it{expect(calc("2")).to eq 2}
  
  it{expect(calc("1,2")).to eq 3}
  it{expect(calc("1,2,3,4")).to eq 10}
  
  
  it{expect(calc("1\n2,3")).to eq 6}
  
  it{expect(calc("//;\n1;2")).to eq 3}
  
  # it "returns exception if a negative number is passed" do 
    # expect{ calc("-1,2,-3") }.to raise_error(/Negative numbers not allowed: -1,-3/) 
  # end 
  
    # it {expect{ calc("-1,-2")}.to raise_error}
    # it {expect{ calc("-1,-2")}.to raise_error "negatives not allowed"}
     it {expect{ calc("-1,-2")}.to raise_error "negatives not allowed: -1,-2"}
    
    
end
