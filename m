Return-Path: <arjun.padmanabhan@microsemi.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on0069.outbound.protection.outlook.com [104.47.37.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svk0R1zTSzDsyP
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 19:09:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mscc365.onmicrosoft.com
 header.i=@mscc365.onmicrosoft.com header.b=YmIOLwK8; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscc365.onmicrosoft.com; s=selector1-microsemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7BdxDaQ0oNcFgCwleYoIY8ApJ5S6QPzN0YRWK/j4Phw=;
 b=YmIOLwK8+v5BLl7JPeRT3si4RM8JjgjUdbkRVBfVNiQ/BWioYr5vCbaqLqGHWtr9CesFhcEztWqtH+zT4tjlHFiJoLJMrCP/GEmooKRSMW4Ux9m00LeCRLS5QI7KYp1hY3sp/A54wcfFEJUeuM+mvQHoNpHrnZcQ1Bg9HIpfiI0=
Received: from BN6PR02CA0044.namprd02.prod.outlook.com (10.173.146.158) by
 BLUPR02MB1217.namprd02.prod.outlook.com (10.163.80.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.659.11; Thu, 13 Oct 2016 08:09:21 +0000
Received: from BN1AFFO11FD011.protection.gbl (2a01:111:f400:7c10::171) by
 BN6PR02CA0044.outlook.office365.com (2603:10b6:404:5f::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.639.5 via Frontend
 Transport; Thu, 13 Oct 2016 08:09:22 +0000
Authentication-Results: spf=none (sender IP is 208.19.100.20)
 smtp.mailfrom=microsemi.com; kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=microsemi.com;
Received-SPF: None (protection.outlook.com: microsemi.com does not designate
 permitted sender hosts)
Received: from avsrvexchhts2.microsemi.net (208.19.100.20) by
 BN1AFFO11FD011.mail.protection.outlook.com (10.58.52.71) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
 15.1.629.5 via Frontend Transport; Thu, 13 Oct 2016 08:09:21 +0000
Received: from AVSRVEXCHMBX2.microsemi.net ([fe80::a552:1d60:6960:9da4]) by
 avsrvexchhts2.microsemi.net ([::1]) with mapi id 14.03.0301.000; Thu, 13 Oct
 2016 01:08:44 -0700
From: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Subject: RE: FW: Kernel panic error while emulating qemuarm image
Thread-Topic: FW: Kernel panic error while emulating qemuarm image
Thread-Index: AdIkdlVJFxw7r6L7Ski1YvuM8vpw4wAllPDAABP4/QAADjqwMP//lQIAgABuycA=
Date: Thu, 13 Oct 2016 08:08:43 +0000
Message-ID: <C160D2872FE0DE4683E1910F9BF829414846E354@avsrvexchmbx2.microsemi.net>
References: <C160D2872FE0DE4683E1910F9BF829414846E2E3@avsrvexchmbx2.microsemi.net>
 <8edc2e64-9ead-43ca-f4ae-d2c262721644@kaod.org>
 <C160D2872FE0DE4683E1910F9BF829414846E33E@avsrvexchmbx2.microsemi.net>
 <c00687ba-1f32-14e9-57f0-52df17aaa6a0@kaod.org>
In-Reply-To: <c00687ba-1f32-14e9-57f0-52df17aaa6a0@kaod.org>
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
X-Forefront-Antispam-Report: CIP:208.19.100.20; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(13464003)(189002)(377454003)(51914003)(199003)(24454002)(93886004)(2950100002)(69596002)(104016004)(8936002)(2501003)(86362001)(23676002)(55846006)(54356999)(47776003)(33656002)(105586002)(102836003)(81166006)(50986999)(8676002)(7736002)(101416001)(9686002)(3846002)(2906002)(305945005)(189998001)(4326007)(5890100001)(81156014)(6116002)(7846002)(586003)(356003)(7696004)(5250100002)(106466001)(87936001)(5660300001)(92566002)(5001770100001)(2920100001)(76176999)(53416004)(97736004)(4001430100002)(2900100001)(68736007)(19580405001)(19580395003)(71926001)(49446005)(626004)(107886002)(15975445007)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB1217; H:avsrvexchhts2.microsemi.net;
 FPR:; SPF:None; PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD011;
 1:1Ltinb+Boj64YBoRDzCAgwlwGaXOU/6+9EEBxGQM24LD9qb8G6JygAuoQaOU6Ys1xwWMAlFtRdrAlI/BDt7R2K6ZYHA/DWpd/+KZ0MvbCP/2aEeUG0XGoABNfWrRI4GLLH/GcQ8YcdQOKrB90ldRVZhU0XBPNgtpvmK5pi3tnhZvDG1ChrXUZGJ37W9VqnGc3sPvziXcar2kjECOqZfJSMoaLSaiaWu7FygmjYqfDxTNYjWytuJaMJ2EfpLy1Zl/zrUNotTIsxM1DzMOJ/FCV+awulkE9oz5qulkOvFOT0SNPtTlIJhYPAnCFZJvD4uEn0xvmnDyivetAiD5B5X6CLqK3INjfnZ19lT5YMMpS2ZJBjaa9N7R5SNaUWRexGreyWvGS2lEL/s0xNG7sTByv80Y8bj4N49jR8DrA6P1cimssIQyv+VmKUvLeywkmD4umlBQmO9UtUUG8eVnPwvhEknqxnepoTpYFluRe9ghLWn6SIwLCuhpcK/BRQynMmSGGsbXClxri5dldjeZk1N/OA==
X-MS-Office365-Filtering-Correlation-Id: 773a224e-cf2c-4667-3e96-08d3f3403d27
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1217;
 2:/IJu7QaTtVLii9tltnMuIR2MQKnC9BKsreE6Y1vUu58dn8YdZ5Ik02MqnXOETJzJ1Vp56Rffg0flo6zG9apE/pVE3MvzbCh82YAymBYLPBBNIHVQZNnSXLEDBlFXa3HC3KHmypqOwfRZHdQWdIausLYpbqLbvXJgB1kcLX4W2nYrBsWqIWKqXjBDOabn6iNLARyjTVLVPi5/n4w6etddVA==;
 3:YqCTAY2SnBWPqvLbDqu1rIZdzwXtgDycfgO3OzjKI4CskBp/GsYj/eFV4utwlsCZ11Xs0CfzyyxIS8VSqSGYp26QGR/alyQkTxm8uetighat8gyfnnxQ6uXJRftDVRxcM4Er4P6FYV0TsM1ZJ27nyIzRGVDxgXJB62fweNWwwukjWHJNmJnJN98gsd4OZ49QXp7APwtL/IPFUp3z7wt+WHLOv0s+dpYedIN0n1h2IVME2DsrxrK6UA7UN3onSAnc;
 25:Wog0aymVd5REoKSKHfX6DJQqKdgtkAvzi/sdqv2AniGW1Q05DL8trhxQS85sMGeHGVPvzfklnxDoXFWfjILX3PnOTP+scH/cI4lEkOO+eqyOZf/JFZcXo0djv6z/DYF0OYkYA8cHjRmLsRdw7R51wwdOQ1MMaKkK4KnQsEP1x4lKMYT6lcgMKgL5IdyC72r23b8V1pTDUbCtOjTl2yAqINKn1lmiKslBfyndtjV5ClvrWLhn3mcxXAzPpgwex6wPLrGauAduwlfvSrmger5iQPAE+LZrd1TmMtdXvpqe1y2AucvWNOt70+h0GbHpaXUgxLOrC4GHZB7P34kr9/DmOMfSMWUZFrv+yGC4e+AyJQpaOxMvDALzfAJ9EhoioQCw9M10fbm0CvOCqGy/SDIH+EXexe005MP63kbszgAVWEwT4uwTsnHz+cosKQhMD4xs
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR02MB1217;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1217;
 31:E1ByH6i/H1lkn89C66ztYbn91AUpWS+cR2IfQUIW5JOWWhORysHVf6jgOwqWeiiErf0yUQhc7bmLAoIY4MscpdV94ezNY+ebOqWOgll1sicDXYDcJvPoxn+wwb4ev9twvT2+lmxBG3ETKxHfRHFNYpp1jin46RgfQhq/c6qhXqAI2UfIy5ltWZg2Nv27A7Nue62LQdnwD2oB6eJ5H62DAjP2ypfSYOOEYURVNoBycSGSEDCxfdVSnNw79sJkLYo0gZsE6aaFqKWfETgGrxA3qg==;
 20:MxK8b6kAijAS1jPYHymrmqpWOq7luURj696OGgx/mLT2035HkDswDyEmdMW1i4VLod1gSpjHjZ/HOeIRZdCVSgyV7KeCHQIADzuUWSxHCODxkhN+yGAD73iQSfQt8opRRXQUDESmNTYP2Pw3wpw5KNm/5Y2M2Mkp5rCGp2AZ1MATERFjbooqkpb7/70/cjl2kU+w5mafKAxafef33RgJs8sFb1MHnPIGSqNJiG8wJaSI/4gVLr7Q/zAikVb98JGmzf4d1oaKhHqGHhhTHcclzF9dphePZOeWyryCcgNquhJombnsZACdJxxi+E19AxRXKZgY7lPBt3RySAObk+gm1rYNmo6T7Ev3flSW7sPxdiuSMCNYr25eCypaWCRG8XP6YrJGaKYjsFsRPuAD+wWZKguBS0wsNaU62nkJ2rG6KtRYDpP2GhL0pD5VhK52148KGqNMQ+OyG5QpyyEGztifKLoTzgRosgh6bTQECJNG2sMB5bwl8Pe1OCSAzlf9pnLt
X-Microsoft-Antispam-PRVS: <BLUPR02MB12172BF42AEEC3C8F272E4DDE2DC0@BLUPR02MB1217.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(65623756079841)(265273979862326); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040176)(601004)(2401047)(13023025)(13024025)(8121501046)(13016025)(13018025)(5005006)(10201501046)(3002001)(6055026);
 SRVR:BLUPR02MB1217; BCL:0; PCL:0; RULEID:; SRVR:BLUPR02MB1217; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1217;
 4:zVXItSofGGHvQarzyVnBmX4e9Yz0xM6zTg0CqNotSnVM05RhrS8Y5BFsdi5bPoWd4x23KNsM+fuE6sSbOCFBg78FZevMKnx27mtPDJzx4dmWfvsoID/JpDxxIw2okE6tKvybL0Mx/5+tO/DFDTOu3g4JhrvGidAgJkNzy384UbfpKR20TsFZEBkW2vVSjwig+5eZpNLY0fKxW21VdBHa7Mc9kpCnQXYVwSN0y3jFTEZz9xoCxk4IbvEiMytc2uG/+pGIDkWRa99ALa0y3nYIybWljLIh9ubWoBiyO3anKNrhFmfRZ60OPaPwh75ZqbMVb+0UbKhaI91ub0x2RHKP9Ge8UKKM1sqM4SzhuR82K2iWqHisBnKjxNbEMhEjjCXu3B3qQAa5966iusncQziMf8eLEOIuRHGRzLZtsP3uhH7cUoKIelHWSypyW5jhZ4xr5eHlnPPIpLkyEiXsUiG/0nJLmWBD+4c3Bq8kIgUEYx53H8fOU+aI5IGGxVV3l+g8PfC7kvyVdbODOI8Wfi+bdqBLyqel51fqY5m5yrxxzPqyeMPrJSqTNrTf9SMBpKRi/09Ht+y6aIsc7yLjAMpQGz4E7m3aoo7Ne5KuSgt3t1A=
X-Forefront-PRVS: 0094E3478A
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTFVQUjAyTUIxMjE3OzIzOjcrOFgvZ1RDY0dkcXhTdnRhdUxTek1yeFUv?=
 =?utf-8?B?eCtNaUZ6UU8reEp5SUtUSkp3R0htWHhXOGJUYnJDVGx1NWdFaDBEbXdRRWpo?=
 =?utf-8?B?VjJBdkRvb0hxcVFyWEpwMVl4WnhMcWJUSXd2MXA3TTU4d1ZtVTYvR2FrNnFP?=
 =?utf-8?B?aXVreGk2cjRxUmxOWWN0ZEdXZ2pZVmhGS09QOUpUUkJ3NlMvYzc5V2l2ZXhu?=
 =?utf-8?B?VEFNd2Joc2FUbGNlb3pPekNpVVZWSG1JQ21MdmVWdDArQW5ZSHJCa1k2R3VT?=
 =?utf-8?B?aUhnUXZINWc0ZzNEb2JiR3c2MVlSUDZUUTFwYlpUbFMycE4yemRLUFdJRkYz?=
 =?utf-8?B?N1BmbGN1T2djWEhxV0RYck5RdDhaaWliWThadXlrdWRIR1JVbWRQZ3lyZCs2?=
 =?utf-8?B?V2dCSm9xYWZtWDRrNHU3cy8vUmpuQ2xBYVRSM1BWblNQTFBHLysyMHExVEF2?=
 =?utf-8?B?N01pMzNWMUtNdHRqUS9vM3lkWUxYdGlKd3NOUlRhL216cFBVZDRGVUc3MEJ4?=
 =?utf-8?B?ZE43b005a1orK1VUUFppQUc3anNINWRESmJpNVVBZ0lLQ3F3Tk0yTFFPeVZ4?=
 =?utf-8?B?b2FpclRkRjhXVlFabUo1bTJrYy9wWDErRnd6TGxQOXdMUTlUcmR2aHJLeGI1?=
 =?utf-8?B?VThoelFqZml3QW10dmRmVDFjUXF4SzVOMytKdEJVR2QxYWJoaTRVSmpIcFhJ?=
 =?utf-8?B?Z0YzNTBJLytXeER2TzU5TmF6WDhibWQ0dmhqamdmaHNjbEFueWZGREJKNE96?=
 =?utf-8?B?ZmlNUGUxR1NHdFRXRVp3SGZMMGY0NmJ3dWJ6aGlmVkVGaldNMVFWNG9zYTZr?=
 =?utf-8?B?Y1pPelZ0MWlBOXRYdUJndWtlMmJ4REZzdVRCNUpWejY5cFpJMGhQWE5yaXJl?=
 =?utf-8?B?OWxYTzh3Nm9qYWlpVmhhUytvVXZZcUdFcTZrK0ZUWEpFamRyUzBBelo5L29y?=
 =?utf-8?B?ZUhYQ3dLaFVhT1NTWGxMcTROWXVCc1JNQ2xXMzB3YW1mdy9wQ3ViZUJRZmRy?=
 =?utf-8?B?RmZVQ2k4MlpRbUFLa3JPSm15QUdCRGhkeW9MUzljaUVaSjlzQkNJdVdJdHZI?=
 =?utf-8?B?ZG9IY2U5UHFNS2grY29VeG1pRWpUOHIrK21hWUlEdlhXNm1PbE1qU053WkNa?=
 =?utf-8?B?ckpXZnlsMTczVHRXell3UjdTVWVUOXhoNHRzYmZiblUvU2VkY09mWXlGVSt3?=
 =?utf-8?B?elVDQUlnNG15QVRDN1NaNzlBRTd0dW56Q3cyaEpsc25JZGYzS0EveC9HNjJu?=
 =?utf-8?B?TU1SVi85bWg3Y2pkWHhkR3NLZmRYNXd0Rk93NWtXK01kdmZ6Z3lmVmJzazM4?=
 =?utf-8?B?Vi9nbENuK0ozUkpHWnVFelEyM2phODc1Q1ZoRjhBdjF1cHhidWViOEFwRXFu?=
 =?utf-8?B?ZHN0UnZVMWRkOG9HYmFweUVGUjg0NGFMT1Y3Q2xOdmVkcTVWai9UbGdrT3BB?=
 =?utf-8?B?NkVlQUpsSWkyMnZwSXgzK2hqNWorWUhkTWp0c3hPajR2eEZteTU1WVJFZFdW?=
 =?utf-8?B?NThWZGpUS0xjVzZMVnNCYnRKVHZ6MjJ5dkpoR3V2Qm1oQ2dxTUt0TkR0eUtC?=
 =?utf-8?B?dW9tQzdaTWRhdHYrVmh5YVZycnVrRWxSSzFudndTZ1RSQzgyZ0JiWW1BakJ5?=
 =?utf-8?B?WlZXL2dDbUpCWHU2ZnpYMkUyQ0t5bFRRNGlRRThTWTI3TWptVGZBZXduTHha?=
 =?utf-8?B?RHlsRENmOE1UOXFQQndJSEZhaGJ3eVlBc3JCazM4YjZIc2FSbEJadHBNNUpO?=
 =?utf-8?B?ZDBXcFJyZ295VGF2VjdjSy9WKzdQcDA0ZHdCb3djbUVuTmtJb1ZNRWxjTnRF?=
 =?utf-8?B?VUJuZlBpeFBaNVhZQ0N0eVFsSEtEbGxoRTBwYkxQemEvb1FmdmgzRnB6eW9r?=
 =?utf-8?B?S012TFVzcDFobm9XWlRKbzJZQ1pta0cyc1VKaEwxWmx2QkNUN05YM3BkcUYx?=
 =?utf-8?B?Ukp1TGJmTk04WS9hSCtheHV5VFE3VkJYcjlNbkJORTZtbk0rSWFKRUpkQU91?=
 =?utf-8?B?ZHZSeXp6S1hpNUVhbVBndzlrejVSMlRCcUd1QT09?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1217;
 6:YwKGR9tYOVD1/aZghjQMMQtHX4u1rYMcWOOkSWkmtHI+YGsbqJ5d9ZxO1uCiAeCoSpp3XwfzAY2jpi+KjV2I2spm+KGb8ZnkHE8QMe4SNYAYuixmyx8z3DqvyVERgnpY1qGsM4kdStmxMGOzZfrdz4ZJ94QleQfnqNJ+4K1M0mezQSCcuZ0oSqvDXxX8whFWYWnDhS4N/TLaCDrN14dL3/2QC+eRip6e4Omh9NRBicrLemNNspuY9hmzVY6KAED+UWYCesDiWg58JccMjXQ1XcsbZjUE5/E8F0eHKmKvhXTo2tpwMuik1Yqs03RBdPYTp2q1i9yT6iiSf3im0oh95cj7DOO7khZwqY0M3v4a5+0=;
 5:S/we/RZ2JE+/otdoVG84+WK6QUN92Tn4JaotRmSqLQNPgiA/EAWkgUYvXZQ8V2nc9Z0ocQKKuFqpxumntawNu8Vbfs05YGcjnmTzQaj97ifIuwr3h/HDl0FkOy/6OKS8AwiudizWKKRL/CPX3X/mMnDdAK8q2HOvK9x1Zc78p4Y=;
 24:SxpHpEPJyr+HFx+8ko1vCM3LKYFBtZlTgHFTtQfJxqH9Mb4ts/tmQ5UQPAvDb6cv3DGYjmm112fu+g2eVpSovlijSv15kPqd6W6w08QA42M=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB1217;
 7:2yCQmQUjxI3IuFDHceyf1Cgsh2LpQDl8vFtK2XrnsrRuwzTyO/5i/6xh1AUlMN9qRuykUTcbMjHcQSWhOLxoY/RFQ9l2uR2qZ8zMtkWXXB8N7MzZbcia7mFGWxg9+pNlgtkxFgUHDja4d3DxFDyLd4Mrk5oQocOboLK9t7CoqJgMIzqZr4xrko6JdVLp00qy5dP85NMB8fEtX269naSadwPFnYKrPPdT8uJnlvnPtK3SJmgUdKN/W35/A9bZNP7ixkaZQUOJSvllaRfVQYwneP6SUtJeTjimUC0qGQ4kS7Pmg2l0n2FTBAWaGdeDzO7l8R+7MunY9APWIIgOxBLpjs5EW4EzJu7fXNez3poxNH4=
X-OriginatorOrg: microsemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2016 08:09:21.0698 (UTC)
X-MS-Exchange-CrossTenant-Id: f267a5c8-86d8-4cc9-af71-1fd2c67c8fad
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f267a5c8-86d8-4cc9-af71-1fd2c67c8fad; Ip=[208.19.100.20];
 Helo=[avsrvexchhts2.microsemi.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB1217
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
X-List-Received-Date: Thu, 13 Oct 2016 08:09:28 -0000

SGksDQoNCg0KUmVxdWlyZW1lbnQgaXMgdG8gcnVuIGEgd2Vic2VydmVyIGJhc2VkIG9uIG5vZGVq
cyBvbiBhcm0gYmFzZWQgZW11bGF0ZWQgZW52aXJvbm1lbnQuDQoNClNpbmNlIG5vZGVqcyBiaW5h
cmllcyBoYXMgc3VwcG9ydCBvbmx5IGZyb20gYXJtdjYgYXMgcGVyIGh0dHBzOi8vbm9kZWpzLm9y
Zy9lbi9kb3dubG9hZC8gICwgSSBhbSB0cnlpbmcgdG8gZW11bGF0ZSBhbiBlbnZpcm9ubWVudCBi
YXNlZCBvbiBhcm12Ni92NyBzbyB0aGF0IEkgY2FuIHJ1biBteSB3ZWJzZXJ2ZXIgb24gZW11bGF0
ZWQgZW52aXJvbm1lbnQuDQoNClRoYW5rcw0KQXJqdW4gUGFkbWFuYWJoYW4NCg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDw6lkcmljIExl
IEdvYXRlciBbbWFpbHRvOmNsZ0BrYW9kLm9yZ10gDQpTZW50OiBUaHVyc2RheSwgT2N0b2JlciAx
MywgMjAxNiAxOjEyIFBNDQpUbzogQXJqdW4gUGFkbWFuYWJoYW47IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZw0KQ2M6IEJhbGFqaSBNYXJpbXV0aHUNClN1YmplY3Q6IFJlOiBGVzogS2VybmVsIHBh
bmljIGVycm9yIHdoaWxlIGVtdWxhdGluZyBxZW11YXJtIGltYWdlDQoNCkVYVEVSTkFMIEVNQUlM
DQoNCg0KT24gMTAvMTMvMjAxNiAwOTozMiBBTSwgQXJqdW4gUGFkbWFuYWJoYW4gd3JvdGU6DQo+
IEhpLA0KPg0KPiBUaGFua3MgZm9yIHRoZSByZXBseS4NCj4NCj4gVXBkYXRlOiBGb3IgZGVmYXVs
dCBjb21waWxhdGlvbihhcm12NWUpIHdpdGhvdXQgY2hhbmdpbmcgdHVuaW5nIA0KPiBmZWF0dXJl
cywgSSBjb3VsZCBydW4gcWVtdSgyLjcuMCkgd2l0aCBidWlsdCBpbWFnZS4gSXNzdWUgIG9mIGtl
cm5lbCANCj4gcGFuaWMgaGFwcGVucyB3aGVuIEkgY2hhbmdlIHR1bmluZyBmZWF0dXJlIGZpbGUg
YXMgSSBtZW50aW9uZWQgaW4gDQo+IHRyYWlsaW5nIG1haWwuDQoNCkkgYW0gbm90IHN1cmUgd2hh
dCB5b3UgYXJlIHRyeWluZyB0byBhY2hpZXZlIGJ1dCwgdW5kZXIgcWVtdSwgdGhlIG1hY2hpbmUg
J3BhbG1ldHRvLWJtYycgZW11bGF0ZXMgYSBib2FyZCB3aXRoIGEgQVJNOTI2RUotUyBDUFUgd2hp
Y2ggaXMgYSB2NS4gU28gaXQgd2lsbCBiZSBkaWZmaWN1bHQgdG8gcnVuIGEga2VybmVsIGNvbXBp
bGVkIGZvciBhbiBhYm92ZSB2ZXJzaW9uIG9mIHRoZSBpbnN0cnVjdGlvbiBzZXQuDQoNCllvdSB3
aWxsIG5lZWQgdG8gcnVuIHRoZSBtYWNoaW5lICdhc3QyNTAwLWV2Yicgd2hpY2ggZW11bGF0ZXMg
YSBib2FyZCB3aXRoIGEgQVJNMTE3Niwgd2hpY2ggaXMgYSB2NisuIFRoYXQgbWlnaHQgYmUgYmV0
dGVyLg0KDQoNCnFlbXUtc3lzdGVtLWFybSAtbSA1MTIgLU0gYXN0MjUwMC1ldmIgLW5vZ3JhcGhp
YyBcDQogICAgICAgIC1kcml2ZSBmaWxlPTxwYXRoPi9mbGFzaC1wYWxtZXR0byxmb3JtYXQ9cmF3
LGlmPW10ZCBcDQogICAgICAgIC1uZXQgbmljIFwNCiAgICAgICAgLW5ldCB1c2VyLGhvc3Rmd2Q9
OjEyNy4wLjAuMToyMjIyLToyMixob3N0ZndkPToxMjcuMC4wLjE6MjQ0My06NDQzLGhvc3RuYW1l
PXFlbXUNCg0KdXNpbmcgLWtlcm5lbCBzaG91bGQgd29yayBhbHNvLg0KDQpUaGFua3MNCg0KQy4N
Cg0KDQo+IFRoYW5rcw0KPiBBcmp1biBQYWRtYW5hYmhhbg0KPg0KPiAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ8OpZHJpYyBMZSBHb2F0
ZXIgW21haWx0bzpjbGdAa2FvZC5vcmddDQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDEzLCAy
MDE2IDEyOjQ4IFBNDQo+IFRvOiBBcmp1biBQYWRtYW5hYmhhbjsgb3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnDQo+IENjOiBCYWxhamkgTWFyaW11dGh1DQo+IFN1YmplY3Q6IFJlOiBGVzogS2VybmVs
IHBhbmljIGVycm9yIHdoaWxlIGVtdWxhdGluZyBxZW11YXJtIGltYWdlDQo+DQo+IEVYVEVSTkFM
IEVNQUlMDQo+DQo+DQo+IEhlbGxvLA0KPg0KPiBDb3VsZCB5b3UgdHJ5IG91dCB0aGUgaW5zdHJ1
Y3Rpb25zIHVuZGVyIDoNCj4NCj4gICAgICAgICBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9k
b2NzL2Jsb2IvbWFzdGVyL2NoZWF0c2hlZXQubWQNCj4NCj4gYW5kIHBsZWFzZSB1c2UgdGhpcyBx
ZW11IHRyZWUgOg0KPg0KPiAgICAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3FlbXUN
Cj4NCj4gTWFpbmxpbmUgaXMgbWlzc2luZyBhIGZldyBtb2RlbHMuDQo+DQo+IFRoYW5rcywNCj4N
Cj4gQy4NCj4NCj4gT24gMTAvMTMvMjAxNiAwNjo0NiBBTSwgQXJqdW4gUGFkbWFuYWJoYW4gd3Jv
dGU6DQo+PiBIaSwNCj4+DQo+Pg0KPj4NCj4+IEkgY2xvbmVkIG9wZW5ibWMgcmVwb3NpdG9yeSBh
bmQgYnVpbHQgaW1hZ2UgZm9yIHFlbXUtYXJtLg0KPj4NCj4+DQo+Pg0KPj4gU2luY2UgSSBuZWVk
IHRvIGJ1aWxkIGZvciBhcm12NywgSSBjaGFuZ2VkIHR1bmluZyBmaWxlcy4NCj4+DQo+Pg0KPj4N
Cj4+IFRoZSBmaWxlIEkgY2hhbmdlZCBhbmQgY2hhbmdlcyBJIG1hZGUgd2FzDQo+Pg0KPj4gMS4g
ICAgICAgbWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS90dW5lLWFybTkyNmVqcy5pbmMNCj4+DQo+
PiAtICAgICAgICAgIERFRkFVTFRUVU5FID89IOKAnGFybXY3YeKAnQ0KPj4NCj4+IC0gICAgICAg
ICAgUmVxdWlyZSBjb25mL21hY2hpbmUvaW5jbHVkZS9hcm0vYXJjaC1hcm12N2EuaW5jDQo+Pg0K
Pj4NCj4+DQo+PiBBZnRlciBtYWtpbmcgdGhlc2UgY2hhbmdlcywgSSBleGVjdXRlZCBiaXRiYWtl
IG9ibWMtcGhvc3Bob3ItaW1hZ2UuDQo+Pg0KPj4NCj4+DQo+PiBJIHRyaWVkIHJ1bm5pbmcgcnVu
cWVtdSBxZW11YXJtIGJ1dCB0aGUgY29tbWFuZCBpcyBzdHVjayBhdCBWTkMuIFBsZWFzZSBmaW5k
IFNjcmVlblNob3QxLnBuZyBhdHRhY2hlZC4NCj4+DQo+Pg0KPj4NCj4+IEFzIGFuIGFsdGVybmF0
aXZlIHdheSBJIGRvd25sb2FkZWQgcWVtdS0yLjcuMCBzb3VyY2UgY29kZSBhbmQgYnVpbHQgdGhl
IHFlbXUgZXhlY3V0YWJsZS4NCj4+DQo+Pg0KPj4NCj4+IFVzaW5nIHRoZSBidWlsdCBleGVjdXRh
YmxlLCBxZW11IHN0YXJ0ZWQgYnV0IEkgYW0gb2JzZXJ2aW5nIGtlcm5lbC1wYW5pYyBlcnJvci4g
UGxlYXNlIGZpbmQgU2NyZWVuU2hvdDIucG5nIGF0dGFjaGVkLg0KPj4NCj4+DQo+Pg0KPj4gSXMg
dGhlcmUgYW55IHdheSB0byBnZXQgcGFzdCB0aGlzIGlzc3VlPyBBbSBJIG1pc3Npbmcgc29tZXRo
aW5nIG9yIHdoZXRoZXIgdGhlIHN0ZXBzIEkgZGlkIHdhcyB3cm9uZyBmb3IgYnVpbGRpbmcgZm9y
IGFybXY3Pw0KPj4NCj4+DQo+Pg0KPj4gUmVnYXJkcw0KPj4NCj4+IEFyanVuIFBhZG1hbmFiaGFu
DQo+Pg0KPj4gU29mdHdhcmUgRGVzaWduIEVuZ2luZWVyDQo+Pg0KPj4gTWljcm9zZW1pIFN0b3Jh
Z2UgU29sdXRpb25zIEluZGlhIFB2dC4gTHRkLg0KPj4NCj4+DQo+Pg0KPj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IG9wZW5ibWMgbWFpbGluZyBs
aXN0DQo+PiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4+IGh0dHBzOi8vbGlzdHMub3psYWJz
Lm9yZy9saXN0aW5mby9vcGVuYm1jDQo+Pg0KPg0KDQo=
