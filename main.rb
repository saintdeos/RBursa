require 'byebug'
require_relative './hw4'

byebug
t = Team.new do 
  have_seniors "Олег", "Оксана"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_juniors "Владислава", "Аркадий", "Рамеш"
  priority :juniors, :developers, :seniors
  on_task :junior do |dev, task|
    puts "Отдали задачу #{task} разработчику #{dev.name}, следите за ним!"
  end
  on_task :senior do |dev, task|
    puts "#{dev.name} сделает #{task}, но просит больше с таким глупостями не приставать."
  end
  on_task :developer do |dev, task|
    puts "#{dev.name} работает над #{task}, просил не беспокоить."
  end

end

def works_dict
  works_dict = ['Помыть машину', 'Постирать коврики', 'Прочитать рассылку', 'Покрасить забор', 
                  'Вынести мусор', 'Съесть печеньки', 'Поработать над таском', 'Сходить в спортзал', 
                  'Оплатить интернет', 'Поздравить директора', 'Купить подарок', 'Выпить кофе', 
                  'Сходить в паб', 'Полежать на диване', 'Посмотреть фильм', 'Послушать музыку', 
                  'Поспать']
  works_dict.sample
end

15.times { t.add_task(works_dict) }
# pp t.add_task('taste food')
# pp t.add_task('taste food')
# pp t.add_task('taste food')
# pp t.add_task('taste food')
# pp t.add_task('taste food')
# pp t.add_task('taste food')
pp t.report
# pp t.all

# pp t.juniors
# pp t.seniors
# pp t.developers