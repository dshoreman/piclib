<?php

use Faker\Factory as Faker;

class ImagesTableSeeder extends Seeder {

	public function run()
	{
		$faker = Faker::create();

		foreach(range(1, 10) as $index)
		{
			$title = implode(' ', $faker->words(rand(2, 5)));
			$ext = $faker->randomElement(['jpg', 'png', 'gif']);

			Image::create([
				'title' => $title,
				'name_saved' => $faker->uuid.'.'.$ext,
				'name_original' => Str::slug($title),
				'height' => $faker->randomNumber(250, 1440),
				'width' => $faker->randomNumber(300, 2560),
				'created_at' => $faker->dateTimeBetween('-5 years', '-2 years'),
				'updated_at' => $faker->dateTimeBetween('-2 years', 'now'),
			]);
		}
	}

}
