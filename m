Return-Path: <arjun.padmanabhan@microsemi.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0080.outbound.protection.outlook.com [104.47.33.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjK4V0BqfzDrPV
 for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2016 19:51:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mscc365.onmicrosoft.com
 header.i=@mscc365.onmicrosoft.com header.b=bv1wC6XW; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscc365.onmicrosoft.com; s=selector1-microsemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=yndYtcVeANf9M11o5kwbTsoUHGJnac1mG6H9MS+e8N0=;
 b=bv1wC6XWdZn4iyo+jwBpspH/Ufhg5+LQSTPGGpyQXhUolPxY4oP3GdCDziCqw4B8bADvi3r6+1cl5eJbDCTZHYRCbXN57VKQzlWFQUXFLZRglqEa9kWtaBszC10IWVOM61Sh+X4ZuRAK7RJSqTTqY6MUtQ1Y9ZSPrvcqa1VS9eI=
Received: from BY2PR02CA0097.namprd02.prod.outlook.com (10.163.44.151) by
 CY1PR0201MB1002.namprd02.prod.outlook.com (10.161.211.144) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.639.5; Mon, 26 Sep
 2016 09:51:48 +0000
Received: from BN1AFFO11OLC002.protection.gbl (2a01:111:f400:7c10::129) by
 BY2PR02CA0097.outlook.office365.com (2a01:111:e400:5261::23) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.639.5 via Frontend
 Transport; Mon, 26 Sep 2016 09:51:47 +0000
Authentication-Results: spf=none (sender IP is 208.19.100.20)
 smtp.mailfrom=microsemi.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=microsemi.com;
Received-SPF: None (protection.outlook.com: microsemi.com does not designate
 permitted sender hosts)
Received: from avsrvexchhts2.microsemi.net (208.19.100.20) by
 BN1AFFO11OLC002.mail.protection.outlook.com (10.58.53.73) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
 15.1.629.5 via Frontend Transport; Mon, 26 Sep 2016 09:51:46 +0000
Received: from AVSRVEXCHMBX2.microsemi.net ([fe80::a552:1d60:6960:9da4]) by
 avsrvexchhts2.microsemi.net ([::1]) with mapi id 14.03.0301.000; Mon, 26 Sep
 2016 02:51:33 -0700
From: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Patrick Williams
 <patrick@stwcx.xyz>
CC: Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Subject: runqemu qemux86-64 image kvm cpuid error
Thread-Topic: runqemu qemux86-64 image kvm cpuid error
Thread-Index: AdIX2oTk20V847KJTyqHSgiqEm5/nA==
Date: Mon, 26 Sep 2016 09:51:32 +0000
Message-ID: <C160D2872FE0DE4683E1910F9BF829413D2A6086@avsrvexchmbx2.microsemi.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.34.10]
Content-Type: multipart/mixed;
 boundary="_004_C160D2872FE0DE4683E1910F9BF829413D2A6086avsrvexchmbx2mi_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:208.19.100.20; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(189002)(199003)(87936001)(15975445007)(3846002)(102836003)(2900100001)(4326007)(2920100001)(6116002)(790700001)(189998001)(55846006)(69596002)(586003)(84326002)(107886002)(7736002)(5660300001)(626004)(7846002)(8936002)(260700001)(4001430100002)(92566002)(356003)(2906002)(7696004)(568964002)(21480400002)(101416001)(229853001)(512954002)(50986999)(53416004)(54356999)(97736004)(9686002)(5001770100001)(16236675004)(9326002)(4610100001)(106466001)(86362001)(71926001)(105586002)(575784001)(5260100001)(33656002)(19300405004)(2476003)(19580405001)(19580395003)(81166006)(81156014)(2930100002)(19625215002)(49446005)(2501003)(68736007)(5890100001)(8676002)(5250100002)(104016004)(99936001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0201MB1002; H:avsrvexchhts2.microsemi.net;
 FPR:; SPF:None; PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11OLC002;
 1:PPrloiN27J/Eo65QDfoGbCutiweWZwZUSn3aWHuzrZqSjEaZWavZTZf9w0OYIRVMBWPb2DAaglIpyLfji+NJpwGDjddIcNPsgtx58Xmrk4sSAj1TnlKbZxldWkfWRtEdbM3eOF0GnAHx5tmoU+bW7N9qAIGb0l67y+rSJbjKMk818pKFahr4c0pRT2MmdXj4j7co9QENHFsYyExwPHOmYlGwvpaV8Bf+9xS1y+6Mz+DoQSK6Hl+BnRoMjeAxuh3BQTZuv0PdY9Ur6XJNwIMC49THiSik38OljwV5FJWgiu4VSH73UsOoqjJsAUo4OyfGuF10QKfklBTUhMTykabcolvjAaEokvxpnPJeVvVll86SqPQfPVBh2AlRH3apxTBMu8gB0WuUa+5rohBrtuXE/Bii/GD618hqJZo/xBoMxLlLJrJevbA9R6sWnFiRO+X675otGeyXezG1sAWpt6NjRkA+nlqclbWSbyUpVFv1TTtsYXbht4vG5mmpEZ5knQYE4xNdipSyTi9CGQ4H+NcQlw==
