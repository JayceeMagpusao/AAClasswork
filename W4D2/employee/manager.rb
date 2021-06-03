require_relative "employee.rb"
require "byebug"

class Manager < Employee
    attr_accessor :employees
    def initialize(name, title, salary, boss)
        super
        @employees = [] #[jay, pat, mike, kevin] mike 1485381[@emplyees = [john, kyle]]
    end

    def bonus(multiplier)
        bonus = self.getSalaries
        bonus * multiplier
    end

    def getSalaries
        total = 0
        @employees.each do |employee|
            if employee.kind_of?(Manager)
                total += employee.getSalaries + employee.salary
            else 
                total += employee.salary
            end
        end
        total
    end
end

ned = Manager.new("ned", "founder", 1000000, nil)
darren = Manager.new("darren", "TA manager", 78000, ned)
ned.employees << darren
shawna = Employee.new("shawna", "TA", 12000, darren)
darren.employees << shawna
david = Employee.new("david", "TA", 10000, darren)
darren.employees << david

puts ned.bonus(5)
puts darren.bonus(4)
puts david.bonus(3)