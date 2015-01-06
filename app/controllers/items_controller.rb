class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_note
  before_action :authenticate_user!
  before_action :admin_only, only: [:update, :destroy]

  def index
    @items = @note.items
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
  def create
    if @note.items.create(item_params.merge(user_id: current_user.id))
      redirect_to note_path(@note)
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if @item.update(item_params)
      redirect_to note_path(@note), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    redirect_to note_path(@note), notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def set_note
      @note = Note.find(params[:note_id])
    end

    def admin_only
      # check if the current user is an admin OR the item belongs to the currentu user
      unless current_user && (current_user.admin? || current_user == @item.user)
        redirect_to root_path || :back, :alert => "Access denied."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:text, :note_id)
    end
end
