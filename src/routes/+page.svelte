<script lang="ts">
	import { onMount } from 'svelte';

	const timeZone = 'Europe/Moscow';

	let time = $state(new Date());

	let timeFormated = $derived.by(() => {
		const formatter = new Intl.DateTimeFormat('en-US', {
			timeStyle: 'long',
			timeZone
		});
		return formatter.format(time);
	});

	onMount(() => {
		const interval = setInterval(() => {
			time = new Date();
		}, 1000);

		return () => clearInterval(interval);
	});
</script>

<div>
	<img src="/images/me.jpg" alt="my pic" />
	<h1 class="font-bold underline">Hi, I'm Gleb</h1>
</div>

<p>
	I'm currently living in Sochi, Russia. My time is about {timeFormated}
</p>
