<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css" />
		<script
			src="https://cdn.jsdelivr.net/npm/psl@1.9.0/dist/psl.min.js"
			integrity="sha256-pGXYc481WIYNZUsKubKxCxQUydhNrlM5S8g5eMU8fdw="
			crossorigin="anonymous"></script>
		<title>CwC Bypass</title>
		<style>
			.warn {
				color: red;
			}
			main {
				text-align: center;
			}
			input {
				width: 80%;
			}
			iframe[seamless] {
				background-color: transparent;
				border: 0px none transparent;
				padding: 0px;
				margin: 0px;
				max-height: 100%;
				width: 100%;
				overflow: hidden;
			}
		</style>
	</head>
	<body>
		<header>
			<h1>CwC Bypass</h1>
			<p>
				Bypass browser level internet restrictions by using Coding with Chrome
			</p>
		</header>
		<main>
			<p class="notice, warn" style="display: none">
				<b>Warning!</b><br />
				You are not using Coding with Chrome!
			</p>
			<input
				type="url"
				id="search"
				placeholder="Search or type a URL"
				onkeyup="searchBoxinput();" />
			<select name="searchEngine" id="searchEngine">
				<option value="google">Google</option>
				<option value="bing">Bing</option>
				<option value="duckduckgo">DuckDuckGo</option>
				<option value="yahoo">Yahoo</option>
				<option value="deviantart">DeviantArt</option>
			</select>
			<button type="button" id="submit" disabled onclick="browse();">Go</button>
			<section>
				<iframe
					src="https://lebestnoob.github.io/CwC-Bypass/bookmarks.html"
					scrolling="no"
					height="650"
					width="100%"
					seamless
					allowtransparency="true"
					name="bookmarks"
					frameborder="0"
					marginheight="0px"
					marginwidth="0px"></iframe>
			</section>
		</main>
	</body>
	<script async>
		if (navigator.userAgent !== "CwC sandbox") {
			console.warn("Coding with Chrome was not detected!");
			const x = document.querySelector(".warn");
			x.style.display = "";
		}

		const searchbox = document.querySelector("#search");
		const submit = document.querySelector("#submit");
		const searchEngineInput = document.querySelector("#searchEngine");

		let searchEngine = "www.google.com/search";

		searchbox.addEventListener("keypress", function (event) {
			if (event.key === "Enter") {
				event.preventDefault();
				submit.click();
			}
		});

		async function browse() {
			let url = new URL(`https://${searchbox.value}`);
			if (searchEngineInput.value === "bing") searchEngine = "bing.com/search";
			if (searchEngineInput.value === "yahoo")
				searchEngine = "search.yahoo.com/search";
			if (searchEngineInput.value === "duckduckgo")
				searchEngine = "duckduckgo.com/";
			if (searchEngineInput.value === "deviantart")
				searchEngine = "youtube.com/watch?v=DLzxrzFCyOs";
			if (
				searchbox.value.startsWith("https://") ||
				searchbox.value.startsWith("http://")
			) {
				window.location = searchbox.value;
			} else if (searchbox.value.endsWith("/")) {
				window.location = `https://${searchbox.value}`;
			} else if (psl?.isValid(url.hostname)) {
				window.location = `https://${searchbox.value}`;
			} else if (searchbox.value) {
				console.log(`Assuming "${searchbox.value}" as a search`);
				window.location = `https://${searchEngine}?q=${searchbox.value}`;
			}
		}

		function searchBoxinput() {
			if (searchbox.value) {
				submit.disabled = false;
			} else {
				submit.disabled = true;
			}
		}
	</script>
</html>
