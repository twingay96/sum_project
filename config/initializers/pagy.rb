require 'pagy/extras/bootstrap'
Pagy::DEFAULT[:items] = 3
Pagy::DEFAULT[:cycle] = true
#Pagy::DEFAULT[:overflow] = cycle
Pagy::DEFAULT[:overflow] = :last_page
