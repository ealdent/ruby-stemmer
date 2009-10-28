require 'helper'

class TestStemmer < Test::Unit::TestCase

  def test_stemmer_creation
    assert_kind_of ::Lingua::Stemmer, ::Lingua::Stemmer.new
  end
end
