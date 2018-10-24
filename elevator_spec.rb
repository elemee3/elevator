require 'rspec'
require_relative 'elevator'

describe Elevator do
  before do
    @a_elevator = Elevator.new()
  end

  it "elevator is a thing" do
    expect{Elevator.new()}. to_not raise_error
  end

  it "has a request up method" do
    expect(@a_elevator). to respond_to(:request_up)
  end



  it "has a request down method" do
    expect(@a_elevator). to respond_to(:request_down)
  end

  it "has a request floor method" do
    expect(@a_elevator). to respond_to(:request_floor)
  end

end
