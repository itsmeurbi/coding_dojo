defmodule Dojo do
  @moduledoc """
  Documentation for `Dojo`.
  """

  @doc """
  Dojo who_likes_it.

  ## Examples
      iex> Dojo.who_likes_it([])
      "no one likes this"

      iex> Dojo.who_likes_it(['Urbi'])
      "Urbi likes this"
  """
  def who_likes_it(people_who_likes_it) do
    case length(people_who_likes_it) do
      0 ->
        "no one likes this"
      1 ->
        [person] = people_who_likes_it
        "#{person} likes this"
      2 ->
        [person1, person2] = people_who_likes_it
        "#{person1} and #{person2} likes this"
      3 ->
        [person1, person2, person3] = people_who_likes_it
        "#{person1}, #{person2} and #{person3} likes this"
      _ ->
        [person1, person2 | rest_of_people] = people_who_likes_it
        number_of_rest_of_people = length(rest_of_people)
        "#{person1}, #{person2} and #{number_of_rest_of_people} others likes this"
    end
  end
end
