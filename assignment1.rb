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

#cycles through options until 'Quit' is selected
loop do
    action = whatDo()

    #input data
    if action == '1'
        print "Enter name of file you want to access."
        fileName = gets.chomp
        #reads data from file
        file = File.open(fileName)
        #puts data into array
        file_data = File.read(fileName).split(",").map(&:chomp)
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

        if edit == '1'
            puts "Enter new Student Information."
            #add to array

        end
        if edit == '2'
            puts "Enter name of Student to Delete."
            studName = gets.chomp
            #studentFound = search(studentName)
            #delete student
            #make sure array is fine

        end
        if edit == '3'
            puts "Enter name of Student you wish to edit."
            studName = gets.chomp
            #studLocation = search(studName)
            puts "Which category do you wish to change?"
            puts "1 - First name"
            puts "2 - Last name"
            puts "3 - Email Address"
            puts "4 - Primary Major"
            puts "5 - Secondary Major"
            puts "6 - First Minor"
            puts "7 - Second Minor"
            makeEdit = gets.chomp
            puts "Enter new information."
            file_data[studLocation][makeEdit-1] = makeEdit
            puts "New information taken."
        end

    end
    #form groups
    if action == '3'
        puts "Enter size of groups."
        groupSize = gets.chomp

    end
    #edit groups
    if action == '4'

    end
    #write groups to file
    if action == '5'
        print "Enter name of file you want to write to."
        file = File.open(fileName, "w")
        File.write(fileName, [1,2,3].join("\n"), mode: "a")
        puts "Groups written to file."
    end
    #quit
    if action == '6'
        break;
    end
end