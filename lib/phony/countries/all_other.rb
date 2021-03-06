# Splits a national number into a fixed size NDC and rest.
#
module Phony
  module Countries
    
    # Returns an anonymous fixed size ndc / format country handler.
    #
    def self.fixed size, options = {}
      options.merge! :ndc_length => size
      Phony::Country.fixed options
    end
    
    # TODO
    #
    def self.with_cc cc
      mapping[cc.size][cc.to_s]
    end
    
    # Defines a mapping of country code to all splitters/formatters.
    #
    # Note: The above fixed helper is used.
    #       In some cases, we have explicit countries defined.
    #
    # Note: Many taken from http://en.wikipedia.org/wiki/Telephone_numbering_plan.
    #
    def self.mapping
      {
        1 => {
          '0' => fixed(1), # reserved
          '1' => fixed(3,  # USA, Canada, etc.
                       :local_format => [3, 4]
                 ),
          
          # Kazakhstan (Republic of) & Russian Federation
          # http://en.wikipedia.org/wiki/Telephone_numbers_in_Russia
          #
          '7' => fixed(3,
                       :local_format => [3, 2, 2]
                 ),
        },
        2 => {
          '20' => Countries::Egypt,
          '27' => fixed(2,  # South Africa
                        :local_format => [3, 4]
                  ),
                  
          '30' => Countries::Greece,
          '31' => Countries::Netherlands,
          '32' => fixed(1,  # Belgium
                        :local_format => [3, 4]
                  ),
          '33' => fixed(1,  # France
                        :local_format         => [2, 2, 2, 2],
                        :service_ndcs         => %w{8}
                        # :special_ndcs => {
                        #   :service => %w{8},
                        #   :mobile  => %w{6 7}
                        # }
                  ),
          '34' => fixed(2, # Spain
                    :local_format => [3, 4]
                  ),
          '36' => Countries::Hungary,
          '39' => Countries::Italy,

          '40' => Countries::Romania,
          '41' => fixed(2,  # Switzerland (Confederation of)
                        :local_format         => [3, 2, 2],
                        :service_local_format => [3, 3],
                        :service_ndcs         => %w{800 840 842 844 848}
                        # :special_ndcs => {
                        #   :service => %w{800 840 842 844 848},
                        #   :mobile  => %w{74 76 77 78 79}
                        # }
                  ),
          '43' => Countries::Austria,
          '44' => fixed(2), # TODO United Kingdom of Great Britain and Northern Ireland
          '45' => fixed(2,  # Denmark
                        :local_format => [2, 2, 2]
                  ),
          '46' => Countries::Sweden,
          '47' => fixed(4,  # Norway
                    :local_format => [4]
                  ),
          '48' => fixed(2, # Poland (Republic of)
                        :local_format => [1, 3, 3] # Approximation. Correct would be 48-xxx-xxx-xxx
                  ),
          '49' => Countries::Germany,
          
          '51' => Countries::Peru,
          '52' => fixed(2), # TODO Mexico
          '53' => fixed(2), # TODO Cuba
          '54' => fixed(2), # TODO Argentine Republic
          '55' => fixed(2,  # Brazil (Federative Republic of)
                        :local_format => [4, 4],
                        :service_ndcs => %w{100 128 190 191 192 193 194 197 198 199}
          ), # http://en.wikipedia.org/wiki/Telephone_numbers_in_Brazil
          '56' => Countries::Chile,
          '57' => fixed(2), # TODO Colombia (Republic of)
          '58' => fixed(3,  # Venezuela (Bolivarian Republic of)
                        :local_format => [7]
          ),
          
          '60' => fixed(2), # TODO Malaysia
          '61' => fixed(1,  # Australia
                        :local_format => [4, 4]
                  ),
          '62' => fixed(2), # TODO Indonesia (Republic of)
          '63' => fixed(2), # TODO Philippines (Republic of the)
          '64' => fixed(1,  # New Zealand
                        :local_format => [3, 4]
                  ),
          '65' => fixed(2), # TODO Singapore (Republic of)
          '66' => fixed(2), # TODO Thailand

          '81' => fixed(2), # TODO Japan
          '82' => fixed(2), # TODO Korea (Republic of)
          '84' => fixed(2), # TODO Viet Nam (Socialist Republic of)
          '86' => fixed(2), # TODO China (People's Republic of)

          '90' => fixed(2), # TODO Turkey
          '91' => fixed(2), # TODO India (Republic of)
          '92' => fixed(2), # TODO Pakistan (Islamic Republic of)
          '93' => fixed(2,  # Afghanistan
                        :local_format => [7] # Actually, the document says 6, but the examples use 7.
          ), # http://www.wtng.info/wtng-93-af.html
          '94' => fixed(2), # TODO Sri Lanka (Democratic Socialist Republic of)
          '95' => fixed(2), # TODO Myanmar (Union of)
          '98' => fixed(2), # TODO Iran (Islamic Republic of)
        },
        3 => {
          # TODO From here on.
          #
          '210' => fixed(2), # -
          '211' => fixed(2), # -
          '212' => fixed(2), # Morocco
          '213' => fixed(2), # Algeria
          '214' => fixed(2), # -
          '215' => fixed(2), # -
          '216' => fixed(2), # Tunisia
          '217' => fixed(2), # -
          '218' => fixed(2), # Lybia
          '219' => fixed(2), # -

          '220' => fixed(2), # Gambia
          '221' => fixed(2), # Senegal
          '222' => fixed(2), # Mauritania
          '223' => fixed(2), # Mali
          '224' => fixed(2), # Guinea
          '225' => fixed(2), # Côte d'Ivoire
          '226' => fixed(2), # Burkina Faso
          '227' => fixed(2), # Niger
          '228' => fixed(2), # Togolese Republic
          '229' => fixed(2), # Benin

          '230' => fixed(2), # Mauritius
          '231' => fixed(2), # Liberia
          '232' => fixed(2), # Sierra Leone
          '233' => fixed(2), # Ghana
          '234' => fixed(2), # Nigeria
          '235' => fixed(2), # Chad
          '236' => fixed(2), # Central African Republic
          '237' => fixed(2), # Cameroon
          '238' => fixed(2), # Cape Verde
          '239' => fixed(2), # Sao Tome and Principe

          '240' => fixed(2), # Equatorial Guinea
          '241' => fixed(2), # Gabonese Republic
          '242' => fixed(2), # Congo
          '243' => fixed(2), # Democratic Republic of the Congo
          '244' => fixed(2), # Angola
          '245' => fixed(2), # Guinea-Bissau
          '246' => fixed(2), # Diego Garcia
          '247' => fixed(2), # Ascension
          '248' => fixed(2), # Seychelles
          '249' => fixed(2), # Sudan

          '250' => fixed(2), # Rwanda
          '251' => fixed(2), # Ethiopia
          '252' => fixed(2), # Somali Democratic Republic
          '253' => fixed(2), # Djibouti
          '254' => fixed(2), # Kenya
          '255' => fixed(2), # Tanzania
          '256' => fixed(2), # Uganda
          '257' => fixed(2), # Burundi
          '258' => fixed(2), # Mozambique
          '259' => fixed(2), # -

          '260' => fixed(2), # Zambia
          '261' => fixed(2), # Madagascar
          '262' => fixed(3), # Reunion / Mayotte (new)
          '263' => fixed(2), # Zimbabwe
          '264' => fixed(2), # Namibia
          '265' => fixed(2), # Malawi
          '266' => fixed(2), # Lesotho
          '267' => fixed(2), # Botswana
          '268' => fixed(2), # Swaziland
          '269' => fixed(2), # Comoros

          '280' => fixed(2), # -
          '281' => fixed(2), # -
          '282' => fixed(2), # -
          '283' => fixed(2), # -
          '284' => fixed(2), # -
          '285' => fixed(2), # -
          '286' => fixed(2), # -
          '287' => fixed(2), # -
          '288' => fixed(2), # -
          '289' => fixed(2), # -
          '290' => fixed(2), # Saint Helena

          '291' => fixed(2), # Eritrea
          '292' => fixed(2), # -
          '293' => fixed(2), # -
          '294' => fixed(2), # -
          '295' => fixed(2), # -
          '296' => fixed(2), # -
          '297' => fixed(2), # Aruba
          '298' => fixed(2), # Faroe Islands
          '299' => fixed(2), # Greenland

          '350' => fixed(2), # Gibraltar
          '351' => fixed(2), # Portugal
          '352' => fixed(2), # Luxembourg
          '353' => fixed(2), # Ireland
          '354' => fixed(2), # Iceland
          '355' => fixed(2), # Albania
          '356' => fixed(2), # Malta
          '357' => fixed(2), # Cyprus
          '358' => fixed(2), # Finland
          '359' => fixed(2), # Bulgaria

          '370' => fixed(2), # Lithuania
          '371' => fixed(2), # Latvia
          '372' => fixed(2), # Estonia
          '373' => fixed(2), # Moldova
          '374' => fixed(2), # Armenia
          '375' => fixed(2), # Belarus
          '376' => fixed(2), # Andorra
          '377' => fixed(2), # Monaco
          '378' => fixed(2), # San Marino
          '379' => fixed(2), # Vatican City State

          '380' => fixed(2), # Ukraine
          '381' => fixed(2), # Serbia and Montenegro
          '382' => fixed(2), # -
          '383' => fixed(2), # -
          '384' => fixed(2), # -
          '385' => fixed(2), # Croatia
          '386' => fixed(2), # Slovenia
          '387' => fixed(2), # Bosnia and Herzegovina
          '388' => fixed(2), # Group of countries, shared code
          '389' => fixed(2), # The Former Yugoslav Republic of Macedonia

          '420' => fixed(3,  # Czech Republic
                         :local_format => [3, 3]
                   ),
          '421' => fixed(2), # Slovak Republic
          '422' => fixed(2), # Spare code
          '423' => fixed(0,  # Liechtenstein (Principality of)
                         :local_format => [3, 2, 2]
                   ),
          '424' => fixed(2), # -
          '425' => fixed(2), # -
          '426' => fixed(2), # -
          '427' => fixed(2), # -
          '428' => fixed(2), # -
          '429' => fixed(2), # -

          '500' => fixed(2), # Falkland Islands (Malvinas)
          '501' => fixed(2), # Belize
          '502' => fixed(2), # Guatemala (Republic of)
          '503' => fixed(2), # El Salvador (Republic of)
          '504' => fixed(2), # Honduras (Republic of)
          '505' => fixed(2), # Nicaragua
          '506' => fixed(2), # Costa Rica
          '507' => fixed(2), # Panama (Republic of)
          '508' => fixed(2), # Saint Pierre and Miquelon (Collectivité territoriale de la République française)
          '509' => fixed(2), # Haiti (Republic of)

          '590' => fixed(3), # Guadeloupe (French Department of)
          '591' => fixed(2), # Bolivia (Republic of)
          '592' => fixed(2), # Guyana
          '593' => fixed(2), # Ecuador
          '594' => fixed(3), # French Guiana (French Department of)
          '595' => fixed(2), # Paraguay (Republic of)
          '596' => fixed(3), # Martinique (French Department of)
          '597' => fixed(2), # Suriname (Republic of)
          '598' => fixed(2), # Uruguay (Eastern Republic of)
          '599' => fixed(2), # Netherlands Antilles

          '670' => fixed(2), # Democratic Republic of Timor-Leste
          '671' => fixed(2), # Spare code
          '672' => fixed(2), # Australian External Territories
          '673' => fixed(2), # Brunei Darussalam
          '674' => fixed(2), # Nauru (Republic of)
          '675' => fixed(2), # Papua New Guinea
          '676' => fixed(2), # Tonga (Kingdom of)
          '677' => fixed(2), # Solomon Islands
          '678' => fixed(2), # Vanuatu (Republic of)
          '679' => fixed(2), # Fiji (Republic of)

          '680' => fixed(2), # Palau (Republic of)
          '681' => fixed(2), # Wallis and Futuna (Territoire français d'outre-mer)
          '682' => fixed(2), # Cook Islands
          '683' => fixed(2), # Niue
          '684' => fixed(2), # -
          '685' => fixed(2), # Samoa (Independent State of)
          '686' => fixed(2), # Kiribati (Republic of)
          '687' => fixed(2), # New Caledonia (Territoire français d'outre-mer)
          '688' => fixed(2), # Tuvalu
          '689' => fixed(2), # French Polynesia (Territoire français d'outre-mer)

          '690' => fixed(2), # Tokelau
          '691' => fixed(2), # Micronesia (Federated States of)
          '692' => fixed(2), # Marshall Islands (Republic of the)
          '693' => fixed(2), # -
          '694' => fixed(2), # -
          '695' => fixed(2), # -
          '696' => fixed(2), # -
          '697' => fixed(2), # -
          '698' => fixed(2), # -
          '699' => fixed(2), # -

          '800' => fixed(2), # International Freephone Service
          '801' => fixed(2), # -
          '802' => fixed(2), # -
          '803' => fixed(2), # -
          '804' => fixed(2), # -
          '805' => fixed(2), # -
          '806' => fixed(2), # -
          '807' => fixed(2), # -
          '808' => fixed(2), # International Shared Cost Service (ISCS)
          '809' => fixed(2), # -

          '830' => fixed(2), # -
          '831' => fixed(2), # -
          '832' => fixed(2), # -
          '833' => fixed(2), # -
          '834' => fixed(2), # -
          '835' => fixed(2), # -
          '836' => fixed(2), # -
          '837' => fixed(2), # -
          '838' => fixed(2), # -
          '839' => fixed(2), # -

          '850' => fixed(2), # Democratic People's Republic of Korea
          '851' => fixed(2), # Spare code
          '852' => fixed(2), # Hong Kong, China
          '853' => fixed(2), # Macao, China
          '854' => fixed(2), # Spare code
          '855' => fixed(2), # Cambodia (Kingdom of)
          '856' => fixed(2), # Lao People's Democratic Republic
          '857' => fixed(2), # Spare code
          '858' => fixed(2), # Spare code
          '859' => fixed(2), # Spare code

          '870' => fixed(2), # Inmarsat SNAC
          '871' => fixed(2), # Inmarsat (Atlantic Ocean-East)
          '872' => fixed(2), # Inmarsat (Pacific Ocean)
          '873' => fixed(2), # Inmarsat (Indian Ocean)
          '874' => fixed(2), # Inmarsat (Atlantic Ocean-West)
          '875' => fixed(2), # Reserved - Maritime Mobile Service Applications
          '876' => fixed(2), # Reserved - Maritime Mobile Service Applications
          '877' => fixed(2), # Reserved - Maritime Mobile Service Applications
          '878' => fixed(2), # Universal Personal Telecommunication Service (UPT)
          '879' => fixed(2), # Reserved for national non-commercial purposes

          '880' => fixed(2), # Bangladesh (People's Republic of)
          '881' => fixed(2), # International Mobile, shared code
          '882' => fixed(2), # International Networks, shared code
          '883' => fixed(2), # -
          '884' => fixed(2), # -
          '885' => fixed(2), # -
          '886' => fixed(2), # Reserved
          '887' => fixed(2), # -
          '888' => fixed(2), # Reserved for future global service
          '889' => fixed(2), # -

          '890' => fixed(2), # -
          '891' => fixed(2), # -
          '892' => fixed(2), # -
          '893' => fixed(2), # -
          '894' => fixed(2), # -
          '895' => fixed(2), # -
          '896' => fixed(2), # -
          '897' => fixed(2), # -
          '898' => fixed(2), # -
          '899' => fixed(2), # -

          '960' => fixed(2), # Maldives (Republic of)
          '961' => fixed(2), # Lebanon
          '962' => fixed(2), # Jordan (Hashemite Kingdom of)
          '963' => fixed(2), # Syrian Arab Republic
          '964' => fixed(2), # Iraq (Republic of)
          '965' => fixed(2), # Kuwait (State of)
          '966' => fixed(2), # Saudi Arabia (Kingdom of)
          '967' => fixed(2), # Yemen (Republic of)
          '968' => fixed(2), # Oman (Sultanate of)
          '969' => fixed(2), # Reserved - reservation currently under investigation

          '970' => fixed(2), # Reserved
          '971' => fixed(2), # United Arab Emirates
          '972' => fixed(2), # Israel (State of)
          '973' => fixed(2), # Bahrain (Kingdom of)
          '974' => fixed(2), # Qatar (State of)
          '975' => fixed(2), # Bhutan (Kingdom of)
          '976' => fixed(2), # Mongolia
          '977' => fixed(2), # Nepal
          '978' => fixed(2), # -
          '979' => fixed(2), # International Premium Rate Service (IPRS)

          '990' => fixed(2), # Spare code
          '991' => fixed(2), # Trial of a proposed new international telecommunication public correspondence service, shared code
          '992' => fixed(2), # Tajikistan (Republic of)
          '993' => fixed(2), # Turkmenistan
          '994' => fixed(2), # Azerbaijani Republic
          '995' => fixed(2), # Georgia
          '996' => fixed(2), # Kyrgyz Republic
          '997' => fixed(2), # Spare code
          '998' => fixed(2), # Uzbekistan (Republic of)
          '999' => fixed(2), # Reserved for possible future use within the Telecommunications for Disaster Relief (TDR) concept
        }
      }
    end
      
  end
end