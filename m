Return-Path: <arjun.padmanabhan@microsemi.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0078.outbound.protection.outlook.com [104.47.37.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svj9v4hZtzDsyJ
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 18:32:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mscc365.onmicrosoft.com
 header.i=@mscc365.onmicrosoft.com header.b=AFD/oCvw; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscc365.onmicrosoft.com; s=selector1-microsemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rY/pTJnhkcDVjyE4GFNyjSHgGXMmC/j9lkrG/kLisM0=;
 b=AFD/oCvwzWRcSwtjg3k78gSjgiTjMWgJ+cv0OiajaHEC9nuD3vnqLgOYEMPjABoxidh2/bU4KjhMu4A6nbczA03oQWTHl0+ccwuHATYuJkzmu0iUB7/gn626a63UGTCtRXh62ZMcOz9kh6UWluSi9IPnlssrir8XnuN1UVJa7dA=
Received: from BY1PR0201CA0016.namprd02.prod.outlook.com (10.160.191.154) by
 SN1PR02MB2015.namprd02.prod.outlook.com (10.165.227.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.659.11; Thu, 13 Oct 2016 07:32:29 +0000
Received: from BY2FFO11FD023.protection.gbl (2a01:111:f400:7c0c::139) by
 BY1PR0201CA0016.outlook.office365.com (2a01:111:e400:4814::26) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.12 via
 Frontend Transport; Thu, 13 Oct 2016 07:32:29 +0000
Authentication-Results: spf=none (sender IP is 208.19.100.21)
 smtp.mailfrom=microsemi.com; kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=microsemi.com;
Received-SPF: None (protection.outlook.com: microsemi.com does not designate
 permitted sender hosts)
Received: from avsrvexchhts1.microsemi.net (208.19.100.21) by
 BY2FFO11FD023.mail.protection.outlook.com (10.1.15.212) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
 15.1.629.5 via Frontend Transport; Thu, 13 Oct 2016 07:32:28 +0000
Received: from AVSRVEXCHMBX2.microsemi.net ([fe80::a552:1d60:6960:9da4]) by
 avsrvexchhts1.microsemi.net ([::1]) with mapi id 14.03.0301.000; Thu, 13 Oct
 2016 00:32:26 -0700
From: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Subject: RE: FW: Kernel panic error while emulating qemuarm image
Thread-Topic: FW: Kernel panic error while emulating qemuarm image
Thread-Index: AdIkdlVJFxw7r6L7Ski1YvuM8vpw4wAllPDAABP4/QAADjqwMA==
Date: Thu, 13 Oct 2016 07:32:26 +0000
Message-ID: <C160D2872FE0DE4683E1910F9BF829414846E33E@avsrvexchmbx2.microsemi.net>
References: <C160D2872FE0DE4683E1910F9BF829414846E2E3@avsrvexchmbx2.microsemi.net>
 <8edc2e64-9ead-43ca-f4ae-d2c262721644@kaod.org>
In-Reply-To: <8edc2e64-9ead-43ca-f4ae-d2c262721644@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.34.10]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:208.19.100.21; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(199003)(24454002)(51914003)(377454003)(189002)(13464003)(104016004)(2501003)(15975445007)(86362001)(69596002)(101416001)(3846002)(47776003)(105586002)(6116002)(2906002)(53416004)(356003)(81156014)(7736002)(305945005)(4326007)(5890100001)(2950100002)(8676002)(2920100001)(102836003)(87936001)(50466002)(5660300001)(626004)(2900100001)(8936002)(189998001)(5250100002)(7846002)(92566002)(23676002)(19580405001)(106466001)(11100500001)(33656002)(19580395003)(5001770100001)(97736004)(586003)(107886002)(54356999)(50986999)(4001430100002)(76176999)(7696004)(68736007)(55846006)(9686002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB2015; H:avsrvexchhts1.microsemi.net;
 FPR:; SPF:None; PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD023;
 1:U4RhKzbKs3+Xmb9VYjkLCNXrhRs+Y8yAWl0vVusS0cIcE6rg0NYzpezocsFXP1dmaNxDHrkLshlLidJRCi5fJtcXDetfNADv0kevsu5e5qiosUMb470b9fnEvGPahoWfDn41foGw3SRV/ivZWgi4ahwWFGqqHrnEY2W8oZGd75ltk1R0yipZHZghe7t1auhHLc48eo723294493y+iUMGt4AlEfVxQ1mvNrojPkc6TlJ1XFFsd3Hhe8T4bfL2Ge/5FwVPb2C51gv7/Uh4Kr6CyfOdpNGU37+BwTOe4KsOYW4IMFBFWCLotaP/0mPh2pnRmPv95L9louS4s48bBF6R2lVV9Iaywd22pg/2gq9w7xTM/FTvDilK8Nu+6Sfuhc4rCazIYjUKsXVd2Gx/WJDEHtdWqw4bJs7IDHzi8qE7J0f5vpiWyU7tZf+cDpOhHHzje1Oo1QivPJUvgJgy/zbv6G1VYR0r34RxoB78aFS+S06MGV9Jt+Qdrpi7ApQ/s7RrV7Jcb8ubx1lYJL5eg/c+Unyk+LjYbqg6xRN6mG6WiQ=
X-MS-Office365-Filtering-Correlation-Id: 83f2185e-5869-45cf-163e-08d3f33b164a
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2015;
 2:4+NwUWlmkZ9BTybPlq7wMMA0lZLmzkUu4u2uQDx1gadoTY7t7PBDktVu6wEXBfUpwVp3jM6UobnWqzfxcFQ+W19nbeR3tiOf440VufjvbdrkRa68q8yLCphhsU2Cs770gJ89myFLOXyrkUXNXq7cxkG4BgsFsQIZVz4Pdd/XpawrSu4sl5ZJoXk8zxit/3OPUi0++yOGWyr81MUhkfp3eg==;
 3:X7JlzWngsf/zi9C7uvbfGwqP3oNEY8i/IHqvFZ8ve9WcQw8IZEGCe6gz8dbkWDv49ME6tLVVfbZXQ3LouarJU7RfNSfG8MN/qTSC5HUSSrAooDGNKuYbuJ6w5oxpBLM8Ly0ova6+3rjS1H7yJQWDc7DtUyPbCaxXjEKW5YVDxXvrer+Mcll2WPEX+rOFjrupw06DjVriRkoMcxvjAWH7lzYYe9aPoglP8eke1bE+YYePVUXf2UQCrEVF/VCMz8j2
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR02MB2015;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2015;
 25:sy9F9dcqCmXoFlReEVBFUIQVxuSBTiZSHqSkziHf026eEkL7rL/15x7kjCoyQcYtTi+zMN2YuZcnjhJ79uJ6K4f2OXFoieFBr4NMuHD7bfh8Ywz1Bct0IZY0GhJLVgKbSQv4ipD2ALQCsj8vsMwLwTC+ZkkoRQ6IwWerUjCcFL4YkPic2VA9HkROATRCBvnJvkw7k6zesDDYC+vA3kO16IpYPyLXtWUox1eMX5qF7x5rfLPMz4cEQGv6ithlLUy0q9ZCLcP+0MnxX8yDbfpmF/rcITWp0wwi6pAPpGOOJ/zOAdrqXETlgIXtPYPBh4ncjl6lp1grckHd5Y54HsoxqOqJ5MMZ0lMs+oUvkhvDfWSahY1VsyRzKgQGdjUaBsmoCxfbkIbzFeGWoKRp4A7Pq2fARBlHPc4TlTE4snrLmYdtVC3VDQxJ9ezC2LM6ZDAYdaRXzgAnA3FaudZLk43GPBNOWokWy/or+htCZ0P9YMggv/6sgwad2zdVKT3A9QWe/jbtPM92mqQGRivZq2jDQFdxfBOMtLH3LS2bh4p96w6NHq7zwLONzFUjd8wYl6hwzmmULf89v3K1hnJiXcu6hTtYBdS/OruY6T8+XZAjHH3SCZs5npRMA1VYdHlXrvy22WAX0/lFdCSS2DYsT4PiWwhIKclAuZfk8B+a5YF2Ceua585jwpCM36TujR1KdgcK4xfrQHuCZ2ikrFQTeX58BnBlNpZyJ8oMzOtCJj46R+VRLV6gW0wEcef4aCD+r2qv3im31nGS+0BAFPa30P56lpbbx6d3f3Kjwwj8s/q0Us9UlCPrTNU48o7wsPlqM1Fkm71Qn0eM4k3fSFlITRv3jzWG7WeVYGcMQx04JMwEna/rRD+9YZkpvpFmOBON1uxP
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2015;
 31:m0ybjVKxYXUtLTZ8rDq1kaFdstvUfgfvnXpsFOHjFyPC0GRQ/0PW+tnTVxWgzqRIpC5IKNh1adIn8pWJkT6pVt2ASufF6FdfyPUGDmQcw0O6Ao2kPSeeAyQ4oXt1boUNFqEKtnzJA1jDHVpLKzxpD+kxQTQYN2XEsRl034nfnpudXva92iuRuewQFNpk9oasQUGZXuYXyexF7I7aYbGfMX4wE21wdI4xrpkQtsY6AtEGZCVYFjHpm56jpLu1O2U3ZaT5AJG13YNTNrCKXZY3JA==;
 20:ip0O1E9a+Sc0Par9EH3y7VPjL0bZlF8IE+D2VFMKnn8KyNl3wm32g/YEKwSPgbK9rURkTa/swHfau/HltyOcl94zOa19H40X7jBg3c2u5hkYDbF43yOVT0A07m5I5AbxHXNzbaR5f8txBfcQosr5dV+r4sY90joTu03E1GGR41G6+B5Ia9mm+TCA0N7V+X4rbXYMbs1ejtaL4STtBzP4yRXut+UFGwgqQw7Ybk/nnQ8ZhjbBOK5lq7afsOEbDe0uTX0FDcBvT+GIqcKNgTzlKBigctKXeWYGnFpIbGAyVTnSKhXsuvWANdmlNqXeW8GCqtmwO8ec67p7rHUkPfapWLxv9405ykth3z5Wxqe5nzQzw6Ibw+OYlHZ/0HqnsxdC5iCNH+tOIWMkTVsaDGj9TfsmPXI4Aq33miukRMqpEguiBSc2gqrvjWC/Niowc2GaA9291BYzba3BTAjjGXbEDgAaW7CXVdSWrLNmO7Q8tSrginx/mRWCpYS3o04Kk38k
X-Microsoft-Antispam-PRVS: <SN1PR02MB2015011598789700BCFAA4B7E2DC0@SN1PR02MB2015.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(65623756079841);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040176)(601004)(2401047)(13024025)(13015025)(13018025)(13017025)(5005006)(13023025)(8121501046)(3002001)(10201501046)(6055026);
 SRVR:SN1PR02MB2015; BCL:0; PCL:0; RULEID:; SRVR:SN1PR02MB2015; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2015;
 4:9l4Y18NvK71RQBiIa/zdRbWxP/syHBrO6RRyb77HYxPjZR5CCqimDDdiqInDQBWWLQ8LSzKEsmdva8gk/yruVa1vdbUrI7UBhq+MNBsF2btSQFQiiiKPQVc5YJHV5WKoUn/ex3oBYivtq0j6PeZ5dnOQkOOOzYGENd+hWOda56eegxOAskDl1yhiJZz0NiwN5djsu/D486sM53t9ZiPcy2AWz53IoepWxVsWjWyu2Z61LZGAR2gTT83ElJl5XdYIK2CfFomg5dp6jb6wlEJtHjiXMG6O7CZXVWC/btpinbBMtzDE8+6Xbvs52cTTKPdjWBfK9JHB6o+v+LrUxULC4fbcs+hJ5FfWbyiVMsdTqu2QhtwlLxVkxn8gFNe5rk6UNbz/rT/V4U3sHdKcwh3jNsVhpBIBFnRffqVZvHWah20J53q3fJeP6PrrquYVd2vMjQ1J1F1HBJikx+PVOkSynQVGjs20DCiQbuhd7tJEE4t7/PUlg6nqKrE4zmYTqSdYcQjW0XzoJ+3uwJbmKUYwSKN+eDg4WfBtvWdyXvu9VTIBMFoiUYCD92a6SsVaokn0qlYw7vFSkGaQIQfof8rStQ==
X-Forefront-PRVS: 0094E3478A
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjFQUjAyTUIyMDE1OzIzOnMvZG9pRXVFZmp4Wi9WSzVwanoxLzQvL2pa?=
 =?utf-8?B?TDJUY09IM3h5KzNGSElrNXNjemdWbk80YWpPVnMweFI0U1JxMUhDaW5QS1VD?=
 =?utf-8?B?VjdYNlNyM0FiTXQzaDVwME85d0NlMWMrcXhsM3I0YURuVWVweVJEQU5PVjNl?=
 =?utf-8?B?eEZxYTd3RmtPMFQycEl5TVduanNUcVphZnJ5aGVlb3o5UmJpZk9wNkVoWGpw?=
 =?utf-8?B?ZkY2SEwzemd2NVpmR0pONVphRkJCRzlwbmFRSm1UU3dUYjhCVGtnb2ZOejA5?=
 =?utf-8?B?M3JLQVVqRGFQcHM2MW9zaXljTkpMQXl5dGhSMkdxRFJGb21iOUVIVXg3cWZk?=
 =?utf-8?B?d0ViVEUwS2JpdDBPNjh5T0ZIaHVSUExEVEJ3SFlsRGxiS0Rnbk8zcXpTSVlR?=
 =?utf-8?B?Snh4b0RJRkprWFY5N3ZSV3R2N1h5YzY5R1dPK2R3QmMyQ21GWGtWTzR4N1Zp?=
 =?utf-8?B?K1ArQlpYR0pZZkFMVVJWS3NSMGNpaUZKS0x1c0g1SW94MTc3N25IanFaUkQ0?=
 =?utf-8?B?NXF0bis3TUFHc2FIKzJUU1RvQzE1ZFJXdHZEZklPYVppNkJZZ0dSY1FwY3I2?=
 =?utf-8?B?VlJKcC83b21wUEwrOFZiZ1RGNURCZGJwcGU3YVlmT1luQXVTYmRXM1VwNmVs?=
 =?utf-8?B?ckZxL3BGZGp0T3dZV2lXdk44VXRqdUFXeWcrR25EQ1FGd3hxQ2FuU2NwQk9K?=
 =?utf-8?B?alE5eTRkRWdEZlpyTDdGeUVvUncxa2VybTV2WitDeUFRNmdYbWMzc1NJTWFL?=
 =?utf-8?B?Z3ZRbWFTeVNoZEd1dUpxZHJ2VWlFYUlQb3lqV1NGRnlDWTVCYXhyMEN5Vnpw?=
 =?utf-8?B?OFcrZnA1RnI3YWY1ZWxDQ2JtM2wwV2JFUEt2TitEVkVsQjhFZE5BZCthczRj?=
 =?utf-8?B?Qk5XaUN1S1lZM0xmVHdVZjJtM3lNN1ZXTzVuNVdFeFlmbk5ZTElzMmxpc01w?=
 =?utf-8?B?VkZoaEo2WXZ0RDNVWGVLUERzV2ZKRno1MnhSdzJ2ZllQRW02OU9mVXJENWhT?=
 =?utf-8?B?Mld3Y21JNm8zVmloeXVUby9XeFBNK013VkJmamFHYzIzdTQxWWFyTzZ5amIx?=
 =?utf-8?B?ZGxyaFZ2WWhMbTVzUVRyNGFBWHdTUmNyNkV5cHdheEV1MTE3djM3ZUx1SDNl?=
 =?utf-8?B?Rmwwb01leEtYMGZxeHBTSnpWMHI0b2dKZkRsNUJRblRFS25oT0tlVDJBM3A0?=
 =?utf-8?B?emZmbEJQSmREMDRtSi9BUXhydWVlNUhYaHlodGxsNzNtRUJzbmI3UTNqMFNU?=
 =?utf-8?B?Nmh4Y1pqVnQyaDRQc1AxUXdxRlVCVjhINlFlcHA3Rk10MmRhMXJsd0ppRFZC?=
 =?utf-8?B?Q0g2NWVydXljKy85eVh5MEp4aStRejg5ZDdwOEhLV2gwS1dxSWt0TUhnRnRK?=
 =?utf-8?B?bWk2c3R4Vmd3cFR2bnZwSWlKYmN0Slc4RjlYVC9BR2Fubk1XcDVlYmt1NDI2?=
 =?utf-8?B?K3BoUXNJTk90QXpabFpwKy9LbEZRZ0ZtSiszN2lXVW1Ldjh1ajBoN0p3N3pz?=
 =?utf-8?B?c1BtUnE5WHJtMlIvM1ZCUHNIQ0ZxaEdFbFdvZ0Z2VStpdUNDRHBjOFA5aS9a?=
 =?utf-8?B?K3B3dlRoWHJid2huTjROMW9OdUY3VVRtL2crRTJKOTZVYWxpUjFrWnVzdmh5?=
 =?utf-8?B?VXNkczZVVm9EWjJSaWJPeHBIOWxvZE1Pak9FRHdsb21rbU5KQStFUVlmMyti?=
 =?utf-8?B?QWh0MzkvNmxpSE1WWGp5cFU1aGU5MHNrL3Y5R3FFdGt3WmN0aGd3TXBZTDFq?=
 =?utf-8?B?V1Y1Yzl0UGEwV0kwQkp5cVkwazJIZWg0dnh2WUozUEFrM2FPODJjd3VUNktp?=
 =?utf-8?B?eW95aENsYi90NzdlbVlBS3JRa2VNRDZDcVZSZjh3aWFkRE5WZEU5endzREpC?=
 =?utf-8?B?dGV0ckZIMGdmWDJ2Q213cU5EU0pueGN4MmN3QVliVU5kZm04ZWtacms0aEpj?=
 =?utf-8?B?SFdianRVaDlRU05QS0o4SHRLMDlrZnZIMndTSGxXaFJFaktKd0tuZXBnSjNM?=
 =?utf-8?Q?G/n9OT?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2015;
 6:IkbSJQD+eHGIA1Nece28m1qUGUl77b26jBN/m80Sn0K/TIUJUODkcDHKxtPbL4hQS7y2HTrCBDYwdTjYZnW01bYBsQUp7blZvJQ2TRvpkR9u/NfODpVBlZMpKgb4MJXh8u9KMF1erg50zr3kmqW3M2ogb7L3xdWaxgSeSX3sZ0WpS+DkR6LGsZVhvCNYf6sfpmqtS39G6xZ6jHJa7IlvQz+0Eu1mEpIZtTKmLCX194t5QIDr0P2+6DatPaS4S17DbJJs8SVk3PWyW1bgxbssN2DrWypd16iPZjUlqqCXS0+l6uS1Pnd9ptEAoop+HPoyJJJiaU0xk24iX+P2W51gS3Wp3QQS+6mtByssnZhYBVc=;
 5:fndH37spExLsFCTq0I7b7N+GuHqqOgR8oQHlGdSu+yUWnfza7x53WDgLIYABP56XOU74p9JAVfn8/qavbROPLSrZ37NAOZ1WsurpKUlbaSS+a/z1Py+k7gMoJ4RWJN3bZGousrwylYSMHPbdYsX+e2Hx+xxPnn5xK0R3sPDXhLM=;
 24:7ZtwHvtPRrKmDRDB7jLu5EBnuVoMSb333t0wI+RTW6ApEexR5Hj4J7HnQkgj0j6ozxBLpW1jTalM37H3bdJhrXKYPzX1zaFhigGz4b9KOyM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB2015;
 7:qHl662skYC0DX22CnpIYJ5QNB6kY1lUD+TWJIafIS6WGZRc1ddPKLF2JKt7nm+gXAI7JigNKStqlvE9mit5VcO1nbatbQH7KNi42iY09oc2dZSElZpX4fYO7NWRuykWpF7cuLyWG+w8I9HMyQyYzqrymbo74FaQtOINA0isPqScaleEKTiENGE12ZzL73AyKB6LwmPSSUrmPFhqYg7pzlOqB6iHX5N5KAfFMx4XEWyHCdQbrR6Gah6jNAD8DzxXh9GZym4GmNrZ3mpZftDfl+C2ZAI+DM11HjRi02NgSSezCr5sU/ZHjZHIyToU+JUTWB20CTZAvz4+zpujiR3SplE+f3LoIBVjjzEx598OJARc=
X-OriginatorOrg: microsemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2016 07:32:28.9606 (UTC)
X-MS-Exchange-CrossTenant-Id: f267a5c8-86d8-4cc9-af71-1fd2c67c8fad
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f267a5c8-86d8-4cc9-af71-1fd2c67c8fad; Ip=[208.19.100.21];
 Helo=[avsrvexchhts1.microsemi.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB2015
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2016 07:32:36 -0000

SGksDQoNClRoYW5rcyBmb3IgdGhlIHJlcGx5Lg0KDQpVcGRhdGU6IEZvciBkZWZhdWx0IGNvbXBp
bGF0aW9uKGFybXY1ZSkgd2l0aG91dCBjaGFuZ2luZyB0dW5pbmcgZmVhdHVyZXMsIEkgY291bGQg
cnVuIHFlbXUoMi43LjApIHdpdGggYnVpbHQgaW1hZ2UuIElzc3VlICBvZiBrZXJuZWwgcGFuaWMg
aGFwcGVucyB3aGVuIEkgY2hhbmdlIHR1bmluZyBmZWF0dXJlIGZpbGUgYXMgSSBtZW50aW9uZWQg
aW4gdHJhaWxpbmcgbWFpbC4NCg0KVGhhbmtzDQpBcmp1biBQYWRtYW5hYmhhbgkNCg0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEPDqWRyaWMgTGUgR29h
dGVyIFttYWlsdG86Y2xnQGthb2Qub3JnXSANClNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDEzLCAy
MDE2IDEyOjQ4IFBNDQpUbzogQXJqdW4gUGFkbWFuYWJoYW47IG9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZw0KQ2M6IEJhbGFqaSBNYXJpbXV0aHUNClN1YmplY3Q6IFJlOiBGVzogS2VybmVsIHBhbmlj
IGVycm9yIHdoaWxlIGVtdWxhdGluZyBxZW11YXJtIGltYWdlDQoNCkVYVEVSTkFMIEVNQUlMDQoN
Cg0KSGVsbG8sDQoNCkNvdWxkIHlvdSB0cnkgb3V0IHRoZSBpbnN0cnVjdGlvbnMgdW5kZXIgOg0K
DQogICAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9tYXN0ZXIvY2hl
YXRzaGVldC5tZA0KDQphbmQgcGxlYXNlIHVzZSB0aGlzIHFlbXUgdHJlZSA6DQoNCiAgICAgICAg
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcWVtdQ0KDQpNYWlubGluZSBpcyBtaXNzaW5nIGEg
ZmV3IG1vZGVscy4NCg0KVGhhbmtzLA0KDQpDLg0KDQpPbiAxMC8xMy8yMDE2IDA2OjQ2IEFNLCBB
cmp1biBQYWRtYW5hYmhhbiB3cm90ZToNCj4gSGksDQo+DQo+DQo+DQo+IEkgY2xvbmVkIG9wZW5i
bWMgcmVwb3NpdG9yeSBhbmQgYnVpbHQgaW1hZ2UgZm9yIHFlbXUtYXJtLg0KPg0KPg0KPg0KPiBT
aW5jZSBJIG5lZWQgdG8gYnVpbGQgZm9yIGFybXY3LCBJIGNoYW5nZWQgdHVuaW5nIGZpbGVzLg0K
Pg0KPg0KPg0KPiBUaGUgZmlsZSBJIGNoYW5nZWQgYW5kIGNoYW5nZXMgSSBtYWRlIHdhcw0KPg0K
PiAxLiAgICAgICBtZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL3R1bmUtYXJtOTI2ZWpzLmluYw0K
Pg0KPiAtICAgICAgICAgIERFRkFVTFRUVU5FID89IOKAnGFybXY3YeKAnQ0KPg0KPiAtICAgICAg
ICAgIFJlcXVpcmUgY29uZi9tYWNoaW5lL2luY2x1ZGUvYXJtL2FyY2gtYXJtdjdhLmluYw0KPg0K
Pg0KPg0KPiBBZnRlciBtYWtpbmcgdGhlc2UgY2hhbmdlcywgSSBleGVjdXRlZCBiaXRiYWtlIG9i
bWMtcGhvc3Bob3ItaW1hZ2UuDQo+DQo+DQo+DQo+IEkgdHJpZWQgcnVubmluZyBydW5xZW11IHFl
bXVhcm0gYnV0IHRoZSBjb21tYW5kIGlzIHN0dWNrIGF0IFZOQy4gUGxlYXNlIGZpbmQgU2NyZWVu
U2hvdDEucG5nIGF0dGFjaGVkLg0KPg0KPg0KPg0KPiBBcyBhbiBhbHRlcm5hdGl2ZSB3YXkgSSBk
b3dubG9hZGVkIHFlbXUtMi43LjAgc291cmNlIGNvZGUgYW5kIGJ1aWx0IHRoZSBxZW11IGV4ZWN1
dGFibGUuDQo+DQo+DQo+DQo+IFVzaW5nIHRoZSBidWlsdCBleGVjdXRhYmxlLCBxZW11IHN0YXJ0
ZWQgYnV0IEkgYW0gb2JzZXJ2aW5nIGtlcm5lbC1wYW5pYyBlcnJvci4gUGxlYXNlIGZpbmQgU2Ny
ZWVuU2hvdDIucG5nIGF0dGFjaGVkLg0KPg0KPg0KPg0KPiBJcyB0aGVyZSBhbnkgd2F5IHRvIGdl
dCBwYXN0IHRoaXMgaXNzdWU/IEFtIEkgbWlzc2luZyBzb21ldGhpbmcgb3Igd2hldGhlciB0aGUg
c3RlcHMgSSBkaWQgd2FzIHdyb25nIGZvciBidWlsZGluZyBmb3IgYXJtdjc/DQo+DQo+DQo+DQo+
IFJlZ2FyZHMNCj4NCj4gQXJqdW4gUGFkbWFuYWJoYW4NCj4NCj4gU29mdHdhcmUgRGVzaWduIEVu
Z2luZWVyDQo+DQo+IE1pY3Jvc2VtaSBTdG9yYWdlIFNvbHV0aW9ucyBJbmRpYSBQdnQuIEx0ZC4N
Cj4NCj4NCj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gb3BlbmJtYyBtYWlsaW5nIGxpc3QNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+
IGh0dHBzOi8vbGlzdHMub3psYWJzLm9yZy9saXN0aW5mby9vcGVuYm1jDQo+DQoNCg==
