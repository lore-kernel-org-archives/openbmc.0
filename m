Return-Path: <arjun.padmanabhan@microsemi.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0085.outbound.protection.outlook.com [104.47.41.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjx5P0ZDDzDrVM
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 19:54:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mscc365.onmicrosoft.com
 header.i=@mscc365.onmicrosoft.com header.b=GzULkEWx; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscc365.onmicrosoft.com; s=selector1-microsemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=P2w7j0IXIDk20KyYsWe5nN7KTdHKp8sk5ZiBMTtcDwQ=;
 b=GzULkEWxHCU4lkJRsc6hIjnZY4XsDn3tYzVLhfSmZUnHW509MZA+5gH4MPRZqEVBIdEtfvsgBi03ceWAAu0WT7K6bG2NOjRr2XJe9szfssl2i7NBpb+qVJPF+vG2XDd42UTEuTZlQFK+ltAUvKHYBrICPtaB2XOkR7fuAz5PSRM=
Received: from BLUPR0201CA0034.namprd02.prod.outlook.com (10.163.116.44) by
 CY4PR02MB2440.namprd02.prod.outlook.com (10.173.38.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.629.8; Tue, 27 Sep 2016 09:54:44 +0000
Received: from BY2FFO11OLC011.protection.gbl (2a01:111:f400:7c0c::195) by
 BLUPR0201CA0034.outlook.office365.com (2a01:111:e400:52e7::44) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.639.5 via Frontend
 Transport; Tue, 27 Sep 2016 09:54:42 +0000
Authentication-Results: spf=none (sender IP is 208.19.100.21)
 smtp.mailfrom=microsemi.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=microsemi.com;
Received-SPF: None (protection.outlook.com: microsemi.com does not designate
 permitted sender hosts)
Received: from avsrvexchhts1.microsemi.net (208.19.100.21) by
 BY2FFO11OLC011.mail.protection.outlook.com (10.1.15.22) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
 15.1.629.5 via Frontend Transport; Tue, 27 Sep 2016 09:54:41 +0000
Received: from AVSRVEXCHMBX2.microsemi.net ([fe80::a552:1d60:6960:9da4]) by
 avsrvexchhts1.microsemi.net ([::1]) with mapi id 14.03.0301.000; Tue, 27 Sep
 2016 02:54:39 -0700
From: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
To: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Patrick Williams
 <patrick@stwcx.xyz>
Subject: RE: runqemu qemux86-64 image kvm cpuid error
Thread-Topic: runqemu qemux86-64 image kvm cpuid error
Thread-Index: AdIX2oTk20V847KJTyqHSgiqEm5/nAAylqWw
Date: Tue, 27 Sep 2016 09:54:38 +0000
Message-ID: <C160D2872FE0DE4683E1910F9BF829413D2A623E@avsrvexchmbx2.microsemi.net>
References: <C160D2872FE0DE4683E1910F9BF829413D2A6086@avsrvexchmbx2.microsemi.net>
In-Reply-To: <C160D2872FE0DE4683E1910F9BF829413D2A6086@avsrvexchmbx2.microsemi.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.34.10]
Content-Type: multipart/alternative;
 boundary="_000_C160D2872FE0DE4683E1910F9BF829413D2A623Eavsrvexchmbx2mi_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:208.19.100.21; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(189002)(377454003)(199003)(107886002)(19625215002)(81166006)(2501003)(104016004)(84326002)(7696004)(97736004)(2910100002)(19300405004)(5890100001)(105586002)(87936001)(15975445007)(76176999)(54356999)(586003)(50986999)(5250100002)(102836003)(6116002)(790700001)(106466001)(2950100002)(19580395003)(2920100001)(2940100001)(69596002)(2900100001)(3846002)(19580405001)(5660300001)(5001770100001)(8936002)(2906002)(260700001)(92566002)(8676002)(16236675004)(189998001)(9686002)(626004)(81156014)(86362001)(101416001)(55846006)(512954002)(7846002)(33656002)(356003)(53416004)(7736002)(68736007)(9326002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB2440; H:avsrvexchhts1.microsemi.net;
 FPR:; SPF:None; PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC011;
 1:p7KciXC5auVZRKI8Dj6nwmzc7MjFOvp2/kwqa4W484+5krK2qDy9whnukyuJa7XFuS73Yiwjwr717QPQe24qE0a2rbWJNpKXQNu1R3vJtJnN0Y3Xy6GGtc/I6nznG+q4B7HYEnJ8p2/y8e1b8gaZL1lPq/+sKnYtXRbyH1xQmo2EOZ5v2YJpfJsS5c0+8Hsyah8K7OADemgSF1sySKaEjTxB1+gqjBD7Mt2nc4o6nf327epHb5ioG9HTcia+iu0LDX55J9nUg8d7b4dHaD9twfBUTfmYA1qpv4jQQlWv69oc6hSHuoFaqplGf4NaKyELNU2izGkBFGoqPFnvGUgFIRTyLdYBCByj37V0wsvJUrbEJYg6I+XYw/OQiM9wYCOXDmVmBTuVOmVdks+0ULhrHarHoRtPFuqUgEFgCWC2ZwMnBHR9lzTKCa+nsNrqvM5NTVfc6bMWEuoep315ZqGPC9qwmXupholLt0DWIDkZ6BLdEHijZlRPIrdPimIrtTB7wHTFGARPWJ5UtaAMdLVb/E9L1cg1a6j9AJx70qcLy+47A7GY0anXxbK32Lnntifx
X-MS-Office365-Filtering-Correlation-Id: 4043214d-6d63-4b26-7967-08d3e6bc4dc3
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2440;
 2:Sazrs58VCpMhrsWjohBgbkiwN0vWezqJHmp7P9QOKDnFfoWv96ngZtGWsgSDhMMJ4R98IPNgozUIiJRERWRqltIlvsTAdiqjWbimmG4PimpUyoVQoDfXbOjGABDNybd2upO4WqWvcHmSgBZLvIzNyahb5DISN/Qs2GlfXg1SCfGJVklmmLRsEp6Pfy8yO2RT;
 3:HQmswdZk566JTXJUOoLzn7x2zn5bV9ywt7gn9f0UFlnW2ZVV9u4/SuNVkWrXTk2KOWPpDNJeVZub3vSQWt8yQyjNL5elRiVnJrnJbrEWrCZF/Smh3doXT+XDZNlJlHFBqv11Cc0liohSRBpUxpQ4MdXGSCCKKZrsaxxYMTgHQzW5o7X5wRewnxHYowyoPezvzkzU8RDZpXHGlmM0zHVALTOG670iRhMvoD56naAo1cs=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY4PR02MB2440;
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2440;
 25:D99ckHo0FEwku4ATmeDqYIi52iUN0g7EfFDCaQhvBUYGxSEys6hMc8y2SdJ0BqAWUSFyMpsrHHNHALuB1CVV6/4yZl0RUpeqZhrvZ6TBY9jGvfaqaL4smm/RoBYaZI+KXzet0VZJL1p3jl78DPNn8KfWgMI18ubnxwbKJbppip6/050RDYlgbPX6w8IZw5xkcLT99AeP/yrkel1Woy9ep+RLC8HaFbhF6kkbRdwVht1RDc4MYEZOxkYSWWEvvy15Jw71razjvU2FEAkHbMHKtI+2FqJQNXpayyP41L/2h/hrZgG2Fo04WgYlCnX6oaFQu2dNte6RI6/bcZmFEXaZ4CpcQeXPH4lWrln5mntOovdZ9vgdB3UFDBrmbsgMmmTgeR2hRmyxavGKT/OCZ1PqOKN2afNbcmqyIa6kSV+Kz/Luk4mSWvC4Orc4X5gViBanCHbR4C5hFb5rKMQvfIp9hBTtGOJjV0ai4xjbJFczAI1o2URd+ngwelnZEaniQPpGPACYkEk6qhiTl24aDQq8r58ZFQAcKdbYIRr7r7TO9nTMqQyq+lgP+Zdshi16yS2mfi/T2GZAOX1FOSYHhrhQ6fxZjA9gd3WyfCTcdfd6llM0gdo/w89b6kqAkqgpzRhYmrbPfaXB96c1kKudu9AQy76b+4VypPjY8zWDOhuVTyuDW1Yir/MX7N5jO5XW0oXoYeYEMsqcwfyk+0tFKow5vN4kTrjtG8gijAHXWXhbtXNjuYpioFz5Pd7iHMK789adZIM9avLP4ule3H3XD98n+CR0ce0yH1rwMmRLwb2KIUP2RMfLRqXKYWfEEmnNpezE4phKL/Y4XEFFrzD6fdHRafD6TA6xe4eF6VorKgq7ww+1oF6VMmmWV0G0ihBwPGcYpM4JJZAc30C24noSB8x3zg==
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2440;
 31:9jU5yev2qU0ZDP5NoG/HHm64pa8QkBo8FPpP2KhpyV80XKxx2jfGzGVyM9hs6aTgPH8caGv+D+RCGjorXsnXVi9DQM8fEaOsttFuAXL7enpOfLfGOAUzXyJs5c5tDNWVHw3fqAy8qkjPtSDZjVAqRDk31rCEAzI/Td4o1oxmiiyk+JEP31HwLU3tVOG71mtLoBMXf2FQ/orlwHn5odMCgaXV3MaAahRt1a8L/mB01WQ=;
 20:v5pP+obsS98KICjswlY6S0cIOqOhMuRigBK4Gx7wGd3O+PhDV1X//OBsTH7OKzR+uFuOTYa2iOre4Ptk/k+i4ejmaaOByr/16sgTyCpYOCU+f6yx+cqjtMWFB/Rqd9cIANIg1AxNjy+nOpWhW8OiHxrt6vUUQEiP2nA4QbqvHUzB+zFOmtFPGKSMtJJ3AtNp2AWrh+JuS4UBBjNGrSxIIDt2ZsYtAZ0vy8KtA5bkUoUO+Mb83hmD3nQEgbtoC9iu59X0JKAD3NSHQs8+I2yreDMJXYRbsoUFZsU5I8CaEQ1q2U8WZ9A8u4MJM7PISufoOvaPAsaBNFxYM05lEzlCTknoVrHg4UB5C/ulY3JhFpsweM4Wh/ViK7nZ0K2OkRZD22w2GyAXOVvBn5yZt8ojhfhx0mZeuS6ceiTKxO4768ro46KoCa9tUKM2qlfZd4q0t9qCKNB90gLFS3OScdbHn5UNdMgsCVYp/Z+T6EZN2eappx+pzuQbR8hUJjRU2+cs
X-Microsoft-Antispam-PRVS: <CY4PR02MB24407C2C23936F0E04A6026CE2CC0@CY4PR02MB2440.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(65623756079841)(21748063052155); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040176)(601004)(2401047)(8121501046)(13024025)(13023025)(13017025)(13018025)(13015025)(5005006)(10201501046)(3002001)(6055026);
 SRVR:CY4PR02MB2440; BCL:0; PCL:0; RULEID:; SRVR:CY4PR02MB2440; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2440;
 4:JDpNw6XaokA5O17pdFrP97EsBFGBOL3HYF5qFa3EYJYt4p+xlisEJxCZHUStNqpi8uU2dNLbG97NB5t1l2pqpV7HtaQsKBfoAMmKH3Oc7TikCs9Jft7tgBQyW76dqwW1r12lW89K1qfP3Vz6tXLckhW2ihIO/MIx2uS93WOqf6qtPg1W7j92zuz84OBbJvCRRWEamQSN5GvVIjOBAWJJJUh4gMZK73fGNuiL4mzTBfg0uBuhfpKHCwTJ4Y0TVzY18w2N6t4beHqbH9+aWi5M8phMBiuyJDv3251r9bwCWFiV/yj1iwPejn28h3j8ABEPuHXJ3GO/JkM5bsohs/gGLeTTWXLPYO0P39y8+WSOrVM2KoQ3DquDkSr1Fc6AcjEq2Ry8qw9CJg2NUsJlUsk5YCan7EtkwKXQ9ml+oA/jMxFzt+uXnxVrr+xvcg/0FkvQ5cMAcgcyZd0nsLbpA/CSW41h8P1KGti4NY/6FDj4lPzRpdDVN9aPCEZD5Igu0Uqt0sSiFHdIfmZMAexyBY7JpdZDokBAmHqgwaXMnrZDioY9gJLdCfIfSxVHGbNLkRCWZyfF3GJirS1lIR8G4kqAIS17aLutdjE9H6fgGJJ/FH0=
