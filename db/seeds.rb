# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Hr.create(name: 'Karan Verma', email: 'hr123@gmail.com', password: '12345678', role: 'HR Manager',
          joining_date: '2023-01-01', salary: 25_000)
