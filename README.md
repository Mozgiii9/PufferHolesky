

## Дата создания гайда: 09.05.2024

## Обзор проекта Puffer Finance:

**Puffer Finance – это протокол ликвидного рестейкинга, построенный поверх EigenLayer. В его рамках пользователи депонируют stETH или wstETH, взамен получая pufETH. Для возврата первоначального вложения вместе с прибылью необходимо вернуть выданный актив.** 

При этом функционал ликвидного токена этим не ограничивается. Его можно использовать в DeFi-приложениях аналогично «замороженным» в Puffer Finance активам.

Тем не менее главная миссия протокола заключается в децентрализации работы сети Ethereum путем привлечения большего числа соло-стейкеров, а также обеспечения деятельности операторов AVS на EigenLayer. Для этого как раз и необходимы средства пользователей, которые за их предоставление получают финансовую выгоду.

Полноценную версию Puffer Finance запустили 1 февраля 2024 года. Его разработку ведет компания Puffer Labs, основанная Амиром Форузани и Джейсоном Вранеком. Первый имеет опыт работы в NASA, а второй непродолжительное время являлся членом команды Chainlink Labs.

Согласно DeFiLlama, на момент написания объем заблокированных в смарт-контрактах проекта средств (TVL) составляет $1,317 млрд, уступая только ether.fi и Renzo. Протокол также имеет поддержку от более двадцати инвесторов, вложивших в его развитие более $18 млн. 

**Самые известные –– Jump Crypto, Animoca Brands и Ethereum Foundation. Стоит отметить, что 30 января 2024 года в этот список вошла Binance Labs, однако сумма сделки не разглашается.**

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/ff49f7db-36ff-4574-8937-f4b245adadd8)

**Официальные ресурсы проекта:**

- Веб-сайт : [перейти](https://www.puffer.fi/)
- Twitter : [перейти](https://twitter.com/puffer_finance)
- Discord : [перейти](https://discord.gg/pufferfi)
- GitHub : [перейти](https://github.com/PufferFinance)

### Системные требования к серверу(официальные):

- **CPU : 4 cores;**
- **RAM : 16 GB;**
- **Disk : 2 TB SSD(NVMe рекомендован) + 14 TB SSD для архива Ethereum;**
- **OS : Ubuntu 20.04**

### Характеристики, на которых нода также может работать:

- **CPU : 4 cores;**
- **RAM : 16 GB;**
- **Disk : 1 TB SSD (SATA или NVMe)**
- **OS : Ubuntu 20.04**

## Инструкция по установке ноды Puffer:

**1. Настройте отдельный Ethereum кошелек под ноду. Сделать это можно через Metamask.**

**2. Подключаемся к серверу и обновляем пакеты:**

```bash

sudo apt update && sudo apt upgrade -y

```

**3. Установим необходимое ПО для работы ноды:**

```bash

sudo apt install build-essential curl

```

**4. Запускаем установочный скрипт. Просто жмем Enter и дожидаемся установки дополнительных пакетов:**

```bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

```

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/b9f6036b-42bf-4571-be80-0d106f2345c9)


**5. Далее выполняем команду:**

```bash

source $HOME/.cargo/env

```

**6. Далее вставляем данный код:**

```bash

echo “export PATH=\”$HOME/.cargo/bin:$PATH\”” >> ~/.bashrc
source ~/.bashrc

```

**7. Проверяем установку необходимого ПО. В терминале должна отобразиться версия пакета:**

```bash

rustc --version

```

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/595a8bfc-46b9-47ec-be66-3cf78011febb)

*Ваша версия может отличаться от той, что на скрине. Не волнуйтесь, это нормально)*

**8. Еще раз обновим пакеты. Выполним команды:**

```bash

sudo apt update

```

```bash

sudo apt install libssl-dev pkg-config

```

*В случае, если у Вас открывается розовое окно - просто жмите Enter*

**9. Выполните следующие команды по очереди:**

```bash

export OPENSSL_DIR=/usr/include/openssl

```

```bash

echo 'export OPENSSL_DIR=/usr/include/openssl' >> ~/.bashrc
source ~/.bashrc

```

```bash

export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu

```

```bash

export OPENSSL_INCLUDE_DIR=/usr/include/openssl

```

```bash

echo 'export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu' >> ~/.bashrc
echo 'export OPENSSL_INCLUDE_DIR=/usr/include/openssl' >> ~/.bashrc
source ~/.bashrc

```

**10. Проверим версию пакетов. По очереди выполните команды:**

```bash

pkg-config --version

```

```bash

pkg-config --libs openssl

```

*В терминале высветится:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/1929d0ae-fa06-4a99-a4b7-b16e8ff37897)

*Если Вы получили такой вывод, то все установилось без ошибок. Ваши версии могут отличаться от версий на скрине, это нормально*

