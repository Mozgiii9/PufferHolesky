#!/bin/bash

# Функция для отображения логотипа
display_logo() {
  echo -e '\e[40m\e[32m'
  echo -e '███╗   ██╗ ██████╗ ██████╗ ███████╗██████╗ ██╗   ██╗███╗   ██╗███╗   ██╗███████╗██████╗ '
  echo -e '████╗  ██║██╔═══██╗██╔══██╗██╔════╝██╔══██╗██║   ██║████╗  ██║████╗  ██║██╔════╝██╔══██╗'
  echo -e '██╔██╗ ██║██║   ██║██║  ██║█████╗  ██████╔╝██║   ██║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝'
  echo -e '██║╚██╗██║██║   ██║██║  ██║██╔══╝  ██╔══██╗██║   ██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗'
  echo -e '██║ ╚████║╚██████╔╝██████╔╝███████╗██║  ██║╚██████╔╝██║ ╚████║██║ ╚████║███████╗██║  ██║'
  echo -e '╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝'
  echo -e '\e[0m'
  echo -e "\nПодписаться на канал may.crypto{🦅} чтобы быть в курсе самых актуальных нод - https://t.me/maycrypto\n"
}

# Функция для отображения меню
display_menu() {
  echo "Меню:"
  echo "1. Создать пароль"
  echo "2. Ввести Run command"
  echo "3. Ввести приватный ключ от кошелька"
  echo "4. Ввести адрес кошелька в сети Ethereum"
  echo "5. Запустить установку Puffer (Holesky Testnet)"
  echo "6. Исправить ошибку Active"
  echo "7. Выйти из скрипта"
  read -p "Выберите пункт меню: " choice
  case $choice in
    1) create_password ;;
    2) input_run_command ;;
    3) input_private_key ;;
    4) input_wallet_address ;;
    5) install_puffer ;;
    6) fix_active_error ;;
    7) exit_script ;;
    *) echo "Неверный выбор, попробуйте снова." ;;
  esac
}

# Функция для создания пароля
create_password() {
  read -sp "Создайте пароль для защиты Validator Keys: " password
  echo $password > password.txt
  echo -e "\nПароль сохранен в файл password.txt"
  display_menu
}

