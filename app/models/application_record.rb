class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  Refile.secret_key = 'fe209bc5232c2bbaf4965d8bc53694149f16929ebef799ce46a76b643259153ca1ceaa271d9aa24db69f4b7934dce419c790876b580cd515ea68c9b9caf6944a'
end
