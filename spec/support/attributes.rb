# The overrides variable lets us merge in alternative variables later.
def truck_attributes(overrides = {})
	{
		name: "Johnny Blonde",
		cuisine_type: "Tapas",
	}.merge(overrides)
end