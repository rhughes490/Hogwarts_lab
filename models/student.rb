require_relative('../db/sql_runner')

class Student 
    attr_reader :id, :first_name, :second_name, :house, :age

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @second_name = options['second_name']
        @house = options['house']
        @age = options['age'].to_i
    end

    def save()
        sql = "INSERT INTO students
        (first_name, 
        second_name,
        house,
        age) 
        VALUES 
        ($1, 
        $2,
        $3,
        $4) RETURNING id;"
        values = [@first_name, @second_name, @house, @age]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end

    def pretty_name()
      return "#{@first_name} #{@second_name}"
    end

    def self.all()
        sql = "SELECT * FROM students;"
        students_hashes = SqlRunner.run(sql)
        return students_hashes.map{ |student| Student.new(student)}
    end

    def self.find(id)
        sql = "SELECT * FROM students WHERE id = $1;"
        values = [id]
        result = SqlRunner.run(sql, values)[0]
        return nil if result == nil
        return Artist.new(result)
    end

end