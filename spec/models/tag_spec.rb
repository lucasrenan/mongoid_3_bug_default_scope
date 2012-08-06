require 'spec_helper'

describe Tag do
  describe "N-N relations" do
    it "should saves ids on both sides" do
      tag  = Tag.create(name: "tag1")
      post = Post.create(title: "post")
      tag.posts << post
      tag.save
      tag.reload

      tag.posts.should eq([post])
    end

    it "should saves ids on both sides (relation by ids)" do
      post = Post.create(title: "post")
      tag  = Tag.new(name: "tag", post_ids: [post.id])
      tag.save

      tag.reload
      post.reload

      tag.post_ids.should eq([post.id])
      post.tag_ids.should eq([tag.id])
    end
  end
end
