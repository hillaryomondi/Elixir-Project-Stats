defmodule Stats do
  alias Stats.CentralTendency.{Mean, Median, Mode}

  #def population_mean(nums), do: Mean.population_mean(nums)
  defdelegate population_mean(nums), to: Mean

  defdelegate sample_mean(nums), to: Mean

  defdelegate median(nums_list), to: Median

  defdelegate mode(nums_list), to: Mode

end
