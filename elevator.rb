class Elevator
  attr_accessor :floor, :time, :floors_arr
  def initialize
    @floor = 1
    @time = 0
    @floors_arr = [1]
    @up_arr = []
    @down_arr = []
    @timestamp = []
  end

  def request_up(time_called, from_floor)
    #Increase time according to floors traveled
    #Floor is now from_floor
    #Next action is request floor
    @timestamp << time_called
    @floors_arr << from_floor
    @up_arr << from_floor
    @time = @time + ((from_floor-@floor) *10).abs
    #update floor, elevator moves to floor that was requested from
    @floor = from_floor

  end

  def request_down(time_called, from_floor)
    #Increase time according to floors traveled
    #Floor is now from_floor
    #Next action is request floor
    @timestamp << time_called
    @floors_arr << from_floor
    @down_arr << from_floor
    @time = @time + ((from_floor-@floor) *10).abs
    #update floor, elevator moves to floor that was requested from
    @floor = from_floor
  end

  def request_floor(from_floor, to_floor)
    #Elevator floor is now to_floor
    #Time will now change according to floor traveled
    @floors_arr << to_floor
    @floor = to_floor
    @time = @time + ((from_floor - to_floor) *10).abs
  end

  def run
    p @floors_arr
  end

  def router
    # use floors, up, down arrs
    # use timestamps and current time
    # goal: determine optimal route for elevator
    # output: updated floors_arr organized in the correct order

    # @up_arr.sort.last = highest floor
    # @down_arr.sort.first = lowest floor

    #Assuming up direction::
    #if they push the button before the current time
    #if @timestamp[i] < @time
    # AND &&
    #if their floor is more than current floor
    #if @up_arr[i] > @floor
    #then they can still catch the elevator

    #Assuming down direction::
    #if they push the button before the current time
    #if @timestamp[i] < @time
    # AND &&
    #if their floor is less than the current floor
    # current time plus diff in floors times ten
    #then they can still catch the elevator

  end

end


#elevator takes into account which direction its going, at what point someone called the elevator and if it will be passing them, and then everyones destination according to up or down.

elevator1 = Elevator.new
elevator1.request_up(0,2)
p "You are now on floor: #{elevator1.floor}"
elevator1.request_floor(2,6)
p "You are now on floor: #{elevator1.floor}"
p elevator1.time
p elevator1.floors_arr
elevator1.request_down(15, 5)
p "You are now on floor: #{elevator1.floor}"
elevator1.request_floor(5, 4)
p "You are now on floor: #{elevator1.floor}"
p elevator1.time
p elevator1.floors_arr

# elevator2.requestUp(0, 2) // Rider A calls from 2nd level @ time unit 0
# elevator2.requestFloor(2, 6) // Rider A boards and requests 6th floor
# elevator2.requestDown(15, 5) // Rider B calls from 5th level @ time unit 15
# elevator2.requestFloor(5, 4) // Rider B boards and requests 4th floor
# elevator2.requestDown(41, 4) // Rider C requests from 4th floor @ time unit 41
# elevator2.requestFloor(4, 1) // Rider C boards and requests 1st floor
# elevator2.run() // [1, 2, 6, 5, 4, 1]
# elevator2.getTime() // 100




# elevator.requestUp(0, 1) // Rider calls from the ground level @ time unit 0
# elevator.requestFloor(1, 3) // Rider boards and requests 3rd floor
# elevator.run() // [1, 1, 3]






# Elevator Service

# More practice with services. We can build a service for most anything, which makes a very reproduceable and easily organized place for our functions.

## Requirements:
# [ ] The elevator must work on a building with any number of floors
# [ ] The elevator takes 10 seconds to travel one floor - count seconds as integers
# [ ] An elevator can be called from any floor on the building, and the rider will specify if they are going up or down.
# [ ] A rider will call the elevator by calling the method elevator.requestUp(int time, int fromFloor) or elevator.requestDown(int time, int fromFloor)
# [ ] Once inside the elevator, the rider can request any specific floor number.
# [ ] The method call for this request will be elevator.requestFloor(int fromFloor, int toFloor)
# [ ] If a rider is going to make a request for a particular floor, assume the request occurs at the same time unit the elevator arrived on the floor
# [ ] You need to implement the method that decides the routing. The elevator should service all requested operations in a timely manner and not make extraneous stops.
# [ ] Your program will be initialized with a series of steps and then called via elevator.run(). You can assume that the elevator knows all requests that are going to be made for it at the time the run method is called. When the program runs, it should return an array of the order of the floors that the elevator went in, with the first floor being in the 0 index.
# [ ] After running, elevator.getTime() should return the total elapsed time required to service all requests.


## Test Cases

# elevator.getTime() // 20
#
