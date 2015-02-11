def calc(input)
  return 0 if (input=="")
  
  # input.to_i 
  
sum=0
input.split(/\W+/).each { |number|   
  
    negative_numbers = number.select{|x| x.to_i < 0} 
    raise "Negative numbers not allowed: #{negative_numbers.join(',')}" if negative_numbers.any? 
  
  
  sum+=number.to_i  
   }
sum
  
end

def negative
  return "negatives not allowed"
end


describe 'calc' do
  it {expect(calc("")).to eq 0}
  it {expect(calc("0")).to eq 0}
  it {expect(calc("1")).to eq 1}
  it {expect(calc("1333")).to eq 1333}
  
  it {expect(calc("1,2")).to eq 3}
  it {expect(calc("11,22")).to eq 33}
  it {expect(calc("1,2,3,4")).to eq 10}
  
  
  it {expect(calc("1
2,3")).to eq 6}
  it {expect(calc("1 2 3")).to eq 6}
  it {expect(calc("1, 2 
    3")).to eq 6}
  it {expect(calc("1, 2;3")).to eq 6}
  
  it "returns exception if a negative number is passed" do 
    expect{ StringCalculator.add("-1,2,-3") }.to raise_error(/Negative numbers not allowed: -1,-3/) 
  end 

end
