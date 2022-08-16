def extract_ids(structure, ids = [])
  return ids unless structure[:id].present?

  ids << structure[:id]
  items = structure[:items] || []
  items.each do |struc|
    extract_ids(struc, ids)
  end
  ids
end
