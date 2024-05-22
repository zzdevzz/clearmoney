export class FinanceCalculationsService {
  call(income = 0, salary = 0) {
      const incomeTax = this.calculateTax(income);
      const nationalInsurance = this.calculateNationalInsurance(income);
      const studentLoan = this.calculateStudentLoanRepayment(income);

      const disposableIncome = income - (incomeTax + nationalInsurance + studentLoan);

      return {
          incomeTax: incomeTax,
          nationalInsurance: nationalInsurance,
          studentLoan: studentLoan,
          disposableIncome: disposableIncome
      };
  }

  calculateTax(income) {
      if (income === null) return 0;

      const personalAllowance = 12570;
      const basicRateLimit = 50270;
      const higherRateLimit = 125140;
      const taxBasic = 0.20;
      const taxHigher = 0.40;
      const taxSuper = 0.45;

      let tax = 0;
      if (income <= personalAllowance) {
          tax = 0;
      } else if (income <= basicRateLimit) {
          tax = (income - personalAllowance) * taxBasic;
      } else if (income <= higherRateLimit) {
          tax = (basicRateLimit - personalAllowance) * taxBasic + (income - basicRateLimit) * taxHigher;
      } else {
          tax = (basicRateLimit - personalAllowance) * taxBasic + (higherRateLimit - basicRateLimit) * taxHigher + (income - higherRateLimit) * taxSuper;
      }

      return tax;
  }

  calculateNationalInsurance(salary) {
    if (salary === null) return 0;

    // Annual thresholds for national insurance contributions
    const annualLowerThreshold = 12570;  // Adjusted to match annual figures, e.g., £12,570
    const annualUpperThreshold = 50270;  // Adjusted to match annual figures, e.g., £50,270
    const annualAdditionalThreshold = 9670;  // Adjusted to match annual figures, e.g., £96,700

    let ni = 0;
    if (salary <= annualLowerThreshold) {
        ni = 0;
    } else if (salary <= annualUpperThreshold) {
        ni = (salary - annualLowerThreshold) * 0.12;  // 12% between lower and upper threshold
    } else if (salary <= annualAdditionalThreshold) {
        ni = (annualUpperThreshold - annualLowerThreshold) * 0.12 + (salary - annualUpperThreshold) * 0.02;  // 2% on everything above the upper threshold
    } else {
        // If salary exceeds additional threshold
        ni = (annualUpperThreshold - annualLowerThreshold) * 0.12 + (annualAdditionalThreshold - annualUpperThreshold) * 0.02;
    }

    return ni;
  }

  calculateStudentLoanRepayment(income) {
      if (income === null) return 0;

      const paymentThreshold = 27295;
      const taxBasic = 0.09;

      let studentLoan = 0;
      if (income > paymentThreshold) {
          studentLoan = (income - paymentThreshold) * taxBasic;
      }

      return studentLoan;
  }
}
