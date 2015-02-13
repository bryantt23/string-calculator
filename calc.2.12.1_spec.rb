def Add(numbers)
  return 0 if (numbers=="")
  
    delimiter = numbers.match /^\/\/[^\d]+/ 
  
  # numbers.split(",").map(&:to_i).inject(&:+)
  # numbers.split(/[\n,]/).map(&:to_i).inject(&:+)

    numbers = numbers.split /[,\n#{delimiter.to_s.gsub(/[\/\/]/,'')}]/ 
  numbers.map(&:to_i).inject(&:+)

    
    
end




describe 'Add' do
  it{expect(Add("")).to eq 0}
  it{expect(Add("0")).to eq 0}
  it{expect(Add("1")).to eq 1}
  it{expect(Add("2")).to eq 2}
  
  it{expect(Add("1,2")).to eq 3}
  it{expect(Add("1,2,3,4")).to eq 10}

  it{expect(Add("1\n2,3")).to eq 6}
  
  it{expect(Add("//;\n1;2")).to eq 3}

end

