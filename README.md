# Right2Restrooms

Right2Restrooms is a web application that allows users to find nearby public restrooms, filter for accessbility, and add new reviews and restrooms to our database.

## Domain Model
- User (Devise)
  - id
  - email
  - username
  - encrypted_password
- Bathrooms
  - id
  - address
  - hours
  - accessible
  - gender_neutral
  - family_accessible
  - purchase_required
  - updated_at
- Reviews
  - id
  - user_id
  - bathroom_id
  - body
  - created_at
- Favorites
  - id
  - user_id
  - bathroom_id
 
### Version Information
Ruby version: `3.2.1`
Rails version: `7.0.4.3`
