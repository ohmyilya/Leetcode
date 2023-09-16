defmodule Solution do
  def two_sum(nums, target) do
    two_sum(nums, target, 1, %{})
  end

  defp two_sum([], _target, _index, _map), do: {:error, 0, 0}

  defp two_sum([num | rest], target, index, num_to_index) do
    complement = target - num
    case Map.get(num_to_index, complement) do
      nil ->
        two_sum(rest, target, index + 1, Map.put(num_to_index, num, index))
      complement_index ->
        {:ok, complement_index, index}
    end
  end
end
