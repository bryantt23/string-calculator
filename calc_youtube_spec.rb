# https://www.youtube.com/watch?v=JBHBFOgvp4g

def calc string
  return 0 if string.empty?
  
#   $ is a global variable
  # string.split(/\W+/).map(&:to_i).inject(&:+)
  
# negative part  
  operands =  string.split(/\W+/).map(&:to_i)
  
  raise "negatives not allowed" if operands.any?{|o| o < 0}
  # operands.inject(&:+)
  
  # negatives = operands.select { |number| number < 0 }
  # raise "negatives not allowed" unless negatives.empty?
  
  # raise "negatives not allowed #{negatives.join ','}" unless negatives.empty?
  operands.inject(&:+)
  
  
end


describe 'calc' do
  
  it {expect(calc("")).to eq 0}  
  it {expect(calc("1")).to eq 1}  
  it {expect(calc("2")).to eq 2}
  it {expect(calc("1,2")).to eq 3}
  it {expect(calc("1,2,3,4")).to eq 10}
  
  
  it {expect(calc("1
2,3")).to eq 6}
  it {expect(calc("1 2 3")).to eq 6}
  it {expect(calc("1, 2 
    3")).to eq 6}
  it {expect(calc("1, 2;3")).to eq 6}
  
  it "returns exception if a negative number is passed" do 
    expect{ calc("-1")}.to raise_error "negatives not allowed"
end
    
  # it {expect{ calc("-1,-2")}.to raise_error}
  
  # it {expect{ calc("-1,-2")}.to raise_error "negatives not allowed"}
  
  # it {expect{ calc("-1,-2")}.to raise_error "negatives not allowed -1,-2"}
  
  # it "returns exception if a negative number is passed" do 
    # expect{ calc("-1,-2")}.to raise_error "negatives not allowed -1,-2"
  
end
