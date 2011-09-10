require 'helper'

class TestBioRestrictionEnzyme < Test::Unit::TestCase
  def setup
    @t = Bio::RestrictionEnzyme
  end

  def test_rebase
    assert_equal(@t.rebase.respond_to?(:enzymes), true)
    assert_not_nil @t.rebase['AarI']
    assert_nil @t.rebase['blah']
  end

  def test_enzyme_name
    assert_equal(@t.enzyme_name?('AarI'), true)
    assert_equal(@t.enzyme_name?('atgc'), false)
    assert_equal(@t.enzyme_name?('aari'), true)
    assert_equal(@t.enzyme_name?('EcoRI'), true)
    assert_equal(@t.enzyme_name?('EcoooRI'), false)
  end
end