**11. Переходим к установке клиента Puffer-Coral-Cli. Создадим директорию:**

```bash

mkdir puffer

```

**12. Переходим в папку:**

```bash

cd puffer

```

**13. Скачаем ПО ноды:**

```bash

git clone https://github.com/PufferFinance/coral

```

**14. Перейдем в установленную директорию:**

```bash

cd coral

```

**15. Выполним команду:**

```bash

cargo build --release

```

*После выполнения команды пойдут такие логи как на скрине. Дождидаемся надписи "Finished" и только после этого переходим к следующему шагу:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/16b358ea-af49-415a-8fa4-5ac82b223e8e)

**16. Если предыдущая команда была выполнена с ошибками, выполните следующую команду:**

```bash

cargo clean

```

**17. Переходим к редактированию файла с паролем ноды. Убедитесь, что Вы находитесь в /puffer/coral/ и выполните команду:**

```bash

nano

```

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/b34f9c3f-8f03-4ccc-a9d2-8ad41db9f592)

**18. Создаем пароль к ноде. После чего сохраняем файл комбинацией клавиш CTRL + X и присваиваем имя файлу "password.txt"(без кавычек!)**

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/a82ca444-8306-4017-8245-33d2f82d30c6)

**19. Проверим нахождение файла в директории:**

```bash

ls

```

*Должно быть как на фото ниже*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/68307ca3-a73d-412e-8086-1887eefb4697)

**20. Переходим к созданию регистрационного файла. Перейдите на [сайт](https://launchpad.puffer.fi/Setup) лаунчпада Puffer. Подключаем созданный специально для ноды кошелек. Если ранее Вы не добавляли сеть Holesky в кошелек, то Metamask автоматически предложит Вам это сделать.**

**21. Попадаем на страницу, как на скрине ниже. Отключаем Enclave если он был включен. Открываем блокнот или любой другой редактор на своем локальном компьютере и копируем команду:**

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/d3adac13-77d1-41bc-8cb0-bc29e77b2e1b)

**22. В команде у Вас будут два пустых значения, которые нужно заменить своими:**

```

<PATH_TO_A_KEYSTORE_PASSWORD_FILE> <--- "password.txt"
<PATH_TO_REGISTRATION_JSON> <--- "registration.json"

```

**23. После того, как Вы отредактировали команду, копируем ее из блокнота и вставляемв командную строку сервера и жмем Enter. Если Вы все указали верно, то пойдет установка:**

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/f443312f-7891-4d11-817d-ebbaa550e0e8)

*Как только установка закончится, Вы увидите то же самое, что на скрине ниже:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/63998cd4-c8fb-41b4-bb2a-c02800995314)

**24. Перейдем к настройке консенсус клиента. Выполним команду:**

```bash

cd

```

**25. Выполним следующую команду. Во время установки жмем Enter:**

```bash

sudo apt-get install build-essential git-lfs cmake

```

**26.**

```bash

openssl rand -hex 32 | tr -d “\n” > “/tmp/jwtsecret”

```

**27. Переходим в указанную папку:**

```bash

cd /tmp/

```

**28. Отредактируем файл "jwtsecret". В нем необходмо указать свой приватный ключ от кошелька:**

```bash

nano jwtsecret

```

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/e1326eed-f389-4761-b3d4-c2952f3bd3a3)

*После того, как вставили приватный ключ, сохраняем файл комбинацией клавиш CTRL + X*

**29.**

```bash

cd

```

**30. Выполним установку консенсус клиента:**

```bash

git clone https://github.com/status-im/nimbus-eth2

```

**31. Перейдем в папку с клиентом:**

```bash

cd nimbus-eth2

```

**32. Выполните следующую команду. Замените символ "X" на объем оперативной памяти, который Вы готовы выделить для клиента консенсуса. В моей системе 16 GB RAM, я заменил "X" на "8":**

```bash

make -jX nimbus_beacon_node

```

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/1a501200-5aa0-499b-8fd6-5e11a9174405)

*Процесс может занять некоторое время. Дождитесь момента как на скрине ниже:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/43874920-3a46-4bb2-a9b8-53e73aa1f985)

**33. Укажем, что мы хотим работать в сети Holesky. Для этого выполним команду:**

```bash

build/nimbus_beacon_node trustedNodeSync \
  --network:holesky \
  --data-dir=build/data/shared_holesky_0 \
  --trusted-node-url=https://holesky-checkpoint-sync.stakely.io/

```

*Процесс запустится и также потребует время:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/bacb3750-fc38-4276-bfa8-ef0ea89ecf34)

*Дождитесь момента как на скрине ниже:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/1214a0c5-32b5-4e74-a8ba-ca5583cc3753)

**34. Перейдем в папку с ключами валидатора Puffer:**

```bash

cd ~/puffer/coral/etc/keys/bls_keys

```

