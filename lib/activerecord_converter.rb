require "activerecord_converter/version"
require "activerecord_converter/railtie"

module ActiverecordConverter
  def self.to_ary_h active_records
    query_text = active_records.to_sql()

    from_idx = /FROM `/ =~ query_text

    select_column_names = 
      query_text[7..(from_idx - 2)].split(",")
                                   .map{|m| m.strip }

    key_column_names = 
      select_column_names.map do |m|
        if m.include?(" as ")
          as_idx = / as / =~ m
          m[(as_idx + 4)..]
        else
          m.split(".")[1].gsub("`", "")
        end
      end

      active_records.pluck(*select_column_names).map { |m| key_column_names.zip(m).to_h }
  end
end
