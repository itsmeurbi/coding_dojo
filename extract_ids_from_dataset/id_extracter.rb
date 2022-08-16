# o2
def extract_ids(data)
  id = data[:id]
  return [] unless id.present?

  items = data[:items] || []
  items.reduce([id]) do |ids, item|
    ids += extract_ids(item)
  end
end
