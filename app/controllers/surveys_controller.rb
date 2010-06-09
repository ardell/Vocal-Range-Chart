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
    @survey.submissions.each do |submission|
      datasets << (GoogleChartDataset.new :data => [submission.a_0, submission.a_sharp_0, submission.b_0, submission.c_1], :title => submission.name, :color => colors.pop)
    end
    data = GoogleChartData.new :datasets => datasets, :min => 0, :max => 10
    axis = GoogleChartAxis.new :axis  => [GoogleChartAxis::LEFT, GoogleChartAxis::BOTTOM]
    @chart = GoogleLineChart.new :width => 400, :height => 300
    @chart.data = data
    @chart.axis = axis
    # @chart = GoogleChart.line(
    #   :data => [
    #     [1, 2, 4, 3],
    #     [2, 3, 5, 4]
    #   ],
    #   :labels => { 
    #     :x => [ 'A0', 'A#0', 'B0', 'C1' ], 
    #     :y => [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ] 
    #   }
    # )

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey }
    end
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
end
