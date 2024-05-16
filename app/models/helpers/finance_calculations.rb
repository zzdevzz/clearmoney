# class FinanceCalculations
#   def calculate_tax(income)
#     # Define tax brackets and rates
#     personal_allowance = 12570
#     basic_rate_limit = 50270
#     higher_rate_limit = 125140
#     tax_basic = 0.20
#     tax_higher = 0.40
#     tax_super = 0.45
#     # Calculate tax based on income
#     if income <= personal_allowance
#       tax = 0
#     elsif income <= basic_rate_limit
#       tax = (income - personal_allowance) * tax_basic
#     elsif income <= higher_rate_limit
#       tax = (basic_rate_limit - personal_allowance) * tax_basic + (income - basic_rate_limit) * tax_higher
#     else
#       tax = (basic_rate_limit - personal_allowance) * tax_basic + (higher_rate_limit - basic_rate_limit) * tax_higher + (income - higher_rate_limit) * tax_super
#     end
#     tax
#   end

#   def calculate_national_insurance(salary)
#     # Weekly thresholds
#     lower_threshold = 123
#     upper_threshold = 242
#     additional_threshold = 967

#     # Monthly equivalents for easier input handling
#     monthly_lower_threshold = 533
#     monthly_upper_threshold = 1048
#     monthly_additional_threshold = 4189

#     # Convert monthly salary to weekly if needed
#     if salary > monthly_lower_threshold # assuming the salary is entered monthly if it's higher than monthly lower threshold
#       weekly_salary = salary / 4.333 # average weeks per month
#     else
#       weekly_salary = salary # assume salary is weekly if it's below the monthly lower threshold
#     end

#     # Calculate NI based on weekly salary
#     if weekly_salary <= lower_threshold
#       ni = 0
#     elsif weekly_salary <= upper_threshold
#       ni = (weekly_salary - lower_threshold) * 0.08
#     elsif weekly_salary <= additional_threshold
#       ni = (upper_threshold - lower_threshold) * 0.08 + (weekly_salary - upper_threshold) * 0.08
#     else
#       ni = (upper_threshold - lower_threshold) * 0.08 + (additional_threshold - upper_threshold) * 0.08 + (weekly_salary - additional_threshold) * 0.02
#     end

#     ni
#   end
# end
