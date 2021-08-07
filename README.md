# ActiverecordConverter

convert activerecord to just ary hash

## Usage

ActiverecordConverter.to_ary_h(activerecord)

```
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

puts ary_h
=>
{"id"=>1, "name"=>"動物太郎_0", "weight"=>23, "height"=>44, "body"=>"small", "hair"=>"none", "created_at"=>Mon, 01 Apr 2019 00:00:00.000000000 UTC +00:00, "updated_at"=>Mon, 01 Apr 2019 05:10:00.000000000 UTC +00:00, "animal_type_id"=>1, "countory_id"=>1}
{"id"=>2, "name"=>"動物太郎_1", "weight"=>21, "height"=>33, "body"=>"middle", "hair"=>"short", "created_at"=>Tue, 02 Apr 2019 00:00:00.000000000 UTC +00:00, "updated_at"=>Tue, 02 Apr 2019 05:10:00.000000000 UTC +00:00, "animal_type_id"=>2, "countory_id"=>2}

```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'activerecord_converter'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install activerecord_converter
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
