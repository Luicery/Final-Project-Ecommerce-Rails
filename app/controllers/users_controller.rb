class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create, :show]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show

    @user_obj = {
      user: current_user,
      userstuff: {
        cart: current_user.cart.items,
        wishlist: current_user.wishlist.items
      }
    }
    render json: @user_obj

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.create user_params
    cart = Cart.create
    wishlist = Wishlist.create
    @user.cart = cart
    @user.wishlist = wishlist
    if @user.persisted?
      # format.html { redirect_to @user, notice: 'User was successfully created.' }
      render json: {:user_id => @user.id}
    else
      # format.html { render :new }
      render json: {errors: @user.errors.full_messages }, status: 422
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :password, :email, :address, :phone)
    end
end
