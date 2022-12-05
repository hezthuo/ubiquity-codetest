class CsvsController < ApplicationController
  before_action :authenticate_user!


  def index
    @user = current_user
    @csvindb = Csv.last
    csv = Csv.last
    @csv = csv.file
    
    @parsed_csv ||= CSV.parse(@csv.download, col_sep: ",", row_sep: :auto, skip_blanks: true)

  end

  def create 
    # Check that there's a file to be uploaded
    return redirect_to new_csv_path, alert: "Please select a file to be uploaded" unless params[:csv].present?
    file = params[:csv][:file].read 
    
    # check that upload is csv only
    return redirect_to new_csv_path, alert: "Please upload CSV only" unless params[:csv][:file].content_type == "text/csv"

    puts 'AFTER SERVICE OBJ: '
    
    # check if uuid column contains valid data. If not, abort mission
    csv = RowValidator.new(file)
    csv.validate_rows
    puts 'VALIDATED ROWS BOOLEAN VALUE:'
    puts csv.validate_rows
    return redirect_to new_csv_path, alert: "UUID column has bad data" unless csv.validate_rows
  

    # validated_csv = RowValidator.new(file)
    puts "PARSED FILE TO CONSOLE..."
    
    # parsed_csv = CSV.parse(file.path, col_sep: ",", row_sep: :auto, skip_blanks: true)
    # puts parsed_csv[0].class
    
    @csv = Csv.create(csv_params)
    @user = current_user
    @user.csvs << @csv
    
    if @user.save
      puts @csv.file.inspect

      flash[:success] = 'file ' + @csv.file.blob.filename.to_s + ' uploaded successfully' 
      redirect_to csvs_path
    else
      flash[:notice] = @csv.errors.full_messages.first
      redirect_to new_csv_path
    end 
    
  end

  def show
  end

  def new
    @csv = Csv.new
  end

  def edit
  end

  def destroy
  end

  private
  
  def csv_params
    params.require(:csv).permit(:name, :file)
  end 
end
