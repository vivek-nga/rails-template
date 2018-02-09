class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]

  # GET /apartments
  # GET /apartments.json
  def index
    WebNotificationsChannel.broadcast_to(
      current_user,
      title: 'New things!',
      body: 'All the news fit to print'
    )
    @apartments = Apartment.all
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
  end

  # GET /apartments/new
  def new
    @apartment = Apartment.new
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments
  # POST /apartments.json
  def create
    files = params[:files]
    p "=================================================================="
    ap params[:files]
    p "=================================================================="
    file_name = files[0].try(:original_filename).try(:gsub, ' ','-')
    # file_name = "#{Time.now.to_s.gsub(' ', '-')}#{file_name}"
    @apartment = Apartment.find_or_initialize_by(name: file_name)

    directory = Rails.root.join("public", "uploads") 
    begin  
      Dir.mkdir(directory) unless Dir.exists?(directory)
    rescue Exception => e
      puts e.backtrace
    end
    path = File.join(directory, file_name)
    p "=================================================================="
    p request.headers['Content-Range']
    p request.headers['Content-Length']
    p "=================================================================="
    content_range = request.headers['Content-Range']
    start_value = content_range.split('-').first if content_range
    #range_value = content_range.split('-').last.split('/').map(&:to_i) if content_range
    File.delete(path) if (start_value.present? && start_value == "bytes 0") && (File.exist? path) 
    File.open(path, "ab") { |f| f.write(files.first.read)}
    @apartment.upload = path
    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render json: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.fetch(:apartment, {})
    end
end
