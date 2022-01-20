declare module "react-native-terra-apple" {
  export interface RNTerra {
    /**
     * Authenticate user for linking Apple HealthKit to Terra.
     * @param devId Terra devID
     * @param apiKey Terra apiKey
     * @param autoFetch Enable auto fetching data every 8 hours when user opens the app
     * @param referenceID Terra reference ID pushed to the webhook for widget sessions
     * @param callback function called with userID upon completed authentication
     */
    initApple(
      devId: string,
      apiKey: string,
      autoFetch: boolean,
      referenceID: string,
      callback: (userID: string) => void
    ): void;

    /**
     * Send Terra Athlete data to Dev webhook
     */
    getAthlete(): void;

    /**
     * Send Terra Body data to Dev webhook
     * @param startDate start date in ISOString format
     * @param endDate end date in ISOString format
     */
    getBody(startDate: string, endDate: string): void;

    /**
     * Send Terra Daily data to Dev webhook
     * @param startDate start date in ISOString format
     * @param endDate end date in ISOString format
     */
    getDaily(startDate: string, endDate: string): void;

    /**
     * Send Terra Activity data to Dev webhook
     * @param startDate start date in ISOString format
     * @param endDate end date in ISOString format
     */
    getActivity(startDate: string, endDate: string): void;

    /**
     * Send Terra Sleep data to Dev webhook
     * @param startDate start date in ISOString format
     * @param endDate end date in ISOString format
     */
    getSleep(startDate: string, endDate: string): void;

    /**
     * Deauth user from Terra service
     */
    deauth(): void;
  }

  const TerraApple: RNTerra;

  export default TerraApple;
}
