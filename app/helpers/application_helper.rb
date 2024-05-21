module ApplicationHelper
  def chart_library_donut_config
    {
      # scales: {
      #   x: {
      #     ticks: {
      #       color: "white" # Changes the x-axis tick labels to white
      #     },
      #     grid: {
      #        color: "rgba(255, 255, 255, 1)", # Changes the x-axis grid lines to a lighter white
      #        display: false
      #     }
      #   },
      #   y: {
      #     ticks: {
      #       color: "white" # Changes the y-axis tick labels to white
      #     },
      #     grid: {
      #       color: "rgba(255, 255, 255, .5)", # Changes the y-axis grid lines to a lighter white
      #       display: false
      #     }
      #   }
      # },
      plugins: {
        legend: {
          labels: {
            color: "white" # Optional: Changes the legend labels to white if you have a legend
          }
        },
        tooltip: {
          enabled: true,
          bodyColor: "white", # Optional: Changes the tooltip text color to white
          titleColor: "white" # Optional: Changes the tooltip title color to white
        }
      }
    }
  end

  def chart_library_line_config
    {
      scales: {
        x: {
          ticks: {
            color: "white" # Changes the x-axis tick labels to white
          },
          grid: {
             color: "rgba(255, 255, 255, 1)",
             display: true # Changes the x-axis grid lines to a lighter white
          }
        },
        y: {
          ticks: {
            color: "white" # Changes the y-axis tick labels to white
          },
          grid: {
            color: "rgba(255, 255, 255, .5)",
            display: true # Changes the y-axis grid lines to a lighter white
          }
        }
      },
      plugins: {
        legend: {
          labels: {
            color: "white" # Optional: Changes the legend labels to white if you have a legend
          }
        },
        tooltip: {
          enabled: true,
          bodyColor: "white", # Optional: Changes the tooltip text color to white
          titleColor: "white" # Optional: Changes the tooltip title color to white
        }
      }
    }
  end

  def chart_library_bar_config
    {
      scales: {
        x: {
          ticks: {
            color: "white" # Changes the x-axis tick labels to white
          },
          grid: {
             color: "rgba(255, 255, 255, 1)",
             display: true # Changes the x-axis grid lines to a lighter white
          }
        },
        y: {
          ticks: {
            color: "white" # Changes the y-axis tick labels to white
          },
          grid: {
            color: "rgba(255, 255, 255, .5)",
            display: true # Changes the y-axis grid lines to a lighter white
          }
        }
      },
      plugins: {
        legend: {
          labels: {
            color: "white" # Optional: Changes the legend labels to white if you have a legend
          }
        },
        tooltip: {
          enabled: true,
          bodyColor: "white", # Optional: Changes the tooltip text color to white
          titleColor: "white" # Optional: Changes the tooltip title color to white
        }
      }
    }
  end
end
