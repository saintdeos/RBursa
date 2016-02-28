require 'byebug'
require_relative './hw4'

byebug
t = Team.new do 
  have_seniors "Олег", "Оксана"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_juniors "Владислава", "Аркадий", "Рамеш"
  priority :juniors, :developers, :seniors
  # on_task :junior

end

pp t.juniors
pp t.seniors
pp t.developers
pp t.add_task('taste food')
pp t.add_task('taste food')
pp t.add_task('taste food')
pp t.add_task('taste food')
pp t.add_task('taste food')
pp t.add_task('taste food')
pp t.all


# dev = JuniorDeveloper.new('Vasya')
# dev = SeniorDeveloper.new('Vasya')
# dev = Developer.new('Vasya')
# puts dev.status
# dev.add_task('Помыть машину')
# dev.add_task('Постирать коврики')
# dev.add_task('Прочитать рассылку')
# dev.add_task('Покрасить забор')
# dev.add_task('Вынести мусор, который лежит уже полгода в гараже')
# puts dev.tasks
# puts dev.status
# dev.add_task('Съесть печеньки')
# dev.add_task('Поработать над таском')
# dev.add_task('Сходить в спортзал')
# dev.add_task('Оплатить счет за интернет')
# dev.add_task('Поздравить директора с Днем Рождения')
# dev.tasks
# dev.add_task('Купить подарок')
# dev.add_task('Выпить кофе')
# dev.add_task('Сходить в паб с друзьями')
# dev.add_task('Полежать на диване')
# dev.add_task('Посмотреть фильм')
# dev.tasks
# dev.add_task('Послушать музыку')
# dev.add_task('Поспать')
# puts dev.status
# 5.times { dev.work! }
# dev.tasks
# 5.times { dev.work! }
# dev.tasks
# 15.times { dev.work! }
# dev.tasks