defmodule Dash.Spongebob do
  use Rustler, otp_app: :dash, crate: "spongebob"

  @doc """
  Changes the text to speak like Spongebob

  #iex> Dash.Spongebob.format("was this a waste of time?")
  "WaS tHIs a WAstE Of TimE?"
  """
  @spec speak(String.t()) :: String.t()
  def speak(_string), do: :erlang.nif_error(:nif_not_loaded)
end
