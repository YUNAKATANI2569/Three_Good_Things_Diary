class Users::PasswordnsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[update destroy]

  def check_guest
    if params[:user][:email].dwncase == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは編集・削除できません。'
    end
  end

end