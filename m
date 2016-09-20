Return-Path: <arjun.padmanabhan@microsemi.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on0081.outbound.protection.outlook.com [104.47.36.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdY4N4nvlzDsfj
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 16:38:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mscc365.onmicrosoft.com
 header.i=@mscc365.onmicrosoft.com header.b=BVtHc6ID; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscc365.onmicrosoft.com; s=selector1-microsemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=dplF/4dQUl/N19nQaX2+BT5hP5BSMAM/SeUSqiN8D1M=;
 b=BVtHc6IDHhwPBVg8SYYayPIYNeOGUx67iWjGvwijMsj+Dh54QzEJQc88m427i5zm8sGnd9dpoH7Qn14ZLjr+vIdvriHepEFH5wOcRafdaef1QScKzNOr14rtyWLWF6JDQ5iU95JoD1UkagK9Ay6z8ZJkd8T/GndqFwNkEQA/70E=
Received: from DM5PR02CA0072.namprd02.prod.outlook.com (10.168.192.34) by
 MWHPR02MB2447.namprd02.prod.outlook.com (10.168.204.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.629.8; Tue, 20 Sep 2016 06:38:39 +0000
Received: from BN1BFFO11FD019.protection.gbl (2a01:111:f400:7c10::1:161) by
 DM5PR02CA0072.outlook.office365.com (2603:10b6:3:39::34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.629.8 via Frontend Transport; Tue, 20 Sep 2016 06:38:39 +0000
Authentication-Results: spf=none (sender IP is 208.19.100.21)
 smtp.mailfrom=microsemi.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=microsemi.com;
Received-SPF: None (protection.outlook.com: microsemi.com does not designate
 permitted sender hosts)
Received: from avsrvexchhts1.microsemi.net (208.19.100.21) by
 BN1BFFO11FD019.mail.protection.outlook.com (10.58.144.82) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
 15.1.629.5 via Frontend Transport; Tue, 20 Sep 2016 06:38:38 +0000
Received: from AVSRVEXCHMBX2.microsemi.net ([fe80::a552:1d60:6960:9da4]) by
 avsrvexchhts1.microsemi.net ([::1]) with mapi id 14.03.0301.000; Mon, 19 Sep
 2016 23:38:36 -0700
From: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Subject: Aspeed board for development
Thread-Topic: Aspeed board for development
Thread-Index: AdITCKqBtOiV47MvTQGT4IxJZBG0Qw==
Date: Tue, 20 Sep 2016 06:38:35 +0000
Message-ID: <C160D2872FE0DE4683E1910F9BF829413D2A3893@avsrvexchmbx2.microsemi.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.34.10]
Content-Type: multipart/alternative;
 boundary="_000_C160D2872FE0DE4683E1910F9BF829413D2A3893avsrvexchmbx2mi_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:208.19.100.21; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(199003)(189002)(2930100002)(15975445007)(9326002)(55846006)(189998001)(2920100001)(2351001)(2900100001)(106466001)(104016004)(53416004)(229853001)(107886002)(101416001)(105586002)(19580395003)(86362001)(7696004)(110136003)(54356999)(356003)(50986999)(5250100002)(450100001)(626004)(16236675004)(9686002)(68736007)(19625215002)(92566002)(19300405004)(3480700004)(7846002)(7736002)(1730700003)(97736004)(5660300001)(84326002)(260700001)(69596002)(512954002)(102836003)(790700001)(8936002)(6116002)(11100500001)(8676002)(4326007)(586003)(81156014)(3846002)(33656002)(2906002)(2501003)(87936001)(81166006)(4001430100002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2447; H:avsrvexchhts1.microsemi.net;
 FPR:; SPF:None; PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD019;
 1:Sa9ao1LWQcbGsS/kehvNNjV96GRhmCKrambc7B2m/lz/yR+r6ajN0J8QDF8PF75Feiz/mkZVjGXPt7E807V7xnLXzB8jJmLU1f29LBmHH3puRIAAyzVPJjluiCajoRo+p0bZhl6Jw19KAj2IsSdxPZIMX1aM8Hv78/E38WZFRR10WTkgax1EiPBKT6ezYrBBw0wVXGvCkQmjMKOkkwmqSqbu+N0qbyFTIjShQllA5x8Te2GdJIKGKulQUO83NfYiwR3i8JpA7aMbRagwtJTCvLNNulEtRYSl+ixMslsnm+BM7rpf9Lw/hYe7ZBWFcV24O0mdxzyo1aYNaAa0CSWU9G6NQQ3vSkb1aSyZUxQBfPJjKXSnKSmJYkuBHZxYQXTJjHRwBr7BlWgfHuoaWe+OHHjKurqoSMxEEjjVor5jmmiySyKpPFqpl32aCYQ0LeurrQBLM1W/1dJhpRJ5U37GLDMDq8kyzzDBCbxib+R+xywC88HmuCOjKsiuZwMJi3QPUiIJmajO43EpR4kybZGpTCKkOdEwWyZtMMkgWju0zCE=
X-MS-Office365-Filtering-Correlation-Id: c0c9a735-dccb-4f80-8fce-08d3e120c153
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2447;
 2:OLCvir2faCygjR3rmByhlcGE5HnnBGBX8b/Dy3bNidk1iAAWTEgdkZmzuDM56p80ntndnYudV/67ksXPAZK/Wuig8Arf47VjezuA5jtrNNRm34zFdbW391P0eXB2pXHoiKmdvcnkCSEHj9Cv0P5CMsn4Qtp8HsyinniPjPF993nVGfUS6UnZ3OyTfp9YTkaz;
 3:UNNCQlDGQwJDuHTihGYjWXVxySVp7qiRPvK6XRSJB9VS7W9rgbJVRTtwYSexUC1sil+ewi+VmfOOa0vbZqzmGnMimj+/rP7MLySVhMvPSEPAAOIgDjgN0KpJSHvECMIw3mP1H6D/W5ycFdrTNoDUcw/Bm3ROSj7NtB71Tews+2fFLYg27MKH6o4xbPdjY4UtigpW9UplcEA28HIxw+KcGHWcJLoMJKmyuY/8w8YFwHw=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:MWHPR02MB2447;
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2447;
 25:Lu1VJa615ngWEQqoxke1iddWjp989MbKKfkaRVdlPA6C2K7CPh2D+nr2hEplrwV838+o5UrImAzb1QNclY9+0ZRgoIoRb0CB/8u90VRWf8em7D11RisjPUt2fRV5NjA/9RsZXs76Ty7PoKU0uLvKqrjeYam96w6MVg1jkav1jS3mQkxzaAOd/Zo1L6fleY+glXzKUWhwaLBE4JekRgbtUdTNCQBdMPvPm7dKY/6iWanDYO3OyC1fDPTGxuAps7nmd9ogxNABYqEe+xOhMgK4d5NtdXHWmoqBDJ56xqZqwFg34J0sJ0Dk5sRvC3COXD5lk659zq9lBD13OFZnM/T6cgiybcEL9z492itBwBietQ4/RashZUyEB0TxwG8oF6J30TkoRnySattiuTezhtER22Q7ARMGYGUOaRkeNj3YKbIEwjB2ODvFh8idivT0CHnk2a2YlkE4jdB7NSZauupn92OkUq8+YksPAcRHT81MYb5H6KcOk9HKf2Dvou6Il9tgLwEVHWhMSR+pAbuCFI0Gzj2/kVXLUvJaBrHegzP/hW3N6XpkS05kjRI7h6wHjdpsmI95kXOy7ZaVMH4ItfKB2YB5nTzk4Z+jNqCA/SCTUG8SL4+J7RDjKz5U11fjSRryNjuPA3liIqnNG/PC82iNUaMaT4WqioxGaI9xBGBphDPsKErPfWDv0Xoo5STrnfV81i/izYNQI2ODjjCAFnznCUT7QCX357AGkRH292zaqrORjSj+5QBdGDKgMnrSdm1XOBE6Tq2RacF2GQWLyPot6GhgHPsvTGQcxVWsK1MxH1Hl9ryHk7tVH/w9vVzZJOtljqsmEgbooQnyTqwr44izZPjANS7Djs1zhmunP2cUhA80lWJmJHmx5tMHMHyuppH2
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2447;
 31:YXifdGp80S1YhV0EZu9mQ/Ik/jq/Mnn9bQ42RGJDZzHjGdG7cu5IdxVuOWmexG7wx7g4kQlcbqHWolGOe+i3iZ3WKNJcEFLp9S35gY2ZvH96nA0nAQmMlsQjhF9D2+pniT+xxzBjv/lUjgP3O2GNebAQrqo7/Aerd6j3Yhf5KvARxFilsk9rrTCCpq7fSnGEPfUGsXxs++V36zxmtqonBQnu/8CvKBXwHFnuNMnq3mM=;
 20:ZSKaLObb61ZPJ8k8Ce66vkggUjqYuMp2uS02l/qu1obYZUSnuI9Dzlkw2y0yqBuoiUi0IkU7imvZhqFIURUZV0I0mjxf2alEIZmXmmnRFoKIWmx9zXaUcY8zWiGJv7OUi3gR3zMMnbzIBk5VGTiZLtQxi5sOA/QKiVSsiuiGy8Dm1kq0yUCKyD5TiSLEm0uuH8gJRxLUZr+jAOqoU2Nvt/+Xl8qY+e6qbggmQz9M+Y7iw+CS144mSteXNoVqUOF8cWAAnJZGoI50CpOVjsDwgWfv8zyyTzA4j0yTEGpEKJirpCMNkBj3i/wwskzBj4AMRfW6grsaFLlY3iy86dqNJzistuHnhfQ3j8OgiLqGzDtfTTvkkRA/0YjX6W/OnqHtf8zhsr687Oocb+0vM0t/i5sy20l7fpIXVVUiyRoIj/+L5iwfktZbIyeXx2zWw8pDUS6MkAwiHp2GHtlki6XyfTqAdu/LcIpPGMISo19MO8yNcwY+CuU7wl4b1COjFiwA
X-Microsoft-Antispam-PRVS: <MWHPR02MB2447138BAA2C9A9D55EC72DCE2F70@MWHPR02MB2447.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(21748063052155);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040176)(601004)(2401047)(5005006)(8121501046)(13018025)(13017025)(13024025)(13015025)(13023025)(3002001)(10201501046)(6055026);
 SRVR:MWHPR02MB2447; BCL:0; PCL:0; RULEID:; SRVR:MWHPR02MB2447; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2447;
 4:rIE3bFBtvD/HJp1nX1vyqhzqVgxIKZI7aCaEJoAkVoQ8gzV1aE7oLC9ho5Odwr0mOE8q1joisYwpD9a1i46xkWLpRsD2QAMlgIu94QoJtzrN4zPRc8z1epCuQc/VpLBzkSn3NwXOk3niNtbtOzZ3rIXJoDNagPEKSReBymjqf8JiWOkN8/wlJOf9i3H4s/c5pjIPqs8TVfOfguBaNM8JVfGJtID8Yip96/t0nXROVvATGtRDeoysSDYctI4YNtbYnoG+Ky6ZeJV8AwxaJbADa78SYEEiIdu14exQmEx2RD3BaT+s09ewWa9FaZ+L+fGIl58J9TbAMIRiXZL/8deLkMsS03cmc91t3rsTWQsNNQQegTn6mHrTw0irkxPIEcYxu//QMQJ/COf+KeuNEUUMe7vJJW1Ph2pgxF7pnZ230XlA2fCGTEhv/fJ8ku7+q4n57trvmxNzcPdIbSN33NXujmOvgC1WB2jA0EnSZUQOV39Ps/hr1y/Top2W2r/jWdBdfnphku3Z+31gSbBTsRuh34nTYuQPX0fQcx6OsJ21jrq+HsTL4HAonuL3gijDn/4n9ef+iLgsySEQMQJOhenOHg==
X-Forefront-PRVS: 0071BFA85B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB2447;
 23:XxZJecn8TOFTyF0GMJPmMruvnb52tp/7kFAOv7v4/?=
 =?us-ascii?Q?HzXrRglwPi3CkYpm4hIhJ0uGhG6WjXxg9ripy6+mrGZXIMaBGe5iJ/z+e2ll?=
 =?us-ascii?Q?d97j6xYDfD+rWu5z9SZwOf2Aj34bRWCgKIAHzag1xyurLbnsbTQRjm6/Daa5?=
 =?us-ascii?Q?JMtqZwpG1pDPd+Mx3pM141OJSftP2tssxteucWzGtUTIZ0fAfQmMa8QYipUE?=
 =?us-ascii?Q?aU3Fyu77SU/OsbdGjWYBUJaq0F0uTr8hUGV8C4SIjXt9ON1y0BpNiDoxOXQ9?=
 =?us-ascii?Q?ccYvCL+PRe7kGJx22G3k7VLM9iqqXzVRc0ozgIdUHr7Rg+vySIV0D5DaoJ75?=
 =?us-ascii?Q?h5eC08tfOvYOpuqlDFBDBr8HEq3dfy5PgtQEAd8/uvE39PpJAyV0oeQ2hYjd?=
 =?us-ascii?Q?m2oz0teGTJyMBXNrSm17jtPnMVN8/Ej3Ar4lT1t/Lyoj3V9DwndugrW+/AnU?=
 =?us-ascii?Q?7wra0oLBSFTqevQxxD5OZ8Wa75Ov0QQSbSdCE6wF1BsoEKLmCxFHF/KzQ6Pb?=
 =?us-ascii?Q?Hmoo958FAb7jNZfqh4JDykMNAPPyZH3CyEFbSY8GTap4z2wyiQIrLKVy5KJg?=
 =?us-ascii?Q?BX9RCBTR4FM0Y/jMR+ty0BxGMtE6c8xFu2yCanxL/jO5MvzRINPvDcoaOmTF?=
 =?us-ascii?Q?0YLSjPXPpa+5psq8OvQenVbTU5G4C5Opswzgmanol4vVQZCBVtmH/5RQfGr3?=
 =?us-ascii?Q?5y3lYgwCMPpdgftPe0MOcZkd0aeBGZ9wWm2Q4WjTWD+LmhoN+xj9HNvJq0Tk?=
 =?us-ascii?Q?89w3EGdHjGa5lGNHjVX7zIrRYxdaZrndGVfPHjLq+tWijhkCJk+jeFyRHmFr?=
 =?us-ascii?Q?3cpyfxSCbOxE/frvn1OcGQ7eadnGSSlPWh5EcqOcTxjN3/YjKFrOjz70F99+?=
 =?us-ascii?Q?99SXYBQwecquZr2Cf+0FaLqt+CiyGQS5Yz6KHr7Q/CLBqDTcHze5EtoSt7Xw?=
 =?us-ascii?Q?Gf9vsrvOtQdhuA+3Eip8QHf+yDkuf7Vo6SRQ778szOkkGdn+S8s6AgsQvbSk?=
 =?us-ascii?Q?OUqC8Z+o7NDIRzDGzaBGgOZdfSFqFYUwDIb2DdoE43lG/iekp3Oa28bqPJJo?=
 =?us-ascii?Q?FARjHDG/HR7cFw07zlkBiFCw0dQTYapgaaoaodL9k7XdsoqrJ5cnPUi9cX5z?=
 =?us-ascii?Q?LSRYbnlkjV3AxZV6pR+hnlJ1xSP60Rywn4l88Z4hyMaZ/87e/pm5f8qR/99H?=
 =?us-ascii?Q?PCHiZqBOpASv8oQjRHuQO5Q8L3qKMxfhyg7CjrVjKrxjUuGhyVJGaCWO5nzp?=
 =?us-ascii?Q?xfywkIp6qx1iyZiaA2lT/ssS+415A3Xr1g5VmRfa/LsqI6xfM5USuZRs7rWE?=
 =?us-ascii?Q?166BI9+zrOXPo1ey0WD/eyG9fxtAfKyFvGIDu4Vq1/pIunZmZKip+wwImKD3?=
 =?us-ascii?Q?hAKAlvuuEyWIQqFvQVzxQ8PyQLlfEOhWyGR1AxKSOtr3LiaznCYMi87lUpXs?=
 =?us-ascii?Q?CB6zx3JNpl+zVgCqALQ6VjYsY4VHmJtuDfPtbHktwd3uXnpP/vGbGNk5B81L?=
 =?us-ascii?Q?lJbi1Fk3GweJJVleabE0n0GtDc7mRU4l6k=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB2447;
 6:tx00LeKHx7M7WurMiTrgmOQE2x47jzMp7CI+HFh/L4CorIk/1iCZdzXTrhUUT/wGxTbn7iAbu2qAxqiHYalfVbN7UJqY03/IIp2PNSwR3cgTGenuPOGNeiPsqjmboVDcYl0NfaC4FGbVZ1HCAjEvg93xyeCzeeotr5GA300aFJsH/efJ8umDBB1m7eylIAgIxUuvh3UA3Gon80sjz81SQJkylUTl0wySeROcsPsBvHKwMHSDR47q5dw8k3gI/TtHZEDcGRxqK4sAH1YBRUgt6vH3i02c9eekbHAoNhcieKHTEUKQr1jD8VtkcsBIZazvx4cBp/mOVGk5TqMGMjGDUQ==;
 5:Fx7B3m/PVnf7FTk5lGxrNTHungmYfy5dJ4cSodiYPwJNpOh+my+GstWOKW/Cd5McpOcXBXsGYJROJgB1LNrh1az1PNnWsZ5ppzMYycQk+BMk0jabUOBmvoUpCcZx+5EDfp1qum58IaLlfmug5PM2MQ==;
 24:PlIbFNmghEUS0qIPvve/RonJZbgScK2KZjHSEdaT5K6VQr/Q3Uzv+eCia5jCDKctt9eBix7tT6zZLDx72y2AuutkkNfCF58b7hUT7wwXxsg=;
 7:/5ZoW/OyjHBT9jPas7f2JskwCf2BW8TWargOG51xlrRgaGh4sBAb/K6kZPrfFTTtexVBng4CVPzS1aXjTbO0oettf3f4COlrFTQ7U0NyKAo3EiSf0Nm8lr0BHadfoBz3pLatg2HHiOxftUOCDebIRz4aSXVzKzA0QHBbS/sv8dESqLv9CTxOKyaWBQznuagwI9oJkn6SBerarXocGvGmf7TPhJr+k8pwWAH97MCBIwib82NpaC45vaw7qZuMfrsIpA/fubDI+b2gLXdMUKBQ7r20QFL/ofnLF5Qqye3lospxt6EvHcGUZ751LUqdRJ8c
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2016 06:38:38.4778 (UTC)
X-MS-Exchange-CrossTenant-Id: f267a5c8-86d8-4cc9-af71-1fd2c67c8fad
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f267a5c8-86d8-4cc9-af71-1fd2c67c8fad; Ip=[208.19.100.21];
 Helo=[avsrvexchhts1.microsemi.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2447
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
X-List-Received-Date: Tue, 20 Sep 2016 06:38:45 -0000

--_000_C160D2872FE0DE4683E1910F9BF829413D2A3893avsrvexchmbx2mi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,


I am working on requirement  to deploy our redfish server on openbmc enviro=
nment.



Initial plan was to work on rapsberryPi3 board.  Since rapsberryPi does not=
 have full support as of now(Git issue #587), I am planning to build openbm=
c image for aspeed board and deploy the image on it.



I could not find purchase link to buy aspeed boards. Please let me know the=
 procedure to purchase.



Also if anyone can share some information on which board version/model I ne=
ed to buy for development, it will be helpful.



Regards

Arjun Padmanabhan

--_000_C160D2872FE0DE4683E1910F9BF829413D2A3893avsrvexchmbx2mi_
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<p class=3D"MsoPlainText">I am working on requirement &nbsp;to deploy our r=
edfish server on openbmc environment.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Initial plan was to work on rapsberryPi3 board. &=
nbsp;Since rapsberryPi does not have full support as of now(Git issue #587)=
, I am planning to build openbmc image for aspeed board and deploy the imag=
e on it.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I could not find purchase link to buy aspeed boar=
ds. Please let me know the procedure to purchase.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Also if anyone can share some information on whic=
h board version/model I need to buy for development, it will be helpful.<o:=
p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Regards<o:p></o:p></p>
<p class=3D"MsoPlainText">Arjun Padmanabhan<o:p></o:p></p>
</div>
</body>
</html>

--_000_C160D2872FE0DE4683E1910F9BF829413D2A3893avsrvexchmbx2mi_--
