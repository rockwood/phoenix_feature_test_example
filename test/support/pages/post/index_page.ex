defmodule Blog.PostIndexPage do
  use Blog.Browser

  def visit do
    navigate_to("/posts")
  end

  def delete(post) do
    visit
    find_element(:class, "qa-post-row-#{post.id}")
    |> find_within_element(:class, "qa-delete")
    |> click
    accept_dialog()
  end
end
