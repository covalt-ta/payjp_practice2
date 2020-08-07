class UsersController < ApplicationController
  def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
    redirecto_to new_card_path and return unless card.present?
    customar = Payjp::Customer.retrieve(card.customer_token)
    @card = customar.cards.first
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path 
    else
      redirecto_to :show
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
