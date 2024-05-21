class FinanceCalculationsService {
  call(income = 0, salary = 0) {
      const incomeTax = this.calculateTax(income);
      const nationalInsurance = this.calculateNationalInsurance(salary);
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

      const lowerThreshold = 123;
      const upperThreshold = 242;
      const additionalThreshold = 967;
      const monthlyLowerThreshold = 533;
      const monthlyUpperThreshold = 1048;
      const monthlyAdditionalThreshold = 4189;

      let weeklySalary = salary > monthlyLowerThreshold ? salary / 4.333 : salary;

      let ni = 0;
      if (weeklySalary <= lowerThreshold) {
          ni = 0;
      } else if (weeklySalary <= upperThreshold) {
          ni = (weeklySalary - lowerThreshold) * 0.08;
      } else if (weeklySalary <= additionalThreshold) {
          ni = (upperThreshold - lowerThreshold) * 0.08 + (weeklySalary - upperThreshold) * 0.08;
      } else {
          ni = (upperThreshold - lowerThreshold) * 0.08 + (additionalThreshold - upperThreshold) * 0.08 + (weeklySalary - additionalThreshold) * 0.02;
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
