declare module "react-native-terra-apple" {
  export interface RNTerraApple {
    /**
     * Authenticate user for linking Apple HealthKit to Terra.
     * @param devId Terra devID
     * @param apiKey Terra apiKey
     * @param referenceID Terra reference ID pushed to the webhook for widget sessions
     */
    auth(
      devId: string,
      apiKey: string,
      referenceID: string
    ): Promise<TerraAuthResponse>;

    /**
     * @param devId Terra devID
     * @param apiKey Terra apiKey
     * @param autoFetch Enable auto fetching data every 8 hours when user opens the app
     */
    initTerra(devId: string, apiKey: string, autoFetch: boolean): Promise<any>;

    /**
     * Send Terra Athlete data to Dev webhook
     */
    getAthlete(): Promise<Boolean>;

    /**
     * Send Terra Body data to Dev webhook
     * @param startDate start date in ISOString format
     * @param endDate end date in ISOString format
     */
    getBody(startDate: string, endDate: string): Promise<any>;

    /**
     * Send Terra Daily data to Dev webhook
     * @param startDate start date in ISOString format
     * @param endDate end date in ISOString format
     */
    getDaily(startDate: string, endDate: string): Promise<any>;

    /**
     * Send Terra Activity data to Dev webhook
     * @param startDate start date in ISOString format
     * @param endDate end date in ISOString format
     */
    getActivity(startDate: string, endDate: string): Promise<any>;

    /**
     * Send Terra Sleep data to Dev webhook
     * @param startDate start date in ISOString format
     * @param endDate end date in ISOString format
     */
    getSleep(startDate: string, endDate: string): Promise<any>;

    /**
     * Deauth user from Terra service
     */
    deauth(): void;
  }

  export interface TerraAuthResponse {
    userID: string;
    referenceID: string;
    status: string;
  }

  const TerraApple: RNTerraApple;

  export default TerraApple;
}
