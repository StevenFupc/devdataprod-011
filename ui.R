library(shiny)
shinyUI(
    pageWithSidebar(
        headerPanel("How much is the diamond?"),
        sidebarPanel(
            h3("Enter desired weight of diamond, and get an estimated price"),
            h3("Please enter a diamond weight in carats (0.15 - 0.35)"),
            numericInput('weight',"Diamond weight (in carat)",value=0.20,min=0.15,max=0.35,step=0.01),
            h3("You have entered:"),
            verbatimTextOutput("inputValue"),
            h3("Price of your desired diamond is likely to be (in SGD):"),
            verbatimTextOutput("price"),
            h3("in the range of"),
            verbatimTextOutput("lower"), 
            h3("and"),
            verbatimTextOutput("higher")  
        ),
        mainPanel(
            h4("Data is diamond prices (Signapore dollars) and diamond weight in carats (standard measure of 
            diamond mass, 0.2 ). To get the data use library(UsingR); data(diamond). The relationship of 
            price and weight is shown below(linear regression)."),
            plotOutput('regression')
        )   
    )
)