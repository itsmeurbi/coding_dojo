require 'minitest'
require 'minitest/autorun'
require_relative 'id_extracter'

class IdExtracterTest < Minitest::Test
  def test_it_works_with_empty_structure
    ids = extract_ids({})

    assert_equal [], ids
  end

  def test_it_works_with_one_level_structure
    ids = extract_ids({id: 1})

    assert_equal [1], ids
  end

  def test_it_works_with_two_level_structure
    ids = extract_ids({id: 1, items: [{ id: 2 }]})

    assert_equal [1, 2], ids
  end

  def test_it_works_with_two_level_structure
    ids = extract_ids({id: 1, items: [{ id: 2 }, { id: 4 }, { id: 8 }]})

    assert_equal [1, 2, 4, 8], ids
  end

  def test_it_works_with_three_level_structure
    ids = extract_ids({id: 1, items: [{ id: 2, items: [{ id: 4 }] }, { id: 8 }]})

    assert_equal [1, 2, 4, 8], ids
  end

  def test_it_works_with_three_level_structure_2
    data = {
      id: 1,
      items: [
        {id: 2},
        {id: 3, items: [
          {id: 4},
          {id: 5}
        ]}
      ]
    }

    ids = extract_ids(data)

    assert_equal [1, 2, 3, 4, 5], ids
  end

  def test_it_works_with_four_level_structure
    data = {
      id: 1,
      items: [
        { id: 2 },
        { id: 3, items: [
          { id: 4, items: [ {id: 3} ] },
          { id: 5 }
        ]}
      ]
    }
    ids = extract_ids(data)

    assert_equal [1, 2, 3, 4, 3, 5], ids
  end
end
