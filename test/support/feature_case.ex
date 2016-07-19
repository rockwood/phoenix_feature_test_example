defmodule Blog.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      @moduletag :feature
      alias Blog.Repo
      import AsyncHelpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Blog.Repo)

    if tags[:async] do
      metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Blog.Repo, self())
      Hound.start_session(metadata: metadata)
    else
      Hound.start_session
      Ecto.Adapters.SQL.Sandbox.mode(Blog.Repo, {:shared, self()})
    end

    :ok
  end
end
