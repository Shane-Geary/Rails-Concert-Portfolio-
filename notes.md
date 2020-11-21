Rails Concert Portfolio 

Users 
    - has_many :tickets 
    - has_many :venues
    - has_many :tickets, through: :venues
    - username 
    - password_digest


Venues      Join table- joining users and tickets 
    - belongs_to :user
    - belongs_to :ticket
    - name 


Tickets 
    - belongs_to :user 
    - has_many :venues
    - has_many :users, through: :venues 
    - name 
    - date 
    - artist 


Search bar 
    - get the data to pass around properly through the controller