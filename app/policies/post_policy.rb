class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.present? && record.user == user
    # would love to add a deadline to edit or delete. After 24 hours it's permenant.
  end

  def destroy
    update?
  end

end