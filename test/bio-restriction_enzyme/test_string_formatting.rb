load Pathname.new(File.join(File.dirname(__FILE__), ['..'], 'helper.rb')).cleanpath.to_s

require 'bio/util/restriction_enzyme/string_formatting'

class TestBioRestrictionEnzymeStringFormatting < Test::Unit::TestCase

  include Bio::RestrictionEnzyme::StringFormatting

  def setup
    @t = String
    @obj_1 = @t.new('gata')
    @obj_2 = @t.new('garraxt')
    @obj_3 = @t.new('gArraXT')
    @obj_4 = @t.new('nnnnnnngarraxtnn')
  end

  def test_strip_padding
    assert_equal('gata', strip_padding(@obj_1))
    assert_equal('garraxt', strip_padding(@obj_2))
    assert_equal('gArraXT', strip_padding(@obj_3))
    assert_equal('garraxt', strip_padding(@obj_4))
  end

  def test_left_padding
    assert_equal('', left_padding(@obj_1))
    assert_equal('', left_padding(@obj_2))
    assert_equal('', left_padding(@obj_3))
    assert_equal('nnnnnnn', left_padding(@obj_4))
  end

  def test_right_padding
    assert_equal('', right_padding(@obj_1))
    assert_equal('', right_padding(@obj_2))
    assert_equal('', right_padding(@obj_3))
    assert_equal('nn', right_padding(@obj_4))
  end

  def test_add_spacing
    assert_equal('n^n g^a t^a', add_spacing('n^ng^at^a') )
    assert_equal('n^n g^a r r a x t^n', add_spacing('n^ng^arraxt^n') )
  end

end
