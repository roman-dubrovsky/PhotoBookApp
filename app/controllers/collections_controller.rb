class CollectionsController < ApplicationController
  def create
    current_user.collections.create(collection_params)
    redirect_to index_path
  end

  def update
    @collection = Collection.find(params[:id])
    @collection.update(collection_params)
    redirect_to index_path
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to index_path
  end

  private
    def collection_params
      params.require(:collection).permit(:title)
    end
end
