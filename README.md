Задача 1.1 
	Сконструируем проект для создания Docker-сервиса, состоящего из двух различных контейнеров - веб-сервера и базы данных. Создадим файл docker-compose.yml, который определяет два сервиса: web и db.  В этом файле используется формат YAML для описания структуры Docker-сервиса. Должна получиться приблизительно следующая структура каталога (имена будем использовать примерные для простоты изложения):
	- myproject
		- docker-compose.yml
		- web
			- .Dockerfile
			- index.html

Чтобы создать Docker-файл, выполните следующие шаги:
	Шаг 1: С помощью любого текстового редактора создадим файл с расширением ".Dockerfile".
	Шаг 2: Сохраним Docker-файл в корневую директорию вашего проекта.
	Шаг 3: Откройте командную строку или терминал и перейдите в директорию, где находится ваш Docker-файл.
	Шаг 4: Запустим команду для сборки Docker-образа из Docker-файла:
		docker build -t our_image_name .
После успешной сборки образа мы можем использовать его для запуска контейнеров с приложением. Сервис web создается из Docker-образа, собираемого на основе файла Dockerfile в каталоге web. Контейнер web будет доступен на порту 80. Сервис db создается на основе образа базы данных PostgreSQL. Здесь мы также определяем переменные окружения для настройки пользователя, пароля и имени базы данных.
Чтобы запустить сервис выполним следующие действия:
	1. Установим и запустим Docker
	2. Создадим структуру каталога, как указано выше.
	3. Поместите наш веб-код в файл web/index.html.
	4. Создадим Docker-образ для веб-сервера, создав файл web/Dockerfile с необходимыми инструкциями.
	5. Откроем командную строку в каталоге myproject, где находится файл docker-compose.yml.
	6. Запустим команду docker-compose up для создания и запуска контейнеров.
Теперь ваш сервис должен быть доступен.

Задача 1.2 
	Чтобы создать 3 сервиса в каждом окружении (dev, prod, lab), мы будем использовать механизм переменных окружения в Docker Compose. 
В нашем проекте используется переменная окружения ${ENVIRONMENT}, которую нужно будет задать для каждого из трех окружений (dev, prod, lab). Эта переменная передается в сервисы web и worker с помощью параметра environment в файле docker-compose.yml. Таким образом, мы сможем использовать один и тот же файл docker-compose.yml для разных окружений, просто задавая нужное значение переменной окружения перед запуском сервиса.  Чтобы запустить сервис в определенном окружении, выполним следующие шаги:
	1. Создайте структуру каталога, аналогичную предыдущему примеру.
	2. Определим свои настройки для каждого окружения, например, в файле .env.dev для окружения разработки, .env.prod для окружения продакшна и .env.lab для окружения лаборатории. Для определения настроек для каждого окружения в файле .env.dev мы будем использовать переменные окружения:
	2.1. Создадим файл .env.dev в корневой директории вашего проекта.
	2.2. В файле .env.dev определите переменные окружения и присвойте им значения, соответствующие вашим настройкам для окружения разработки.
	3. В этих файлах определим переменную окружения ENVIRONMENT со значением, соответствующим текущему окружению (dev, prod, lab).
	4. Откроем командную строку в каталоге myproject, где находится файл docker-compose.yml.
	5. Запустим команду docker-compose --env-file .env.{environment} up для запуска сервисов в заданном окружении (замените {environment} на нужное значение: dev, prod или lab). Например:
	**docker-compose --env-file .env.{dev} up**
	**docker-compose --env-file .env.{prod} up**
	**docker-compose --env-file .env.{lab} up**


Задача 2.1
	В этой задаче мы набросаем пример Docker Compose файлов для описания сервисов продажи билетов и прогноза погоды для двух окружений lab и dev.
Наши шаги в целом будут теми же, что и в предыдущих задачах.
	Для запуска окружения lab выполним команду:
		docker-compose -f lab.docker-compose.yaml up
	Для запуска окружения dev:
		docker-compose -f dev.docker-compose.yaml up

Задача 2.2
	Эта задача похожа на предыдущую и в чём-то аналогична задаче 1.2: мы возьмём проект из задачи 2.1. и расширим его так, чтобы каждый из наших проектов сервисов работал в окружениях lab и dev.
