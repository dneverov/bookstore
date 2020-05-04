class BookPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def show?
    true
  end

  def update?
    user.present? && (user == record.user || user.admin?)
  end

  def destroy?
    user.present? && user.admin?
  end

  def publish?
    update?
  end
end
