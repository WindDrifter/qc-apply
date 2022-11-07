defmodule QcCode do
  @moduledoc """
  Documentation for `QcCode`.
  """
  @non_letter_regex ~r/[^a-zA-Z]/

  @spec count_letter_frequency(String.t()) :: String.t()
  def count_letter_frequency(input) do

    # first part replace symbol with numbers
    {current_letter_total, output} =
    @non_letter_regex
    |> Regex.replace(input, "1")
    |> String.split("", trim: true)
    |> Enum.reduce({0, ""}, fn current_letter, {_current_letter_total, output} = acc ->
      latest_letter = String.at(output, -1)
      count_previous_letter(latest_letter, current_letter, acc)
    end)
    if current_letter_total > 0 do
      "#{output}#{current_letter_total}"
    else
      output
    end
  end


  defp count_previous_letter("", current_letter, acc) do
    case Integer.parse(current_letter) do
      :error -> {1, "#{current_letter}"}
      _ -> acc
    end
  end

  defp count_previous_letter(_, current_letter, {0, output} = acc) do
    # this is where current letter is a number
    case Integer.parse(current_letter) do
      :error -> {1, "#{output}#{current_letter}"}
      _ -> acc
    end
  end


  defp count_previous_letter(previous_letter, current_letter, {current_letter_total, output}) do
    # check if it's number
    case Integer.parse(current_letter) do
      :error ->
        if previous_letter === current_letter do
          {current_letter_total+1, output}
        else
          {1, "#{output}#{current_letter_total}#{current_letter}"}
        end
      _ ->
        # if number skip
      {0, "#{output}#{current_letter_total}"}
    end
  end
end
