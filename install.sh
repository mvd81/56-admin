clear

echo "Hi, We are going to install the Laravel framework and all his dependencies."
composer install

echo "Creating the .env file.(edit this file later)"
php -r "file_exists('.env') || copy('.env.example', '.env');"

echo "Generating laravel key"
php artisan key:generate

echo "Change permissions on bootstrap/cache directory to allow laravel to write in it"
chmod -R 777 bootstrap/cache/

echo "Make cache data dir"
mkdir -p storage/framework/cache/data
cp storage/framework/cache/.gitignore storage/framework/cache/data/.gitignore
printf "*\n! data/\n!.gitignore" > storage/framework/cache/data/.gitignore

echo "Change permissions on storage directory to allow laravel to write in it"
chmod -R 777 storage/

echo "Running npm will install all the necessary files to have laravel mix runing and also all the necessary files to have bootstrap, jquery, popper and fontawesome."
npm install

echo "Now edit your .env file to fill in the details about database and all other necessary settings"
echo "Once done you can run 'npm run watch'"
