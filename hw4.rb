require 'byebug'
require 'pp'
class Team

  attr_reader :team_list, :pr

  def initialize(&block)
    @team_list = []
    @pr = []
    instance_eval &block
  end

  def priority(*list)
    list.each {|n| @pr << n}
  end

  def have_seniors(*names)
    names.each do |n| 
      @team_list << SeniorDeveloper.new(n)
    end
  end

  def have_developers(*names)
    names.each do |n| 
      @team_list << Developer.new(n)
    end
  end

  def have_juniors(*names)
    names.each do |n| 
      @team_list << JuniorDeveloper.new(n)
    end
  end

  def sort_by_rank(rank)
    @team_list.select {|r| r.rank.eql? rank}.map{|n| n.name}
  end

  def seniors
    sort_by_rank(:seniors)
  end

  def developers
    sort_by_rank(:developers)
  end

  def juniors
    sort_by_rank(:juniors)
  end
  
  def all
    @team_list
  end

  def report

  end

  def select_worker
    @team_list.sort_by {|e| [e.work_list, @pr.index(e.rank)]}.first
  end

  def add_task(task)
    select_worker.add_task(task)
  end

end

class Developer

  MAX_TASKS = 10

  attr_reader :name, :work_list

  def initialize(name)
    @name = name
    @work_list = []
  end

  def rank
    :developers
  end

  def add_task(task)
    can_add_task? ? busy : task_add(task)
  end

  def work!
    can_work? ? task_finish : relax
  end

  def tasks
    @work_list.map.with_index { |task, num| %Q(#{num+1}. "#{task}") }
  end

  def status
    case @work_list.size
    when self.class::MAX_TASKS
      'Занят'
    when 0
      'Свободен'
    else
      'Работаю'
    end
  end

  def can_add_task?
    @work_list.size >= self.class::MAX_TASKS
  end

  def can_work?
    !@work_list.empty?
  end

  private

  def relax
    raise "Нечего делать!"
  end

  def busy
    raise "Слишком много работы"
  end

  def task_add(task)
    @work_list << task
    puts %Q(%s: Добавлена задача "%s". Всего в списке задач: %i) %
    [name, task, work_list.size]
  end

  def task_finish
    if can_work?
      puts %Q(%s: Выполнена задача "%s". Осталось задач: %i) %
      [name, work_list.shift, work_list.size]
    end
  end
end

class SeniorDeveloper < Developer

  MAX_TASKS = 15

  def work!
    can_work? ? working : relax
  end

  def rank
    :seniors
  end

  private

  def working
    rand(2).zero? ? (puts "Что-то лень") : 2.times { task_finish }
  end
end

class JuniorDeveloper < Developer

  MAX_TASKS = 5

  def add_task(task)
    task_lenght?(task) ? (raise "Слишком сложно!") : super
  end

  def rank
    :juniors
  end

  private

  def task_lenght?(task)
    task.size >= 20
  end

  def task_finish
    puts %Q(%s: Пытаюсь делать задачу "%s". Осталось задач: %i) %
    [name, work_list.shift, work_list.size]
  end
end

byebug
t = Team.new do 
  have_seniors "Олег", "Оксана"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_juniors "Владислава", "Аркадий", "Рамеш"
  priority :juniors, :developers, :seniors

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