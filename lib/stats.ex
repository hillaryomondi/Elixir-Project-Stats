defmodule Stats do
  alias Stats.CentralTendency.Mean

  #def population_mean(nums), do: Mean.population_mean(nums)
  defdelegate population_mean(nums), to: Mean

  defdelegate sample_mean(nums), to: Mean

end