X-Forefront-PRVS: 007814487B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB2440;
 23:It9lfxHzgsDiAz79AsEX2/Km9COHQRNkhX9ygDTCJ?=
 =?us-ascii?Q?9Boyyohk0ZqGLO4vY6gXfFFuVN8eDjiDbWT6b7/rSkKm2QRwkb50jpdvQarE?=
 =?us-ascii?Q?BFdWSAIfeYLIhcKo1irWLNyz7yQvM7IiEMvNUa6zL8oRYyp8F+CZyCvpZxHr?=
 =?us-ascii?Q?W+eFjZrYA9K4KyAPurnoMStpHMvhO1BL8Nh53kDbXAUKnqQzk6FjYAm36zyO?=
 =?us-ascii?Q?1lEf0b89By91wO1lvynOTkx4tX/3O/19q5vPFx11wDR8QwMx9YLjRvoWW+7H?=
 =?us-ascii?Q?31xCqqTnOxMPNMIF3CGE1bin94UIflvY2y2sp/Nlz7MoSHdZEuYTCNBgsNiY?=
 =?us-ascii?Q?oFenZ3X/01jR4I0p1Djut2R9CZzd2jbosAOqF9hUtZ3RlkG2RjqhNO56gLbr?=
 =?us-ascii?Q?tIOwKSnK3gZP7h8OorSzQ2e+kpFEb9ZZgwKm3Eh/R1o98DWLQOtmjm9RKcW9?=
 =?us-ascii?Q?J9vF4X0yt5Afj42Ss11D23bR6SiASXvwyCUoHtCQluxgFSSsLrp6CqIaseuN?=
 =?us-ascii?Q?dsUfh+Bee63hhuJgQJs/dXPPPZGg2Aq1ytKGseye0rCIuHq0dbC0rOrxJW49?=
 =?us-ascii?Q?PVsHxaHnHFhBYkOz0kWQ5FbN5kNr+6jGUNeFtISN7t5RQ1gZUtK8UI2IzXDm?=
 =?us-ascii?Q?WwbBRdM1j1R45drJL3wGPW+1EUbDCgybvnasPnJPQ6h2Krg3yW3ZGH0bgNOF?=
 =?us-ascii?Q?T3D/mpAXvWinNXlpl6WXyn2A4srwghIQB5+qVz/otV6bwrU+fJDNON+we15a?=
 =?us-ascii?Q?cuiVb3/nZYrJGCXAtUmynyv5DHXeFv8ejFE0SdykwPxjj14mXbETnvW5N0M5?=
 =?us-ascii?Q?e22UP6C7ChMz/zdK1PWhH43uB7X2IO3XOtAR3fk6qmpWGUGabgX4m0p2ZwGw?=
 =?us-ascii?Q?Gmqs04mjBeclYcRLL/CYnlSw3ZMdHxTJ/wk/gAqFV/ajDgDAjgF93O1h6Xs9?=
 =?us-ascii?Q?aKbkGwIZ0iyziXTLm0+xdJjO+VvS9w7fpmUteh8ihIbEOLbmiHSwBbperq7c?=
 =?us-ascii?Q?4eIKNICbmiAs4wAP6YEpuLK3nZ7bwuNS1vGkugB2UbyJUgRUdNC8phqQqf9M?=
 =?us-ascii?Q?uUgQRe9XGvRsIwShb2mQ4QDr3J8bwjYY63ZNbKrpB0UO8CrxdCBB1avqSg/s?=
 =?us-ascii?Q?qi6H7VIeGMZiJeSoJTQDsI1/aFLfh/eV/9qj7VODYIKsWNrnuyOn2ABLB88D?=
 =?us-ascii?Q?0kav9UmLt6Ruyu0cgVxgp60r8Bu2ukQUeBsAQTZA8ITb5R+BvQZasgCXCD+X?=
 =?us-ascii?Q?5XzSz4+VFYbNPtNHusj7Y6kM8cAvJe0rJn0eq/f4jzpBCjn3kmFsYbpcZJij?=
 =?us-ascii?Q?hFRqSfeT5FS/7uf3NzAS/P61R4tzU5g+eLmPfxfQf6IxD0dE4tSvHPAgQ8B+?=
 =?us-ascii?Q?FIjOekEucogfyr419MdBdx9amU7pC6q1sOc0Zp4dBunzzwvqC2NSRdCXcJVy?=
 =?us-ascii?Q?5n2pL+x4FJjvvzor6IxOHzyBuv0P0PChEAUXBBlJckL+hNB7V9X?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB2440;
 6:k8pg5tfBmw8EydP+P+4Z7cOAMrH3rgCvlLtvh842E6vPlCyG2WP/4n3nxZsLXEjLk9O3AkVko9ejmGwp+IIoXe6dAFHKF4GsrUOgE+Pr1GDL1MKjDvUsyQsZ+GY+TrBa4dB73nEVWz8KEUAPtSHg1rtPrJs9xrLSC8/ZLc+a4pF/LM9oPW68K4Jp2hVKTh1dY0sxH1ZfAffOjsBeW4tmNUfFtqexDGUzsO/8SutuXAuheIfRTVTCK11j+NYWdCxV+O5Vdx2NZmDf+40iqw70XDMPbwK7yhY72FJDyr9TlHh9ztBjlqXEpdk2HWnKJAkvIWImUr4n4Wi/yQT4xeXVgw==;
 5:nv3YDpNc3uUMJyyPt8OO4QuPsHuXwV4e1Dcrgv3hP3hQ6RD2yIO3frZyKMvgFVayu5xu5CXZnXDbhtC+og7t1jBka0Fuhyxz5wAqixPrHgw322I8Cu2gDeslaonA93r9/oMopdIZA5RF3MALcUDy6g==;
 24:abGnXsaLq2YOXhqk1AVwAEBPMANq2+7FYOp983x4YXD8nOKOciu5OZwGhAZeV0YFyh6mfosY0nFhMeb9N0WpKNjBRgjJhh4oBN91DJRrAD8=;
 7:LD0QPZTdmiAwQNwmH9HVHuoMvTvhorUjw8eFQJtqk+Wu9wpFh6/S+NaWrucZwYorCFdcjGQhJnaA8IEfDv1U0cne9J+0vDn55GIKygi7rHVU7R9LUahNLK/4opcs4Rrwo9WzulVyrMWz5hJw2dep4FXs6EHW/pH/37CnJpb/DN7l0JSETKvfpwGjM+W+Ehnw3qkvbCTytwcYAJP02LsYN19Ft1+lYOHJNhRPa29TStAJFgoN80dw+kdIxY2VY8HTh6BR5E4DNKO5D+QS1kL5WgMSJPCv1QfAHNKiYcClnPOLD/G/G7YBlR2n58QXpyPO
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2016 09:54:41.9616 (UTC)
X-MS-Exchange-CrossTenant-Id: f267a5c8-86d8-4cc9-af71-1fd2c67c8fad
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f267a5c8-86d8-4cc9-af71-1fd2c67c8fad; Ip=[208.19.100.21];
 Helo=[avsrvexchhts1.microsemi.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2440
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
X-List-Received-Date: Tue, 27 Sep 2016 09:54:50 -0000

--_000_C160D2872FE0DE4683E1910F9BF829413D2A623Eavsrvexchmbx2mi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Update: I could get past the issue by setting -cpu host,enforce in qemu com=
mand.

Runqemu was setting cpu as core2duo.

Regards
Arjun Padmanabhan
Software Design Engineer
Microsemi Storage Solutions India Pvt. Ltd.

From: openbmc [mailto:openbmc-bounces+arjun.padmanabhan=3Dmicrosemi.com@lis=
ts.ozlabs.org] On Behalf Of Arjun Padmanabhan
Sent: Monday, September 26, 2016 3:22 PM
To: openbmc@lists.ozlabs.org; Patrick Williams
Cc: Balaji Marimuthu
Subject: runqemu qemux86-64 image kvm cpuid error

Hi,

While executing runqemu on qemux86-64 image with kvm option, I am getting C=
PUID kvm_asyncpf error.  Have anyone faced this issue? Is there any fix for=
 this issue?

I am attaching my cpuinfo along with this mail.

Following is the console output.
[root@openbmc qemux86-64]# runqemu qemux86-64 kvm

Continuing with the following parameters:
KERNEL:
[/root/Desktop/openbmc/openbmc/qemu_build/tmp/deploy/images/qemux86-64/bzIm=
age-qemux86-64.bin]
ROOTFS:
[/root/Desktop/openbmc/openbmc/qemu_build/tmp/deploy/images/qemux86-64/obmc=
-phosphor-image-qemux86-64-20160923061208.rootfs.ext4]
FSTYPE: [ext4]
Setting up tap interface under sudo
Acquiring lockfile for tap0...
Running qemu-system-x86_64...
/root/Desktop/openbmc/openbmc/qemu_build/tmp/sysroots/x86_64-linux/usr/bin/=
qemu-system-x86_64
-kernel
/root/Desktop/openbmc/openbmc/qemu_build/tmp/deploy/images/qemux86-64/bzIma=
ge-qemux86-64.bin
-net nic,model=3Dvirtio -net tap,vlan=3D0,ifname=3Dtap0,script=3Dno,downscr=
ipt=3Dno -cpu
kvm64 -drive
file=3D/root/Desktop/openbmc/openbmc/qemu_build/tmp/deploy/images/qemux86-6=
4/obmc-phosphor-image-qemux86-64-20160923061208.rootfs.ext4,if=3Dvirtio,for=
mat=3Draw
-show-cursor -usb -usbdevice tablet -vga vmware -no-reboot -enable-kvm -m 2=
56
-serial mon:vc -serial null -append "vga=3D0 uvesafb.mode_option=3D640x480-=
32
root=3D/dev/vda rw mem=3D256M ip=3D192.168.7.2::192.168.7.1:255.255.255.0
oprofile.timer=3D1 rootfstype=3Dext4 "
warning: host doesn't support requested feature:
CPUID.40000001H:EAX.kvm_asyncpf [bit 4]
VNC server running on '::1:5901'

Regards
Arjun Padmanabhan
Microsemi Storage Solutions India Pvt. Ltd.

--_000_C160D2872FE0DE4683E1910F9BF829413D2A623Eavsrvexchmbx2mi_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Lucida Console";
	panose-1:2 11 6 9 4 5 4 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Update: I could get pa=
st the issue by setting &#8211;cpu host,enforce in qemu command.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Runqemu was setting cp=
u as core2duo.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Regards<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"color:#=
1F497D">Arjun Padmanabhan<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"color:#=
1F497D">Software Design Engineer<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Microsemi Storage Solu=
tions India Pvt. Ltd.</span><span style=3D"color:#1F497D"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openbmc [mailto:openbmc-bounces&#43;arj=
un.padmanabhan=3Dmicrosemi.com@lists.ozlabs.org]
<b>On Behalf Of </b>Arjun Padmanabhan<br>
<b>Sent:</b> Monday, September 26, 2016 3:22 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org; Patrick Williams<br>
<b>Cc:</b> Balaji Marimuthu<br>
<b>Subject:</b> runqemu qemux86-64 image kvm cpuid error<o:p></o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">While executing runqemu on qemux86-64 image with kvm=
 option, I am getting CPUID kvm_asyncpf error. &nbsp;Have anyone faced this=
 issue? Is there any fix for this issue?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am attaching my cpuinfo along with this mail.<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Following is the console output.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">[root@openbmc qemux86-64]=
# runqemu qemux86-64 kvm<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">Continuing with the follo=
wing parameters:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">KERNEL:<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">[/root/Desktop/openbmc/op=
enbmc/qemu_build/tmp/deploy/images/qemux86-64/bzImage-qemux86-64.bin]<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">ROOTFS:<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">[/root/Desktop/openbmc/op=
enbmc/qemu_build/tmp/deploy/images/qemux86-64/obmc-phosphor-image-qemux86-6=
4-20160923061208.rootfs.ext4]<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">FSTYPE: [ext4]<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">Setting up tap interface =
under sudo<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">Acquiring lockfile for ta=
p0...<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">Running qemu-system-x86_6=
4...<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">/root/Desktop/openbmc/ope=
nbmc/qemu_build/tmp/sysroots/x86_64-linux/usr/bin/qemu-system-x86_64<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">-kernel<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">/root/Desktop/openbmc/ope=
nbmc/qemu_build/tmp/deploy/images/qemux86-64/bzImage-qemux86-64.bin<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">-net nic,model=3Dvirtio -=
net tap,vlan=3D0,ifname=3Dtap0,script=3Dno,downscript=3Dno -cpu<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">kvm64 -drive<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">file=3D/root/Desktop/open=
bmc/openbmc/qemu_build/tmp/deploy/images/qemux86-64/obmc-phosphor-image-qem=
ux86-64-20160923061208.rootfs.ext4,if=3Dvirtio,format=3Draw<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">-show-cursor -usb -usbdev=
ice tablet -vga vmware -no-reboot -enable-kvm -m 256<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">-serial mon:vc -serial nu=
ll -append &quot;vga=3D0 uvesafb.mode_option=3D640x480-32<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">root=3D/dev/vda rw mem=3D=
256M ip=3D192.168.7.2::192.168.7.1:255.255.255.0<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">oprofile.timer=3D1 rootfs=
type=3Dext4 &quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">warning: host doesn't sup=
port requested feature:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;;color:red">CPUID.40000001H=
:EAX.kvm_asyncpf [bit 4]<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Lucida Console&quot;">VNC server running on '::=
1:5901'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Arjun Padmanabhan<o:p></o:p></p>
<p class=3D"MsoNormal">Microsemi Storage Solutions India Pvt. Ltd.<o:p></o:=
p></p>
</div>
</div>
</body>
</html>

--_000_C160D2872FE0DE4683E1910F9BF829413D2A623Eavsrvexchmbx2mi_--
