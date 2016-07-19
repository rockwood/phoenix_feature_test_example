defmodule Blog.PostEditPage do
  use Blog.Browser
  alias Blog.PostFormSection

  def visit(post) do
    navigate_to("/posts/#{post.id}/edit")
  end

  def update(post, attrs) do
    visit(post)
    PostFormSection.submit(attrs)
  end

  def has_error? do
    find_element(:class, "qa-error")
  end
end
