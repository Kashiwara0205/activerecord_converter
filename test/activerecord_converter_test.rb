require "test_helper"

class ActiverecordConverterTest < ActiveSupport::TestCase

  test "active recordをarray hashに変換出来ることを担保する" do 
    Pokotarou.import("./test/data/const.rb")
    Pokotarou.execute("./test/data/countories.yml")
    Pokotarou.execute("./test/data/animal_types.yml")
    Pokotarou.execute("./test/data/animals.yml")
    Pokotarou.execute("./test/data/tags.yml")
    Pokotarou.execute("./test/data/member.yml")
    Pokotarou.execute("./test/data/question.yml")

    record =
      Animal.joins(:animal_type)
            .joins(:countory)
            .select("animals.id",
                    "animals.name",
                    "animals.weight",
                    "animals.height",
                    "animals.body",
                    "animals.hair",
                    "animals.created_at",
                    "animals.updated_at",
                    "animal_types.id as animal_type_id",
                    "countories.id as countory_id")
            .order("animals.id")

    ary_h = ActiverecordConverter.to_ary_h(record)

    assert_equal 2, ary_h.size

    assert_equal 1, ary_h[0]["id"]
    assert_equal "動物太郎_0", ary_h[0]["name"]
    assert_equal 23, ary_h[0]["weight"]
    assert_equal 44, ary_h[0]["height"]
    assert_equal "small", ary_h[0]["body"]
    assert_equal "none", ary_h[0]["hair"]
    assert_equal "2019-04-01 00:00:00 UTC", ary_h[0]["created_at"].to_s
    assert_equal "2019-04-01 05:10:00 UTC", ary_h[0]["updated_at"].to_s

    assert_equal 2, ary_h[1]["id"]
    assert_equal "動物太郎_1", ary_h[1]["name"]
    assert_equal 21, ary_h[1]["weight"]
    assert_equal 33, ary_h[1]["height"]
    assert_equal "middle", ary_h[1]["body"]
    assert_equal "short", ary_h[1]["hair"]
    assert_equal "2019-04-02 00:00:00 UTC", ary_h[1]["created_at"].to_s
    assert_equal "2019-04-02 05:10:00 UTC", ary_h[1]["updated_at"].to_s
  end
end
