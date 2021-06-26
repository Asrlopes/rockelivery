defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Avenida dos estados, 331",
                 "age" => 25,
                 "cpf" => "12345678900",
                 "email" => "jhon@doe.com",
                 "id" => _id,
                 "name" => "Jhon Doe"
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = build(:user_params, %{"password" => "123", "name" => "junior"})

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => %{"password" => ["should be at least 6 character(s)"]}}

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "96e1d987-a373-401c-aeb2-99e7e3fb4ee9"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
