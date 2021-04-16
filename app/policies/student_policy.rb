class StudentPolicy < ApplicationPolicy
  attr_reader :current_user, :student

  def initialize(current_user, student)
    @student = student
    @current_user = current_user
  end

  def index?
      @current_user.admin? or @current_user.teacher?
  end
  def create?
    @current_user.admin? or @current_user.teacher?
  end
  def new?
    create?
  end
  def update?
    @current_user.admin? or @current_user.teacher?
  end
  def edit?
    update?
  end
  def destroy?
    @current_user.admin? or @current_user.teacher?
  end
end
