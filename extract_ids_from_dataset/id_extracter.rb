def extract_ids(structure)
  return [] unless structure[:id].present?

  ids = []
  ids << structure[:id]
  if structure[:items].present?
    process_items(structure, ids)
  end
  ids
end

def process_items(structure, ids)
  structure[:items].each do |struc|
    ids << struc[:id]
    if struc[:items].present?
      process_items(struc, ids)
    end
  end
end
