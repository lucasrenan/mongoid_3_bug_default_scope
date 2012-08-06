class Post
  include Mongoid::Document

  field :title,    type: String
  field :text,     type: String
  field :priority, type: Integer

  has_and_belongs_to_many :tags

  default_scope asc(:priority)
end
