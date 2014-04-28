<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Piclib Revisited</title>
	<style>
		@import url(//fonts.googleapis.com/css?family=Lato:700);

		body {
			font-family:'Lato', sans-serif;
			color: #999;
		}
	</style>
</head>
<body>
	<div class="welcome">
		<h1>All Images</h1>
		<section id="images">
		@foreach ($images as $image)
			<li>{{ link_to_route('single-image', $image->title, ['id' => $image->id]) }}</li>
		@endforeach
		</section>
	</div>
</body>
</html>
