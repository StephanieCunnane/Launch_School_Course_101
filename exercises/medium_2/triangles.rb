def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  
  return :invalid unless angles.sum == 180
  return :invalid if angles.include?(0)
  
  case 
  when angles.include?(90) then :right
  when angles.max > 90 then :obtuse
  when angles.max < 90 then :acute
  end
end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  return :invalid if angles.include?(0)
  return :invalid unless angles.sum == 180

  case
  when angles.one?(90) then :right
  when angles.all? { |angle| angle < 90 } then :acute
  else :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

