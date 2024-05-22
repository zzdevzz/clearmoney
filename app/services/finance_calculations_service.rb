class FinanceCalculationsService
  def call(income = 0, salary = 0)
    income_tax = calculate_tax(income)
    national_insurance = calculate_national_insurance(salary)
    student_loan = calculate_student_loan_repayment(income)

    disposable_income = income - (income_tax + national_insurance + student_loan)

    return {
      income_tax: income_tax,
      national_insurance: national_insurance,
      student_loan: student_loan,
      disposable_income: disposable_income
    }
  end

  def calculate_tax(income)
    return 0 if income.nil?
    # Define tax brackets and rates
    personal_allowance = 12570
    basic_rate_limit = 50270
    higher_rate_limit = 125140
    tax_basic = 0.20
    tax_higher = 0.40
    tax_super = 0.45
    # Calculate tax based on income
    if income <= personal_allowance
      tax = 0
    elsif income <= basic_rate_limit
      tax = (income - personal_allowance) * tax_basic
    elsif income <= higher_rate_limit
      tax = (basic_rate_limit - personal_allowance) * tax_basic + (income - basic_rate_limit) * tax_higher
    else
      tax = (basic_rate_limit - personal_allowance) * tax_basic + (higher_rate_limit - basic_rate_limit) * tax_higher + (income - higher_rate_limit) * tax_super
    end
    tax
  end

  def calculate_national_insurance(salary)
    return 0 if salary.nil?

    # Annual thresholds for national insurance contributions
    annual_lower_threshold = 12570  # Example: £12,570
    annual_upper_threshold = 50270  # Example: £50,270
    annual_additional_threshold = 96700  # Example: £96,700

    # Calculate NI based on annual salary
    if salary <= annual_lower_threshold
      ni = 0
    elsif salary <= annual_upper_threshold
      ni = (salary - annual_lower_threshold) * 0.12  # 12% rate between lower and upper threshold
    elsif salary > annual_upper_threshold
      ni = (annual_upper_threshold - annual_lower_threshold) * 0.12 + (salary - annual_upper_threshold) * 0.02  # 2% on everything above upper threshold
    end

    ni
  end

  def calculate_student_loan_repayment(income)
    return 0 if income.nil?
    # Define tax brackets and rates
    payment_threshold = 27295
    tax_basic = 0.09
    # Calculate tax based on income
    if income <= payment_threshold
      studentloan = 0
    else
      studentloan = (income - payment_threshold) * tax_basic
    end
    studentloan
  end
end