**35. Просмотрим сожержимое папки:**

```bash

ls

```

*У Вас должен отобразиться только один файл с названием в виде последовательности цифр и букв*

**36. Внимательно выполните следующую команду:**

```bash

cp -v ~/puffer/coral/etc/keys/bls_keys/REPLACE ~/nimbus-eth2/build/data/shared_holesky_0/validators/

Замените "REPLACE" на имя файла из прошлой папки. Вы можете скопировать название файла полностью выделив его и нажав CTRL + C, после чего перенести название в блокнот на своем локальном компьютере.

ПРИМЕР:

Имя моего файла: 7742nh471h20471h2409127943h021947h012947h0129834b8213g0d2jds0921dhn721908ed721dd021987h21dhd0

Моя команда будет выглядеть так:

cp -v ~/puffer/coral/etc/keys/bls_keys/7742nh471h20471h2409127943h021947h012947h0129834b8213g0d2jds0921dhn721908ed721dd021987h21dhd0 ~/nimbus-eth2/build/data/shared_holesky_0/validators/

```

**37. Скопируем файл еще раз в другую директорию:**

```bash

cp -v ~/puffer/coral/etc/keys/bls_keys/7742nh471h20471h2409127943h021947h012947h0129834b8213g0d2jds0921dhn721908ed721dd021987h21dhd0 ~/nimbus-eth2/build/data/shared_holesky_0/validators/

ВНИМАНИЕ! Замените "7742nh471h20471h2409127943h021947h012947h0129834b8213g0d2jds0921dhn721908ed721dd021987h21dhd0" на собственное имя Вашего файла!

```

**38. Перейдем в директорию:**

```bash

cd ~/nimbus-eth2/

```

**39. Выполните команду. В процессе выполнения сервер попросит ввести пароль, который Вы создавали ранее:**

```bash

build/nimbus_beacon_node deposits import --data-dir=build/data/shared_holesky_0

```

**40. Внимательно выполните следующую команду:**

```bash

./run-holesky-beacon-node.sh --web3-url=http://127.0.0.1:8551 --suggested-fee-recipient=WALLET_ADDRESS  --jwt-secret=/tmp/jwtsecret

!WALLET_ADDRESS замените на адрес Вашего кошелька!

ПРИМЕР:

Адрес моего кошелька: 0xB0551d678a6746F2Cf300CF698d314EA1e74e3c7

Моя команда будет выглядеть так:

./run-holesky-beacon-node.sh --web3-url=http://127.0.0.1:8551 --suggested-fee-recipient=0xB0551d678a6746F2Cf300CF698d314EA1e74e3c7  --jwt-secret=/tmp/jwtsecret

```

*Если Вы все выполнили корректно, то Вы увидете процесс как на скрине ниже:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/0572deef-55ed-4e65-8fa9-aee078d5564c)

*Дождитесь логов, как на скрине ниже:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/94c69f65-f104-449f-be0d-f3e2c2fa30b6)

*Начнется синхронизация, вы можете проверить на белых линиях, что там есть параметр с надписью “sync: — h — m (0.00%)”, который показывает прогресс синхронизации Вашей ноды. Как только она будет полностью синхронизирована, должно быть написано “synced/opt”.*

**41. Переходим к настройке Execution клиента. Выполните команды по очереди:**

```bash

wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

```

```bash

sudo dpkg -i packages-microsoft-prod.deb

```

```bash

sudo apt-get update

```

```bash

sudo apt-get install dotnet-sdk-8.0 dotnet-runtime-8.0

```

*Пойдет процесс установки как на скрине ниже:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/c6a20a13-445f-484e-96bb-a42c832dd6ea)

**42. Проверим установку:**

```bash

dotnet --list-sdks

```

```bash

dotnet --list-runtimes

```

*Должны появиться значения как на скрине ниже:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/0ff2122f-7d9d-43ad-bfc6-67ea3c9bc1da)

**43. Выполните команду:**

```bash

git clone https://github.com/NethermindEth/nethermind.git

```

*Дождитесь конца установки*

**44.**

```bash

cd nethermind/src/Nethermind/

```

**45. Выполните следующую команду:**

```bash

dotnet build Nethermind.sln -c Release

```

*Начнется создание файлов:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/074918e8-671d-4452-940c-e4976c5db1b7)

*Дождитесь момента как на скрине ниже:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/6ed5bf72-b52b-4cba-9458-f20007548471)

**46. Необходимо получить тестовые токены Ethereum Holesky. Для этого переходим в [кран](https://www.holeskyfaucet.io/), клеймим от 2-х до 3-х токенов.**

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/48642295-2cd1-4762-9237-8698fb8e5b06)

**47. После того, как заклеймили Holesky ETH, выполните следующие команды:**

```bash

sudo apt update

```

```bash

sudo apt install screen

```

