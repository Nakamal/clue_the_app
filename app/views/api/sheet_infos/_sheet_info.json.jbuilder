json.id sheet_info.id
json.guess sheet_info.guess
json.printed_status sheet_info.printed_status
json.card do
  json.partial! sheet_info.card, partial: "api/cards/card", as: :card
end