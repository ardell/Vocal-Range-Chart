class SubmissionsController < ApplicationController
  # GET /submissions
  # GET /submissions.xml
  def index
    @submissions = Submission.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @submissions }
    end
  end

  # GET /submissions/1
  # GET /submissions/1.xml
  def show
    @submission = Submission.find(params[:id])
    @fields = get_fields
    @ratings = get_ratings

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @submission }
    end
  end
  
  # GET /submissions/new
  # GET /submissions/new.xml
  def new
    @submission = Submission.new
    @survey = Survey.find(:first, :conditions => { :visitor_hash => params[:visitor_hash] })
    @submission.survey = @survey
    @visitor_hash = params[:visitor_hash]
    
    @fields = get_fields
    @ratings = get_ratings

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @submission }
    end
  end

  # GET /submissions/1/edit
  def edit
    @submission = Submission.find(params[:id])
    @fields = get_fields
    @ratings = get_ratings
  end

  # POST /submissions
  # POST /submissions.xml
  def create
    @submission = Submission.new(params[:submission])
    @survey = Survey.find(:first, :conditions => { :visitor_hash => params[:visitor_hash] })
    @submission.survey = @survey
    @visitor_hash = params[:visitor_hash]
    
    respond_to do |format|
      if @submission.save
        flash[:notice] = 'Submission was successfully created.'
        format.html { redirect_to("/surveys/" + @survey[:visitor_hash] + "/view") }
        format.xml  { render :xml => @submission, :status => :created, :location => @submission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /submissions/1
  # PUT /submissions/1.xml
  def update
    @submission = Submission.find(params[:id])
    @survey = @submission.survey
    @visitor_hash = params[:visitor_hash]

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        flash[:notice] = 'Submission was successfully updated.'
        format.html { redirect_to(@submission) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.xml
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to(submissions_url) }
      format.xml  { head :ok }
    end
  end
  
protected

  def get_fields
    fields = [
      # { :label => 'C8',   :color => 'white',  :name => 'c_8' },
      # { :label => 'B7',   :color => 'white',  :name => 'b_7' },
      # { :label => 'A#7',  :color => 'black',  :name => 'a_sharp_7' },
      # { :label => 'A7',   :color => 'white',  :name => 'a_7' },
      # { :label => 'G#7',  :color => 'black',  :name => 'g_sharp_7' },
      # { :label => 'G7',   :color => 'white',  :name => 'g_7' },
      # { :label => 'F#7',  :color => 'black',  :name => 'f_sharp_7' },
      # { :label => 'F7',   :color => 'white',  :name => 'f_7' },
      # { :label => 'E7',   :color => 'white',  :name => 'e_7' },
      # { :label => 'D#7',  :color => 'black',  :name => 'd_sharp_7' },
      # { :label => 'D7',   :color => 'white',  :name => 'd_7' },
      # { :label => 'C#7',  :color => 'black',  :name => 'c_sharp_7' },
      # { :label => 'C7',   :color => 'white',  :name => 'c_7' },
      # { :label => 'B6',   :color => 'white',  :name => 'b_6' },
      # { :label => 'A#6',  :color => 'black',  :name => 'a_sharp_6' },
      # { :label => 'A6',   :color => 'white',  :name => 'a_6' },
      # { :label => 'G#6',  :color => 'black',  :name => 'g_sharp_6' },
      # { :label => 'G6',   :color => 'white',  :name => 'g_6' },
      # { :label => 'F#6',  :color => 'black',  :name => 'f_sharp_6' },
      # { :label => 'F6',   :color => 'white',  :name => 'f_6' },
      # { :label => 'E6',   :color => 'white',  :name => 'e_6' },
      # { :label => 'D#6',  :color => 'black',  :name => 'd_sharp_6' },
      # { :label => 'D6',   :color => 'white',  :name => 'd_6' },
      # { :label => 'C#6',  :color => 'black',  :name => 'c_sharp_6' },
      { :label => 'C6',   :color => 'white',  :name => 'c_6' },
      { :label => 'B5',   :color => 'white',  :name => 'b_5' },
      # { :label => 'A#5',  :color => 'black',  :name => 'a_sharp_5' },
      { :label => 'A5',   :color => 'white',  :name => 'a_5' },
      # { :label => 'G#5',  :color => 'black',  :name => 'g_sharp_5' },
      { :label => 'G5',   :color => 'white',  :name => 'g_5' },
      # { :label => 'F#5',  :color => 'black',  :name => 'f_sharp_5' },
      { :label => 'F5',   :color => 'white',  :name => 'f_5' },
      { :label => 'E5',   :color => 'white',  :name => 'e_5' },
      # { :label => 'D#5',  :color => 'black',  :name => 'd_sharp_5' },
      { :label => 'D5',   :color => 'white',  :name => 'd_5' },
      # { :label => 'C#5',  :color => 'black',  :name => 'c_sharp_5' },
      { :label => 'C5',   :color => 'white',  :name => 'c_5' },
      { :label => 'B4',   :color => 'white',  :name => 'b_4' },
      # { :label => 'A#4',  :color => 'black',  :name => 'a_sharp_4' },
      { :label => 'A4',   :color => 'white',  :name => 'a_4' },
      # { :label => 'G#4',  :color => 'black',  :name => 'g_sharp_4' },
      { :label => 'G4',   :color => 'white',  :name => 'g_4' },
      # { :label => 'F#4',  :color => 'black',  :name => 'f_sharp_4' },
      { :label => 'F4',   :color => 'white',  :name => 'f_4' },
      { :label => 'E4',   :color => 'white',  :name => 'e_4' },
      # { :label => 'D#4',  :color => 'black',  :name => 'd_sharp_4' },
      { :label => 'D4',   :color => 'white',  :name => 'd_4' },
      # { :label => 'C#4',  :color => 'black',  :name => 'c_sharp_4' },
      { :label => 'C4',   :color => 'white',  :name => 'c_4' },
      { :label => 'B3',   :color => 'white',  :name => 'b_3' },
      # { :label => 'A#3',  :color => 'black',  :name => 'a_sharp_3' },
      { :label => 'A3',   :color => 'white',  :name => 'a_3' },
      # { :label => 'G#3',  :color => 'black',  :name => 'g_sharp_3' },
      { :label => 'G3',   :color => 'white',  :name => 'g_3' },
      # { :label => 'F#3',  :color => 'black',  :name => 'f_sharp_3' },
      { :label => 'F3',   :color => 'white',  :name => 'f_3' },
      { :label => 'E3',   :color => 'white',  :name => 'e_3' },
      # { :label => 'D#3',  :color => 'black',  :name => 'd_sharp_3' },
      { :label => 'D3',   :color => 'white',  :name => 'd_3' },
      # { :label => 'C#3',  :color => 'black',  :name => 'c_sharp_3' },
      { :label => 'C3',   :color => 'white',  :name => 'c_3' },
      { :label => 'B2',   :color => 'white',  :name => 'b_2' },
      # { :label => 'A#2',  :color => 'black',  :name => 'a_sharp_2' },
      { :label => 'A2',   :color => 'white',  :name => 'a_2' },
      # { :label => 'G#2',  :color => 'black',  :name => 'g_sharp_2' },
      { :label => 'G2',   :color => 'white',  :name => 'g_2' },
      # { :label => 'F#2',  :color => 'black',  :name => 'f_sharp_2' },
      { :label => 'F2',   :color => 'white',  :name => 'f_2' },
      { :label => 'E2',   :color => 'white',  :name => 'e_2' },
      # { :label => 'D#2',  :color => 'black',  :name => 'd_sharp_2' },
      { :label => 'D2',   :color => 'white',  :name => 'd_2' },
      # { :label => 'C#2',  :color => 'black',  :name => 'c_sharp_2' },
      { :label => 'C2',   :color => 'white',  :name => 'c_2' },
      # { :label => 'B1',   :color => 'white',  :name => 'b_1' },
      # { :label => 'A#1',  :color => 'black',  :name => 'a_sharp_1' },
      # { :label => 'A1',   :color => 'white',  :name => 'a_1' },
      # { :label => 'G#1',  :color => 'black',  :name => 'g_sharp_1' },
      # { :label => 'G1',   :color => 'white',  :name => 'g_1' },
      # { :label => 'F#1',  :color => 'black',  :name => 'f_sharp_1' },
      # { :label => 'F1',   :color => 'white',  :name => 'f_1' },
      # { :label => 'E1',   :color => 'white',  :name => 'e_1' },
      # { :label => 'D#1',  :color => 'black',  :name => 'd_sharp_1' },
      # { :label => 'D1',   :color => 'white',  :name => 'd_1' },
      # { :label => 'C#1',  :color => 'black',  :name => 'c_sharp_1' },
      # { :label => 'C1',   :color => 'white',  :name => 'c_1' },
      # { :label => 'B0',   :color => 'white',  :name => 'b_0' },
      # { :label => 'A#0',  :color => 'black',  :name => 'a_sharp_0' },
      # { :label => 'A0',   :color => 'white',  :name => 'a_0' }
    ]
  end

  def get_ratings
    ratings = [
      { :label => '0', :value => 0 },
      { :label => '1', :value => 1 },
      { :label => '2', :value => 2 },
      { :label => '3', :value => 3 },
      { :label => '4', :value => 4 },
      { :label => '5', :value => 5 },
      { :label => '6', :value => 6 },
      { :label => '7', :value => 7 },
      { :label => '8', :value => 8 },
      { :label => '9', :value => 9 },
      { :label => '10', :value => 10 }
    ]
  end

end
