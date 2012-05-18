class DocumentsController < ApplicationController

  before_filter :authenticate_user!
  # GET /documents
  # GET /documents.json
  def index
    @documents = current_user.documents

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = current_user.documents.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = current_user.documents.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = current_user.documents.build(params[:document])

    respond_to do |format|
      if @document.save
        format.html { redirect_to dashboard_path, notice: 'Document was successfully created.' }
        format.json { render json: @document, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = current_user.documents.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to dashboard_path, notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = current_user.documents.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end
  
  def download
    if resource.file.present?
      redirect_to resource.file_url
    else
      redirect_to resource, :alert => "Sorry, document unavailable for download."
    end
  end
end
