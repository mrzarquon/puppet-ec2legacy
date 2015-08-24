#stolen from facter 2 util::values library
def flatten_structure(path, structure)
  results = {}

  if structure.is_a? Hash
    structure.each_pair do |name, value|
    new_path = "#{path}_#{name}".gsub(/\-|\//, '_')
    results.merge! flatten_structure(new_path, value)
  end
  elsif structure.is_a? Array
    structure.each_with_index do |value, index|
    new_path = "#{path}_#{index}"
    results.merge! flatten_structure(new_path, value)
  end
  else
    results[path] = structure
  end

  results
end

factermajversion = Facter.value(:facterversion).split('.')[0].to_i

if factermajversion >= 3 && (ec2_metadata = Facter.value(:ec2_metadata))
  ec2_facts = flatten_structure("ec2", ec2_metadata)
  ec2_facts.each_pair do |factname, factvalue|
    Facter.add(factname, :value => factvalue)
  end
end
