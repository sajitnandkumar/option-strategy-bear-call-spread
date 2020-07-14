p <- ggplot(expiry_eod_data, aes(x = returns)) +
  geom_histogram(aes(y = ..count..), binwidth = 0.5,
                 colour = "black", fill = "#56B4E9") +
  scale_x_continuous(name = "% Return On Expiry Day\n% Change in Day Close from Day Open") +
  scale_y_continuous(name = "Count") +
  ggtitle("Expiry Day Closing - % Change from Day Open\nDate Range - 10th July 2017 to 10th July 2020") +
  theme(axis.line = element_line(size=1, colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank(),
        plot.title=element_text(size = 16, family="Comic Sans MS"),
        text=element_text(size = 16, family="Comic Sans MS"),
        axis.text.x=element_text(colour="black", size = 12),
        axis.text.y=element_text(colour="black", size = 12)) +
  # Add Mean Line
  geom_vline(aes(xintercept = mean(returns, na.rm = T)),
             colour = "black", linetype ="solid", size = .8, show.legend = TRUE) +
  geom_text(mapping = aes(x = mean(returns, na.rm = T),
                          y = 10, angle = 90, 
                          label = paste("mean = ", round(mean(returns, na.rm = T),2)),
                          hjust = 0,
                          vjust = -0.5), 
            colour = "black", 
            family="Comic Sans MS",
            size = 6,
            data = expiry_eod_data) +
  # Add 1SD Line for + and -
  geom_vline(aes(xintercept = mean(returns, na.rm = T) + sd(returns, na.rm = T)),
             colour = "black", linetype ="longdash", size = .8, show.legend = TRUE) +
  geom_text(mapping = aes(x = mean(returns, na.rm = T) + sd(returns, na.rm = T),
                          y = 10, angle = 90, 
                          label = paste("+1SD = ", round(mean(returns, na.rm = T) + sd(returns, na.rm = T),2)),
                          hjust = 0,
                          vjust = -0.5), 
            colour = "black", 
            family="Comic Sans MS",
            size = 6,
            data = expiry_eod_data) +
  geom_vline(aes(xintercept = mean(returns, na.rm = T) - sd(returns, na.rm = T)),
             colour = "black", linetype ="longdash", size = .8, show.legend = TRUE) +
  geom_text(mapping = aes(x = mean(returns, na.rm = T) - sd(returns, na.rm = T),
                          y = 10, angle = 90, 
                          label = paste("-1SD = ", round(mean(returns, na.rm = T) - sd(returns, na.rm = T),2)),
                          hjust = 0,
                          vjust = -0.5), 
            colour = "black", 
            family="Comic Sans MS",
            size = 6,
            data = expiry_eod_data) +
  # Add 2SD Line for + and -
  geom_vline(aes(xintercept = mean(returns, na.rm = T) + 2*sd(returns, na.rm = T)),
             colour = "black", linetype ="longdash", size = .8, show.legend = TRUE) +
  geom_text(mapping = aes(x = mean(returns, na.rm = T) + 2*sd(returns, na.rm = T),
                          y = 10, angle = 90, 
                          label = paste("+2SD = ", round(mean(returns, na.rm = T) + 2*sd(returns, na.rm = T),2)),
                          hjust = 0,
                          vjust = -0.5), 
            colour = "black", 
            family="Comic Sans MS",
            size = 6,
            data = expiry_eod_data) +
  geom_vline(aes(xintercept = mean(returns, na.rm = T) - 2*sd(returns, na.rm = T)),
             colour = "black", linetype ="longdash", size = .8, show.legend = TRUE) +
  geom_text(mapping = aes(x = mean(returns, na.rm = T) - 2*sd(returns, na.rm = T),
                          y = 10, angle = 90, 
                          label = paste("-2SD = ", round(mean(returns, na.rm = T) - 2*sd(returns, na.rm = T),2)),
                          hjust = 0,
                          vjust = -0.5), 
            colour = "black", 
            family="Comic Sans MS",
            size = 6,
            data = expiry_eod_data) +
  # Max value
  geom_vline(aes(xintercept = max(returns, na.rm = T)),
             colour = "black", linetype ="longdash", size = .8, show.legend = TRUE) +
  geom_text(mapping = aes(x = max(returns, na.rm = T),
                          y = 10, angle = 90, 
                          label = paste("Max = ", round(max(returns, na.rm = T),2)),
                          hjust = 0,
                          vjust = -0.5), 
            colour = "black", 
            family="Comic Sans MS",
            size = 6,
            data = expiry_eod_data) +
  # Min value
  geom_vline(aes(xintercept = min(returns, na.rm = T)),
             colour = "black", linetype ="longdash", size = .8, show.legend = TRUE) +
  geom_text(mapping = aes(x = min(returns, na.rm = T),
                          y = 10, angle = 90, 
                          label = paste("Min = ", round(min(returns, na.rm = T),2)),
                          hjust = 0,
                          vjust = -0.5), 
            colour = "black", 
            family="Comic Sans MS",
            size = 6,
            data = expiry_eod_data) +
  # Add % covered in 1 SD
  geom_segment(aes(x = mean(returns, na.rm = T) - sd(returns, na.rm = T),
                   xend = mean(returns, na.rm = T) + sd(returns, na.rm = T),
                   y = 35, yend = 35)) +
  geom_text(mapping = aes(x = mean(returns, na.rm = T),
                          y = 35, angle = 0, 
                          label = paste(perc_1sd, "% - 1SD"),
                          vjust = -0.5), 
            colour = "red", 
            family="Comic Sans MS",
            size = 6,
            data = expiry_eod_data) +
  # Add % covered in 2 SD
  geom_segment(aes(x = mean(returns, na.rm = T) - 2*sd(returns, na.rm = T),
                   xend = mean(returns, na.rm = T) + 2*sd(returns, na.rm = T),
                   y = 30, yend = 30)) +
  geom_text(mapping = aes(x = mean(returns, na.rm = T),
                          y = 30, angle = 0, 
                          label = paste(perc_2sd, "% - 2SD"),
                          vjust = -0.5), 
            colour = "red", 
            family="Comic Sans MS",
            size = 6,
            data = expiry_eod_data)

p