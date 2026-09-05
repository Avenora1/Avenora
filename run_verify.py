import asyncio
from playwright.async_api import async_playwright

async def main():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        context = await browser.new_context(viewport={'width': 412, 'height': 915})
        page = await context.new_page()

        await page.goto("http://localhost:8080/index.html")
        await page.wait_for_timeout(1000)

        # Dashboard screenshot
        await page.screenshot(path="dashboard_verification.png")
        print("Captured dashboard screenshot.")

        # Open Deposit modal
        await page.click("text=DEPOSIT / BUY GEMS")
        await page.wait_for_timeout(500)
        await page.screenshot(path="deposit_modal_verification.png")

        # Close Deposit modal
        await page.click("#modal-deposit button")
        await page.wait_for_timeout(500)

        # Launch 3D Game
        await page.click("text=PLAY GAME (3D)")
        await page.wait_for_timeout(2000)
        await page.screenshot(path="game_3d_verification.png")
        print("Captured 3D Game screenshot.")

        await browser.close()

if __name__ == "__main__":
    asyncio.run(main())
