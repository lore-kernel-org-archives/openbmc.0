Return-Path: <arjun.padmanabhan@microsemi.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::603])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK8Qk4f9BzDvrQ
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 16:13:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mscc365.onmicrosoft.com
 header.i=@mscc365.onmicrosoft.com header.b="eZuJ26Xt"; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscc365.onmicrosoft.com; s=selector1-microsemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LD96gp7IMl8Aus5470AxExDtejmwLpJU3RDu0JHIhDo=;
 b=eZuJ26XtvJ/ZJyW91mbmUyaEVXEEqDwgJtO+smDAyAsWTxhQml4tnifcbREEf9IGJ73MWnaYuQPMsia4g9XpRAwHv/cnSoDTHdgkHXp+fQsdC0Urd+N+ijBQHCAk4YF+xSHnQJvf1W6Diw/Uyx8ELmVtoRhYRXkOKwwBeYsOrJU=
Received: from BN1PR02CA0029.namprd02.prod.outlook.com (10.141.56.29) by
 BY2PR0201MB1861.namprd02.prod.outlook.com (10.163.75.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.721.10; Thu, 17 Nov 2016 05:12:54 +0000
Received: from BN1BFFO11FD048.protection.gbl (2a01:111:f400:7c10::1:138) by
 BN1PR02CA0029.outlook.office365.com (2a01:111:e400:2a::29) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.721.10 via
 Frontend Transport; Thu, 17 Nov 2016 05:12:54 +0000
Authentication-Results: spf=none (sender IP is 208.19.100.20)
 smtp.mailfrom=microsemi.com; jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=microsemi.com;
Received-SPF: None (protection.outlook.com: microsemi.com does not designate
 permitted sender hosts)
Received: from avsrvexchhts2.microsemi.net (208.19.100.20) by
 BN1BFFO11FD048.mail.protection.outlook.com (10.58.145.3) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
 15.1.721.5 via Frontend Transport; Thu, 17 Nov 2016 05:12:53 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
 SizeAsReceived:1297; Count:19
Received: from AVSRVEXCHMBX2.microsemi.net ([fe80::a552:1d60:6960:9da4]) by
 avsrvexchhts2.microsemi.net ([::1]) with mapi id 14.03.0319.002; Wed, 16 Nov
 2016 21:12:52 -0800
From: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
To: Joel Stanley <joel@jms.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Balaji Marimuthu
 <balaji.marimuthu@microsemi.com>
Subject: RE: Query on image deployment on ASPEED board
Thread-Topic: Query on image deployment on ASPEED board
Thread-Index: AdJAiqFB93/YZn8STQapL0m87vBlQAARQDmAABAw54D//4XOAIAAhOcg
Date: Thu, 17 Nov 2016 05:12:51 +0000
Message-ID: <C160D2872FE0DE4683E1910F9BF8294157425819@avsrvexchmbx2.microsemi.net>
References: <C160D2872FE0DE4683E1910F9BF82941574257CE@avsrvexchmbx2.microsemi.net>
 <CACPK8Xf5OMSNxDN1xnFwSYYbkUSJ9OC_UfD1zFbgu3ZizSJdtg@mail.gmail.com>
 <C160D2872FE0DE4683E1910F9BF82941574257FF@avsrvexchmbx2.microsemi.net>
 <CACPK8Xfm=Uaa9vp9aS7Lx-rwCGXHyGCgo=ayF_L6W6wM3HWCjA@mail.gmail.com>
In-Reply-To: <CACPK8Xfm=Uaa9vp9aS7Lx-rwCGXHyGCgo=ayF_L6W6wM3HWCjA@mail.gmail.com>
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
 SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(24454002)(13464003)(199003)(189002)(377454003)(71926001)(8676002)(9686002)(68736007)(6916009)(101416001)(106466001)(7696004)(50986999)(97736004)(2906002)(189998001)(110136003)(50466002)(626004)(92566002)(2950100002)(55846006)(69596002)(47776003)(229853002)(23676002)(5250100002)(54356999)(4326007)(6116002)(2900100001)(76176999)(5660300001)(33656002)(105586002)(49446005)(87936001)(53416004)(107886002)(3846002)(102836003)(93886004)(81166006)(2920100001)(4001430100002)(7846002)(7736002)(305945005)(356003)(8936002)(81156014)(86362001)(104016004)(36250200004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR0201MB1861; H:avsrvexchhts2.microsemi.net;
 FPR:; SPF:None; PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD048;
 1:7bfEVB3fc0Z8yWLML7z9JwT7vERInSJfzO+kQmsgGZcPT+eL2NPoKdcvOmiCkkFEGlhZGvXOjx5UxZS9ekyd0z6n6L8yLDt0sbyzXVPZajhi8O0cfYbqapdZt1L4U4stAQbBjFZYtnivE6b9b6pZdNBtNlOvCtLMgC55Z+8thJqfrFXf3Pa6sW3AwceM7T80VvxjZ7+FImYMtMIcLBOSEX6eJtDSHSQT3loAJ2qnjZ2hfiOi7UEyxkrXm8CHAlZ+zHQ0Gg1gBJ/qAXRaOKPkBYnPCHNAX5s0DpOMwhr+yQca1L1eZ93X9cCmCbTa4WGlxYdbBxNc06+QbhKnAZI8MKoIJM1mBAx3OhKw79T/nu364KAaLEepQ2v0xUIo5XZOR2g/sSubewiaz9QUwGUH+bLuxXEd6eMgEbdicCKhY2hffd3A4cKBUisPkk5ve29gnUBbkSDxnsnMIH1BJJF+YJv7JKzYK2tML1SG1AaX576MGPuRYIND/7oaDrsr848ihAkHo1mc66ShweQGMGAAdw==
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1861;
 2:tsIN8tA1Np0alJz929Y1tJ8hrJuMHEoMwa16hxv1KKjwDTcSybjxf16M3LH1XMWZupxI09JNgNnICZqvXl8fBSnndeZDzs94leniAUJzIeEONyO7Nol2phaSHMnye2AYZotX65K75q6Iu5LzzGSnhqMHi4r3eVwl6supLcXu+yw=;
 3:mQCPIqiMStxZ4Dd5K48kLHuFCE8CXcw3dKuiEk50nNoPbsCTQfVztdtlHuQSHWptTLeKW5ZFAkLodLCFj2+dSFDid39rk7dSdPuCmwq5wxoF4y/EJohLga1dwVkoqgF+YKSCqMS9elk6wlt4uF58D+A3U8HDa6UREt4nf7reZ+4YN62aAiJ1K+fTAMKD5o6DnkqBM2GhEmxutk73hEpt3zsCjbsHhxygyxorcEL5U2YD8tG146Vjz6DRjDgUFyd8ULv/fliuN+hm2p/BKvdt9Q==
X-MS-Office365-Filtering-Correlation-Id: 366d4e4e-f401-4faf-e7ca-08d40ea862c5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001);
 SRVR:BY2PR0201MB1861; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1861;
 25:81mEiv5d/EORsMFSnU5RZaB9Y9/MnEbhiOz0ahB1WRwVSpJULbXjsp0nK0sYV3cLrd/P/K0aifhECJc62fJAbMUez37WcKqYUEdOB7+6pYElCnUbW5Jtbib4FqinFTP33DVppo+wgp+zvoZTZswunRfVE54So/N7bC6D98J1EWtv9ClsvE2eHc/fqS2F1xvxWKIo1K/vcOfcCnDXW05dGIYNcBSgg4CUgEa70Pz+4nMtWRqultOQUeHTB631BEb++J4TwYJ/O5qNeOmZrEQhvlUIAoJb6JflqpMNhQKhMikUKLXf/9FXnDQ7SJpYsrpgRRgywIsjvEqPDyj1C0xcIrZ6p36Ci80/fOltn54afTPr0eLKlGOulw/7lvLahYpAI6TV7UE/nNLfpXR6/JgtgAzU3vwkL5oJub3eWeQ/QWO+4l2JK20Q6HhZIv+Eu/EbuxthX0K5TPjeDEefEb0kPwrL3L4yHIbybABqe9S21GQRWV+Ecfls2Zjv14qSqB9ryF0O2mgO6U/NtUE9S1txfmUmsD+Kt4m0GwjSa6RUnYFPj6C7yUR/h08qHnjEm2PH9tyRNv18VvRELzB4pVqWk64C7Gt2XIBAjvZFpGM2qW/t9IxYJGkfqFmxDb2GM/pXmwsShzOuoi+ZeLyxSO6LUb8rEOzVKt2wA5daaG9lCrRck+o7D4k90kAHJ4E9makPGlZUx4vjx774I2uGi68onIb8y2kq0uoQgB/UAIjzHrnbLcFNomsAA54JNNIJwoLT1PFqWaSDFw2jouNJB4gG2vOO5JBi+c7M5XAMQcNNQIf5rB1ERZwyCs6Bdwh7L509ai+iKQj1mAyfLcp0yIPDChkdcIxVHcO73a8NJ/upv8GN491kz1u4JYbZaft9bufGZkQxydHHDXMHFf4xUREFeg==
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1861;
 31:6PqTgsJAcAjTxsD/P66QXrXN9Pw4Mm+hjAG0o7dQRfcmNh2jLvfoOcl56633x9bILv6IfZ7UjAc6/PTcmAy1zPdyAHVLpNGxRAwwL7EYKeuRboH07xDe399VCrurYnHVJK4DBV+dBslnyoyWvt+Rb6z6bTEwwQ1SiV3HotJthrZvGyYDee9lg+oSwVgkFEFsvqX/u1PGNSiR5ZWaHDok8kjjojTk5pLFXfIcn/JMIdBZEiAbvTFu2UR3s1HBUr48K+PKbWwIgdJ0RGooLkKrsg==;
 20:bU99hcTUasBKjWKApDQqnrePVQ359Z18iHGzW+PdPQDsivI07qeZt9X3opl9ggI8KhpNJpYxOoeBjYS7YPnrm7mCKescHFAX6HU6ZzjTbo6kEsjJlXJTrf9M5an6riNHXIRENzJno7Ef9+pC/haVBwBS8G0iQSP3248ZiG5YR6gKYSbCS+KJEKd4j0IWCXZM1rFMOGtEvOGPoGVOoFUtEQ1cVeJqu7TNxQSaUuj1lq1UWIR1QZMGrjimYsVV/Zs7IXMePxvJe94yjHwoBZ+XPQ6fVjYdnSKuC5oHMiF64bjFj0m1QhLAfgiOO7zVhZ87/b299N9r2Us6XWfb+i3jTd9/FPeD544ES/dqKLon9qhSWcilgD6mmx0coAQNJTzCVQBu9f5AGwjbVbuX2ESKLM8XFGK+GPm0Yw9NXXpTpSVNeEeTAGpxcKI67i6WCr+4mUx7DDcECuMmyToYxJFPWdb8dLl+Zk5VxHiAGnnaQ1od+SYUJS7KV7Iy9BxDcdq3
X-Microsoft-Antispam-PRVS: <BY2PR0201MB18612B61E9A820D63311F0F2E2B10@BY2PR0201MB1861.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(65623756079841)(72170198267865); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6060326)(6040281)(601004)(2401047)(13016025)(8121501046)(5005006)(13024025)(13023025)(13018025)(10201501046)(3002001)(6055026)(6061324)(6041223);
 SRVR:BY2PR0201MB1861; BCL:0; PCL:0; RULEID:; SRVR:BY2PR0201MB1861; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1861;
 4:lJ9qsAmLBIqUA26bOvWOZmGYsF+MeUWFRldiivN5hsTFc8xHuMmXVaITvPYVkStXQvjCGCj9QTuJqWRVFi1eDtdMN8DdYZ7kFZNtvDriWz/ZNv33lWmuvznIf/As7q0arOV5gayQfJ5EanGNqop1PglDjJtuBcMHLWaulCl14B0Z/RFuvyZAuzp6vKlvFcSQWO/feLPDHz5yJJ59nNTzWEFGyCCjmimyXe6asE/wGTi9Hp6eDUriOGIPeCJBHEPKSrUbDq0NsvfNk+Axjz+7KdYx6BnW5YftOBxQe0tgF9Co85o4E27UdI7MN8yujv3z9Qt+IKj+AKslV3utxeSZ90jPBCz+41OIxnx64flmohmctUtYiLE2f+LlAhNQkvCK+3BUUn5qsLqCjIsyZ5y8CwAM/reKPn8r12cZXabI58UvGRFQfec8T9EXLwZqcS0xh+qXTsvCsDFLWfIMbqW4B659BgXu7z0sU0AK8s9imSs16hRUT87RXCPBCQHMSZA8Ts/lFqaS/ZmUu6N/RW+ao1RTzf9iH7iQ7q53ozzlzheHaB+j19FH1ZzlKiZcOPZ7TKheqcs3bbFcAPZY/aw12t4VAa5pA3Q/RIg29UC5o+yHKuwyHf96Hy3EVPxxjCaOROtppTnlvABtSozuxjA7Th/tY0hsSBGuT4TOYc/pzTA=
