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
  TerraApple.initTerra(devID, apiKey, autoFetch).then(success => {
    console.log(success);
    console.log(
      'can call backfill or something now, scopes auth query completed',
    );
  });
}
