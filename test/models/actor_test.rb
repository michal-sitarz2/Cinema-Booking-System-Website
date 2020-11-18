require 'test_helper'

class ActorTest < ActiveSupport::TestCase

  setup do
    @movie = movies(:one)
  end

  test 'should not save actor without a name' do
    actor = Actor.new
    actor.surname = "surname"
    actor.movie = @movie

    actor.save
    refute actor.valid?
  end

  test 'should not save empty actor' do
    actor = Actor.new
    actor.name = "name"
    actor.surname = "surname"

    actor.save
    refute actor.valid?

  end

  test 'should save valid actor' do
    actor = Actor.new
    actor.name = "name"
    actor.surname = "surname"
    actor.movie = @movie

    actor.save
    assert actor.valid?
  end


end
