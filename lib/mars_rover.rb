class MarsRover
  WIND_ROSE = %w(N E S W)
  attr_reader :x, :y, :direction
  def initialize(x, y, direction, planet = InfinitePlanet.new)
    @x = x
    @y = y
    @direction = direction
    @planet = planet
  end

  def command(commands)
    (commands || "").downcase.split("").each do |command|
      turn(command) if 'rl'.include? command
      move(command) if 'fb'.include? command
    end
  end

  private

  def turn(side)
    index = WIND_ROSE.index(@direction) + (side.eql?('l') ? -1 : 1)
    @direction = WIND_ROSE[index < 0 ? 3 : index > 3 ? 0 : index]
  end

  def move(side)
    axis = "NS".include?(@direction) ? :@y : :@x
    increment = "NE".include?(@direction) ? 1 : -1
    increment *= -1 if side.eql?('b')
    value = instance_variable_get(axis)
    instance_variable_set(axis, value + increment)
  end

  # rotation
  # move back/forward
  # if planet given, it should overlap
  # if list of obstacles given, should stop when obstacle is found
end

class Planet
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end

class InfinitePlanet < Planet
  FIXNUM_MAX = (2**(0.size * 8 -2) -1)
  def initialize
    super(FIXNUM_MAX, FIXNUM_MAX)
  end
end

