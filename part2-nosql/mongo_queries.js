// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    "_id": 101,
    "name": "Samsung 55-inch Smart TV",
    "category": "Electronics",
    "price": 55000,
    "specs": { "warranty_years": 2, "voltage": "220V", "features": ["4K UHD", "HDR10+", "Smart Apps"] },
    "availability": { "in_stock": true, "warehouse_location": "Delhi" }
  },
  {
    "_id": 102,
    "name": "Levi's Denim Jacket",
    "category": "Clothing",
    "price": 4500,
    "attributes": { "size": ["L", "XL"], "color": "Black", "material": "Denim" },
    "care_instructions": ["Machine wash cold", "Do not bleach", "Iron at medium temperature"]
  },
  {
    "_id": 103,
    "name": "Amul Cheese Block 500g",
    "category": "Groceries",
    "price": 220,
    "nutrition": { "calories": 804, "fat": "95g", "protein": "1.5g" },
    "expiry_date": "2024-12-15",
    "storage": { "temperature": "Refrigerated", "shelf_life_days": 270 }
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: "2025-01-01" }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: 102 }, // Levi's Jacket
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });
// Why index on category?
// Without an index, system has to look at every single record in the database - one by one - just to identify the product you are searching for. This is fine as long as the database has very less records. 

// By indexing the category, the database creates a "shortcut" list. Instead of readng every single record, it can directly jump to the record which matches the category being queried. This keeps your search results snappy and users happy with faster response, no matter the size of the database. 