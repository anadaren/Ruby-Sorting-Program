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
    return action
end

def sortFunction (data, indexToSort)
    
    dataLength = data.size
    return if data if dataLength <= 1

    swapped = false
    while !swapped
        swapped = false
        (dataLength-1).times do |i|
            (dataLength-1).times do |j|
                if data[j][indexToSort] > data[j+1][indexToSort]
                    data[j], data[j+1] = data[j+1], data[j]
                    swapped = true
                end
            end
        end
    end
end

file_data = Array.new
groupSize = 5

#cycles through options until 'Quit' is selected
loop do
    action = whatDo()

    #input data
    if action == '1'
        print "Enter name of file you want to access. "
        fileName = gets.chomp
        #reads data from file
        file = File.open(fileName)
        #puts data into array
        file_data = File.readlines(fileName)[1..-1].map do |line|
            line.split(",").map(&:to_s)
        end

        #closes file
        file.close
        puts "File read into array."
    end

    #edit data
    if action == '2'
        puts "What do you want to do?"
        puts "1 - Add New Student"
        puts "2 - Delete Student"
        puts "3 - Edit Student Information"
        edit = gets.chomp

        #add new student
        if edit == '1'
            #gets info
            puts "Enter new Student Information."
            newStud = gets.split(",").map(&:to_s)
            
            #add to array
            
            toAdd = file_data.select { |x| x[2] == studMail}
                if toAdd == []
                file_data = file_data.push(newStud)
                puts "Student added to file."
            else
                puts "Student already in file."
            end

        end

        #deletes student
        if edit == '2'
            #gets info
            puts "Enter email of Student to Delete."
            studMail = gets.chomp

            #deletes from array
            toDelete = file_data.select { |x| x[2] == studMail}
                puts toDelete
                if toDelete == []
                    puts "Student not found"
                else
                    file_data -= toDelete
                    puts "Student deleted."
                end
        end

        #edit student
        if edit == '3'
            puts "Enter email of Student you wish to edit."
            studMail = gets.chomp
            temp = 0
            toEdit = file_data.index { |x| x[2] == studMail}
            if toEdit == []
                puts "Student not found."
            else
                puts "Which category do you wish to change?"
                puts "1 - First name"
                puts "2 - Last name"
                puts "3 - Email Address"
                puts "4 - Primary Major"
                puts "5 - Secondary Major"
                puts "6 - First Minor"
                puts "7 - Second Minor"
                makeEdit = gets.to_i
                puts "Enter new information."
                newInfo = gets.chomp

                file_data[toEdit][makeEdit-1] = newInfo
                
                puts "New information taken."
                puts file_data
            end
        end

    end

    #form groups
    if action == '3'
        puts "Enter size of groups. (Default size 5.)"
        groupSize = gets.to_i

        puts "Select constraints. (You may enter multiple.)"
        puts "1 - Similar Majors"
        puts "2 - Similar Minors"
        puts "3 - Groups Must be in same section"

        # take input
        constra = gets.chomp

        #sort groups
        if constra.include?("1")
            sortFunction(file_data, 4)
        end
        if constra.include?("2")
            sortFunction(file_data, 6)
        end
        if constra.include?("3")
            sortFunction(file_data, 3)
        end

        #add constraints as necessary

    end

    #list groups
    if action == '4'
        groupNumber = 1
        puts "Group number #{groupNumber}"
        for i in 0..file_data.length()-1 do
            if i%groupSize == 0 && i != 0
                groupNumber += 1
                puts "--"
                puts
                puts "Group number #{groupNumber}:"
            end
            puts file_data[i]
        end
        puts
    end

    #write groups to file
    if action == '5'
        print "Enter name of file you want to write the groups to."
        writeName = gets.chomp
        File.open(writeName, "w+") do |x|
            x.puts(file_data)
        end
        puts "Groups written to file."
    end

    #quit
    if action == '6'
        break;
    end
end