X-MS-Office365-Filtering-Correlation-Id: b4bd0af9-60c6-4da5-71ef-08d3e5f2bad0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1002;
 2:DDMaUauYo96P6YGaVj4YY68TN0At1WV5h21CAyfyqP6yMB4II/6kV+5tX6pFxho+61AYCYoAlYkTH7cxQdtNol7B8XizYaP0LgUr2pXnfbZBA9YBP0sptgY+rz6WqZtInI19e+aKw4aIlYZp6T3TWhgHJbHMaJumR5S72PyjB/QSp0TtfHQJUqG7Jq0lrdZl;
 3:JkyvfIw8qSxOoo7Kxk0IBt2bnVbeAXEE5TUiR7h3htgnL5v/PmUdpfbs4LOsTH5W6uUNtjwF32K7TlbhuDkBXgyjHdmWBre66ujZyF5cQwwFCKqCgfJE7x/IH5PUBbrX3Zl+dZ6il3XAoorI6cReIblAtUHKI8A8RlRAaAVuM6cUY6MKhrQ15mawdAYrTP3arJvGmDG+zC8QM70/RoW30Xa9vQvFrJU3kg5h+H1v6CY=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0201MB1002;
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0201MB1002;
 25:YAXqq6qB2kWFBHQn4MKh5kGLWvj0SxNWTTDgKV7?=
 =?us-ascii?Q?s8uHgbUhEcj9gi3MkvOrVpCGUJEdaePz03hu2EgGiIOgmsaMT+rWbD+DBiwh?=
 =?us-ascii?Q?D1xukbpxD6kgyZ5KVCQTLQ6jILipiVvmHBTwor57iPgAmoZTterh3bDKLhGN?=
 =?us-ascii?Q?tEz2F67W27V6M2LmSpNeEwNfXuDy8A1tPySVfavcRvzIeAijAvqUssNXktGM?=
 =?us-ascii?Q?a4QNCnpx7FtXsAjvYXrFVP+Qlk7XULtxUJcMlwZJ9zM5eyH8xBd3qf84cOBo?=
 =?us-ascii?Q?ZA7ofzVlft1ngWNvXEbigXe/CHrzUtHMRCLRR3jgkDJu8b5RwpjSR7Z7yTYe?=
 =?us-ascii?Q?Tokh+KQPt2oxdwF4sNjV358cW4trVAtctOeukjJ8A6J4EAWP2tz0a1gatnL1?=
 =?us-ascii?Q?7vOxD6KFYsyRx9Wc+m2sLcxNfqnyBmK6MhOEHVpbIqA630JhTo27BTYW5Kvb?=
 =?us-ascii?Q?yGYirPtb5Km+joTVPBmp6QCm5CxauWXAMqA9fEAtF0LvqKy31hdhUiwKH/k5?=
 =?us-ascii?Q?fylxg5atLGT0sNSb0oaQ9N4/XMzawe/1tZIRgdrRHJp6accahMRDN5Ri1+jP?=
 =?us-ascii?Q?ypYY9AWGbuk0F+NN14AmLNG2gefB6qA6rdSvAt6TiHWrb1mjBO3nmzB6/cAG?=
 =?us-ascii?Q?On980Z2JGR4ldRjYePxfhfuvX9dnBX0xclgto4kUrNoV6QznxtSnHyPiTzp/?=
 =?us-ascii?Q?7UZi0PgDPHIPuiQ0LSewFjzVRk0KqjebQB+h+5/O4X6er4/7mCOL1JJf5fi3?=
 =?us-ascii?Q?IZhKeJKhiFZAS639uxIU/cP3iVUPvIlmXbbjMB892MxqyU6CAv4TOux3GIxr?=
 =?us-ascii?Q?+Um/Yrt+QY8YvdB6tk/w59LKBb4s4uwWVZZw/1gx//V0h4LybMA9xNprpYnc?=
 =?us-ascii?Q?vZq8ldWxr3re10epAyUfaSmW2j1WYEz8xAgqd10XHWX176MZ432qXkID+Hdu?=
 =?us-ascii?Q?wlYVYZxUBeA12h7ftvZHMDKipWDUi/OQzXEhAqlqtrudGFWYgRubIGJzjkrh?=
 =?us-ascii?Q?IdtEBlM1M9cfUFHJcD/itZj6N?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1002;
 31:zcFXB0z+xCGRzNGxE9kQgD2pY1J06khlyrB+R5ra6HJfflloZ4ng+vYmVWNufa86y2sknNpD2dvDZlGuSUMfUQ7/S93Z9vOkczMscp5q/ggdM0/7zej7HU+vGipjP3Fr3Jv9Pmiy+8eyMtXQzIdiD83RWSgn/NdG9bv1wGXBZeEivwiKh6cBHWlbWejQW0BreOsN8D270bP2hFF5v7ZFbmCocMgJnBCWU3MTbkyMms/IzZGtVjf+iitlOtdvjr2f;
 20:LRYav+DBl//5wgafqngtA/AKpPVmokwwsksUa9Rky81skw+ghf093KodHmEAlg36JZZXPgZfwJBglH1nBgkUCgv/Yyvno2JKbol203SKHzsQ2TPJgCM3U1/fG4UuuV623BBcT9AYSX7ZWCQhb+nH9OiBvW2sgUfDPhxkemkwnZwsq+TAwO8JCLmYplcLyLcowARVkYMpKXJ1ysI6YApXanOBKS83HFsn+s5+dd37/mTC+GQnINS5pfKm9gfBodiJ6/SrsnCzgPIpeJYSI/hZqdJIvc3JefgvEqlXGkxwh7bEzVWJ73j5jG24nFYZA3p/ZOE5Z5rFNOs3zWV6BSDasVejosof8Gw/rTQPHSCpMWhoYurU9ETq3N+xvTfZXnXoLnbwz4Cz3FF9jg7DZOuuHBNAhovt5+O+WS/n9V2SDvbYb8sVb6TpstxEtX+mlZ6XSDQm68eSN5gNwo1ca+cJqUYVPjk9w/8Rc6qDrPZO4PTjmKsr580yfXLbGwJalRQS