# Функция для ввода Run command
input_run_command() {
  read -p "Введите Ваш Run Command со страницы лаунчпада Puffer (https://launchpad.puffer.fi/Setup): " run_command
  run_command=${run_command//<PATH_TO_A_KEYSTORE_PASSWORD_FILE>/password.txt}
  run_command=${run_command//<PATH_TO_REGISTRATION_JSON>/registration.json}
  echo $run_command > run_command.txt
  echo "Run Command сохранен в файл run_command.txt"
  display_menu
}

# Функция для ввода приватного ключа
input_private_key() {
  read -sp "Введите Ваш приватный ключ от кошелька. Получить приватный ключ можно в Metamask: " private_key
  echo $private_key > jwtsecret
  echo -e "\nПриватный ключ сохранен в файл jwtsecret"
  display_menu
}

# Функция для ввода адреса кошелька
input_wallet_address() {
  read -p "Введите адрес Вашего кошелька в сети Ethereum: " wallet_address
  echo $wallet_address > wallet_address.txt
  echo "Адрес кошелька сохранен в файл wallet_address.txt"
  display_menu
}

# Функция для установки Puffer (Holesky Testnet)
install_puffer() {
  sudo apt update && sudo apt upgrade -y
  sudo apt install build-essential curl screen -y
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source $HOME/.cargo/env
  echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
  rustc --version
  sudo apt update
  sudo apt install libssl-dev pkg-config -y
  export OPENSSL_DIR=/usr/include/openssl
  echo 'export OPENSSL_DIR=/usr/include/openssl' >> ~/.bashrc
  source ~/.bashrc
  export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu
  export OPENSSL_INCLUDE_DIR=/usr/include/openssl
  echo 'export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu' >> ~/.bashrc
  echo 'export OPENSSL_INCLUDE_DIR=/usr/include/openssl' >> ~/.bashrc
  source ~/.bashrc
  pkg-config --version
  pkg-config --libs openssl
  mkdir -p ~/puffer/coral
  cd ~/puffer
  git clone https://github.com/PufferFinance/coral
  cd coral
  cargo build --release || (cargo clean && cargo build --release)
  cp ~/password.txt .
  bash ~/run_command.txt
  cd
  sudo apt-get install build-essential git-lfs cmake -y
  openssl rand -hex 32 | tr -d "\n" > "/tmp/jwtsecret"
  cp ~/jwtsecret /tmp/
  git clone https://github.com/status-im/nimbus-eth2
  cd nimbus-eth2
  make -j8 nimbus_beacon_node
  build/nimbus_beacon_node trustedNodeSync \
    --network:holesky \
    --data-dir=build/data/shared_holesky_0 \
    --trusted-node-url=https://holesky-checkpoint-sync.stakely.io/
  cp ~/puffer/coral/etc/keys/bls_keys/* ~/nimbus-eth2/build/data/shared_holesky_0/validators/
  mkdir -p ~/nimbus-eth2/validator_keys/
  cp ~/nimbus-eth2/build/data/shared_holesky_0/validators/* ~/nimbus-eth2/validator_keys/keystore.json
  screen -dmS consensus
  screen -S consensus -X stuff "cd ~/nimbus-eth2/\n"
  screen -S consensus -X stuff "build/nimbus_beacon_node deposits import --data-dir=~/nimbus-eth2/validator_keys/keystore.json\n"
  wallet_address=$(cat ~/wallet_address.txt)
  screen -S consensus -X stuff "./run-holesky-beacon-node.sh --web3-url=http://127.0.0.1:8551 --suggested-fee-recipient=$wallet_address --jwt-secret=/tmp/jwtsecret\n"
  wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
  sudo dpkg -i packages-microsoft-prod.deb
  sudo apt-get update
  sudo apt-get install dotnet-sdk-8.0 dotnet-runtime-8.0 -y
  dotnet --list-sdks
  dotnet --list-runtimes
  git clone https://github.com/NethermindEth/nethermind.git
  cd nethermind/src/Nethermind/
  dotnet build Nethermind.sln -c Release
  screen -dmS execution
  screen -S execution -X stuff "cd ~/nethermind/src/Nethermind/Nethermind.Runner\n"
  screen -S execution -X stuff "dotnet run -c Release -- --config=holesky --datadir='../../../../nethermind-datadir' --JsonRpc.Host=0.0.0.0 --JsonRpc.JwtSecretFile=/tmp/jwtsecret\n"
  echo "Установка успешно завершена. Сохраните файл ~/puffer/coral/registration.json на свой ПК и завершите регистрацию в Puffer Dashboard."
  display_menu
}

# Функция для исправления ошибки Active
fix_active_error() {
  screen -r consensus -X stuff "^C"
  screen -r execution -X stuff "^C"
  rm -r nethermind-datadir
  cd ~/nimbus-eth2
  build/nimbus_beacon_node deposits import --data-dir=build/data/shared_holesky_0
  read -sp "Введите пароль от своих Validator Keys: " validator_password
  echo $validator_password | build/nimbus_beacon_node deposits import --data-dir=build/data/shared_holesky_0
  screen -dmS consensus
  wallet_address=$(cat ~/wallet_address.txt)
  screen -S consensus -X stuff "cd ~/nimbus-eth2/\n"
  screen -S consensus -X stuff "./run-holesky-beacon-node.sh --web3-url=http://127.0.0.1:8551 --suggested-fee-recipient=$wallet_address --jwt-secret=/tmp/jwtsecret\n"
  screen -dmS execution
  screen -S execution -X stuff "cd ~/nethermind/src/Nethermind/Nethermind.Runner\n"
  screen -S execution -X stuff "dotnet run -c Release -- --config=holesky --datadir='../../../../nethermind-datadir' --JsonRpc.Host=0.0.0.0 --JsonRpc.JwtSecretFile=/tmp/jwtsecret\n"
  echo "В ближайшие несколько часов Ваш статус Active должен смениться на зеленый. Если этого не произошло - проделайте установку ноды с нуля, полностью переустановив сервер."
  display_menu
}

# Функция для выхода из скрипта
exit_script() {
  echo "Выход из скрипта..."
  exit 0
}

# Основной блок скрипта
display_logo
display_menu
