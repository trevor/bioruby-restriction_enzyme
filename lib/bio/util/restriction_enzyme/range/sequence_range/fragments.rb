# bio/util/restriction_enzyme/analysis/fragments.rb -

require 'bio/util/restriction_enzyme'

module Bio
class RestrictionEnzyme
class Range
class SequenceRange

class Fragments < Array

  attr_accessor :primary
  attr_accessor :complement

  def initialize(primary, complement)
    @primary = primary
    @complement = complement
  end

  DisplayFragment = Struct.new(:primary, :complement)

  def for_display(p_str=nil, c_str=nil)
    p_str ||= @primary
    c_str ||= @complement
    pretty_fragments = []
    self.each { |fragment| pretty_fragments << fragment.for_display(p_str, c_str) }
    pretty_fragments
  end
end # Fragments
end # SequenceRange
end # Range
end # RestrictionEnzyme
end # Bio
