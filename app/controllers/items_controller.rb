class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_note

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
    @item = @note.items.create(item_params)
    redirect_to note_path(@note)
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:text, :user_id, :note_id)
    end
end
