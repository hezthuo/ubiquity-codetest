class RegistrationsController < Devise::RegistrationsController

protected

  def after_sign_up_path_for(resource)
    csvs_index_path
  end

end
