class EscamboappDatabase < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "escamboapp_development"
end
