class SurveysController < ApplicationController
  # GET /surveys
  # GET /surveys.xml
  def index
    @surveys = Survey.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.xml
  use_google_charts
  def show
    @survey = Survey.find(:first, :conditions => { :owner_hash => params[:owner_hash] })
    
    # Create the google chart
    datasets = []
    colors = [ 'FFFF00', 'FF00FF', '00FFFF', 'FF0000', '00FF00', '0000FF' ]
    
    @fields = get_fields
    @survey.submissions.each do |submission|
      submissionData = []
      @fields.each do |field|
        submissionData << submission[field[:name]]
      end
      datasets << (GoogleChartDataset.new :data => submissionData, :title => submission.name, :color => colors.pop)
    end
    data = GoogleChartData.new :datasets => datasets, :min => 0, :max => 10
    axis = GoogleChartAxis.new :axis  => [GoogleChartAxis::LEFT, GoogleChartAxis::BOTTOM]
    labels = GoogleChartAxisLabels.new :labels  => [
      get_ratings.collect {|rating| rating[:description]},
      get_fields.collect {|field| field[:label]}
    ]
    stripes = GoogleChartStripes.new :stripes  => [
      {:color => "DDDDDD", :width => 7},
      {:color => "FFFFFF", :width => 7},
      {:color => "DDDDDD", :width => 7},
      {:color => "FFFFFF", :width => 7},
      {:color => "DDDDDD", :width => 1},
    ]
    @chart = GoogleLineChart.new :width => 900, :height => 300
    @chart.data = data
    @chart.axis = axis
    @chart.labels = labels
    @chart.stripes = stripes
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey }
    end
  end
  
  def view
    @survey = Survey.find(:first, :conditions => { :visitor_hash => params[:visitor_hash] })
    
    # Create the google chart
    datasets = []
    colors = [ 'FFFF00', 'FF00FF', '00FFFF', 'FF0000', '00FF00', '0000FF' ]
    
    @fields = get_fields
    @survey.submissions.each do |submission|
      submissionData = []
      @fields.each do |field|
        submissionData << submission[field[:name]]
      end
      datasets << (GoogleChartDataset.new :data => submissionData.reverse, :title => submission.name, :color => colors.pop)
    end
    data = GoogleChartData.new :datasets => datasets, :min => 0, :max => 10
    axis = GoogleChartAxis.new :axis  => [GoogleChartAxis::LEFT, GoogleChartAxis::BOTTOM]
    @chart = GoogleLineChart.new :width => 400, :height => 300
    @chart.data = data
    @chart.axis = axis
  end

  # GET /surveys/new
  # GET /surveys/new.xml
  def new
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(:first, :conditions => { :owner_hash => params[:owner_hash] })
  end

  # POST /surveys
  # POST /surveys.xml
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        flash[:notice] = 'Survey was successfully created.'
        format.html { redirect_to :action => 'show', :owner_hash => @survey.owner_hash }
        format.xml  { render :xml => @survey, :status => :created, :location => @survey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.xml
  def update
    @survey = Survey.find(:first, :conditions => { :owner_hash => params[:owner_hash] })

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        flash[:notice] = 'Survey was successfully updated.'
        format.html { render :action => "show", :owner_hash => @survey.owner_hash }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.xml
  def destroy
    @survey = Survey.find(:first, :conditions => { :owner_hash => params[:owner_hash] })
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
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
    ].reverse
  end

  def get_ratings
    ratings = [
      { :label => '0',  :value => 0,    :description => "Cannot Sing (0%)"},
      { :label => '1',  :value => 1,    :description => "Growl (10%)" },
      { :label => '2',  :value => 2,    :description => "Can Rarely Hit (20%)" },
      { :label => '3',  :value => 3,    :description => "Can Sometimes Hit (30%)" },
      { :label => '4',  :value => 4,    :description => "Can Typically Hit (40%)" },
      { :label => '5',  :value => 5,    :description => "Uncontrolled (50%)" },
      { :label => '6',  :value => 6,    :description => "Poor Control (60%)" },
      { :label => '7',  :value => 7,    :description => "Average Control (70%)" },
      { :label => '8',  :value => 8,    :description => "Good Control (80%)" },
      { :label => '9',  :value => 9,    :description => "Near Perfect Control (90%)" },
      { :label => '10', :value => 10,   :description => "Perfect Control (100%)"},
    ]
  end

end
