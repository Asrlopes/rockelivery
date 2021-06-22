defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns an changeset" do
      params = %{
        address: "Avenida dos estados, 331",
        age: 25,
        cep: "00000000",
        cpf: "12345678900",
        email: "jhon@doe.com",
        password: "123456",
        name: "Jhon Doe"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Jhon Doe"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        address: "Avenida dos estados, 331",
        age: 25,
        cep: "00000000",
        cpf: "12345678900",
        email: "jhon@doe.com",
        password: "123456",
        name: "Jhon Doe"
      }

      update_params = %{name: "Jhon"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Jhon"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{
        address: "Avenida dos estados, 331",
        age: 15,
        cep: "00000000",
        cpf: "12345678900",
        email: "jhon@doe.com",
        password: "123456",
        name: "Jhon Doe"
      }

      response = User.changeset(params)

      expected_response = %{age: ["must be greater than or equal to 18"]}

      assert errors_on(response) == expected_response
    end
  end
end
