class RawMaterialsController < ApplicationController
        before_action :set_raw_material, only: [:show, :edit, :update, :destroy]
      
        # GET /raw_materials
        def index
          @raw_materials = RawMaterial.all
        end
      
        # GET /raw_materials/:id
        def show
        end
      
        # GET /raw_materials/new
        def new
          @raw_material = RawMaterial.new
        end
      
        # POST /raw_materials
        def create
          @raw_material = RawMaterial.new(raw_material_params)
          if @raw_material.save
            redirect_to @raw_material, notice: 'Raw material was successfully created.'
          else
            render :new
          end
        end
      
        # GET /raw_materials/:id/edit
        def edit
        end
      
        # PATCH/PUT /raw_materials/:id
        def update
          if @raw_material.update(raw_material_params)
            redirect_to @raw_material, notice: 'Raw material was successfully updated.'
          else
            render :edit
          end
        end
      
        # DELETE /raw_materials/:id
        def destroy
          @raw_material.destroy
          redirect_to raw_materials_url, notice: 'Raw material was successfully deleted.'
        end
      
        private
      
        # Méthode pour récupérer la matière première à partir de l'ID
        def set_raw_material
          @raw_material = RawMaterial.find(params[:id])
        end
      
        # Méthode pour whitelister les paramètres autorisés
        def raw_material_params
          params.require(:raw_material).permit(:name, :description, :quantity, :price)
        end
      end      
