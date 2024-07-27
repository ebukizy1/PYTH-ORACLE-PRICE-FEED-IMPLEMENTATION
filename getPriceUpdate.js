const { spawn } = require("child_process");

const DAIUSD =
  "0xb0948a5e5313200c632b51bb5ca32f6de0d36e9950a942d19751e833f70dabfd";
const LINKUSD =
  "0x8ac0c70fff57e9aefdf5edf44b51d62c2d433653cbb2cf5cc06bb115af04d221";
const WBTCUSD =
  "0xc9d8b075a5c69303365ae23633d4e085199bf5c520a3b90fed1322a0342ffc33";
const USDCUSD =
  "0xeaa020c61cc479712813461ce153894a96a6c00b21ed0cfc2798d1f9a9e9c94a";

spawn(
  `curl 'https://hermes.pyth.network/v2/updates/price/latest?ids[]=${DAIUSD}&ids[]=${LINKUSD}&ids[]=${WBTCUSD}&ids[]=${USDCUSD}' | jq '.binary.data[0]' -r > price_update.txt`,
  {
    stdio: "inherit",
    shell: true,
  }
);
