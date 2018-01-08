class Player

  attr_reader :proficiency, :min_desired_prof, :name

  def initialize(name, prof, min_prof)

    @name = name
    @proficiency = prof
    @min_desired_prof = min_prof

  end

  def to_s

    "#{@name}, proficiency: #{@proficiency}, seeks proficiency >= #{@min_desired_prof}."

  end

end