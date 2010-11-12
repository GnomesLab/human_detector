ActiveRecord::Schema.define(:version => 20101112002548) do
  create_table "human_detector_questions", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "answer",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
