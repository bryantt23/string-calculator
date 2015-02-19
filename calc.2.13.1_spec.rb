def calc(numbers)
  return 0 if(numbers.to_i==0)
  
  delimiter = numbers.match /^\/\/[^\d]+/ 

   numbers = numbers.split /[,\n#{delimiter.to_s.gsub(/[\/\/]/,'')}]/ 
   
# raise "negatives not allowed" if numbers.any?{|o| o.to_i < 0}    

negatives = numbers.select {|number| number.to_i <0}

   
raise "negatives not allowed: #{negatives.join ','}" if negatives.any?

  numbers.map(&:to_i).inject(&:+)
  
end


describe 'calc' do

  it{expect(calc("")).to eq 0}
  it{expect(calc("0")).to eq 0}
  it{expect(calc("1")).to eq 1}
  it{expect(calc("2")).to eq 2}
  it{expect(calc("3")).to eq 3}
  
  it{expect(calc("1,2")).to eq 3}
  it{expect(calc("1,2,3,4")).to eq 10}


  it{expect(calc("1\n2,3")).to eq 6}
  
  
   # it {expect{ calc("-1,-2")}.to raise_error}
   # it {expect{ calc("-1,-2")}.to raise_error "negatives not allowed"}
   it {expect{ calc("-1,-2")}.to raise_error "negatives not allowed: -1,-2"}

    # it {expect{ calc("-1,-2")}.to raise_error}
    # it {expect{ calc("-1,-2")}.to raise_error "negatives not allowed"}

end

