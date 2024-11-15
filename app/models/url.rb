class Url < ApplicationRecord
    validates :original_url, presence: true, format: URI::regexp(%w[http https])
    validates :short_code, uniqueness: true
  
    before_create :generate_short_code
  
    # Generate a short, unique code
    def generate_short_code
      loop do
        self.short_code = SecureRandom.urlsafe_base64(4)
        break unless Url.exists?(short_code: short_code)
      end
    end
  
    # Find the original URL by the short code
    def self.find_by_short_code(code)
      find_by(short_code: code)
    end
  end
  