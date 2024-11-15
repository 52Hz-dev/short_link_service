ShortLink is a simple URL shortening service built with Ruby on Rails. It provides two main endpoints to shorten URLs and retrieve the original URLs from short codes.

## Features
- **Encode a URL**: Convert a long URL to a short URL.
- **Decode a URL**: Retrieve the original URL from a short URL.
- **Persistent Storage**: URLs are stored in a database to allow retrieval after server restarts.
- **Error Handling**: Proper messages for invalid URLs or missing short codes.

## Getting Started

1. **Clone the Repository**
   git clone [https://github.com/yourusername/shortlink.git](https://github.com/52Hz-dev/short_link_service.git)
2. **Install Dependencies**
   bundle install
3. **Set up the Database**
   rails db:create rails db:migrate
4. **Run the server**
  rails server
5. **Testing**
*Run build-in testing file (test/controllers/url_controller_test.rb)*
  bundle exec rspec
 *or using postman*
![image](https://github.com/user-attachments/assets/7051d799-7e84-4bdd-a9c9-f3ab2e76aaeb)
   

##   Evaluation
1. **Security**
- Input Validation: The application validates that original_url is a proper URL format to avoid storing malformed or unsafe URLs.
- Rate Limiting (Consideration): Although not implemented in this version, adding rate limiting (e.g., using Rack Attack) can help prevent abuse and ensure the service is not overwhelmed by excessive requests.
- Sanitization: The application sanitizes user inputs to prevent potential security threats, such as XSS or SQL injection.
- Unique Short Codes: The app ensures unique short codes, and there are plans to implement collision resolution in the event of conflicts, which would be documented.
2. **Scalability**
- Collision Handling: With the current approach of unique short codes, there’s a risk of collisions when encoding a large volume of URLs. A unique identifier-based approach (like hashing the URL) with retry logic for conflicts could further mitigate this.
- Caching: Frequently accessed URLs can be cached to reduce database load and improve response times. Caching could be implemented using Redis or Rails’ caching features.
- Database Scaling: As the service grows, switching to a distributed database or a NoSQL solution like DynamoDB for high-volume reads/writes could be considered. Sharding by user or URL origin might also help with scaling.
- Service Decomposition: For extremely high traffic, decomposing the URL shortening service into microservices (one for encoding, one for decoding) might increase scalability and reliability.

