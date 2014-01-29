class MarsRover
  WIND_ROSE = %w(N E S W)

  attr_reader :x, :y, :direction
  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
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
end

