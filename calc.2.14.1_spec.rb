def stringcalc(numbers)
  
  delimiter = numbers.match /^\/\/[^\d]+/ 
  
  return 0 if(numbers=="")
  
  # numbers.split(/^\/\/[^\d]+/).map(&:to_i).inject(&:+) 

   numbers = numbers.split /[,\n#{delimiter.to_s.gsub(/[\/\/]/,'')}]/ 
   
   negatives = numbers.select { |number| number.to_i<0 }
   
   raise "negatives not allowed: #{negatives.join(",")}" if negatives.any?


   # raise "negatives not allowed" if numbers.any? { |number| number.to_i<0 }


   # negatives = numbers.select { |number| number<0 }
   

  numbers.map(&:to_i).inject(&:+)
  
  
  
end



describe 'stringcalc' do
  
  it{expect(stringcalc("")).to eq 0}
  it{expect(stringcalc("0")).to eq 0}
  it{expect(stringcalc("1")).to eq 1}
  it{expect(stringcalc("2")).to eq 2}
  it{expect(stringcalc("3")).to eq 3}
  
  
  it{expect(stringcalc("1,2")).to eq 3}
  it{expect(stringcalc("1,2,3")).to eq 6}
  it{expect(stringcalc("1,2,3,4")).to eq 10}

  it{expect(stringcalc("1\n2,3")).to eq 6}  
  
  it{expect(stringcalc("1\n2,3")).to eq 6}
  
  it{expect(stringcalc("//;\n1;2")).to eq 3}
  
    # it {expect{ stringcalc("-1,-2")}.to raise_error}
    # it {expect{ stringcalc("-1,-2")}.to raise_error "negatives not allowed"}
     it {expect{ stringcalc("-1,-2")}.to raise_error "negatives not allowed: -1,-2"}
end