**48. Проверим корректность установки утилиты screen командой:**

```bash

screen --version

```

**49. Создадим сессию screen командой:**

```bash

screen -S consensus

```

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/486c9140-2d51-4c48-a04a-9d58a1aac39f)

**50. Перейдем в папку:**

```bash

cd ~/nimbus-eth2 

```

**51. Выполните команду:**

```bash

./run-holesky-beacon-node.sh --web3-url=http://127.0.0.1:8551 --suggested-fee-recipient=WALLET --jwt-secret=/tmp/jwtsecret

Замените "WALLET" на адрес Вашего кошелька

ПРИМЕР:
./run-holesky-beacon-node.sh --web3-url=http://127.0.0.1:8551 --suggested-fee-recipient=0xB0551d678a6746F2Cf300CF698d314EA1e74e3c7 --jwt-secret=/tmp/jwtsecret

```

*Пойдут логи как на скрине ниже:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/3a6509d2-77de-4ca4-8274-9557ddb075bf)

*Полная синхронизация займет от 2-х до 4-х часов*

**52. Откройте новое окно в SSH клиенте и заново подключитесь к серверу. После подключения выполните команду:**

```bash

screen -S execution

```

**53. Переходим в папку:**

```bash

cd ~/nethermind/src/Nethermind/Nethermind.Runner

```

**54. Выполните команду:**

```bash

dotnet run -c Release --   --config=holesky   --datadir="../../../../nethermind-datadir"   --JsonRpc.Host=0.0.0.0   --JsonRpc.JwtSecretFile=/tmp/jwtsecret

```

*Начнется синхронизация консенсус клиента:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/cbe7e267-5e0a-4574-8bca-9312b60d70ab)

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/2adbb2d3-6bbf-429a-a06d-249193796f80)

*Дожидаемся конца синхронизации. Это не быстрый процесс*

**55. Завершаем регистрацию в Puffer Dashboard. Переходим по [ссылке](https://launchpad.puffer.fi/Setup)**

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/9e2ae8a7-ba79-497b-820b-29d63be3101f)

*Нажимаем "Continue". Попадаем на страницу как на скрине ниже:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/2dd28d05-9722-440f-9def-f4b3a1740194)

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/8251be4b-3ecd-4239-bc38-408dcba0bb2b)

*В своем случае, я прописал значение 3. Вы же можете прописать другое значение, главное, чтобы оно было больше 2-х ETH:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/c3f9e2be-37c6-4c6a-a3d4-62c8fed68dd9)

*Далее минтим тикеты. 1 тикет = 1 день работы ноды:*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/70c04ebf-206d-4d0f-8e14-3f7e0f05a0c3)

*Адреса контрактов pufETH и Puffer Validator Tickets в сети Ethereum Holesky. Добавляем их в Metamask:*

```

Holesky pufETH Contract: 0x98408eadD0C7cC9AebbFB2AD2787c7473Db7A1fa

Holesky Puffer Validator Ticket Contract: 0xA143c6bFAff0B25B485454a9a8DB94dC469F8c3b

```

*Нажимаем "Continue"*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/74f8da2a-a203-49bf-8bc9-d9adbb1ee837)

**56. Финальный шаг. Необходимо загрузить файл "registartion.json" в окно браузера. Сделать это можно при помощи FileZilla.**

*Открываете приложение FileZilla на своем локальном компьютере и подключаетесь к серверу.*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/f025efc2-3b0b-46bc-9fc4-4a83cd4691e2)

*Далее переходите в каталог "/root/puffer/coral". Перенесите файл "registration.json" на свой ПК. Просто выделите его и перенесите в левую часть окна в любую удобную папку на своем компьютере*

![image](https://github.com/Mozgiii9/PufferSetupTheNode/assets/74683169/6fbac5e3-7372-4337-a378-9fc4e3c1b6b9)

*После переноса файла на свой ПК, загрузите его в окно бразуера и нажмите "Finish". Вам нужно будет подписать все необходимые транзакции в открывшемся окне Metamask*

**Начнется синхронизация ноды. Она может занять продолжительное время вплоть до нескольких дней. Мониторить своего валидатора Вы можете в данном [эксплорере](https://holesky.beaconcha.in/validator/)**

## На данном этапе установка ноды Puffer подошла к концу. Мониторить состояние своего валидатора Вы можете через Puffer Dashboard, а также через эксплорер из прошлого шага.

### Обязательно проведите собственный ресерч проектов перед тем как ставить ноду. Сообщество NodeRunner не несет ответственность за Ваши действия и средства. Помните, проводя свой ресёрч, Вы учитесь и развиваетесь.

### Связь со мной: [Telegram(@M0zgiii)](https://t.me/m0zgiii)

### Мои соц. сети: [Twitter](https://twitter.com/m0zgiii) 


















































