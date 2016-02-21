
class Developer

  MAX_TASKS = 10

  attr_reader :name, :work_list

  def initialize(name)
    @name = name
    @work_list = []
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

  private

  def can_add_task?
    @work_list.size >= self.class::MAX_TASKS
  end

  def can_work?
    !@work_list.empty?
  end

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

  private

  def task_lenght?(task)
    task.size >= 20
  end

  def task_finish
    puts %Q(%s: Пытаюсь делать задачу "%s". Осталось задач: %i) %
    [name, work_list.shift, work_list.size]
  end
end