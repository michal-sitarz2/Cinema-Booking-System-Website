require 'test_helper'

class CinemaTest < ActiveSupport::TestCase

  test 'should save valid cinema' do
    cinema = Cinema.create(name: "IMAX London", location: "Waterloo, London")
    cinema.save
    assert cinema.valid?
  end

  test 'should not save cinema without name' do
    cinema = Cinema.create(location: "Waterloo, London")
    cinema.save
    refute cinema.valid?
  end

  test 'should not save cinema without surname' do
    cinema = Cinema.create(name: "IMAX London")
    cinema.save
    refute cinema.valid?
  end

  test 'should not save a cinema with repeated name' do
    cinema1 = Cinema.create(name: "IMAX London", location: "Waterloo, London")
    cinema1.save
    assert cinema1.valid?

    cinema2 = Cinema.create(name: "IMAX London", location: "Waterloo, London")
    cinema2.save
    refute cinema2.valid?
  end

end
