json.id @participation.id
json.sheet_infos do
  @participation.grouped_sheet_infos.each do |group_name, sheet_infos|
    eval("json.#{group_name.downcase.pluralize} { json.array! sheet_infos, partial: 'api/sheet_infos/sheet_info', as: :sheet_info }")
  end
end