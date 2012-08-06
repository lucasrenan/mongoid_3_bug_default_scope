require 'spec_helper'

describe Post do
  describe "N-N relations" do
    it "should saves ids on both sides" do
      post = Post.create(title: "post")
      tag  = Tag.create(name: "tag1")
      post.tags << tag
      post.save
      post.reload

      post.tags.should eq([tag])
    end

    it "should saves ids on both sides (relation by ids)" do
      tag  = Tag.create(name: "tag1")
      post = Post.new(title: "post", tag_ids: [tag.id])
      post.save
      
      post.reload
      tag.reload

      post.tag_ids.should eq([tag.id])
      tag.post_ids.should eq([post.id])
    end
  end
end
