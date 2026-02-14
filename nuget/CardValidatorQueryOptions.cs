using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.CardValidator
{
    /// <summary>
    /// Query options for the Card Validator API
    /// </summary>
    public class CardValidatorQueryOptions
    {
        /// <summary>
        /// The card number to validate
        /// </summary>
        [JsonProperty("number")]
        public string Number { get; set; }
    }
}
