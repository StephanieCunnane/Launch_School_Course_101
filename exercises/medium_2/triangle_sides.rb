def triangle(side1, side2, side3)
  triangle_sides = [side1, side2, side3]
  
  return :invalid if triangle_sides.any? { |side| side <= 0 }
  return :invalid if triangle_sides.min(2).sum <= triangle_sides.max
  
  case triangle_sides.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

# Or
def triangle(side1, side2, side3)
  sides = [side1, side2, side3]

  return :invalid if sides.include?(0)
  return :invalid if sides.min(2).sum <= sides.max

  unique_lengths = sides.uniq.size
  case unique_lengths
  when 1 then :equilateral
  when 2 then :isosceles
  else :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

