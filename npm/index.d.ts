declare module '@apiverve/cardvalidator' {
  export interface cardvalidatorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface cardvalidatorResponse {
    status: string;
    error: string | null;
    data: CardValidatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface CardValidatorData {
      card:               Card;
      brand:              null | string;
      cardNumber:         null | string;
      bin:                null | string;
      last4:              null | string;
      isValid:            boolean | null;
      isPotentiallyValid: boolean | null;
      isTestCard:         boolean | null;
      riskScore:          number | null;
      riskLevel:          null | string;
  }
  
  interface Card {
      niceType:      null | string;
      type:          null | string;
      patterns:      (number | null)[];
      gaps:          (number | null)[];
      lengths:       (number | null)[];
      code:          Code;
      matchStrength: number | null;
  }
  
  interface Code {
      name: null | string;
      size: number | null;
  }

  export default class cardvalidatorWrapper {
    constructor(options: cardvalidatorOptions);

    execute(callback: (error: any, data: cardvalidatorResponse | null) => void): Promise<cardvalidatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: cardvalidatorResponse | null) => void): Promise<cardvalidatorResponse>;
    execute(query?: Record<string, any>): Promise<cardvalidatorResponse>;
  }
}
