require "open-uri"
class PageController < ApplicationController

  def welcome
    @issues  = Issue.all.order(id: :desc)
  end

  def about
    
  end

  def get_bing_images
    #如果有GET请求参数直接写在URI地址中  
    uri = 'https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=8&video=1'
    response = nil;
    begin
      timeout(10) do
        open(uri) do |http|  
          response = http.read    
        end
      end
    rescue StandardError,Timeout::Error
      log_p "{错误}***网页打开超时mech"
    end
    if !response.nil?
       result = JSON.parse(response)
       data = result["images"]
    else
      data = []
    end
    render json: {success: true, data: data}
   
  end
end