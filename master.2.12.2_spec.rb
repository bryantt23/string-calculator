def stringcalc(numbers)
  return 0 if (numbers=="")
  
  # numbers.to_i
  
  delimiter = numbers.match /^\/\/[^\d]+/ 
  
  # numbers.split(/[\n,]/).map(&:to_i).inject(&:+) 
   numbers = numbers.split /[,\n#{delimiter.to_s.gsub(/[\/\/]/,'')}]/ 

# this works for basic errors
  # raise "negatives not allowed" if numbers.any?{|o| o.to_i < 0}    
  
  negatives = numbers.select{|o| o.to_i < 0}

  raise "negatives not allowed: #{negatives.join ','}" unless negatives.empty?

  numbers.map(&:to_i).inject(&:+)


end



describe 'stringcalc' do
  it{expect(stringcalc("")).to eq 0}
  it{expect(stringcalc("0")).to eq 0}
  it{expect(stringcalc("1")).to eq 1}
  it{expect(stringcalc("2")).to eq 2}
  
  it{expect(stringcalc("1,2")).to eq 3}
  it{expect(stringcalc("1,2,3,4")).to eq 10}
  
  
  it{expect(stringcalc("1\n2,3")).to eq 6}
  
  it{expect(stringcalc("//;\n1;2")).to eq 3}
  
  
    # it {expect{ stringcalc("-1,-2")}.to raise_error}
    # it {expect{ stringcalc("-1,-2")}.to raise_error "negatives not allowed"}
     it {expect{ stringcalc("-1,-2")}.to raise_error "negatives not allowed: -1,-2"}
    
    
end
