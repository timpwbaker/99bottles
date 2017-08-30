class Bottles

  attr_reader :current

  def verse(current)
    return last_verse if current == 0

    @current = current
    set_instance_variables
    standard_verse
  end

  def verses(last, first)
    Array(first..last).reverse.map{ |current| verse(current) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def set_default_instance_variables
    @remaining_bottles_one = "#{current} bottles"
    @remaining_bottles_two = "#{current-1} bottles"
    @take_down = "one"
  end

  def set_instance_variables
    set_default_instance_variables

    # Overwrite the defaults for specific cases
    case current
    when 1
      @remaining_bottles_one = "1 bottle"
      @remaining_bottles_two = "no more bottles"
      @take_down = "it"
    when 2
      @remaining_bottles_two = "1 bottle"
    when 6
      @remaining_bottles_one = "1 six-pack"
    when 7
      @remaining_bottles_two = "1 six-pack"
    end
  end

  def last_verse
    return "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    "
  end

  def standard_verse
    "#{@remaining_bottles_one} of beer on the wall, #{@remaining_bottles_one} of beer.
Take #{@take_down} down and pass it around, #{@remaining_bottles_two} of beer on the wall.
    "
  end
end
