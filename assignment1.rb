# creates method to fuction as menu
def whatDo
puts "What do you want to do?"
puts "1 - Open File"
puts "2 - Edit Data"
puts "3 - Form Groups"
puts "4 - List Groups"
puts "5 - Write Data to file"
puts "6 - Quit"

action = gets.chomp
end

#cycles through options until 'Quit' is selected
loop do
    whatDo()

    if action == 1
        print "Enter name of file you want to access. "
        fileName = gets.chomp
        file = File.open(fileName)
    end
    if action == 2


    end

    if action == 3

    end

    if action == 4

    end
    
    if actioin == 5


    end

    if action == 6
        File.close(file)
        break;
    end

end