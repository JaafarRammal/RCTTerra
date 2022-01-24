import TerraApple from 'react-native-terra-apple';

const devID = 'devID';
const apiKey = 'apiKey';

export function FirstConnection() {
  TerraApple.auth(devID, apiKey, 'refID')
    .then(res => {
      ConnectUser(res.userID, true);
      console.log(res);
    })
    .catch(e => console.log(e.message, e.code));
}

export function ConnectUser(userID: string, autoFetch: boolean) {
  TerraApple.initTerra(devID, apiKey, userID, autoFetch);
}
