defmodule Blog.PostFormSection do
  use Blog.Browser

  def submit(attrs) do
    Enum.each(attrs, &fill_form_field/1)
    click({:class, "qa-submit"})
  end

  def has_error? do
    find_element(:class, "qa-error")
  end

  defp fill_form_field({:title, value}) do
    fill_field({:class, "qa-title-field"}, value)
  end
  defp fill_form_field({:body, value}) do
    fill_field({:class, "qa-body-field"}, value)
  end
end
