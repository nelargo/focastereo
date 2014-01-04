# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140104094656) do

  create_table "administradors", force: true do |t|
    t.string   "usuario"
    t.string   "password"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "db_alumnos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editar_ramos", force: true do |t|
    t.string   "sigla"
    t.string   "nombre"
    t.integer  "cant_ayudantes"
    t.string   "tipo_ayudante"
    t.string   "criterio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "etapas", force: true do |t|
    t.integer  "activa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiencia", force: true do |t|
    t.string   "sigla"
    t.string   "nom_asignatura"
    t.string   "campus"
    t.string   "profesor"
    t.string   "departamento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postulars", force: true do |t|
    t.integer  "id_alumno"
    t.string   "nom_ramo"
    t.string   "tipo_postulacion"
    t.integer  "prioridad"
    t.integer  "prioridad_alumno"
    t.integer  "num_veces_ayu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profesors", force: true do |t|
    t.string   "nombre"
    t.string   "rol"
    t.string   "password"
    t.string   "departamento"
    t.string   "mail"
    t.string   "oficina"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ramos", force: true do |t|
    t.string   "sigla"
    t.string   "nombre"
    t.string   "profesor"
    t.integer  "num_ayudantes"
    t.string   "tipo_ayudante"
    t.string   "campus"
    t.string   "departamento"
    t.string   "area"
    t.integer  "creditos"
    t.boolean  "activo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
