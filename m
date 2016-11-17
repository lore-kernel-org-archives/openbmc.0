Return-Path: <arjun.padmanabhan@microsemi.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0075.outbound.protection.outlook.com [104.47.38.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK88n0TFxzDvrd
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 16:00:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mscc365.onmicrosoft.com
 header.i=@mscc365.onmicrosoft.com header.b="QdiOIWoB"; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscc365.onmicrosoft.com; s=selector1-microsemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=mk/EtZFGrZH2mrlND89qj2tbeX5ANoFV1fhUL6rode8=;
 b=QdiOIWoBkhdIWOFPW20twaZG24rLFPBvUNe0IZZ951cvmlRa97ikgWEdTSUoDep03gJ/N4OgHA/a8s/9PW5sXwxDUfYERPswE361xJLU8QZeyS+fAQZq555zZxSyGx3uz7pZMjQNemLjVlsAjRJaEAY25M17EYXq3VrzQ8OchRQ=
Received: from DM5PR02CA0064.namprd02.prod.outlook.com (10.168.192.26) by
 BN1PR02MB022.namprd02.prod.outlook.com (10.242.210.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.721.10; Thu, 17 Nov 2016 05:00:47 +0000
Received: from BN1BFFO11FD009.protection.gbl (2a01:111:f400:7c10::1:122) by
 DM5PR02CA0064.outlook.office365.com (2603:10b6:3:39::26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.721.10 via Frontend Transport; Thu, 17 Nov 2016 05:00:47 +0000
Authentication-Results: spf=none (sender IP is 208.19.100.20)
 smtp.mailfrom=microsemi.com; jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=microsemi.com;
Received-SPF: None (protection.outlook.com: microsemi.com does not designate
 permitted sender hosts)
Received: from avsrvexchhts2.microsemi.net (208.19.100.20) by
 BN1BFFO11FD009.mail.protection.outlook.com (10.58.144.72) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
 15.1.721.5 via Frontend Transport; Thu, 17 Nov 2016 05:00:46 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
 SizeAsReceived:1141; Count:19
Received: from AVSRVEXCHMBX2.microsemi.net ([fe80::a552:1d60:6960:9da4]) by
 avsrvexchhts2.microsemi.net ([::1]) with mapi id 14.03.0319.002; Wed, 16 Nov
 2016 21:00:37 -0800
From: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
To: Joel Stanley <joel@jms.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
CC: Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Subject: RE: Query on image deployment on ASPEED board
Thread-Topic: Query on image deployment on ASPEED board
Thread-Index: AdJAiqFB93/YZn8STQapL0m87vBlQAARQDmAABAw54A=
Date: Thu, 17 Nov 2016 05:00:37 +0000
Message-ID: <C160D2872FE0DE4683E1910F9BF82941574257FF@avsrvexchmbx2.microsemi.net>
References: <C160D2872FE0DE4683E1910F9BF82941574257CE@avsrvexchmbx2.microsemi.net>
 <CACPK8Xf5OMSNxDN1xnFwSYYbkUSJ9OC_UfD1zFbgu3ZizSJdtg@mail.gmail.com>
In-Reply-To: <CACPK8Xf5OMSNxDN1xnFwSYYbkUSJ9OC_UfD1zFbgu3ZizSJdtg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.34.10]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-IncomingHeaderCount: 19
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:208.19.100.20; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(189002)(199003)(24454002)(13464003)(377454003)(86362001)(107886002)(189998001)(69596002)(5001770100001)(8676002)(97736004)(33656002)(106466001)(49446005)(53416004)(105586002)(3846002)(101416001)(68736007)(2900100001)(81166006)(6116002)(102836003)(9686002)(76176999)(8936002)(2906002)(92566002)(2920100001)(4326007)(305945005)(7736002)(47776003)(55846006)(4001430100002)(7846002)(54356999)(50986999)(71926001)(229853002)(50466002)(104016004)(626004)(2501003)(356003)(81156014)(7696004)(23676002)(5250100002)(87936001)(5660300001)(2950100002)(202454002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR02MB022; H:avsrvexchhts2.microsemi.net;
 FPR:; SPF:None; PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD009;
 1:Tg1Jkf1g6A9/YTTXSAK11DXXM9O4d3tIwpWeXg2zEmUo8Lj4pteFuSRSaHBBQgGAH7i4XRnGzJkQITjj8B/PqT6T6DeAzasRmfbDSzJkksqN3ot5TyP/xrQ/S1YM4a/bf/IsoVdUfMkrNEQRjcR24I/7EiGvGTTSPZrQmptgMIuoYaFvHRmDnKw8+8d705GyzGGBESyUCi3C1tVVQi+leW1OOjZB3a+vc2dnCieyKiOgSbi2AopSCz0Gsqw27Vkb0TOHfv/blv2u51HbGkE7pDsMK+7M8WINU1EXu5cQU0CvrDVXhcWcWj2OnKHjyHvx47mVT63Si+klJLajBOJQtJjQauhNhaJdBbnc5pCMyK/TwQzsfU/nIhlTSgaFhm65m9/b3qdKNPaYvxyv0INZVPXMxNsj6pnSAwuDAvFZPNKa4M9s0R9EqvT14e6MFfFikfRVAX/pOQEk8DrE9k6dC6WrjoHWIN/a2cCn9dmgsOHwLNjXvvWKgb3Q+C+8FEAH/INQxCJEWratUHA+q91szg==
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB022;
 2:7/DneVqS/yHzXWq9PofAowid40tPFGL7dQ60uXoxNKtdKjdziJE95/EFbDhAF8BcuaaLGO+U51fRLLaJtByPiGx0COUsitso6hp0XC8V1C5yyRFfMiqIC5Ezw2yOUYUeOvgKa7a9k3EGaQc692uCLfoMKkdCwofFuNjh4ILg8ns=;
 3:kbJMVLGq4oHUKwV2DZeteemah6vpO2Qarn9/2DeyEVDaoG20oMFvyz3etVcuKDKmMh2TWbonED1OBkISiqn8eFLvQfIvCvvFj/8EwyH7l8ZFgzS9ww1eRtLQYUmquj/jrI6ftSPZ1ZpftK2MceYMqJ9oiwJ+OqyAoM334DzSkwfzOL3vUDxF3qV8jgZNGi/cJNqejva/m/Vz77XzIvQ2pJ9KgGsORHjo0I1EhgYlyvBud+fDtaahJhrrgE8yv9+Knf11gkKoQkGsv7nMvroBHA==
X-MS-Office365-Filtering-Correlation-Id: bd4601a1-a03a-4c79-f3ac-08d40ea6b133
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:BN1PR02MB022;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB022;
 25:VH86eKPxR4X5IYaHPXmHEE6uY8uJNbVJ/lCkprIl9mQ6/dMmMqvTiStbYzFsd4r6WekViIcyRRzEAkXO2tT4YdrG/BPaFXNt8XzkOveBnEdI9Qngw4eiCuwyM58fnZGUsZAaihdZRSf7Z/XWAavZKgoo59Hbti4l85pjFCV7ImfKnVrhm7XW+d1Ymne8uAwIIEwrZlenysppSGjok7720UzTMlIZp3si2xmnLDdXCBrBhgJiulR9AjlHLcQO2r9H+6XAsG7ed1b2pBa6+K6ixArb8CiqQRqsZ1rBW2AuVec24XePVuKe8wg1RXAA9SpSaxIMaLCKt1ROzsT3bud2Rrn0/KHvN3zNlKabGu7+MRDjKCwQ0SmrFDbljXLVhWvbcv33U1tOrjnTjjrNUWsza6LOte1quYKnCEKrJcR4Iul7Uol8lJqoqfMD834aV+12vrlkqKHxc1a0iCwUq1S7c3I8FLcigr0wor+YjVGKJCdLr016fV4t0kGdKQG+kMDMrp4/nVPJmayvI0Ga9Mjmaco5WDULc0tZ0Loj80tloH/Jg8iblqHwj2CHIqMJq4DfB0b1lQ1yG8iDufdwPiIKvxsI7OIeW5CTpj/HgLjlgOSILKE8EWJYmZWU/NYSRbA4NJxVETIzu2QfeNBG0K5T8IATw09idE91BUDL5I+f/dPxuZUM5RRidpFNFaAP3bJHN2dJBhMkVol6jgG7YqCVn9LCOmPxC8lnDBspVIWsNSFuFpgM19uB41taRa/KfSEd6Aqp920TlTtQ+JkAhyGnKmmltpUseSnGFZjOBE4WpxZEYDJRraep0orbOqBW5FHL06Hyh6xvLvRTNlitjH1F0c2XlATqLjxvKQMkt3rQxK9GoW0r9ulebTsF+QzN7jKEp86SU2qjMdwPruGfV7iqNA==
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB022;
 31:YpBBmVwminu1EPnlrjxfG9AlRDjMaRsO0PoEWB1TIUFYr/y5Qe5K0AkqF7UJukmIztlKtKI3cBUACaQTcOhioEi/mZwAxMcC+zdvGlaXo5F7bDsynHKiFFIjM2jkJjjRfAXmQFkMCwuO8O1+UMcnt20qkhD7/ZpzDd84E5j8k5/I28/EbN2J2+QDPYhvSN5cepnDr9bDURcdw/UxA4GJXcAUupTbU/nkCvru/Bsejh0pPJzKHJ6thxYH1deLMXDF9xkhdyyW2FQnNZvd3BjPMcu8SxTeLZuDSJdNHiqaUY0=;
 20:30tBvxT/RFPe6XK5PdrHjmyBBEz8oWHmM/G/uF2puQais/oADKbvmjOz0JtO+Iupit8hsH9oAnZm/C2Ei1hS+9ko7TpIZXhEqRUHsIJI9jIF/o38oci0w4XCCoThaL5VPSDDnMEwi5d3thlfrorIESWJz5c/9TiMEq3xn0B94O0Lsk6tYMx4eT8klP1fL7yj9o9Kz9BfZUWyCsM4PEE96ppNpNMZsPv4C3ybBeiotGZV7DWz2tFscZ/ps7SSu4HG85aiRxU4WxA+NA1DpfNL1N0osmOqZeSqYgQAMy3p2EJ2c5e4IycOcJTnUxGxwgyr1xHElt3yikP9OyDFZXkJsbrDk8zsWyzX1glr8h3YnDD1YZmu6EQmIk2sGsnf18VMVRp+SRrMjKkQRg/L7rJweDE+L/hZpRyTztLhl4dGYIgggo1+G5gUo5DlvcbTF3XxO5jSH/+mQEzEYHqYopaWOkBKmaQhZkjc1NsUmLvuGMsl0pWOe0pV7pIZp9ykw1Hr
X-Microsoft-Antispam-PRVS: <BN1PR02MB022677266B310FF23B4BACEE2B10@BN1PR02MB022.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(65623756079841)(72170198267865); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6060326)(6040281)(601004)(2401047)(13016025)(5005006)(13023025)(8121501046)(13024025)(13018025)(3002001)(10201501046)(6055026)(6041223)(6061324);
 SRVR:BN1PR02MB022; BCL:0; PCL:0; RULEID:; SRVR:BN1PR02MB022; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB022;
 4:7ScAwjN/qib7sHd+obgLWIUToQamkQVLmLqObKA9WJNfxwug5MpoUKv96ttU5qZ6XJHkzkl8KpSpfTF+2OShm1C4jKTtKzEg13oC2ZPYHHrqzXJrbyQoq/vBNgVaWVyxKqPq3xIPDxvhDP5pMLRqI3Y25JqVZJRZIa4NAYRYdyVfKDtDD4ShNF9lg2oz32J8WxripRLuoRNjR0aFGApdmnSe6Y5E4GuIItP+Q8slsnI8ZEUWepofpL3iI2ZJibQHqA0RHhkGC3weN7UyXbCITGq4Sa0qBphtFcZjtwhf7U1FOuxfkk2EAzWvTMQJebj8e8qQroXop8dkZbKAlS8pMsG7ZIsvqljih5Gyuq0Cv70cGRdGwUBxEFrSOnnIBdUOCZ2gPzATW/RujGH0/jefxdl6xSpdCxixIYaCPBlzGZddhEsN/2HJAY41J0IEc6Jr8sDkNjpmjv2bs8EsFwmopf4C/lE3nvy8rb+NzpUewo4bZ+IpzsCwg8x1LXmuWHepxG7cxnGxWBN6F2jGtC3mfH6lC0WlkJO4AU//1GazmFXKj2Pnim1qElgOn7yWkxPiVIZVutCKrGvWuJI+QPK7dtDctjlr7PBR26auMXZ6MYGLpeYe3UnsmsapnlayqBkrmeIiW6g/JaYIiTaPyGq84Domi2LL2ec/y0jmfAqzubw=
X-Forefront-PRVS: 01294F875B
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjFQUjAyTUIwMjI7MjM6Z3NLdnJydWlnZlIwSzdWVG9yTU1tYm8wRVR4?=
 =?utf-8?B?Tlh3NFIrR3kyNE5CMjNVVUI0aDdiOHdPYlF6VDVYbGh2amk2bzFBQWFyQnpP?=
 =?utf-8?B?eTBhZkZraUFNeitPRHJVU0Y3eDlQc2kvUlNEYW1vVjc0Y2JpVCt6UTB1a0xh?=
 =?utf-8?B?VFRUZzRncXR3ZlUvZVhITGY4dFk1SktheFo3ZlVXZmxwZW9tcHZrK0psYTlP?=
 =?utf-8?B?ZUJ0N1FTU2plaXd5QUxpWCtjUmI2ckZWUFp6S1JqTTgzRlJMM3hXenJPQmIy?=
 =?utf-8?B?c1BTT3N2Y3QwTEJBMkxXNlhNbHZJbnU2aU1VTkNIQVMrSUlCcmJZVHYvMFU5?=
 =?utf-8?B?Vkllc0hhRzRKZnUyWURiSlpCc3I0dUxyNThWeTNTbHAvNGk1aVdLNEJXbFVq?=
 =?utf-8?B?ZHBZRkZ6TVpVMlB5NXhEYTZNcVZzbkdXbE1XdElrQmJIZDJyUWNlZmQ1bk45?=
 =?utf-8?B?RzNiMjdFZHpvT3VsUFpkYmpZWVlVV1M4bnFWdzJDMjdkZkh5Y0ZpMXFVaTFs?=
 =?utf-8?B?dEZRQ09Fd04rUzVFaVEyZlBjN0ZwTW55bzdoSTc4TVN1WmFMbVlOdXlrYnpP?=
 =?utf-8?B?QVdWdEFSNjdHVjRxektxRjRRN0lUZjZUYVVKOFFxakt4djEwUnVuVkc3TEM3?=
 =?utf-8?B?cXZzTVJya2xIVlFqTGhYVzk4UlNTZnpXUHZ2L3FNdlVnTFpjSFNWRUx3ZlQ2?=
 =?utf-8?B?M1J1ZVQxbm5rNDdySDZ2TkdYV3IvUHBsSkZDck9icWJ3VVk4Wm5xOG14eGxl?=
 =?utf-8?B?bDEzSWJBdjVBeUlyRUJ1RSs1RnRoKzA2RGxwcFpyYmJBZGlvaWcvOThQUkx4?=
 =?utf-8?B?NHRYd1ZPU0UrRnNORmZLSi9Md0NrSUNuNmo0RnBkUUordEJXZ0E0VEFGUmtE?=
 =?utf-8?B?N29QYm1GQTA4bEJKNlFnMzVuMHpySkZZWDVMeUJhdEI3amQzVWdqVHlPN2h1?=
 =?utf-8?B?S2JFY2kyb2xnNGpoL2RkY3VUREZ1UUpLVkRBY3FvSjB3WU5lT2lRM3NLZE9Y?=
 =?utf-8?B?QUlicWUvb3AwTzVaeFhFVXIveU9BcFlhTlgrL0RZNE5hdkVLS2NsYVlqUzho?=
 =?utf-8?B?YTBlUTdmWDBEakZaS2xkTEppRkNOQWJJaTFDYi9nNWJLZ3ZvMEJldUJvYlor?=
 =?utf-8?B?NTBOTWpEVWNYckczUnZ4SVoxRG0wSDNLQWhnQ3BSY0k0SktpNGszL1IwWE52?=
 =?utf-8?B?NUdyOE5OS2xUWkp6ZjJmQTNoemVkY1Z3S1RtZXRtRlBXV1V4czBSRDdudW1S?=
 =?utf-8?B?T3VsSUFsYjZVY2lsRE9UVCtuRUQ3MkdHc2dhQmtvQ0UvMGdmZ01TREdhVmo1?=
 =?utf-8?B?NHpOVFdaWEd2RWJ3VGNDRWdLRWc2Mm91eXVYR2I1VStJc3pySzhUMkFTYmlI?=
 =?utf-8?B?VDFYWUVkQ2h2bUxsbE0wVW02Sk02L05MbFlWenowRXJmYm1yVThES2tRb2Jq?=
 =?utf-8?B?amx5Ti9PV3NIdkNJNnpOUG5LaFp2UzM5ZFlLOEdQb3VBRVVOYjBPYjFDdzFz?=
 =?utf-8?B?SUYzOWZNZC9tNHRQem50RnZBZGs1VlVLQWRFNEhnZTl1ZHFIVmNOeEpmdVZa?=
 =?utf-8?B?VVoraXdyUXpuZVRheHY2bExsY1RkcUNFR09DY3lwcmRnL2svMG5uNWUrbTRD?=
 =?utf-8?B?N2xRd2VkTUlUYW85em5PUWM2RlZ0dHh2ZUpwUVBJZHh5eFo5b1dPS2VLTith?=
 =?utf-8?B?Z3dhQWtsZnhoeldMemFzVEMwaW4xWDBpUlJSYW9wdkI4MVZRb0VDUnRMYzJV?=
 =?utf-8?B?SytBMTd5QVgvQVc2a0ZBb0dEK3Fyb3dRWEdOVkVlY1YxZmNCYlRqUEMxenA2?=
 =?utf-8?B?eG8wd0w2QmpCd0pGTGFXRVhOSTE4OGg2RUowMkNUVU8wRG1VQjNHQTc5TFNS?=
 =?utf-8?Q?eO2/ZDN7Hg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB022;
 6:pWM4gv7zYh/Axtb7U0icp+2qIqzuRXOWg2nDxB7+xUcxLswloacK9PzGEa46oU4aHBQVceaLGbFHIpSgJxfOnJXF2gtW26fMPpoNJJIz5WzJVSq9Q9PK8Xm5w8RT/tpp4lM707iufSgps+6mM1JX2m+YMj4qTCj0vdkx+tP1XSUZM7+vFg2kSy0iFyjsY4/attajGVPDeIi95M+X6le9XQjEDpR+KfX+IIztmK28h9CHl2Yyn6enjcPqx5CMMUB9PvSUyA9ABSn2vGgfBqGyOmxsrRNlzb9hpPNCrqZ0HZdeU4TlvTO/7KhdHbWOGKNkGJ4tymt++Izp2rt7x1V9jq3Dc+gb9Qvy5iGoBEuULuQF0cYlBzIL4eIn7RugdneK;
 5:S8XCjz4CEuGa54BuDAWDK01ytAdakKxU7rJBKyF4PXLwzFeYrUaQoSarRxzP5oogiVHelDIs9jJU2dFkMkyxT6bcT06JPB3gfDNgoPVqJCjNo9p1pXaZfUI3Z1uxQCSct+x34q9PeyxyXVm2yJIixw==;
 24:7Q+YiunUeEFOTTz1zn+HPLrY013LtP/I35u19D9/3N2y5zNrvtJ3/PwymKHUt8x0JeOzBauK4x2jKG6nFv/XpYU0ljkw7cYQn5EcoRV7eTY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB022;
 7:HVW25YcteqSAMsh0paCDyfLf7UDk7hTUOIbLRk0sFo6tbmmQUCYihgdly4vvyxQzmWWuJ+cCCwko/bqn+/p5nV+XIWiVoXrOB0R0b3PRfLE4SThk3/XrD2DugSRKRY2Q8KDfGPSjgIhRfUhG5ei1//7/FP9QAXwaEMd+dTHnGLVynSP3WvsueU2ZEpINLQEp12EQHYRaFAyfTdYVG9lSB0QH3Sw+eFsYj6Q0MzbbSDW3VJni04nwBbCpviUfEl8M2Lr5oVlcMPfX9lT1HJc3ezz7hDkEXjA3KDap1ycZP13MHhUBZnk3g/ZT3duSQ13LIVOcedQGeHZjRa+a59Lz/zyFUgIcpns7flLUiy8nMF8=
X-OriginatorOrg: microsemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2016 05:00:46.3138 (UTC)
X-MS-Exchange-CrossTenant-Id: f267a5c8-86d8-4cc9-af71-1fd2c67c8fad
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f267a5c8-86d8-4cc9-af71-1fd2c67c8fad; Ip=[208.19.100.20];
 Helo=[avsrvexchhts2.microsemi.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR02MB022
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
X-List-Received-Date: Thu, 17 Nov 2016 05:00:57 -0000

SGkgSm9lbCwNCg0KVGhhbmtzIGZvciByZXBseS4NCg0KPiBJcyB0aGlzIGFuIEFTVDI0MDAgRURL
Pw0KSXRzJyBhbiBBU1QgMjQwMCBldmFsdWF0aW9uIGJvYXJkLg0KDQo+IEkgcmVjb21tZW5kIGJ1
aWxkaW5nIG9uIG1vZGVybiBVYnVudHUgb3IgRmVkb3JhIG1hY2hpbmUuDQpJIGFtIHVzaW5nIENF
TlQgT1MgNi42IHRvIGJ1aWxkIGltYWdlcyBmb3Igb3BlbmJtYy4gSXMgaXQgcmVjb21tZW5kZWQ/
DQoNCj4gT25jZSB5b3UgaGF2ZSBhbiBpbWFnZSBidWlsdCBpbiBvcGVuYm1jL2J1aWxkL3RtcC9k
ZXBsb3kvaW1hZ2VzLCB5b3UgY2FuIG5ldGJvb3QgaXQgd2l0aCB0ZnRwLg0KU2hvdWxkIEkgbmVl
ZCBhIGZsYXNoIHByb2dyYW1tZXIgdG8gZmxhc2ggaW1hZ2Ugb250byBBU1BFRUQgYm9hcmQ/IElm
IEkgd2FudCB0byBib290IHRoZSBpbWFnZSBmcm9tIEFTUEVFRCBib2FyZCwgaG93IHNob3VsZCBJ
IHByb2NlZWQ/IElzIHRoZXJlIGEgR1VJIGF2YWlsYWJsZSBmb3IgdGhlIGltYWdlIG9mIEFTUEVF
RCBib2FyZD8NCg0KUmVnYXJkcw0KQXJqdW4gUGFkbWFuYWJoYW4NClNvZnR3YXJlIERlc2lnbiBF
bmdpbmVlcg0KTWljcm9zZW1pIFN0b3JhZ2UgU29sdXRpb25zIEluZGlhIFB2dC4gTHRkLg0KDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBqb2VsLnN0YW5AZ21haWwuY29tIFtt
YWlsdG86am9lbC5zdGFuQGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mIEpvZWwgU3RhbmxleQ0KU2Vu
dDogVGh1cnNkYXksIE5vdmVtYmVyIDE3LCAyMDE2IDEwOjA5IEFNDQpUbzogQXJqdW4gUGFkbWFu
YWJoYW4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IEJhbGFqaSBNYXJpbXV0aHUNClN1
YmplY3Q6IFJlOiBRdWVyeSBvbiBpbWFnZSBkZXBsb3ltZW50IG9uIEFTUEVFRCBib2FyZA0KDQpF
WFRFUk5BTCBFTUFJTA0KDQoNCkhlbGxvIEFyanVuLA0KDQpPbiBUaHUsIE5vdiAxNywgMjAxNiBh
dCAyOjU2IFBNLCBBcmp1biBQYWRtYW5hYmhhbiA8YXJqdW4ucGFkbWFuYWJoYW5AbWljcm9zZW1p
LmNvbT4gd3JvdGU6DQo+IFdlIHB1cmNoYXNlZCBBU1BFRUQgZGVtbyBib2FyZCgyNDAwKS4NCj4N
Cj4gV2UgbmVlZCB0byBzZXQgdXAgdGhlIG9wZW5ibWMgZW52aXJvbm1lbnQgb24gdGhlIGJvYXJk
Lg0KPg0KPiBJcyB0aGVyZSBhbnkgZG9jdW1lbnQvc3RlcHMgd2hlcmUgSSBjYW4gcmVmZXIgdG8g
Zm9yIGJ1aWxkaW5nIGFuZCANCj4gZGVwbG95aW5nIHRoZSBvcGVuYm1jIGltYWdlIG9uIEFTUEVF
RCBib2FyZCBhbmQgYm9vdCBpdCB1cCB3aXRoIHRoZSBpbWFnZT8NCg0KSXMgdGhpcyBhbiBBU1Qy
NDAwIEVESz8gSSB3ZSBoYXZlIG5vdCB1c2VkIG9uZSBvZiB0aGVzZSBiZWZvcmUuIFlvdSBzaG91
bGQgYmUgYWJsZSB0byBuZXRib290IGEgUGFsbWV0dG8gaW1hZ2UgdGhvdWdoLCBhbmQgZnJvbSB0
aGVyZSBjb250cmlidXRlIHBhdGNoZXMgdG8gZW5hYmxlIHlvdXIgYm9hcmQuDQoNClRvIGJ1aWxk
IGFuIGltYWdlLCB0YWtlIGEgbG9vayBhdCB0aGUgY2hlZXRzaGVldDoNCg0KaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9jaGVhdHNoZWV0Lm1kI2J1aWxkaW5nLWZv
ci1wYWxtZXR0bw0KDQpJIHJlY29tbWVuZCBidWlsZGluZyBvbiBtb2Rlcm4gVWJ1bnR1IG9yIEZl
ZG9yYSBtYWNoaW5lLg0KDQpPbmNlIHlvdSBoYXZlIGFuIGltYWdlIGJ1aWx0IGluIG9wZW5ibWMv
YnVpbGQvdG1wL2RlcGxveS9pbWFnZXMsIHlvdSBjYW4gbmV0Ym9vdCBpdCB3aXRoIHRmdHAuIElm
IHlvdSBuZWVkIGhlbHAgd2l0aCB0aGF0IHRoZW4gd2UgY2FuIGhlbHAgeW91IG91dC4gSSByZWNv
bW1lbmQgam9pbmluZyAjb3BlbmJtYyBvbiBpcmMuZnJlZW5vZGUubmV0Lg0KDQpDaGVlcnMsDQoN
CkpvZWwNCg==
