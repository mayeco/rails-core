# frozen_string_literal: true

module Admin
  class ResourceGroupsController < ApplicationController
    before_action :set_resource_group, only: %i[ show edit update destroy ]

    # GET /resource_groups or /resource_groups.json
    def index
      @resource_groups = ResourceGroup.all
    end

    # GET /resource_groups/1 or /resource_groups/1.json
    def show
    end

    # GET /resource_groups/new
    def new
      @resource_group = ResourceGroup.new
    end

    # GET /resource_groups/1/edit
    def edit
    end

    # POST /resource_groups or /resource_groups.json
    def create
      @resource_group = ResourceGroup.new(resource_group_params)

      respond_to do |format|
        if @resource_group.save
          format.html { redirect_to @resource_group, notice: "Resource group was successfully created." }
          format.json { render :show, status: :created, location: @resource_group }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @resource_group.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /resource_groups/1 or /resource_groups/1.json
    def update
      respond_to do |format|
        if @resource_group.update(resource_group_params)
          format.html { redirect_to @resource_group, notice: "Resource group was successfully updated." }
          format.json { render :show, status: :ok, location: @resource_group }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @resource_group.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /resource_groups/1 or /resource_groups/1.json
    def destroy
      @resource_group.destroy!

      respond_to do |format|
        format.html { redirect_to admin_resource_groups_path, status: :see_other, notice: "Resource group was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_resource_group
      @resource_group = ResourceGroup.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def resource_group_params
      params.expect(resource_group: [:dataAreaId, :groupId, :inputWarehouseId, :groupName])
    end
  end
end
