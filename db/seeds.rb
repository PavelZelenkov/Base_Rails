# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  {user_name: 'Frodo', user_surname: 'Beggins', email: 'frodo@gmail.com', password: 'qwerty'},
  {user_name: 'Gimli', user_surname: 'Bronzebeard', email: 'gimli@gmail.com', password: 'qwerty'},
  {user_name: 'Gandalf', user_surname: 'Grey', email: 'gandalf@gmail.com', password: 'qwerty'}
])

categories = Category.create!([
  {title: 'Backend', user_id: users.first.id},
  {title: 'Frontend', user_id: users[-2].id},
  {title: 'Mobile development', user_id: users.last.id}
])

tests = Test.create!([
  {title: 'Ruby', level: 0, category_id: Category.first.id, author_id: User.last.id},
  {title: 'Rails', level: 1, category_id: Category.first.id, author_id: User.last.id},
  {title: 'HTML', level: 1, category_id: Category.ids[-2], author_id: User.last.id},
  {title: 'Java', level: 0, category_id: Category.last.id, author_id: User.last.id}
])

questions = Question.create!([
  {body: 'Что такое миграция в Rails?', test_id: Test.ids[-3]},
  {body: 'Как провести миграцию в Rails?', test_id: Test.ids[-3]},
  {body: 'Как удалить последнюю миграцию в rails?', test_id: Test.ids[-3]},
  {body: 'Можно ли писать комментарии в HTML-коде?', test_id: Test.ids[-2]},
  {body: 'Что делает тег <br>?', test_id: Test.ids[-2]}
])

answers = Answer.create!([
  {body: 'Как у птиц, только в программировании', correct: false, question_id: Question.ids[3]},
  {body: 'Механизм ActiveRecord, который позволяет вносить изменения в структуру данных', correct: true, question_id: Question.ids[3]},
  {body: '-$ rails db:migrate', correct: true, question_id: Question.ids[4]},
  {body: '-$ rails migrate', correct: false, question_id: Question.ids[4]},
  {body: '-$ migrate', correct: false, question_id: Question.ids[4]},
  {body: '-$ migrate delete', correct: false, question_id: Question.ids[5]},
  {body: '-$ rails db:rollback', correct: true, question_id: Question.ids[5]},
  {body: 'Да можно', correct: true, question_id: Question.ids[6]},
  {body: 'Нет нельзя', correct: false, question_id: Question.ids[6]},
  {body: 'Ничего не делает', correct: false, question_id: Question.ids[7]},
  {body: 'Отделяет фрагменты текста друг от друга', correct: true, question_id: Question.ids[7]}
])
