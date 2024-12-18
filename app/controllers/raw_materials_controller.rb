class RawMaterialsController < ApplicationController
        before_action :set_raw_material, only: [:show, :edit, :update, :destroy]
      
        def index
          @raw_materials = RawMaterial.all
        end
      
        def show
        end
      
        def new
          @raw_material = RawMaterial.new
        end
      
        def create
          @raw_material = RawMaterial.new(raw_material_params)
          if @raw_material.save
            redirect_to @raw_material, notice: 'Raw material was successfully created.'
          else
            render :new
          end
        end
      
        def edit
        end
      
        def update
          if @raw_material.update(raw_material_params)
            redirect_to @raw_material, notice: 'Raw material was successfully updated.'
          else
            render :edit
          end
        end
      
        def destroy
          @raw_material.destroy
          redirect_to raw_materials_url, notice: 'Raw material was successfully deleted.'
        end
      
        private
      
        def set_raw_material
          @raw_material = RawMaterial.find(params[:id]) # Fetch the raw material by ID from the params
        end
      
        #Allow only specific attributes to be submitted via forms
        def raw_material_params
          params.require(:raw_material).permit(:name, :description, :quantity)
        end
end      
