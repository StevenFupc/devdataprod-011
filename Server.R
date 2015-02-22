library(UsingR)
data(diamond)
fit <- lm(price ~ carat, data = diamond)
shinyServer(
    function(input,output){
      
      values<- reactive({as.numeric(predict(fit, newdata = data.frame(carat = input$weight), interval = "prediction"))})
      
      output$inputValue<-renderPrint({input$weight})
      output$price<-  renderText({values()[1]})
      output$lower<-renderText({values()[2]})
      output$higher<-renderText({values()[3]})  
      
      output$regression <- renderPlot({
          plot(diamond$carat,diamond$price, xlab="Mass(carats)", ylab="Price(SIN$)", bg="lightblue",col="black",cex=1.1,pch=21,frame=FALSE)
          abline(lm(price~carat,data=diamond),lwd=2)
          abline(v=input$weight, col="green", lwd=2)
          
      })   
      
 
    }
)