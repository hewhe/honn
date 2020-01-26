class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new #一覧の中に投稿を作る
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)#(params[:book])はストロンを使わないときに使う
    if @book.save
  	    flash[:notice] = "successfully Created"
  	    redirect_to book_path(@book.id)
    else
       @books = Book.all #ifの上に書いてもどっちでもいい。なぜ？
       render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
	 @book = Book.find(params[:id])
	  if @book.update(book_params)
	   flash[:notice] = "successfully Updated"
	   redirect_to book_path(@book.id) #なんで引数の中がbookでいいのかはresourcesで決められたから、asで設定した場合もok
								   #そうじゃなくて引数の中がbookでいいのはbookという変数が作られていてそこに。idをつけるとそこの番号のurlになる
    else
      render :show
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:notice] = "successfully Destroied"
  	redirect_to books_path #index一覧へ
  end

  private
  def book_params #modelとつながっている
  	params.require(:book).permit(:title, :body) #requireのbookてなに？
  end
end
