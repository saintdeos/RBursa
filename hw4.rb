require_relative './hw3'

require 'byebug'
require 'pp'

class Team

  attr_reader :team_list, :pr, :groups, :bl

  def initialize(&block)
    @team_list = []
    @pr = []
    @groups = {}
    @bl = {}
    instance_eval &block
  end

  def priority(*list)
    *@pr = list
  end

  def make_dev(type, group, *names)
    names.each {|n| @team_list << type.new(n)}
    @groups[group] = @team_list.select{|obj| obj.class.eql? type}
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
    @groups[:seniors]
  end

  def developers
    @groups[:developers]
  end

  def juniors
    @groups[:juniors]
  end

  def on_task(type, &block)
    case
    when type == :junior
      @bl[type] = block
    when type == :developer
      @bl[type] = block
    else
      @bl[type] = block
    end
  end
  
  def all
    @groups.values_at(:seniors, :developers, :juniors).flatten
  end

  def report
    all.each do |dev|
      puts "#{dev.name} (#{dev.rank.to_s}): #{dev.work_list.join(", ")}"
    end
  end

  def select_worker
    @groups.values_at(*@pr).flatten.sort_by{|e| e.work_list.size}
  end

  def add_task(task)
    worker = select_worker.first
    worker.add_task(task)
    @bl[worker.rank].call(worker, task)
  end

end