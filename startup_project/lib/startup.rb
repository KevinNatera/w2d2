require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name,funding,salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end


    def valid_title?(title)
        @salaries[title] != nil
    end


    def >(startup)
        @funding > startup.funding
    end


    def hire(name,title)
        if @salaries[title] != nil
           @employees << Employee.new(name,title)
        else 
            raise "Error: Invalid title."
        end
    end


    def size
        @employees.length
    end


    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding > salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "Error: Broke af"
        end 
    end


    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end


    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += salaries[employee.title]
        end
        sum / employees.length
    end


    def close
        @employees = []
        @funding = 0
    end


    def acquire(startup)
        @funding += startup.funding

        startup.salaries.each do |k,v|
            @salaries[k] = v if !@salaries.has_key?(k)
         end

        startup.employees.each do |employee|
            @employees << employee
        end
        startup.close
    end
end
