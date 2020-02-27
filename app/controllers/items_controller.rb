class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end
  
  def empty
    current_user.cart.items
  end
  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def createCart
    if((current_user.cart.items.where(title: params[:title], index: params[:index], page: params[:page]).exists?))
    else
      if(Item.where(title: params[:title], index: params[:index], page: params[:page]).exists?(conditions = :none) === true)
        @item = Item.where(title: params[:title], index: params[:index], page: params[:page])
        current_user.cart.items << @item
      else
        @item = Item.create(item_params)
        current_user.cart.items << @item
      end
    end
  end

  def createWish
    if((current_user.wishlist.items.where(title: params[:title], index: params[:index], page: params[:page]).exists?))
    else
      if(Item.where(title: params[:title], index: params[:index], page: params[:page]).exists?(conditions = :none) === true)
        @item = Item.where(title: params[:title], index: params[:index], page: params[:page])
        current_user.wishlist.items << @item
      else
        @item = Item.create(item_params)
        current_user.wishlist.items << @item
      end
    end
  end
  def removeWish
    current_user.wishlist.items.delete(Item.where(title: params[:title], index: params[:index], page: params[:page]))
  end
  def removeCart
    current_user.cart.items.delete(Item.where(title: params[:title], index: params[:index], page: params[:page]))
  end
  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :page, :index)
    end
end
