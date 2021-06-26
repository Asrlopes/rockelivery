defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Rockelivery.User{
               address: "Avenida dos estados, 331",
               age: 25,
               cep: "00000000",
               cpf: "12345678900",
               email: "jhon@doe.com",
               id: "96e1d987-a373-401c-aeb2-99e7e3fb4ee9",
               inserted_at: nil,
               name: "Jhon Doe",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } == response
  end
end
