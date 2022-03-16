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
  console.log('connecting');
  TerraApple.initTerra(devID, apiKey, autoFetch).then(success => {
    console.log(success);
    TerraApple.getDaily(
      new Date('2021-01-11').toISOString(),
      new Date().toISOString(),
    ).then(s => {
      console.log(s);
    });
    // TerraApple.getBody(
    //   new Date('2022-01-01').toISOString(),
    //   new Date('2022-01-10').toISOString(),
    // );
  });
}
