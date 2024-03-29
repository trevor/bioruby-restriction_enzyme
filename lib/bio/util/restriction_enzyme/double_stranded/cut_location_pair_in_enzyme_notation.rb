# bio/util/restriction_enzyme/double_stranded/cut_location_pair_in_enzyme_notation.rb - Inherits from DoubleStranded::CutLocationPair

require 'bio/util/restriction_enzyme'

module Bio
class RestrictionEnzyme
class DoubleStranded

# Inherits from DoubleStranded::CutLocationPair , stores the cut location pair in
# enzyme notation instead of 0-based.
#
class CutLocationPairInEnzymeNotation < CutLocationPair

  #########
  protected
  #########

  def validate_2( a, b )
    if (a == 0) or (b == 0)
      raise ArgumentError, "Enzyme index notation only.  0 values are illegal."
    end

    if a == nil and b == nil
      raise ArgumentError, "Neither strand has a cut.  Ambiguous."
    end
  end
end # CutLocationPair
end # DoubleStranded
end # RestrictionEnzyme
end # Bio
