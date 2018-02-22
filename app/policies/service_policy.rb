class ServicePolicy < ApplicationPolicy

  def create?
    ["provider", "admin"].include?(user.role)
  end

  def destroy?
    record.user == user || user.role == "admin"
  end

  def index_service_categories?
    true
    # user.role == "beneficiary" || user.role =="admin"
  end

  def index_services_by_category?
    true
  end

  # class Scope < Scope
  #   def list_all
  #     scope.all
  #   end

  #   def list_filtered(category)
  #     scope.where(category: category)
  #   end


    # def resolve
    #   scope.all
    # end
  # end
end
