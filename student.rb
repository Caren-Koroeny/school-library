require_relative './person'

class Student < Person
    attr_reader :classroom
    def initialize(_id, age, classroom, name = 'unknown' , parent_permission: true)