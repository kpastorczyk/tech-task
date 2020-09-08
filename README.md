# Task description
Create a web API application using Ruby on Rails according to the requirements below.
	

# Application description

The application is a simple orders databse.

	
Requirements

	- There should be two API endpoints:
		1. Orders endpoint
			- Base path of this endpoint should be "/orders"
			- This endpoint should have full CRUD capabilities (index, create, show, update, delete)
			- Order should have the following attributes:
				- Name of the person placing the order
				- Date and time of placing the order
				- Value of the order
				- A list of line items
			- All attributes, including list of line items and their attributes should be rendered by application in index and show actions
			- Only Name of the person placing the order is required to create an order
			- Date and time of placing the order should be automatically filled by the application during order creation and should be set to current date and time
			- Client should not be allowed to directly modify date/time of placing the order, nor value of the order
			- Value of an order is a sum of all it's line items' prices. It should automatically update after any change to the list of line items (or any of it's members)
			
		2. Line Items endpoint
			- Base path of this endpoint should be "/orders/{order_id}/line_items"
			- This endpoint should have full CRUD capabilities (index, create, read, update, delete)
			- Line item should have the following attributes:
				- Name of the item
				- Price of the item
			- All of the attributes are required in order to create a line item
	
	- All endpoints should only respond with JSON
	- Using RSpec, implement 2 specs to verify the following functionalities:
		- Creating an order
		- Adding a Line Item to an Order
	
	- No authorization, nor authentication is required
	- No additional tests are required (except what was mentioned)
	- You are free to use any tools, gems, databases, etc.
	
What will be evaluated:
	
	1. Requirements coverage
		- All requirements should be met
		- No extra functionality should be added
		- Application should be stable and bug free
		
	2. Code quality
		- Design patterns use
		- Compliance with Rails conventions
		- Errors/validations handling
		- Compliance with naming conventions
		- Code formatting
		- Test coverage of the requested 2 functionalities