X-Forefront-PRVS: 01294F875B
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjAyMDFNQjE4NjE7MjM6Uk5XY3FlUlRwN2lxczF6V05kOU1NcThi?=
 =?utf-8?B?RXlLeTFjUUNGR291eEJrZU5mWG5yWmk0dVk5OWdjVXdpOEQwa2w4RTMzdGRC?=
 =?utf-8?B?Tzd3MXl5MFl3bjBtdUEwWlpqTEgwaHpBNlBPMDdCRGJhVEg2eVJ3SGphMytL?=
 =?utf-8?B?bTFVaktzZXNtVDBFL1MwVG94ejNaU24xWHNyTkhjclNwTUcvcDVWYVpnNGZ2?=
 =?utf-8?B?NGhsQ2lGWWQ1NFdVK0pZam45Z1VqVHJlaHRhNldudjh4Q1BlaUZMRk1ERDE5?=
 =?utf-8?B?NWpWQkIveFkvdWpnemI4OGNOZXh5SnYydVpBS0JQQlBnME12bVlYTmthcW11?=
 =?utf-8?B?ZDFFcDZZYmJhcFZ3QWFqNmUvaWNRcC9wbmhCUVh3NkFwb3lPS21FTW5rVVdw?=
 =?utf-8?B?Z3dxVzlnQ3V2dFpjUTZ3S09xL081dURRWmxXRk00bVY5OVNNQ0svOHJ5WjI1?=
 =?utf-8?B?WFRqVGQrekVZZmh6YisvSUswQUtJQ0RiYTl5NFNDYzV0aVExSVBpS1Y4SFoz?=
 =?utf-8?B?TEZZZHpKQnJjOTVqMS84c2tCTHhYYzR6SkNBZ2gwV3lrd3B6NDhSS1MvaG5J?=
 =?utf-8?B?N2JtY29YVk9qczEyTkU5NkI2NnI4M1J3bFJndmNTbnNXYVNkeGw4RTJtRHM0?=
 =?utf-8?B?WTV4Y1I2bzZaNUQ0bG9PektJYkJtdWhnMlVxUnkvbTYrU0lDUytwVFNhT3dP?=
 =?utf-8?B?SG83V2NDMklZRlMrd3NnK0d0WG00RkQzN0RzUDJEaGVoTCtrdDlWaDRmdm5F?=
 =?utf-8?B?ckdmL1BPNGEzeXN5WktnZVVMWS96b21Qbnhnb0FQSS9oMDMxbmduZEZKK3Bh?=
 =?utf-8?B?aHcxR1FHdkxBSHlqVTd2SDJUOFFpWkhUOE85VUpsK09lSVVkdFpkYjBza0NM?=
 =?utf-8?B?Y1g0NnlMSi9zaFo3WUI0bE5acGx4cXA0eDg3TlhIcGFlV1NTQWg5ZFc5bjVX?=
 =?utf-8?B?VGpFMVJuN2VVZzBtTDgvbHBRZk96TUhjK3N1OTd3b3dGNjdoeHFoZEFNL3dP?=
 =?utf-8?B?M0c5cGpKMFNMZURoSndtM25PS0lxOVk3TTE1SXpjWm8wNk5UdmpQcnlRUjBa?=
 =?utf-8?B?UVRtbnNpR04ycWo2b0x1YjFaUW0yR1ZnK294Q3BaY3pGOGdOMUZENDdXOGN2?=
 =?utf-8?B?SG4yN3dFUm5xcW0rVjlHVnlERXVwRmcraHNCRjlVVlZqaGxENU9NSVEvbGNs?=
 =?utf-8?B?VnNMcVB3dUVEM1VPdE4wcDJhdERaZ2wyWUZGNjh1cFFXNGJYc2VFa09Temxn?=
 =?utf-8?B?QmRpc29jaE5zRXdQUWlrWUMzTkJSVG1NcHFRektXOWYyaS9OOFNlWFh6ZFhT?=
 =?utf-8?B?WjYza1V3ZkU0a012UjNESEdTSVk5NFJRbGUxdkgyZWY3WEc1emhtMVRFdXJD?=
 =?utf-8?B?RU9tVWZxZlZOeldNcUZ0TkpOaVJ4Mlo3d0Ezd3JDeW1DMEVFU2hSaVpRV2JY?=
 =?utf-8?B?L0lDR0FsdW8zeFhtYy9kRitHVTFwM2p0TnZSRUZRMXB1M09xNXpyeWxBTCtV?=
 =?utf-8?B?RUFxdHZvbUt1cjJaaDBjaVZyK3R5WG9IcVJBVkRhU1diaGIvMWI1Rk8rTStH?=
 =?utf-8?B?Y1JjanBMRjZRSkFGUUdCL2J2YkNGSkl6U3NCZ2ROZlZBTVlHYzRiZkVGalEx?=
 =?utf-8?B?ZWVxTlR6MWx1eG5qeXN5em1MNk94VmU3bVd6UHIrSHhITlJrNlZPbEE0NmlL?=
 =?utf-8?B?NEkrK2VtU2piNFNLUmZDV1VpWGlTVnBDZkthRjJXaXJUSXJ3dzF4VmFxWnhJ?=
 =?utf-8?B?dE0vTW5BeFRzTFRVUHNFbTA4MVN4YUswc0NiOVJBZlJMUWV0eEZkcTNmckdE?=
 =?utf-8?B?NjNrUzBqVGhWNGQ2VzI2NGJxcStyWTVUK3N4QStjYWdFcnZ1bVlnODJodkNz?=
 =?utf-8?Q?6bXMr6U3YEhNg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1861;
 6:bxm+ap1BlN3joTpCS6gyBsXKhijCprjWWHowQfnGlyscN1+hNLIOO35LN5+VDtnpNjGVzlkFkJLCJes2OJDK/g8RYNdyt1y2HaMI7IlVzke/8wVTWEYoA8yOkVOYSKvTTvqqySyjz6snOwUVowSAwsHVyg4uhfMWwBVdY9d73l4lLVTI2Zs2X7WiiH3Ljt6Bp+kDAaOOkwwhkJdQZ6qMi4Kft6r3nGesBQMf29eLycBFh6J8EuoASeeN71p7FJxFyyYa1MkjnixuNReYqe2A+zr6fVR/LydAzhUw2Sopex4DIi4ogL2NRNSq/oaCHnEzBsaqTs/JDCJrVkst0e8/4w8fLMUJnI4KNmol7b4HUCGhQDu0DOpupbiI0WU7IxoV;
 5:kKnROsSVlhljs7bgc7k6P5uAXCGc0iH3dyZrb/pL6yquhJcrosUCyg5bYGFSXKNuvhbbCHJ4GTayqmKkaZhHW28fjEq8KfmtuElV9c38jopOqd0tdW+sscveeL9iv3Bvnu2xGBQkIU0CwEmF75QLgw==;
 24:xnPKFkprLjVDGyZAGuRfjsE79eAASn5WJZkuqISTL6OF20YPrIbLVrjU8kRN8fguM93HykPVKhTF8jym6yLZVULG/zQeXv2wfsFuFRJM1yg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0201MB1861;
 7:5iyH895clbl/RSeLCn3zLW6tL6YqnU0nB4Shne1QZR8boPMYVFimWcrR4kphxp4HRRUfR/3Vz4/ayB+XUH3qmT9b4XO0Wqp2fzZQa7uTfS6x7essYSc0a4u70CF1eRNH9bFf66tGNMs0OmGiJ0M/AmS6ACDHLHOkGmZexNvefHk2yovRtjnzfCSOhOL2VLlKT/qfItAiNalCcdKz2VmhFNRrFjfI8sAx2sLClxIsojwJSy9PY+bZMRWKz5QjbT2rDsYR2oRhbKuMP4mgEbJHV5/6SiKiH+sGYHi/0Q3WOlEOAd7/HWle839zi/NRJejA4ua7MBV9m+tAR6zXLhbyIhD4kqCy5y1x4kHQgZ2oC2c=
