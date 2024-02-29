import { WebPlugin } from '@capacitor/core';

import type { CallDetectorPlugin } from './definitions';

export class CallDetectorWeb extends WebPlugin implements CallDetectorPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
