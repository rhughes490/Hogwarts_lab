require_relative('../db/sql_runner')

class House 
    attr_reader :id, :name

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
    end

    def save()
        sql = "INSERT INTO houses
        (name)
        VALUES
        ($1)
        RETURNING id;"
        values = [@name]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end

    def self.all()
        sql = "SELECT * FROM houses;"
        houses_hashes = SqlRunner.run(sql)
        return houses_hashes.map{ |house| House.new(house)}
    end

    def self.find(id)
        sql = "SELECT * FROM houses WHERE id = $1;"
        values = [id]
        result = SqlRunner.run(sql, values)[0]
        return nil if result == nil
        return House.new(result)
    end

end