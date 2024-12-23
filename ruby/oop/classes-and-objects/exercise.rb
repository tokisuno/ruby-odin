class MyCar
  attr_accessor :year, :colour, :model

  def initialize(yr, clr, mdl)
    @year = yr
    @colour = clr
    @model = mdl
    @speed = 0
  end
end
