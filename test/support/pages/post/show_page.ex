defmodule Blog.PostShowPage do
  use Blog.Browser

  def visit(post) do
    navigate_to("/posts/#{post.id}")
  end

  def has_post?(post) do
    visit(post)
    find_element(:class, "qa-post-title") |> visible_text == post.title
  end
end