X-OriginatorOrg: microsemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2016 05:12:53.7082 (UTC)
X-MS-Exchange-CrossTenant-Id: f267a5c8-86d8-4cc9-af71-1fd2c67c8fad
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f267a5c8-86d8-4cc9-af71-1fd2c67c8fad; Ip=[208.19.100.20];
 Helo=[avsrvexchhts2.microsemi.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0201MB1861
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
X-List-Received-Date: Thu, 17 Nov 2016 05:13:03 -0000

SGkgSm9lbCwNCg0KPiBJZiB5b3UgaGF2ZSBhIGZsYXNoIHByb2dyYW1tZXIgYXZhaWxhYmxlIHlv
dSBjYW4gcHV0IHRoZSBwYWxtZXR0by1mbGFzaCBpbWFnZSBvbiB0aGVyZS4gSSByZWNvbW1lbmQg
dGFraW5nIGEgYmFjayB1cCBvZiB0aGUgZmxhc2ggaW4gY2FzZSBpdCBkb2VzIG5vdCB3b3JrLg0K
DQpOZXRib290IHdpdGggdGZ0cCBpcyBmb3IgYW4gZW11bGF0b3Igb3Igd2UgY2FuIG5ldGJvb3Qg
d2l0aCB0ZnRwIGZyb20gYm9hcmQgaXRzZWxmPw0KSSBkb27igJl0IGhhdmUgYSBmbGFzaCBwcm9n
cmFtbWVyLiBJZiBJIHdhbnQgdG8gYm9vdCB0aGUgaW1hZ2UgZnJvbSBBU1BFRUQgYm9hcmQsIEkg
d291bGQgYmUgbmVlZGluZyBvbmU/DQpBbnkgb3RoZXIgd2F5IGlzIHRoZXJlIHRvIGJvb3QgdGhl
IGltYWdlIGZyb20gYm9hcmQ/DQoNClRoYW5rcyBhbmQgUmVnYXJkcw0KQXJqdW4gUGFkbWFuYWJo
YW4NClNvZnR3YXJlIERlc2lnbiBFbmdpbmVlcg0KTWljcm9zZW1pIFN0b3JhZ2UgU29sdXRpb25z
IEluZGlhIFB2dC4gTHRkLg0KDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IGpvZWwuc3RhbkBnbWFpbC5jb20gW21haWx0bzpqb2VsLnN0YW5AZ21haWwuY29tXSBPbiBCZWhh
bGYgT2YgSm9lbCBTdGFubGV5DQpTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMTcsIDIwMTYgMTA6
MzYgQU0NClRvOiBBcmp1biBQYWRtYW5hYmhhbg0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
ZzsgQmFsYWppIE1hcmltdXRodQ0KU3ViamVjdDogUmU6IFF1ZXJ5IG9uIGltYWdlIGRlcGxveW1l
bnQgb24gQVNQRUVEIGJvYXJkDQoNCkVYVEVSTkFMIEVNQUlMDQoNCg0KT24gVGh1LCBOb3YgMTcs
IDIwMTYgYXQgMzozMCBQTSwgQXJqdW4gUGFkbWFuYWJoYW4gPGFyanVuLnBhZG1hbmFiaGFuQG1p
Y3Jvc2VtaS5jb20+IHdyb3RlOg0KPiBIaSBKb2VsLA0KPg0KPiBUaGFua3MgZm9yIHJlcGx5Lg0K
Pg0KPj4gSXMgdGhpcyBhbiBBU1QyNDAwIEVESz8NCj4gSXRzJyBhbiBBU1QgMjQwMCBldmFsdWF0
aW9uIGJvYXJkLg0KPg0KPj4gSSByZWNvbW1lbmQgYnVpbGRpbmcgb24gbW9kZXJuIFVidW50dSBv
ciBGZWRvcmEgbWFjaGluZS4NCj4gSSBhbSB1c2luZyBDRU5UIE9TIDYuNiB0byBidWlsZCBpbWFn
ZXMgZm9yIG9wZW5ibWMuIElzIGl0IHJlY29tbWVuZGVkPw0KDQpOby4gSSB3b3VsZCBuZXZlciBy
ZWNvbW1lbmQgYW55b25lIHB1dCB0aGVtc2VsdmVzIHRocm91Z2ggdGhhdC4gQnV0IGl0IHNob3Vs
ZCB3b3JrOyBvbmUgb2YgdGhlIHRlYW1zIHdvcmtpbmcgb24gT3BlbkJNQyB1c2VzIFJIRUwgNi40
IHRvIGRvIGJ1aWxkcy4NCg0KPj4gT25jZSB5b3UgaGF2ZSBhbiBpbWFnZSBidWlsdCBpbiBvcGVu
Ym1jL2J1aWxkL3RtcC9kZXBsb3kvaW1hZ2VzLCB5b3UgY2FuIG5ldGJvb3QgaXQgd2l0aCB0ZnRw
Lg0KPiBTaG91bGQgSSBuZWVkIGEgZmxhc2ggcHJvZ3JhbW1lciB0byBmbGFzaCBpbWFnZSBvbnRv
IEFTUEVFRCBib2FyZD8gSWYgSSB3YW50IHRvIGJvb3QgdGhlIGltYWdlIGZyb20gQVNQRUVEIGJv
YXJkLCBob3cgc2hvdWxkIEkgcHJvY2VlZD8gSXMgdGhlcmUgYSBHVUkgYXZhaWxhYmxlIGZvciB0
aGUgaW1hZ2Ugb2YgQVNQRUVEIGJvYXJkPw0KDQpUaGVyZSBpcyBubyBHVUkuDQoNCklmIHlvdSBo
YXZlIGEgZmxhc2ggcHJvZ3JhbW1lciBhdmFpbGFibGUgeW91IGNhbiBwdXQgdGhlIHBhbG1ldHRv
LWZsYXNoIGltYWdlIG9uIHRoZXJlLiBJIHJlY29tbWVuZCB0YWtpbmcgYSBiYWNrIHVwIG9mIHRo
ZSBmbGFzaCBpbiBjYXNlIGl0IGRvZXMgbm90IHdvcmsuDQoNCllvdSBjYW4gZWl0aGVyIGJ1aWxk
IHRoZSBQYWxtZXR0byBpbWFnZSB5b3Vyc2VsZiwgb3IgdXNlIG9uZSBmcm9tIG91ciBjb250aW51
b3VzIGludGVncmF0aW9uIHNlcnZlciBoZXJlOg0KDQpodHRwczovL29wZW5wb3dlci54eXovam9i
L29wZW5ibWMtYnVpbGQvZGlzdHJvPXVidW50dSx0YXJnZXQ9cGFsbWV0dG8vbGFzdFN1Y2Nlc3Nm
dWxCdWlsZC9hcnRpZmFjdC9pbWFnZXMvcGFsbWV0dG8vDQoNCkl0IHByb2R1Y2VzIG91dHB1dCBv
biBVQVJUNSBhdCAxMTUyMDAgYmF1ZC4gT24gbXkgYXN0MjUwMC1ldmIgdGhhdCBjb25uZWN0b3Ig
aXMgbGFiZWxlZCBERUJVRyBVQVJULg0KDQpDaGVlcnMsDQoNCkpvZWwNCg==
