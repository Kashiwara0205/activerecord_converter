module TestData
  module Helper
    module QuestionTag
      def self.get_tag_id question_ids
        tags = {
          1=> [7],
          2=> [2, 7],
          3=> [7],
          4=> [6],
          5=> [2, 3],
          6=> [1],
          7=> [8],
          8=> [7],
          9=> [5],
          10=>[8],
          11=>[2, 7],
          12=>[7],
          13=>[2],
          14=>[4],
          15=>[4]
        }

        question_ids.map{|m| tags[m]}.reduce(:concat)
      end

      def self.get_question_id question_ids
        tags = {
            1=> [1],
            2=> [2, 2],
            3=> [3],
            4=> [4],
            5=> [5, 5],
            6=> [6],
            7=> [7],
            8=> [8],
            9=> [9],
            10=>[10],
            11=>[11, 11],
            12=>[12],
            13=>[13],
            14=>[14],
            15=>[15]
          }
  
          question_ids.map{|m| tags[m]}.reduce(:concat)
      end
    end
  end
end