defmodule Wabanex.IMCTest do
  use ExUnit.Case
  alias Wabanex.IMC

  describe "calculate/1" do
    test "should return file data when the file exists" do
      params = %{"filename" => "students.csv"}
      response = IMC.calculate(params)

      assert response ==
               {:ok,
                %{
                  "Ana" => 52.70852570021545,
                  "Joao" => 25.056656771681187,
                  "José" => 26.31005951516911,
                  "Maria" => 23.702422145328722
                }}
    end

    test "should return an error when the file does not exists" do
      params = %{"filename" => "studentsx.csv"}
      response = IMC.calculate(params)

      assert response == {:error, "Error while opening the file"}
    end
  end
end
