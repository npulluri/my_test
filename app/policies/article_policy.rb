class ArticlePolicy < ApplicationPolicy
  def index?
    user.role?("admin") || user.role?("publisher")
  end

  def update?
    user.role?("creator")
  end

  def show?
    user.role?("creator") || user.role?("publisher") || user.role?("admin")
  end

  def destroy?
    user.role?("admin")
  end

  def create?
    user.role?("creator")
  end

end