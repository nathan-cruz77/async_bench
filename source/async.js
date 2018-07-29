async function waitN(n){
   setTimeout(() => {}, n * 1000)
}

async function runN(n) {
  await Promise.all(Array(n).fill(1).map(() => waitN(1)))
}

runN(10000)
