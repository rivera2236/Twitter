class TwitsController < ApplicationController
  before_action :set_twit, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user! GOES IN APPLICATION_CONTROLLER.RB - BETTER PLACEMENT.
  
  # GET /twits
  # GET /twits.json
  def index
    @twits = Twit.all
  end

  # GET /twits/1
  # GET /twits/1.json
  def show
  end

  # GET /twits/new
  def new
    @twit = Twit.new
  end

  # GET /twits/1/edit
  def edit
  end

  # POST /twits
  # POST /twits.json
  def create
    @twit = Twit.create(twit_params)

    message_arr = @twit.message.split

    message_arr.each_with_index do |word, index|
      if word[0] == "#"
        #create a new instance of a Tag
        if Tag.pluck(:phrase).include?(word)
          #save that Tag as a variable (to use in TweetTag creation)
          #tag already exists
          tag = Tag.find_by(phrase: word)
        else
          #create a new instance of Tag
          #tag doesn't exist
          tag = Tag.create(phrase: word)
        end
        # twit_tag = TwitTag.create(twit_id: @twit.id, tag_id: tag.id)
        TwitTag.create(twit_id: @twit.id, tag_id: tag.id)
        message_arr[index] = "<a href='/tag_twits?id=#{tag.id}'>#{word}</a>"
      end
    end

    new_message = message_arr.join(" ")
    @twit.update(message: new_message)

    respond_to do |format|
      if @twit.save
        format.html { redirect_to @twit, notice: 'Twit was successfully created.' }
        format.json { render :show, status: :created, location: @twit }
      else
        format.html { render :new }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twits/1
  # PATCH/PUT /twits/1.json
  def update
    respond_to do |format|
      if @twit.update(twit_params)
        format.html { redirect_to @twit, notice: 'Twit was successfully updated.' }
        format.json { render :show, status: :ok, location: @twit }
      else
        format.html { render :edit }
        format.json { render json: @twit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twits/1
  # DELETE /twits/1.json
  def destroy
    @twit.destroy
    respond_to do |format|
      format.html { redirect_to twits_url, notice: 'Twit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twit
      @twit = Twit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twit_params
      params.require(:twit).permit(:message, :user_id, :link)
    end
end
