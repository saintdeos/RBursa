class Developer

  attr_reader :name, :work_list, :rank

  def initialize(name)
    @name = name
    @work_list = []
    @rank = :developer
  end

  def add_task(task)
    @work_list << task
    puts %Q(%s: Добавлена задача "%s". Всего в списке задач: %i) %
    [name, task, work_list.size]
  end

  def work!
    can_work? ? task_finish : relax
  end

  def tasks
    @work_list.map.with_index { |task, num| %Q(#{num+1}. "#{task}") }
  end

  def can_work?
    !@work_list.empty?
  end

  private

  def relax
    puts "Нечего делать!"
  end

  def task_finish
    if can_work?
      puts %Q(%s: Выполнена задача "%s". Осталось задач: %i) %
      [name, work_list.shift, work_list.size]
    end
  end
end

class SeniorDeveloper < Developer

  def initialize(name)
    super
    @rank = :senior
  end

  def work!
    can_work? ? working : relax
  end

  private

  def working
    rand(2).zero? ? (puts "Что-то лень") : 2.times { task_finish }
  end
end

class JuniorDeveloper < Developer

  def initialize(name)
    super
    @rank = :junior
  end

  private

  def task_finish
    puts %Q(%s: Пытаюсь делать задачу "%s". Осталось задач: %i) %
    [name, work_list.shift, work_list.size]
  end
end
