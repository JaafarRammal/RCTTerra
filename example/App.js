/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {
  SafeAreaView,
  StatusBar,
  useColorScheme,
} from 'react-native';

import {Colors} from 'react-native/Libraries/NewAppScreen';

import TerraApple from 'react-native-terra-apple';

const App = () => {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  TerraApple.initApple("devid", "apikey", true, "refID", userID => {
    console.log(userID);
    // TerraApple.getAthlete();
    // TerraApple.getBody(new Date("Jan 10 2022").toISOString(), new Date().toISOString());
    // TerraApple.getDaily(new Date("Jan 02 2022").toISOString(), new Date().toISOString());
    // TerraApple.getSleep(new Date("Jan 02 2022").toISOString(), new Date().toISOString());
    // TerraApple.getActivity(new Date("Jan 02 2022").toISOString(), new Date().toISOString());
    // TerraApple.deauth()
  });


  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar barStyle={isDarkMode ? 'light-content' : 'dark-content'} />
    </SafeAreaView>
  );
};

export default App;
