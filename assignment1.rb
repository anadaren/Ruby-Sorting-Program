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
        file_data = File.readlines(fileName)[0..-1].map do |line|
            line.split(",").map(&:to_s)
        end

        #closes file
        file.close

        #puts file_data[0]
        #puts file_data[0][0]
        #file_data.each { |x| puts "#{x}\n" }
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
            puts "Enter new Student Information."
            newStud = gets.split(",").map(&:to_s)
            #add to array
            studLocation = file_data.assoc(studMail)
            if studLocation == 'nil'

                puts "Student added to file."
            else
                puts "Student already in file."
            end

        end
        #deletes student
        if edit == '2'
            puts "Enter email of Student to Delete."
            studMail = gets.chomp
            #for x [0..x-1]
                file_data[x].include?(studMail)
            studLocation = file_data.assoc(studMail)
            if studLocation == 'nil'
                puts "Student not found."
            else

            #make sure array is fine
                puts "Student deleted."
            end
        end
        #edit student
        if edit == '3'
            puts "Enter email of Student you wish to edit."
            studMail = gets.chomp
            studLocation = file_data.assoc(studMail)
            if studLocation == 'nil'
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
                makeEdit = gets.chomp
                puts "Enter new information."
                newInfo = gets.chomp
                file_data[studLocation][makeEdit-1] = newInfo
                puts "New information taken."
            end
        end

    end

    #form groups
    if action == '3'
        puts "Enter size of groups."
        groupSize = gets.chomp

        puts "How do you want the groups to be sorted? (You may enter multiple.)"
        puts "1 - Alphabetical by last name"
        puts "2 - Similar Majors"
        puts "3 - Different Majors"
        puts "4 - Section"

        # take input

        #sort groups
        if constra == '1'
            #sort by last name
        end
        if constra == '2'
            #sort by contains major
        end
        if constra == '3'
            #sort by different major
        end
        if constra == '4'
            #sorts by section
        end
        #groupArray of new groups

        #print out groups
        #print
    end

    #edit groups
    if action == '4'

    end

    #write groups to file
    if action == '5'
        print "Enter name of file you want to write to."
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