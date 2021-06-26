defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      address: "Avenida dos estados, 331",
      age: 25,
      cep: "00000000",
      cpf: "12345678900",
      email: "jhon@doe.com",
      password: "123456",
      name: "Jhon Doe"
    }
  end
end
