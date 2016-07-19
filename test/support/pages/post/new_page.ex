defmodule Blog.PostNewPage do
  use Blog.Browser
  alias Blog.PostFormSection

  def visit do
    navigate_to("/posts/new")
  end

  def create(attrs) do
    visit
    PostFormSection.submit(attrs)
  end

  def has_error? do
    find_element(:class, "qa-error")
  end
end
