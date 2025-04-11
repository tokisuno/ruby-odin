require './lib/calculator'

describe Calculator do
  describe '#add' do
    it 'returns the sum of two numbers' do
      calc = Calculator.new
      expect(calc.add(5, 2)).to eql(7)
    end

    it 'returns the sum of more than two numbers' do
      calc = Calculator.new
      expect(calc.add(2, 5, 7)).to eql(14)
    end
  end

  describe '#multiply' do
    it 'returns the product of two numbers' do
      calc = Calculator.new
      expect(calc.multiply(5, 2)).to eql(10)
    end

    it 'returns the product of more than two numbers' do
      calc = Calculator.new
      expect(calc.multiply(2, 1, 7)).to eql(14)
    end
  end

  describe '#subtract' do
    it 'returns the remainder of two numbers' do
      calc = Calculator.new
      expect(calc.subtract(5, 2)).to eql(3)
    end

    it 'returns the remainder of more than two numbers' do
      calc = Calculator.new
      expect(calc.subtract(30, 5, 5, 10)).to eql(10)
    end
  end
end
