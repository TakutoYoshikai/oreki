const Oreki = require("oreki-node").Oreki
const oreki = new Oreki("config.json");
const express = require("express")
const app = express()

let point = 0
app.get("/", function(req, res, next) {
  if (point === 0) {
    res.json({ msg: "failed" })
  } else {
    res.json({ msg: "success"})
    point -= 1
  }
})

app.listen(3000, function() {
  console.log("started")
});

(async() => {
  const initialized = await oreki.init()
  if (!initialized) {
    console.error("couldn't initialize")
    return
  }
  oreki.on("paid", function(payment) {
    console.log("PAID")
    console.log(payment)
    point += payment.point
  })
  oreki.start()
  let payment = await oreki.addPayment("user", "endpoint", 5, 1000)
  console.log("payee: ", payment.payee)
})()


