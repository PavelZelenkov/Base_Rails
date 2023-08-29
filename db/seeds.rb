# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  {title: 'Frodo'},
  {title: 'Gimli'},
  {title: 'Gandalf'}
])

categories = Category.create([
  {title: 'Backend', user_id: users.first.id},
  {title: 'Frontend', user_id: users[-2].id},
  {title: 'Mobile development', user_id: users.last.id}
])

tests = Test.create([
  {title: 'Ruby', level: 0, category_id: categories.first.id},
  {title: 'HTML', level: 1, category_id: categories[-2].id},
  {title: 'CSS', level: 1, category_id: categories[-2].id},
  {title: 'Go', level: 0, category_id: categories.first.id},
  {title: 'Java', level: 0, category_id: categories.last.id},
  {title: 'Ruby', level: 1, category_id: categories.first.id}
])

questions = Question.create([
  {body: 'Вопрос 1', test_id: tests.first.id},
  {body: 'Вопрос 2', test_id: tests[-5].id},
  {body: 'Вопрос 3', test_id: tests[-4].id},
  {body: 'Вопрос 4', test_id: tests[-3].id},
  {body: 'Вопрос 5', test_id: tests[-2].id},
  {body: 'Вопрос 6', test_id: tests.last.id}
])

answers = Answer.create([
  {body: 'Ответ 1', correct: 1, question_id: questions.first.id},
  {body: 'Ответ 2', correct: 1, question_id: questions[-5].id},
  {body: 'Ответ 3', correct: 1, question_id: questions[-4].id},
  {body: 'Ответ 4', correct: 1, question_id: questions[-3].id},
  {body: 'Ответ 5', correct: 1, question_id: questions[-2].id},
  {body: 'Ответ 6', correct: 1, question_id: questions.last.id}
])
