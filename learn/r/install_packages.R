# File: install_packages.R

# Set CRAN mirror for package installation
options(repos = c(CRAN = "https://cran.rstudio.com/"))

# Source the file containing the package list
source("/tmp/packages.R")

# Function to install packages if they're not already installed
install_if_missing <- function(packages) {
  # Get list of currently installed packages
  installed <- installed.packages()[,"Package"]
  
  # Find which packages need to be installed
  new_packages <- packages[!(packages %in% installed)]
  
  if (length(new_packages) > 0) {
    message("\nInstalling ", length(new_packages), " packages:")
    message(paste(new_packages, collapse = ", "))
    
    # Install each package with error handling
    for (pkg in new_packages) {
      tryCatch({
        install.packages(pkg, 
                        dependencies = TRUE,
                        quiet = TRUE)
        message("Successfully installed: ", pkg)
      }, error = function(e) {
        message("Failed to install ", pkg, ": ", e$message)
      }, warning = function(w) {
        message("Warning while installing ", pkg, ": ", w$message)
      })
    }
  } else {
    message("\nAll packages are already installed!")
  }
  
  # Verify installations
  installed_after <- installed.packages()[,"Package"]
  still_missing <- new_packages[!(new_packages %in% installed_after)]
  
  if (length(still_missing) > 0) {
    message("\nPackages that failed to install:")
    message(paste(still_missing, collapse = ", "))
  } else {
    message("\nAll required packages are now installed!")
  }
}

# Install packages
message("Starting package installation...")
install_if_missing(packages)