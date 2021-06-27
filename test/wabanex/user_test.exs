defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true
  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, return a valid changeset" do
      params = %{name: "Anderson", email: "sinothic@gmail.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "sinothic@gmail.com", name: "Anderson", password: "123456"},
               errors: []
             } = response
    end

    test "when there are invlida params, returns a invalid changeset" do
      params = %{name: "A", email: "sinothicXgmail.com"}

      response = User.changeset(params)

      assert errors_on(response) == %{
               email: ["has invalid format"],
               name: ["should be at least 2 character(s)"],
               password: ["can't be blank"]
             }
    end
  end
end
