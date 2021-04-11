class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Aleksey',
        username: '@alex',
        avatar_url: 'https://png.pngtree.com/png-clipart/20210328/original/' \
        'pngtree-watercolor-vacuum-lion-avatar-png-image_6169183.jpg'
      ),
      User.new(id: 2, name: 'Arnold', username: '@artist')
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
      name: 'Aleksey',
      username: 'alex',
      avatar_url: 'https://png.pngtree.com/png-clipart/20210328/original/' \
        'pngtree-watercolor-vacuum-lion-avatar-png-image_6169183.jpg'
    )
    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('10.04.2021')),
      Question.new(text: 'Как успехи?', created_at: Date.parse('10.04.2021'))
    ]

    @new_question = Question.new
  end
end
