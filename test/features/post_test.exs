defmodule Blog.PostFeatureTest do
  use Blog.FeatureCase, async: true
  alias Blog.{Post, PostIndexPage, PostNewPage, PostShowPage, PostEditPage}

  describe "Viewing an existing post" do
    setup :create_post

    test "shows the post details", %{post: post} do
      assert PostShowPage.has_post?(post)
    end
  end

  describe "Creating a new post" do
    test "succeeds with valid attributes" do
      PostNewPage.create(valid_attrs)

      eventually fn ->
        assert Repo.one(Post)
      end
    end

    test "fails with invalid attributes" do
      PostNewPage.create(%{title: ""})
      assert PostNewPage.has_error?
    end
  end

  describe "Editing an existing post" do
    setup :create_post

    test "succeeds with valid attributes", %{post: post} do
      PostEditPage.update(post, %{title: "Updated Title"})

      eventually fn ->
        assert %{title: "Updated Title"} = Repo.get!(Post, post.id)
      end
    end

    test "fails with invalid attributes", %{post: post} do
      PostEditPage.update(post, %{title: ""})
      assert PostEditPage.has_error?
    end
  end

  describe "Deleting an existing post" do
    setup :create_post

    test "succeeds", %{post: post} do
      PostIndexPage.delete(post)

      eventually fn ->
        refute Repo.one(Post)
      end
    end
  end

  defp valid_attrs, do: %{title: "Test Title", body: "Test Body"}

  defp create_post(_) do
    {:ok, post: struct(Post, valid_attrs) |> Repo.insert!}
  end
end
