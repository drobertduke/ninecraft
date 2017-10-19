defmodule NinescraftWeb.AccountView do
  use NinescraftWeb, :view

  def render("index.json", %{accounts: accounts}) do
    %{accounts: Enum.map(accounts, &account_json/1)}
  end

  def account_json(account) do
    %{
      name: account.name
    }
  end
end

