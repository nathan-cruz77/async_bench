import asyncio


async def wait_n(n):
    await asyncio.sleep(n)


if __name__ == '__main__':
    tasks = [wait_n(1) for i in range(10_000)]

    loop = asyncio.get_event_loop()
    loop.run_until_complete(asyncio.wait(tasks))
