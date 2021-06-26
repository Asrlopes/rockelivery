defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      "address" => "Avenida dos estados, 331",
      "age" => 25,
      "cep" => "00000000",
      "cpf" => "12345678900",
      "email" => "jhon@doe.com",
      "password" => "123456",
      "name" => "Jhon Doe"
    }
  end

  def user_factory do
    %User{
      address: "Avenida dos estados, 331",
      age: 25,
      cep: "00000000",
      cpf: "12345678900",
      email: "jhon@doe.com",
      password: "123456",
      name: "Jhon Doe",
      id: "96e1d987-a373-401c-aeb2-99e7e3fb4ee9"
    }
  end
end
