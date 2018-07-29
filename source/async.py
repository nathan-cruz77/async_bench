import asyncio
import time


class Stopwatch:

    def __enter__(self):
        self.time = time.time()
        return self

    def __exit__(self, *args):
        self.time = time.time() - self.time
        print('Executed in: {:.0f}ms'.format(self.time * 1000))


async def wait_n(n):
    await asyncio.sleep(n)


with Stopwatch():
    tasks = [wait_n(1) for i in range(10_000)]

    loop = asyncio.get_event_loop()
    loop.run_until_complete(asyncio.wait(tasks))
