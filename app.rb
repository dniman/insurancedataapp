# app.rb
require 'rubyXL'
require 'bundler'
Bundler.require

class InsuranceDataApp < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/create" do
    erb :new
  end

  post "/create" do
    #columns = {"0" => ,"1" => params.fetch(:birthDate,""), "2" => params.fetch(:docText,""),"3" => params.fetch(:fioParentText,"")}
    index = worksheet.sheet_data.size
    row = worksheet.add_row(index)
    worksheet.add_cell(index, 0, params.fetch(:fio_child,""))
    worksheet.add_cell(index, 1, params.fetch(:birthdate,""))
    worksheet.add_cell(index, 2, params.fetch(:doc_text,""))
    worksheet.add_cell(index, 3, params.fetch(:fio_parent,""))
    workbook.save
    redirect "/"
  end


  private 

  def workbook
    @workbook ||= RubyXL::Parser.parse("./db/list.xlsx")
  end

  def worksheet
    @worksheet ||= workbook[0]
  end
end