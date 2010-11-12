Factory.define(:question, :class => HumanDetector::Question) do |q|
  q.sequence(:title)  { |n| "How much is #{n} + 1?" }
  q.sequence(:answer) { |n| "#{n+1}" }
end