const { performance } = require('perf_hooks')

async function wait(delay) {
  await new Promise(resolve => setTimeout(resolve, delay * 1000))
}

async function runN(n) {
  const start = performance.now()
  await Promise.all(Array(n).fill(1).map(() => wait(1)))
  const end = performance.now()
  console.log(`Executed in ${Math.round(end - start)}ms`)
}

runN(10000)
