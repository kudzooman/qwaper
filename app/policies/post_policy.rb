class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.present? && user.role?(:admin)
  end

  def destroy
    update?
  end

end