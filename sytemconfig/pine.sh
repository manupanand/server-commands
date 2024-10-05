//@version=5
indicator("Supertrend Buy/Sell with Stop Loss", overlay=true)

// Default Supertrend settings
atrPeriod = 10
factor = 3.0

// Calculate the Supertrend
[superTrend, direction] = ta.supertrend(factor, atrPeriod)

// Plot Supertrend
plot(superTrend, color=(direction == 1 ? color.red : color.green), linewidth=2, title="Supertrend")

// Buy and Sell signals based on Supertrend direction
buySignal = ta.crossover(close, superTrend) and direction == 1
sellSignal = ta.crossunder(close, superTrend) and direction == -1

// Buy Stop Loss (300 points below the buy price)
var float stopLossPrice = na
if (buySignal)
    stopLossPrice := close - 300

// Display Buy/Sell labels
if (buySignal)
    label.new(bar_index, high, text="Buy", color=color.green, textcolor=color.white, yloc=yloc.abovebar)

if (sellSignal)
    label.new(bar_index, low, text="Sell", color=color.red, textcolor=color.white, yloc=yloc.belowbar)

// Display Stop Loss at the top of the chart when a Buy signal occurs
//
//label.new(bar_index, na, text="Stop Loss: " + str.tostring(stopLossPrice), xloc=xloc.bar_index, yloc=yloc.abovebar, style=label.style_label_left, textcolor=color.white)
//indicator("Random Location Text Box", overlay=true)

//Define specific coordinates
// Define specific coordinates
