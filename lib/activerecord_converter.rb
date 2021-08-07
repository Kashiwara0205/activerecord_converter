require "activerecord_converter/version"
require "activerecord_converter/railtie"

module ActiverecordConverter
  def self.to_ary_h active_records
    query_text = active_records.to_sql()

    end_select_query_idx = 7
    start_from_query_idx = ( /FROM `/ =~ query_text ) - 2

    select_column_names = 
      query_text[end_select_query_idx..(start_from_query_idx)].split(",")
                                                              .map{|m| m.strip }

    key_column_names = 
      select_column_names.map do |m|
        if m.include?(" as ")
          end_as_query_idx = ( / as / =~ m ) + 4
          m[(end_as_query_idx)..]
        else
          m.split(".")[1].gsub("`", "")
        end
      end

      active_records.pluck(*select_column_names).map { |m| key_column_names.zip(m).to_h }
  end
end
