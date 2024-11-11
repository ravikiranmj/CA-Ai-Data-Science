import aiohttp
import asyncio

# Limit the number of concurrent requests (you can adjust this value)
CONCURRENCY_LIMIT = 50
RETRY_LIMIT = 3
TIMEOUT = 10

async def fetch(session, url, semaphore, retries=0):
    async with semaphore:
        try:
            async with session.get(url, timeout=TIMEOUT) as response:
                return url, response.status
        except asyncio.TimeoutError:
            if retries < RETRY_LIMIT:
                return await fetch(session, url, semaphore, retries + 1)
            return url, "TIMEOUT"
        except aiohttp.ClientError as e:
            return url, f"ERROR ({type(e).__name__})"
        except Exception as e:
            return url, f"ERROR ({str(e)})"

async def main(file_path, output_file):
    # Read the URLs from the input file
    with open(file_path, 'r') as f:
        urls = [line.strip() for line in f if line.strip()]
    
    # Create a semaphore to limit concurrency
    semaphore = asyncio.Semaphore(CONCURRENCY_LIMIT)

    async with aiohttp.ClientSession() as session:
        tasks = [fetch(session, url, semaphore) for url in urls]
        results = await asyncio.gather(*tasks)

    # Write only URL and status code to the output file
    with open(output_file, 'w') as f:
        for url, status in results:
            f.write(f"{url} - {status}\n")

if __name__ == '__main__':
    input_file = 'urls.txt'    # Replace with your input file path
    output_file = 'responses.txt'
    asyncio.run(main(input_file, output_file))
    print("URL check completed!")
