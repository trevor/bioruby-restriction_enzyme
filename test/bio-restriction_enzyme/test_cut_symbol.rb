load Pathname.new(File.join(File.dirname(__FILE__), ['..'], 'helper.rb')).cleanpath.to_s

require 'bio/util/restriction_enzyme/cut_symbol'

class TestBioRestrictionEnzymeCutSymbol < Test::Unit::TestCase

  include Bio::RestrictionEnzyme::CutSymbol

  def setup
  end

  def test_methods
    assert_equal('^', cut_symbol)
    assert_equal('|', set_cut_symbol('|'))
    assert_equal('|', cut_symbol)
    assert_equal('\\|', escaped_cut_symbol)
    assert_equal(/\|/, re_cut_symbol)
    assert_equal('^', set_cut_symbol('^'))

    assert_equal(3, "abc^de" =~ re_cut_symbol)
    assert_equal(nil, "abc^de" =~ re_cut_symbol_adjacent)
    assert_equal(3, "abc^^de" =~ re_cut_symbol_adjacent)
    assert_equal(4, "a^bc^^de" =~ re_cut_symbol_adjacent)
    assert_equal(nil, "a^bc^de" =~ re_cut_symbol_adjacent)
  end

end
