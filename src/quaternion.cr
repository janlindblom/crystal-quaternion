# Crystal representation of quaternions.
#
# @author Jan Lindblom <janlindblom@fastmail.fm>
class Quaternion
  VERSION = "0.1.0"
  property a = 0
  property b = 0
  property c = 0
  property d = 0

  def initialize(a, b, c, d)
    @a = a unless a.nil?
    @b = b unless b.nil?
    @c = c unless c.nil?
    @d = d unless d.nil?
  end

  # Returns the conjugate of _obj_ *q* which is the quaternion
  # q* = *a* - *b*_i_ - *c*_j_ - *d*_k_.
  #
  # @return [Quaternion] the conjugate of _obj_.
  def conjugate
    Quaternion.new(@a, -1 * @b, -1 * @c, -1 * @d)
  end

  #
  # Returns the norm of this Quaternion.
  #
  # @return [Number] norm of this Quaternion.
  #
  def norm
    Math.sqrt((@a**2) + (@b**2) + (@c**2) + (@d**2))
  end

  #
  # Returns the versor of this Quaternion
  #
  # @return [Quaternion] the versor of this Quaternion.
  #
  def versor
    self / norm
  end

  #
  # Unary add operator.
  #
  # @param [Quaternion,Number] other +Quaternion+ or +Number+ to add.
  #
  # @return [Quaternion] sum of this and _other_.
  #
  def +(other)
    return plus_minus(other, :plus) if other.is_a? Quaternion
    return plus_minus(Quaternion.new(other), :plus) if other.is_a? Number
  end

  #
  # Unary subtract operator.
  #
  # @param [Quaternion,Number] other +Quaternion+ or +Number+ to substract.
  #
  # @return [Quaternion] result of substracting _other_ from this
  #   +Quaternion+.
  #
  def -(other)
    return plus_minus(other, :minus) if other.is_a? Quaternion
    return plus_minus(Quaternion.new(other), :minus) if other.is_a? Number
  end

  #
  # Unary multiply operator.
  #
  # @param [Quaternion,Number] other +Quaternion+ or +Number+ to multiply
  #   by.
  #
  # @return [Quaternion] product of this and _other_.
  #
  def *(other)
    return hamilton_product(other) if other.is_a? Quaternion
    return scalar_product(other) if other.is_a? Number
  end

  #
  # Unary divide operator.
  #
  # @param [Quaternion,Number] other +Quaternion+ or +Number+ to divide by.
  #
  # @return [Quaternion] result of dividing this +Quaternion+ with _other_.
  #
  def /(other)
    return self * (1 / other.a) if other.real?
    return self * (1 / other) if other.is_a? Number
  end

  def eql?(other)
    return false unless other.is_a? Quaternion
    if @a == other.a && @b == other.b && @c == other.c && @d == other.d
      return true
    end

    false
  end

  def equal?(other)
    eql?(other)
  end

  #
  # Check equality between this +Quaternion+ and _other_.
  #
  # @param [<Type>] other <description>
  #
  # @return [<Type>] <description>
  #
  def ==(other)
    eql?(other)
  end

  def identity_element?
    return true if @a == 1 && @b.zero? && @c.zero? && @d.zero?

    false
  end

  def zero?
    return true if @a.zero? && @b.zero? && @c.zero? && @d.zero?

    false
  end

  def real?
    return true if @b.zero? && @c.zero? && @d.zero?

    false
  end

  def imaginary?
    return true if @a.zero? && (@b != 0 || @c != 0 || @d != 0)

    false
  end

  #
  # Return a zero +Quaternion+.
  #
  # @return [Quaternion] Zero +Quaternion+.
  #
  def self.zero
    Quaternion.new
  end

  private def plus_minus(other, sign)
    case sign
    when :plus
      Quaternion.new((@a + other.a), (@b + other.b),
        (@c + other.c), (@d + other.d))
    when :minus
      Quaternion.new((@a - other.a), (@b - other.b),
        (@c - other.c), (@d - other.d))
    end
  end

  private def scalar_product(other)
    Quaternion.new(other * @a,
      other * @b,
      other * @c,
      other * @d)
  end

  private def hamilton_product(other)
    Quaternion.new(
      ((@a * other.a) - (@b * other.b) - (@c * other.c) - (@d * other.d)),
      ((@a * other.b) + (@b * other.a) + (@c * other.d) - (@d * other.c)),
      ((@a * other.c) - (@b * other.d) + (@c * other.a) + (@d * other.b)),
      ((@a * other.d) + (@b * other.c) - (@c * other.b) + (@d * other.a))
    )
  end
end
