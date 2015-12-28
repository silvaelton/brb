module Brb
  class Invoice < ActiveRecord::Base
    belongs_to :category

    after_create :generate_invoice!


    private

    def generate_invoice!
      barcode = Barcode.generate({
        invoice_id: self.id,
        bank_account: BANKACCOUNT,
        bank_agency:  BANKAGENCY,
        bank_wallet:  BANKWALLET,
        value: category.default_value,
        due: self.due,
        cpf: self.cpf,
        cep: self.cep,
        address: self.address,
        city: self.city,
        state: self.state,
        name: self.name
      })
    end
  end
end
