require_relative './hw3'

require 'byebug'
require 'pp'

class Team

  attr_reader :team_list, :pr, :groups

  def initialize(&block)
    @team_list = []
    @pr = []
    @groups = {}
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
  
  def all
    @groups.values_at(:seniors, :developers, :juniors)
  end

  def report(*pr)
    @groups.values_at(pr)
  end

  def select_worker
    @groups.values_at(*@pr).flatten.sort_by{|e| e.work_list}.first
  end

  def add_task(task)
    select_worker.add_task(task)
  end

end