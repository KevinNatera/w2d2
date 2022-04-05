require_relative "room"

class Hotel

    def initialize(name,hash)
        @name = name
        @rooms = Hash.new

        hash.each do |k,v|
            @rooms[k] = Room.new(v)
        end
        
    end

    def name
        arr = @name.split(" ")
        arr.each_with_index do |word,i|
            arr[i] = word.capitalize
        end
        arr.join(" ")
    end


    def rooms
        @rooms
    end


    def room_exists?(name)
        @rooms[name] != nil
    end

    
    def check_in(name,room_name)
        if self.room_exists?(room_name)
           if @rooms[room_name].add_occupant(name)
            p "check in successful"
           else
            p "sorry, room is full"
           end
        else
            p "sorry, room does not exist"
        end
    end


    def has_vacancy?
        vacant = false

        @rooms.each do |k,v|
            vacant = true  if !v.full?
        end

        vacant
    end


    def list_rooms
        @rooms.each do |k,v|
            puts k + ".*" + v.available_space.to_s
        end
    end
end
