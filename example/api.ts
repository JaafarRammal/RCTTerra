import TerraApple from 'react-native-terra-apple';

const devID = 'devID';
const apiKey = 'apiKey';

export function FirstConnection() {
  TerraApple.auth(devID, apiKey, 'refID')
    .then(res => {
      ConnectUser(true);
      console.log(res);
    })
    .catch(e => console.log(e.message, e.code));
}

export function ConnectUser(autoFetch: boolean) {
  TerraApple.initTerra(devID, apiKey, autoFetch);
}