X-Microsoft-Antispam-PRVS: <CY1PR0201MB10022CC7CEFDC2BA0DA34036E2CD0@CY1PR0201MB1002.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(21748063052155);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(102415321)(6040176)(601004)(2401047)(13023025)(13018025)(13024025)(13016025)(5005006)(8121501046)(10201501046)(3002001)(6055026);
 SRVR:CY1PR0201MB1002; BCL:0; PCL:0; RULEID:; SRVR:CY1PR0201MB1002; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1002;
 4:OLiw8HnBtZbToaL4WbzjnHFVgSzIKmQIMPuURYCwrRDpbpIu8aqLy2ZDxR8NYL4YTpzxHEsVugA6k7qWAK6yDjhFtdo9mY5vHTVIZv5Q28bF0CXNJrY64S4egRI5BwCKWAybiJVLzNu2iUPV7sbnJjLmjhncksbHS/DilFGFfNVQXI/4MSKRRiXuSHwtgLHGfJVqY3NlJcCm7vuYiCwaakKiM4d1zQn+vMnLIZ5TurAyXChU93XDiLI25kgw0/pUxST2rCLpntWqN8sqjaZpVA5L3+Dk/DSEfsysTL6wgOBiwDPQWRBt5eZWmE569UEmG3pmfSTbKxlBU7IXL00Lna5F4Bf4AO63iKq2BMgwvKMqkRfJNQIaVXmqRAt7Mywthg2wDokLFGJHEJMo4VAjqxdc92fsYKx3Xs/fOPhzGpVx1xk6+NrC0EiLxjuFkLyDbhv6rcWUw4V3G4efpnT5SWYCiK/h6d6onGSF8s9i6b7WuRt5p+4Ov6aGhrRsJJvEYInRKOuKyawOyMYSxFW9SKg1dIC5EQdOzhuG4vLurHkhvLualFE6hlYyfegiYXA7vhmBPSkqqOEZi+nXPMxzfA==
