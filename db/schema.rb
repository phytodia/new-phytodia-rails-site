# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_03_05_130355) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actifs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "proprietes"
    t.text "types_produits"
    t.text "cible"
    t.text "efficacite"
    t.text "donnees"
    t.text "concentration"
    t.string "lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ecocert", default: true
    t.boolean "made_in_france", default: true
    t.text "cat_produits", default: [], array: true
    t.text "props_tags", default: [], array: true
    t.text "composition", default: [], array: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.text "titre"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug_authors"
    t.string "slug"
    t.string "lang"
    t.text "title"
    t.text "meta_description"
    t.integer "read_time"
    t.text "intro"
    t.boolean "indexed", default: true
    t.boolean "public", default: true
    t.boolean "follow", default: true
    t.string "canonical"
    t.text "legend_cover"
    t.boolean "summary", default: false
    t.boolean "headline", default: false
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "author_publications", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_author_publications_on_article_id"
    t.index ["author_id"], name: "index_author_publications_on_author_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "lastname"
    t.string "firstname"
    t.text "function"
    t.text "biography_fr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.text "biography_en"
    t.text "biography_es"
    t.text "biography_de"
    t.string "email"
    t.string "linkedin"
    t.string "x"
    t.string "facebook"
    t.string "mastodon"
    t.string "bluesky"
    t.index ["slug"], name: "index_authors_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "titre"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_articles", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_category_articles_on_article_id"
    t.index ["category_id"], name: "index_category_articles_on_category_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.string "lang"
    t.text "categories", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "prestations", force: :cascade do |t|
    t.text "titre"
    t.text "content"
    t.string "lang"
    t.text "intro"
    t.text "title"
    t.text "meta_description"
    t.boolean "indexed", default: true
    t.boolean "follow", default: true
    t.string "canonical"
    t.text "categories", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "richer_text_json_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_richer_texts_rich_json_uniqueness", unique: true
    t.index ["record_type", "record_id"], name: "index_richer_text_json_texts_on_record"
  end

  create_table "richer_text_o_embeds", force: :cascade do |t|
    t.json "fields"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "richer_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_richer_texts_rich_texts_uniqueness", unique: true
    t.index ["record_type", "record_id"], name: "index_richer_text_rich_texts_on_record"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "author_publications", "articles"
  add_foreign_key "author_publications", "authors"
  add_foreign_key "category_articles", "articles"
  add_foreign_key "category_articles", "categories"
end
