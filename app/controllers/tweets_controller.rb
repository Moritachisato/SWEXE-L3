class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    
  end
  
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    
    @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    
    if @tweet.save
     flash[:notice] = "1レコード追加しました"
     redirect_to :root #=>一覧ページにリダイレクトする
    else
     render 'new'
    end
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:notice] = "1レコード削除しました"
    redirect_to "/"
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(message: params[:tweet][:message])
    flash[:notice] = "1レコード更新しました"
    redirect_to "/"
  end
  
end

