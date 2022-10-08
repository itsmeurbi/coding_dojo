defmodule WhoLikesItTest do
  use ExUnit.Case
  doctest Dojo

  test 'it works when nobody likes it' do
    assert Dojo.who_likes_it([]) == "no one likes this"
  end

  test 'it works when someone likes it' do
    assert Dojo.who_likes_it(['Miguel']) == "Miguel likes this"
  end

  test 'it works when two folks likes it' do
    assert Dojo.who_likes_it(['Miguel', 'David']) == "Miguel and David likes this"
  end

  test 'it works when three folks likes it' do
    assert Dojo.who_likes_it(['Miguel', 'David', 'Carmen']) == "Miguel, David and Carmen likes this"
  end

  test 'it works when more than three folks likes it' do
    assert Dojo.who_likes_it(['Miguel', 'David', 'Carmen', 'Elisa', 'Anberth']) == "Miguel, David and 3 others likes this"
  end
end
