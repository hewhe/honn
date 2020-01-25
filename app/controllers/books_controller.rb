class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new #一覧の中に投稿を作る
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)#(params[:book])はストロンを使わないときに使う
  	book.save
  	flash[:success1] = "Successfully Created"
  	redirect_to book_path(book.id)
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
	book = Book.find(params[:id])
	book.update(book_params)
	flash[:success2] = "Successfully Updated"
	redirect_to book_path(book.id) #なんで引数の中がbookでいいのかはresourcesで決められたから、asで設定した場合もok
								   #そうじゃなくて引数の中がbookでいいのはbookという変数が作られていてそこに。idをつけるとそこの番号のurlになる
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:success3] = "Successfully Destroied"
  	redirect_to books_path #index一覧へ
  end

  private
  def book_params #modelとつながっている
  	params.require(:book).permit(:title, :body) #requireのbookてなに？
  end
end
