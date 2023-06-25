#1
#Creating a customized counseling and therapy service
library(shiny)

ui <- fluidPage(
    
    #Header
    titlePanel("Compassionate Mental Health Treatment"),
    
    #Sidebar with Inputs
    sidebarLayout(
      
      #Inputs
      sidebarPanel(
                
        #Select type of service
        selectInput("service", "Service:",
                    c("Individual Counseling",
                      "Family Counseling",
                      "Group Therapy")),
        
        #Text area for details
        textInput("details", "Details:", "Please provide any other details."),
        
        #Submit button
        actionButton("submit", "Submit")
      ),
      
      #Outputs
      mainPanel(
        
        #Output for submitted information
        textOutput("submitted")
      )
    )
)

server <- function(input, output) {
  
  #Reactive value for submitted information
  values <- eventReactive(input$submit, {
    
    #Creating an object for the submitted information
    list_values <- list(
      Service = input$service,
      Details = input$details
    )
    
    #Returning the object
    return(list_values)
    
  })
  
  #Outputting the submitted information
  output$submitted <- renderText({
    paste0("You selected ", values()$Service, " with the following details: ", values()$Details)
  })
}

# Creating the app
shinyApp(ui = ui, server = server)

#2
#Creating a counseling and therapy service that provides compassionate and effective mental health treatment
library(shiny)

#function to calculate the mental health treatment needs
mental_health_treatment_needs <- function(service, details) {
  
  #defining the amount of treatment needed
  amount <- 0
  
  #if the service is individual counseling
  if (service == "Individual Counseling") {
    amount <- amount + 1
    
    #if the details contain something 
    if (details != "") {
      amount <- amount + 1
    }
  }
  
  #if the service is family counseling
  if (service == "Family Counseling") {
    amount <- amount + 2
    
    #if the details contain something 
    if (details != "") {
      amount <- amount + 2
    }
  }
  
  #if the service is group therapy
  if (service == "Group Therapy") {
    amount <- amount + 3
    
    #if the details contain something 
    if (details != "") {
      amount <- amount + 3
    }
  }
  
  #returning the amount of treatment needed
  return(amount)
}

ui <- fluidPage(
    
    #Header
    titlePanel("Compassionate Mental Health Treatment"),
    
    #Sidebar with Inputs
    sidebarLayout(
      
      #Inputs
      sidebarPanel(
                
        #Select type of service
        selectInput("service", "Service:",
                    c("Individual Counseling",
                      "Family Counseling",
                      "Group Therapy")),
        
        #Text area for details
        textInput("details", "Details:", "Please provide any other details."),
        
        #Submit button
        actionButton("submit", "Submit")
      ),
      
      #Outputs
      mainPanel(
        
        #Output for submitted information
        textOutput("submitted"),
        textOutput("treatment")
      )
    )
)

server <- function(input, output) {
  
  #Reactive value for submitted information
  values <- eventReactive(input$submit, {
    
    #Creating an object for the submitted information
    list_values <- list(
      Service = input$service,
      Details = input$details
    )
    
    #Returning the object
    return(list_values)
    
  })
  
  #Outputting the submitted information
  output$submitted <- renderText({
    paste0("You selected ", values()$Service, " with the following details: ", values()$Details)
  })
  
  #Outputting the amount of treatment needed
  output$treatment <- renderText({
    paste0("You need ", mental_health_treatment_needs(values()$Service, values()$Details), " units of treatment.")
  })
  
}

# Creating the app
shinyApp(ui = ui, server = server)

#3
#Creating a counseling and therapy service that provides compassionate and effective mental health treatment

#Loading packages
library(shiny)
library(shinydashboard)

#function to calculate the mental health treatment needs
mental_health_treatment_needs <- function(service, details) {
  
  #defining the amount of treatment needed
  amount <- 0
  
  #if the service is individual counseling
  if (service == "Individual Counseling") {
    amount <- amount + 1
    
    #if the details contain something 
    if (details != "") {
      amount <- amount + 1
    }
  }
  
  #if the service is family counseling
  if (service == "Family Counseling") {
    amount <- amount + 2
    
    #if the details contain something 
    if (details != "") {
      amount <- amount + 2
    }
  }
  
  #if the service is group therapy
  if (service == "Group Therapy") {
    amount <- amount + 3
    
    #if the details contain something 
    if (details != "") {
      amount <- amount + 3
    }
  }
  
  #returning the amount of treatment needed
  return(amount)
}

ui <- dashboardPage(skin = "blue",
                   
                    dashboardHeader(title = "Compassionate Mental Health Treatment"),
                   
                    dashboardSidebar(
                      sidebarMenu(
                        id = "tabs",
                        menuItem("Input", tabName = "Input", icon = icon("list")),
                        menuItem("Output", tabName = "Output", icon = icon("table"))
                      )
                    ),
                   
                    dashboardBody(
                      tabItems(
                        #Input tab
                        tabItem(tabName = "Input",
                                fluidPage(
                                  
                                  #Inputs
                                  selectInput("service", "Service:",
                                              c("Individual Counseling",
                                                "Family Counseling",
                                                "Group Therapy")),
                                  
                                  textInput("details", "Details:", "Please provide any other details."),
                                  
                                  actionButton("submit", "Submit")
                                )
                        ),
                       
                        #Output tab
                        tabItem(tabName = "Output",
                                fluidPage(
                                  
                                  #Output for submitted information
                                  textOutput("submitted"),
                                  textOutput("treatment")
                                )
                        )
                      )
                    )
)

server <- function(input, output, session) {
  
   #Reactive value for submitted information
  values <- eventReactive(input$submit, {
    
    #Creating an object for the submitted information
    list_values <- list(
      Service = input$service,
      Details = input$details
    )
    
    #Returning the object
    return(list_values)
    
  })
  
  #Outputting the submitted information
  output$submitted <- renderText({
    paste0("You selected ", values()$Service, " with the following details: ", values()$Details)
  })
  
  #Outputting the amount of treatment needed
  output$treatment <- renderText({
    paste0("You need ", mental_health_treatment_needs(values()$Service, values()$Details), " units of treatment.")
  })
  
}

# Creating the app
shinyApp(ui = ui, server = server)