X-Forefront-PRVS: 00770C4423
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0201MB1002;
 23:PkwHShHHa3bhWZmiRob+vlscjqJW9GN4tAHgEB7?=
 =?us-ascii?Q?cKJ23Bs8BCHNV4DDKYTuw3meq/6qP1jeCZIMXXjuVuziNWRjRnbOsFusUu6/?=
 =?us-ascii?Q?RvpXTIXYcvE8fIgBUnRngUszE6UPMKcjXNQAiv3UTG96Hlg6t4/BpVNUe4CC?=
 =?us-ascii?Q?l5GbM5KOVM5nkyjlREXLYbNnyJmaTx323Y5bfaiBmuJVtgLNYBwDO3fXIfG5?=
 =?us-ascii?Q?K1qoZ6IY9dEj+iT826IAEtm6gUMcXWN2NGiuNb6O743LBTF/weTxQO77cuY4?=
 =?us-ascii?Q?5Nt+ShUNw0Ehym4MI5Sa82iBCUC0W4NC40VTADF6wZScw/Okb7gUx+yONspV?=
 =?us-ascii?Q?jImixoPIr8zEj09NChGZ+Cp5zIrYXf6F+02KfZliWGrxPOvZocErlDjtlV5s?=
 =?us-ascii?Q?Rq2kG38FsCIW2fFuEC455IpVAUebQPv5XosX4RzBpR/VVDhT203aqUu0gJcH?=
 =?us-ascii?Q?oJRGV5oH3vbKP97ny0uijkUCsBpN7kieRGJF89zrMpBP/YgcTRBrHY+ZZN5b?=
 =?us-ascii?Q?AmeMlXY4N7J99RhsJeyXW1jmmCv61qAWDqpzLYR7BLrvDie5OEfd8UdtQmQC?=
 =?us-ascii?Q?ikYEUSSYDa69nhTmbC575gBPMRC9woiAwmRzhoT93Or9RJara53ypXN9NRxj?=
 =?us-ascii?Q?pbOE0Pv/iCHbqwu2yfBboZUe5VreJMmN4s7Pe5a2r9SFQ0qOjku4Hq3uCefw?=
 =?us-ascii?Q?LXnbb6LrNRZndwgSqpb8gnMg0eEJPDXm4yetaYroCr0oc/o6EH8IEetNu5lw?=
 =?us-ascii?Q?8CfsgYRxccUjHj5wU193I08QabICYuFYwoNY99dIOfd0QIbHOotI5cYUr1Mj?=
 =?us-ascii?Q?wHfcBdVhOFPVsVdvw6D/ylFP4Fa21YrE/TsJg+pV28j6ukwPu/47/JLxe1DY?=
 =?us-ascii?Q?I9kBRTeUd5hr3itW98oIbHcJZbXebUfGwcl/cuNRGaHvVDRNCkgzl6XRjHX0?=
 =?us-ascii?Q?oYwsLZ5gNOnIDOUll+lsNXBzafJ3SAh9Zxpedyk7iMq0Ss2NfrJwOIV74gX/?=
 =?us-ascii?Q?ebQfbIaxaj1vRKH0ZmltK6KFw6yrAckDFBl5/4sa6z1ZgTTZB1Qj6g9xBpx1?=
 =?us-ascii?Q?chSohjak3ezXtkwzkrvSKQXZZOxckDo3tNEirygmAOqq3P7sgz7j5yTlqWzn?=
 =?us-ascii?Q?rX1Te+4632Yidhm7HNgau8CQUP7AsHBkCH10/VhJDqWgNEogQ44IhoTJEyIf?=
 =?us-ascii?Q?MY0+I1w1X/FRpSnp2demfC+VXZJnI6RMBXGhwFBlKdvdP8/eVNmayL9vQlXA?=
 =?us-ascii?Q?aV2MiQ0dIUrq3XE+oxg411US3mt+iDqZbg2EK/OgDJj7d+LUbq0gCv4IXxP/?=
 =?us-ascii?Q?7Cd++aq0l8KImRqJuynyD6kPbjVnE4Fe2eX+jsWkglB95+hDtJobnsNoK0x+?=
 =?us-ascii?Q?rnWUEjnb0aJt5hUOw8iPiKAaBTQHpibNZoCTZpHkgkqvf7vyg3V4gJC82+n9?=
 =?us-ascii?Q?4T44hnRphZZcgiryDzUygG8fOu7DdSGen/mKtBq15De5mpHvW+f55ctEzGDj?=
 =?us-ascii?Q?5BYsNebuZyE3LTPdNI3SiLPGywo11oQ7817soTx4DkWVhW2QvPWPL9WiiJDS?=
 =?us-ascii?Q?/J5+C+tMnv6ZEe0ZVto4rEWl8gkSudThHAMYn2Fgmk8VinzCb76HYH3Pv/6S?=
 =?us-ascii?Q?cmuGSC1ClPzKA2FcI0eurn2HywAa5JNKyhSFDF4vgFbxHSDwnQEKOK7z1/op?=
 =?us-ascii?Q?Xs3Z8?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1002;
 6:OSfbGnIWS4vrbyLGh5lMtDouP1pzxJPZjqkGX9sKTrFde01EH/2DeaIhOgJLTwARI45jZnmDVWuwVgMU7jqIVsyAracsHnRgq2C/msbnqm7j9yPX3ttVBcIFwZkDss1frfxLFgpS+fJ4WPisAXeX4vzWxwldh9b0JvCUxxTBxbcIAqRl6ZfdCbaNHP3jIRbpMbo06nkZu2bQ+P5H8ACaCllerTtuptZQRxqNrLeOARBtZ7HRGxzpxtYJu20hmleBbEskYeKadO12vxviy6nWjEOtUrrb5qVphctvm9C+XQS+dBuBnKs1oSVET/jJYS3NyiTci/f+tQ9eTjHQncLPvQ==;
 5:5YE1udvbjeB6oWBhM1i7y61Mft4mO+0A2VQqmL2GeonUIMbwSloWs3l+FNW0OUO6Ogl8wQeyOVLcCDpoZAndYxrol/RZb0EJWXIZKCNBV6lcrAB6BevJoK13ykW9tVBHYQIyZZtUFkIY4TNklhrE9g==;
 24:gSzPb5zqkaJJeWu9BNjDD4UFIZ6VWZCVOByUJUBJgRCSPA8fpUqBPVHVEk82ZeXXH0RUsot7NGbXo0E6SZf49ibnIuzjnoB6Yubyn19lgOQ=;
 7:Bq6zJbfdKhJlErR7DaoAxY9UXx3+RhgsSyMqpiuTJ0yMk6FwAX+q37MlAIxAy9Ss8t3BL5DU6I7TPxGf5X2BFH/Hmm+RzIvAu2Ak3MuV0FOb2py7r5vp3V2/3JUkpwln/8ZkNCEFGmtvihGJHoCRysNIzXvMxLqWtsnrl8Ydtz60pNnLZT1vWF3wM4wp7f8GHktR/e/7pHRwqOpDyL9qjjtHeNib+pqCMDAaLUeCem+S5uWiv0EK19JOVtAyBcAyS8r+Auskr8uO6c2pkzfib2jRgBUahPOKEhijwPsIutwqlrQGezOpMhcJGIezvTuh
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2016 09:51:46.0641 (UTC)
X-MS-Exchange-CrossTenant-Id: f267a5c8-86d8-4cc9-af71-1fd2c67c8fad
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f267a5c8-86d8-4cc9-af71-1fd2c67c8fad; Ip=[208.19.100.20];
 Helo=[avsrvexchhts2.microsemi.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0201MB1002
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
X-List-Received-Date: Mon, 26 Sep 2016 09:51:55 -0000

--_004_C160D2872FE0DE4683E1910F9BF829413D2A6086avsrvexchmbx2mi_
Content-Type: multipart/alternative;
	boundary="_000_C160D2872FE0DE4683E1910F9BF829413D2A6086avsrvexchmbx2mi_"

--_000_C160D2872FE0DE4683E1910F9BF829413D2A6086avsrvexchmbx2mi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_000_C160D2872FE0DE4683E1910F9BF829413D2A6086avsrvexchmbx2mi_
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
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
</body>
</html>

--_000_C160D2872FE0DE4683E1910F9BF829413D2A6086avsrvexchmbx2mi_--

--_004_C160D2872FE0DE4683E1910F9BF829413D2A6086avsrvexchmbx2mi_
Content-Type: text/plain; name="cpu_info.txt"
Content-Description: cpu_info.txt
Content-Disposition: attachment; filename="cpu_info.txt"; size=3539;
	creation-date="Mon, 26 Sep 2016 09:49:11 GMT";
	modification-date="Mon, 26 Sep 2016 09:49:34 GMT"
Content-Transfer-Encoding: base64

cHJvY2Vzc29yCTogMAp2ZW5kb3JfaWQJOiBHZW51aW5lSW50ZWwKY3B1IGZhbWlseQk6IDYKbW9k
ZWwJCTogNDIKbW9kZWwgbmFtZQk6IEludGVsKFIpIFhlb24oUikgQ1BVIEUzMTIyMCBAIDMuMTBH
SHoKc3RlcHBpbmcJOiA3CmNwdSBNSHoJCTogMTYwMC4wMDAKY2FjaGUgc2l6ZQk6IDgxOTIgS0IK
cGh5c2ljYWwgaWQJOiAwCnNpYmxpbmdzCTogNApjb3JlIGlkCQk6IDAKY3B1IGNvcmVzCTogNAph
cGljaWQJCTogMAppbml0aWFsIGFwaWNpZAk6IDAKZnB1CQk6IHllcwpmcHVfZXhjZXB0aW9uCTog
eWVzCmNwdWlkIGxldmVsCTogMTMKd3AJCTogeWVzCmZsYWdzCQk6IGZwdSB2bWUgZGUgcHNlIHRz
YyBtc3IgcGFlIG1jZSBjeDggYXBpYyBzZXAgbXRyciBwZ2UgbWNhIGNtb3YgcGF0IHBzZTM2IGNs
Zmx1c2ggZHRzIGFjcGkgbW14IGZ4c3Igc3NlIHNzZTIgc3MgaHQgdG0gcGJlIHN5c2NhbGwgbngg
cmR0c2NwIGxtIGNvbnN0YW50X3RzYyBhcmNoX3BlcmZtb24gcGVicyBidHMgcmVwX2dvb2QgeHRv
cG9sb2d5IG5vbnN0b3BfdHNjIGFwZXJmbXBlcmYgcG5pIHBjbG11bHFkcSBkdGVzNjQgbW9uaXRv
ciBkc19jcGwgdm14IHNteCBlc3QgdG0yIHNzc2UzIGN4MTYgeHRwciBwZGNtIHBjaWQgc3NlNF8x
IHNzZTRfMiB4MmFwaWMgcG9wY250IHRzY19kZWFkbGluZV90aW1lciB4c2F2ZSBhdnggbGFoZl9s
bSBpZGEgYXJhdCBlcGIgeHNhdmVvcHQgcGxuIHB0cyBkdHMgdHByX3NoYWRvdyB2bm1pIGZsZXhw
cmlvcml0eSBlcHQgdnBpZApib2dvbWlwcwk6IDYyMDAuMDQKY2xmbHVzaCBzaXplCTogNjQKY2Fj
aGVfYWxpZ25tZW50CTogNjQKYWRkcmVzcyBzaXplcwk6IDM2IGJpdHMgcGh5c2ljYWwsIDQ4IGJp
dHMgdmlydHVhbApwb3dlciBtYW5hZ2VtZW50OgoKcHJvY2Vzc29yCTogMQp2ZW5kb3JfaWQJOiBH
ZW51aW5lSW50ZWwKY3B1IGZhbWlseQk6IDYKbW9kZWwJCTogNDIKbW9kZWwgbmFtZQk6IEludGVs
KFIpIFhlb24oUikgQ1BVIEUzMTIyMCBAIDMuMTBHSHoKc3RlcHBpbmcJOiA3CmNwdSBNSHoJCTog
MTYwMC4wMDAKY2FjaGUgc2l6ZQk6IDgxOTIgS0IKcGh5c2ljYWwgaWQJOiAwCnNpYmxpbmdzCTog
NApjb3JlIGlkCQk6IDEKY3B1IGNvcmVzCTogNAphcGljaWQJCTogMgppbml0aWFsIGFwaWNpZAk6
IDIKZnB1CQk6IHllcwpmcHVfZXhjZXB0aW9uCTogeWVzCmNwdWlkIGxldmVsCTogMTMKd3AJCTog
eWVzCmZsYWdzCQk6IGZwdSB2bWUgZGUgcHNlIHRzYyBtc3IgcGFlIG1jZSBjeDggYXBpYyBzZXAg
bXRyciBwZ2UgbWNhIGNtb3YgcGF0IHBzZTM2IGNsZmx1c2ggZHRzIGFjcGkgbW14IGZ4c3Igc3Nl
IHNzZTIgc3MgaHQgdG0gcGJlIHN5c2NhbGwgbnggcmR0c2NwIGxtIGNvbnN0YW50X3RzYyBhcmNo
X3BlcmZtb24gcGVicyBidHMgcmVwX2dvb2QgeHRvcG9sb2d5IG5vbnN0b3BfdHNjIGFwZXJmbXBl
cmYgcG5pIHBjbG11bHFkcSBkdGVzNjQgbW9uaXRvciBkc19jcGwgdm14IHNteCBlc3QgdG0yIHNz
c2UzIGN4MTYgeHRwciBwZGNtIHBjaWQgc3NlNF8xIHNzZTRfMiB4MmFwaWMgcG9wY250IHRzY19k
ZWFkbGluZV90aW1lciB4c2F2ZSBhdnggbGFoZl9sbSBpZGEgYXJhdCBlcGIgeHNhdmVvcHQgcGxu
IHB0cyBkdHMgdHByX3NoYWRvdyB2bm1pIGZsZXhwcmlvcml0eSBlcHQgdnBpZApib2dvbWlwcwk6
IDYyMDAuMDQKY2xmbHVzaCBzaXplCTogNjQKY2FjaGVfYWxpZ25tZW50CTogNjQKYWRkcmVzcyBz
aXplcwk6IDM2IGJpdHMgcGh5c2ljYWwsIDQ4IGJpdHMgdmlydHVhbApwb3dlciBtYW5hZ2VtZW50
OgoKcHJvY2Vzc29yCTogMgp2ZW5kb3JfaWQJOiBHZW51aW5lSW50ZWwKY3B1IGZhbWlseQk6IDYK
bW9kZWwJCTogNDIKbW9kZWwgbmFtZQk6IEludGVsKFIpIFhlb24oUikgQ1BVIEUzMTIyMCBAIDMu
MTBHSHoKc3RlcHBpbmcJOiA3CmNwdSBNSHoJCTogMTYwMC4wMDAKY2FjaGUgc2l6ZQk6IDgxOTIg
S0IKcGh5c2ljYWwgaWQJOiAwCnNpYmxpbmdzCTogNApjb3JlIGlkCQk6IDIKY3B1IGNvcmVzCTog
NAphcGljaWQJCTogNAppbml0aWFsIGFwaWNpZAk6IDQKZnB1CQk6IHllcwpmcHVfZXhjZXB0aW9u
CTogeWVzCmNwdWlkIGxldmVsCTogMTMKd3AJCTogeWVzCmZsYWdzCQk6IGZwdSB2bWUgZGUgcHNl
IHRzYyBtc3IgcGFlIG1jZSBjeDggYXBpYyBzZXAgbXRyciBwZ2UgbWNhIGNtb3YgcGF0IHBzZTM2
IGNsZmx1c2ggZHRzIGFjcGkgbW14IGZ4c3Igc3NlIHNzZTIgc3MgaHQgdG0gcGJlIHN5c2NhbGwg
bnggcmR0c2NwIGxtIGNvbnN0YW50X3RzYyBhcmNoX3BlcmZtb24gcGVicyBidHMgcmVwX2dvb2Qg
eHRvcG9sb2d5IG5vbnN0b3BfdHNjIGFwZXJmbXBlcmYgcG5pIHBjbG11bHFkcSBkdGVzNjQgbW9u
aXRvciBkc19jcGwgdm14IHNteCBlc3QgdG0yIHNzc2UzIGN4MTYgeHRwciBwZGNtIHBjaWQgc3Nl
NF8xIHNzZTRfMiB4MmFwaWMgcG9wY250IHRzY19kZWFkbGluZV90aW1lciB4c2F2ZSBhdnggbGFo
Zl9sbSBpZGEgYXJhdCBlcGIgeHNhdmVvcHQgcGxuIHB0cyBkdHMgdHByX3NoYWRvdyB2bm1pIGZs
ZXhwcmlvcml0eSBlcHQgdnBpZApib2dvbWlwcwk6IDYyMDAuMDQKY2xmbHVzaCBzaXplCTogNjQK
Y2FjaGVfYWxpZ25tZW50CTogNjQKYWRkcmVzcyBzaXplcwk6IDM2IGJpdHMgcGh5c2ljYWwsIDQ4
IGJpdHMgdmlydHVhbApwb3dlciBtYW5hZ2VtZW50OgoKcHJvY2Vzc29yCTogMwp2ZW5kb3JfaWQJ
OiBHZW51aW5lSW50ZWwKY3B1IGZhbWlseQk6IDYKbW9kZWwJCTogNDIKbW9kZWwgbmFtZQk6IElu
dGVsKFIpIFhlb24oUikgQ1BVIEUzMTIyMCBAIDMuMTBHSHoKc3RlcHBpbmcJOiA3CmNwdSBNSHoJ
CTogMTYwMC4wMDAKY2FjaGUgc2l6ZQk6IDgxOTIgS0IKcGh5c2ljYWwgaWQJOiAwCnNpYmxpbmdz
CTogNApjb3JlIGlkCQk6IDMKY3B1IGNvcmVzCTogNAphcGljaWQJCTogNgppbml0aWFsIGFwaWNp
ZAk6IDYKZnB1CQk6IHllcwpmcHVfZXhjZXB0aW9uCTogeWVzCmNwdWlkIGxldmVsCTogMTMKd3AJ
CTogeWVzCmZsYWdzCQk6IGZwdSB2bWUgZGUgcHNlIHRzYyBtc3IgcGFlIG1jZSBjeDggYXBpYyBz
ZXAgbXRyciBwZ2UgbWNhIGNtb3YgcGF0IHBzZTM2IGNsZmx1c2ggZHRzIGFjcGkgbW14IGZ4c3Ig
c3NlIHNzZTIgc3MgaHQgdG0gcGJlIHN5c2NhbGwgbnggcmR0c2NwIGxtIGNvbnN0YW50X3RzYyBh
cmNoX3BlcmZtb24gcGVicyBidHMgcmVwX2dvb2QgeHRvcG9sb2d5IG5vbnN0b3BfdHNjIGFwZXJm
bXBlcmYgcG5pIHBjbG11bHFkcSBkdGVzNjQgbW9uaXRvciBkc19jcGwgdm14IHNteCBlc3QgdG0y
IHNzc2UzIGN4MTYgeHRwciBwZGNtIHBjaWQgc3NlNF8xIHNzZTRfMiB4MmFwaWMgcG9wY250IHRz
Y19kZWFkbGluZV90aW1lciB4c2F2ZSBhdnggbGFoZl9sbSBpZGEgYXJhdCBlcGIgeHNhdmVvcHQg
cGxuIHB0cyBkdHMgdHByX3NoYWRvdyB2bm1pIGZsZXhwcmlvcml0eSBlcHQgdnBpZApib2dvbWlw
cwk6IDYyMDAuMDQKY2xmbHVzaCBzaXplCTogNjQKY2FjaGVfYWxpZ25tZW50CTogNjQKYWRkcmVz
cyBzaXplcwk6IDM2IGJpdHMgcGh5c2ljYWwsIDQ4IGJpdHMgdmlydHVhbApwb3dlciBtYW5hZ2Vt
ZW50Ogo=

--_004_C160D2872FE0DE4683E1910F9BF829413D2A6086avsrvexchmbx2mi_--
