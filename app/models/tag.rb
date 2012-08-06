class Tag
  include Mongoid::Document

  field :name, type: String
  field :priority, type: Integer

  has_and_belongs_to_many :posts

  default_scope asc(:priority)
end
