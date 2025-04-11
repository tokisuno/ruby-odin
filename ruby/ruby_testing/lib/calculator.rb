class Calculator
  def add(a, b, *c)
    a + b + c.sum
  end

  def multiply(a, b, *c)
    return a * b if c.empty?

    a * b * c.sum
  end

  def subtract(a, b, *c)
    a - b - c.sum
  end
end
