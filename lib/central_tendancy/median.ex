defmodule Stats.CentralTendency.Median do
  require Integer
  alias Stats.Errors
  alias Stats.Validators
  # Scenario - Louis sold the following candies in 9 hours
  # 10, 40, 20, 50, 30, 90, 70, 60 , 80

  # Median -> Central value or the value which divides measurements in 2 equal parts
  #First 50% and the next 50%

  #steps -
  # 1. Sort - [10, 20, 30, 40, 50, 60, 70, 80, 90]
  # 2. Count -
  #    2.1 - If Odd - Take the value at the middle = 50 (median)
  #    2.2 - If Even - Take 2 values at the middle and return the average = 50 (median)
  #           E.g [10,20,30,40,50,60,70,80] = (40+50)/2 = 45(Median)

  #_______________________________________________________________________________

  def median(num_list) when is_list(num_list) do
    num_list
    |> Validators.validate_num_list()
    |> calc_median()
  end

  def median(_), do: Errors.invalid_data_type()

  #____________________________________________________________________________
  defp calc_median({:error, _msg}), do: Errors.invalid_data_type()
  defp calc_median({false, _}), do: Errors.invalid_data_type
  defp calc_median({true, num_list}) do
    count = num_list |> Enum.count()

    num_list
    |> Enum.sort()
    |> get_median(Integer.is_even(count), count)
  end

  #________________________________________________________________
  defp get_median(num_list, false, count), do: Enum.at(num_list, div(count, 2))

  defp get_median(num_list, true, count) do
    a = Enum.at(num_list, div(count-1, 2))
    b = Enum.at(num_list, div(count, 2))

    (a + b) / 2
  end

end
