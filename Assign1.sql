SELECT production_product.product_Id,production_product.Product_Name, production_product.Model_Year, production_product.Price, production_brand.Brand_Name,production_category.Category_Name FROM production_product JOIN production_brand ON production_product.Brand_ID = production_brand.Brand_Id JOIN production_category ON production_product.Category_Id = production_product.Category_Id;




