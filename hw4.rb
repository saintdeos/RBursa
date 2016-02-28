require_relative './hw3'

class Team

  attr_reader :team_list, :pr, :devs, :bl

  def initialize(&block)
    @pr = []
    @devs = {}
    instance_eval &block
  end

  def priority(*list)
    *@pr = list
  end

  def make_dev(type, group, *names)
    @devs[group] = names.map{|n| type.new(n)}
  end

  def have_seniors(*names)
      make_dev(SeniorDeveloper, :seniors, *names)
  end

  def have_developers(*names)
    make_dev(Developer, :developers, *names)
  end

  def have_juniors(*names)
    make_dev(JuniorDeveloper, :juniors, *names)
  end

  def seniors
    @devs[:seniors]
  end

  def developers
    @devs[:developers]
  end

  def juniors
    @devs[:juniors]
  end

  def on_task(type, &block)
    @devs[type] = block
  end
  
  def all
    @devs.values_at(:seniors, :developers, :juniors).flatten
  end

  def report
    all.each do |dev|
      puts "%s (%s): %s" %
        [dev.name, dev.rank, dev.work_list.join(", ")]
    end
  end

  def select_worker
    @devs.values_at(*@pr).flatten.sort_by{|e| e.work_list.size}
  end

  def add_task(task, **options)
    case
    when options[:complexity]
      worker = select_worker.select{|r| r.rank.eql? options[:complexity]}.first
    when options[:id]
      worker = select_worker.select{|n| n.name.eql? options[:id]}.first
    else
      worker = select_worker.first
    end
    worker.add_task(task)
    @devs[worker.rank].call(worker, task)
  end
end
