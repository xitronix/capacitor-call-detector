export interface CallDetectorPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  startObserver(): Promise<void>;
  stopObserver(): Promise<void>;
}
