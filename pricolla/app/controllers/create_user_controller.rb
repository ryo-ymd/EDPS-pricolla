class CreateUserController < ApplicationController
  before_action :auth, only: :create

  def create
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    @key = (0...8).map { o[rand(o.length)] }.join
    User.create(key: @key)
  end

  private

  def auth
    throw(:abort)
  end
end