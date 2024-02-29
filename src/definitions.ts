export interface CallDetectorPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
