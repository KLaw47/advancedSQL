SELECT v.*, vt.body_type, vt.make, vt.model
FROM vehicles v
JOIN vehicletypes vt ON v.vehicle_type_id = vt.vehicle_type_id;