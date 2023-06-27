class Triangle

  attr_accessor :sideone, :sidetwo, :sidethree

  def initialize (sideone, sidetwo, sidethree)
    @sideone = sideone
    @sidetwo = sidetwo
    @sidethree = sidethree
  end

  def validationOne 
   if sideone.negative? or 
      sidetwo.negative? or 
      sidethree.negative? or 
      sideone == 0 or 
      sidetwo == 0 or 
      sidethree == 0
      raise TriangleError
   end
  end

  def validationTwo
    if  sideone + sidetwo <= sidethree or
      sidetwo + sidethree <= sideone or
      sideone + sidethree <= sidetwo
      raise TriangleError
    end
  end

  def kind
    self.validationOne
    self.validationTwo
      if sideone == sidetwo && sidetwo == sidethree
        return :equilateral
      elsif sideone == sidetwo or 
        sidetwo == sidethree or 
        sideone == sidethree
        return :isosceles
      else
        return :scalene
      end
  end


  class TriangleError < StandardError
    def message
      "The measurements you supplied are not that of a valid triangle, please try again with correct measurements!"
    end
  end
end 
