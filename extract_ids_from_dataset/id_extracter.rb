def extract_ids(structure, ids = [])
  return ids unless structure[:id].present?

  ids << structure[:id]
  if structure[:items].present?
    structure[:items].each do |struc|
      extract_ids(struc, ids)
    end
  end
  ids
end
