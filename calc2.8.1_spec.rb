def calc(input1)
   return 0 if (input1=="")   
   
   sum=0
   input1.split(",").each { |number|
     sum += number.to_i        
   }
   sum
end

describe 'calc' do
  it {expect(calc("")).to eq 0}
  it {expect(calc("0")).to eq 0}
  it {expect(calc("1")).to eq 1}
  it {expect(calc("2233")).to eq 2233}
  
  it {expect(calc("1,2")).to eq 3}
  it {expect(calc("1,2,7")).to eq 10}
end

