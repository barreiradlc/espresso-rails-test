class CompanyCreator
  def initialize(company_params)
    @company_params = company_params
  end

  def call    
    Company.create!(@company_params)
  end
end