class FilesController < ApplicationController
  before_action :set_file, only: [:show, :edit, :update, :destroy]

  # GET /files
  # GET /files.json
  def index
    @files = File.all
  end

  # GET /files/1
  # GET /files/1.json
  def show
  end

  # GET /files/new
  def new
    @file = File.new
  end

  # GET /files/1/edit
  def edit
  end

  # POST /files
  # POST /files.json
  def create
    @file = File.new(file_params)

    respond_to do |format|
      if @file.save
        format.html { redirect_to @file, notice: 'File was successfully created.' }
        format.json { render :show, status: :created, location: @file }
      else
        format.html { render :new }
        format.json { render json: @file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /files/1
  # PATCH/PUT /files/1.json
  def update
    respond_to do |format|
      if @file.update(file_params)
        format.html { redirect_to @file, notice: 'File was successfully updated.' }
        format.json { render :show, status: :ok, location: @file }
      else
        format.html { render :edit }
        format.json { render json: @file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /files/1
  # DELETE /files/1.json
  def destroy
    @file.destroy
    respond_to do |format|
      format.html { redirect_to files_url, notice: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file
      @file = File.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_params
      params.fetch(:file, {})
    end
end
