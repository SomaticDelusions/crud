############################################################
#
#  Name:        Sean Glover
#  Date:        02/13/2013
#  Description: Create Read Update Delete program using Arrays only
#
############################################################

names = ["tom", "dick", "harry"]
ages = [35, 53, 23]

def menu
  puts
  puts "1. View all people"
  puts "2. Add a new person"
  puts "3. Update an existing person"
  puts "4. Delete a person"
  puts
  puts "5. View all people that start with a letter"
  puts "6. View all people younger than 21"
  puts "7. View oldest person"
  puts "8. View youngest person"
  puts
  puts "9. Quit"
end

def display_people(names, ages)
  puts
  names.each_with_index do |name, index|
    puts "#{index + 1}. #{name.ljust(20)} #{ages[index].to_s.rjust(3)}"
  end
end

user_choice = 0
until user_choice == 9
  menu
  user_choice = gets.to_i

  if user_choice == 1
    display_people(names, ages)

  elsif user_choice == 2
    print "Please enter a name: "
    new_name = gets.chomp
    print "Please enter age: "
    new_age = gets.to_i

    if new_name == "" or new_age == ""
      puts "Name and age are required. Record was not updated."
    else
      names.push(new_name)
      ages.push(new_age)
      puts "#{new_name} was added to the records."
    end

  elsif user_choice == 3
    display_people(names, ages)

    print "Record number you would like to update (leave blank to cancel update): "
    record_number = gets.to_i - 1

    if record_number + 1 > names.length
      puts "That is not a valid record."

    elsif record_number > 0
      print "Enter new name (leave blank to retain current data): "
      new_name = gets.chomp
      print "Enter new age (leave blank to retain current data): "
      new_age = gets.to_i

      if new_name == "" and new_age == 0
        puts "Record was not updated."

      else
        if new_name != ""
          names[record_number] = new_name
        end

        if new_age != 0
          ages[record_number] = new_age
        end
        puts "Record was updated."
      end
    end

  elsif user_choice == 4
    display_people(names, ages)

    print "Record number you would like to delete: "
    record_number = gets.to_i - 1

    if record_number + 1 > names.length or record_number == -1
      puts "That is not a valid record"
    else
      puts "Are you sure you want to permanently delete #{names[record_number]} age #{ages[record_number]}?"
      puts "This cannot be reversed if you accept. (y/n)"
      user_delete = gets.chomp

      if user_delete == "y"
        names.delete_at(record_number)
        ages.delete_at(record_number)
        puts "Record was deleted."
      else
        puts "The record was not updated."
      end
    end

  elsif user_choice == 5
    print "Enter the first letter of the names you would like to search for: "
    letter = gets.chomp

    names_search = []
    ages_search = []

    names.each_with_index do |name, index|

      if name[0].downcase == letter.downcase
        names_search.push(name)
        ages_search.push(ages[index])
      end
    end

    if names_search.length > 0
      display_people(names_search, ages_search)
    else
      puts "No records were found using your search criteria."
    end

  elsif user_choice == 6
    names_age_21 = []
    ages_age_21 = []

    ages.each_with_index do |age, index|

      if age < 21
        names_age_21.push(names[index])
        ages_age_21.push(age)
      end
    end

    if ages_age_21.length > 0
      display_people(names_age_21, ages_age_21)
    else
      puts "There are no records with an age less than 21."
    end

  elsif user_choice == 7
    oldest_age = 0
    oldest_name = []

    ages.each_with_index do |age, index|

      if age > oldest_age
        oldest_age = age
        oldest_name.clear
        oldest_name.push(names[index])
      elsif age == oldest_age
        oldest_name.push(names[index])
      end
    end

    oldest_name.each_with_index do |name, index|
      puts "#{index + 1}. #{name.ljust(20)} #{oldest_age.to_s.rjust(3)}"
    end

  elsif user_choice == 8
    youngest_age = 999
    youngest_name = []

    ages.each_with_index do |age, index|

      if age < youngest_age
        youngest_age = age
        youngest_name.clear.push(names[index])
        #youngest_name.push(names[index])
      elsif age == youngest_age
        youngest_name.push(names[index])
      end
    end

    youngest_name.each_with_index do |name, index|
      puts "#{index + 1}. #{name.ljust(20)} #{youngest_age.to_s.rjust(3)}"
    end

  elsif user_choice != 9
    puts "That is an invalid selection."
  end
end
