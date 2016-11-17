Return-Path: <arjun.padmanabhan@microsemi.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on0078.outbound.protection.outlook.com [104.47.42.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK7Nk6Q7dzDvrL
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 15:26:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mscc365.onmicrosoft.com
 header.i=@mscc365.onmicrosoft.com header.b="U3M+iFFl"; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscc365.onmicrosoft.com; s=selector1-microsemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=plrujJPGGix/SVstr86CSJH/0/6tgnQYYyAcgf55W1E=;
 b=U3M+iFFl51myu+jNCITO0Mmk8bDrNL3x5OJSZ/Rcbz59C9ikzocRXccDq2EwemEWP6XxJEFmVBbd+y6bDpYBNHOrbdUgohiOPW7QxyFtNeS0cJNSPdPgQfSj30myQYge8Qre3v2G1ihOudPWE2hMNVe/DbyHVJ4CLDLmYVjdttU=
Received: from CY1PR0201CA0038.namprd02.prod.outlook.com (10.163.30.176) by
 BLUPR02MB019.namprd02.prod.outlook.com (10.242.191.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.721.10; Thu, 17 Nov 2016 04:26:06 +0000
Received: from BN1AFFO11FD022.protection.gbl (2a01:111:f400:7c10::162) by
 CY1PR0201CA0038.outlook.office365.com (2a01:111:e400:58b9::48) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.734.8 via Frontend
 Transport; Thu, 17 Nov 2016 04:26:06 +0000
Authentication-Results: spf=none (sender IP is 208.19.100.20)
 smtp.mailfrom=microsemi.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=microsemi.com;
Received-SPF: None (protection.outlook.com: microsemi.com does not designate
 permitted sender hosts)
Received: from avsrvexchhts2.microsemi.net (208.19.100.20) by
 BN1AFFO11FD022.mail.protection.outlook.com (10.58.52.82) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
 15.1.721.5 via Frontend Transport; Thu, 17 Nov 2016 04:26:05 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
 SizeAsReceived:889; Count:16
Received: from AVSRVEXCHMBX2.microsemi.net ([fe80::a552:1d60:6960:9da4]) by
 avsrvexchhts2.microsemi.net ([::1]) with mapi id 14.03.0319.002; Wed, 16 Nov
 2016 20:26:04 -0800
From: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Subject: Query on image deployment on ASPEED board
Thread-Topic: Query on image deployment on ASPEED board
Thread-Index: AdJAiqFB93/YZn8STQapL0m87vBlQA==
Date: Thu, 17 Nov 2016 04:26:04 +0000
Message-ID: <C160D2872FE0DE4683E1910F9BF82941574257CE@avsrvexchmbx2.microsemi.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.34.10]
Content-Type: multipart/alternative;
 boundary="_000_C160D2872FE0DE4683E1910F9BF82941574257CEavsrvexchmbx2mi_"
MIME-Version: 1.0
X-IncomingHeaderCount: 16
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:208.19.100.20; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(189002)(199003)(5250100002)(5000100001)(84326002)(8936002)(50986999)(68736007)(260700001)(7846002)(1730700003)(4001430100002)(356003)(6116002)(2906002)(790700001)(87936001)(102836003)(97736004)(81166006)(2501003)(81156014)(4326007)(9686002)(104016004)(107886002)(8676002)(3846002)(9326002)(101416001)(106466001)(69596002)(7736002)(105586002)(71926001)(55846006)(110136003)(2930100002)(2900100001)(92566002)(7696004)(6916009)(33656002)(2920100001)(54356999)(626004)(53416004)(86362001)(5660300001)(2351001)(49446005)(512954002)(189998001)(450100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB019; H:avsrvexchhts2.microsemi.net;
 FPR:; SPF:None; PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD022;
 1:7rsIQWH0iZd9zQanQtVofSOFOq4oD5K6NZ4AtP7znL5a8HHiX4ogYubpudRu89/Dw30nF1Tw9ytop7puQfU5ZpbG3o/6AL3Yu5cFyib0QME/im71WVZyPKJTZV46vdPN7QID+fSpuoLmhVyqPPHcQAJCTxwnWeJVGfpaw/49pwOW75lX+Xjs0yoRn4Co1eMQ7HWU8kfv/E7dyN4NHtmqaAyW17XjjkPnzWHF/e+GLqc3sclinZD9fiw+giNZRZc8IVIbgDTRWMu0ZVvkxOdHL/bmMNsjIBKMtzd+l0UqoH7tYUUhL+La/8dxaehfea7UBHZXzxVMP68im785BN2idK37M4c0xXqW9qdT5Hypa6QdvgY4AikKzx+EMteh/keMftyiVKmiCAAlVkqr+4GS/bDv0j/wOX55/A1hcvGq7eIIHglthQcaEtHyrJn0BaIB4dHbKVLXycu/eo5nvpRmmPVuaSrK2hmQo7hcGikBg8Oq+8678sz7QkeBZYWOxqG1JtLtFk8tTrRi8u6EzBIaDQ==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB019;
 2:GJXdMEI8GjGnekpaS+JaVubw4RUeS8SWmQU0bszQdmNgMvxBPagGP+lNB0mrxl/J8H6ZLesS3rM1zyqNRrApdcKZypPsCymbZvOZiTM86L8fk46p8r855W1aWQL1IPiePVbYZxvWGPr8RxClQfcEu2iVjW7SpK3h3DeVzJUJAGA=;
 3:BgPh9Yd4ZQ2+iHidzjQvQpxM6blvEgpOb8EjmG8uGaHckgq5pjLfL1g25EubD4jqOfRcSzkjnQiKfDIBudewTq2q7F7bM9gcA1DyyUdjuS68xYu1I1iioPr4vjEwQNRfOdE93C3eUk7reD/fLNlfOj1e8o/slUHyix9ysDKeDA4rz3GJEGEgPt/QONEInZLN/An/K1fM3iZ8LneDNbiHW6VWmJcGIV+gKhJCoahL1eQzUZyEn2D9lHDxTXKQaIDRv//asF6jQLSA0EmOj/yFOA==
X-MS-Office365-Filtering-Correlation-Id: 882132ac-1d40-4e6f-a11a-08d40ea1d923
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:BLUPR02MB019;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB019;
 25:5q16m4LfRSehELP4KA+zIvyq4r3DlGY1jegQcxI7CaJ5V6H0f/FOnFzTnMsyqnSUypACxOKlFNLscTp8fu1tTJQE0EANzvG2x23/P+9bcolbpcDX8CtY+4WHHm9aq6HlQKpzH9NRKVguA9Zpt4etE6aAKoU89hQlIdiwemK/sf+j8Alci1BQzKf/y/rXGHgmA0OOttI2+YZMHTM9JkPMkJ5kap4zmookXZWQbVLaY8nnh+NzzyS1WHWeY5Iz2+1Ure8F5dBMfI3EJBAcnmAIadS0Qhb883m5FAeCUzKdVovFKisVz9oSkShkvWRtMJArlcCYCZ2AvOlkjcm4hw47WRR4cY2koeXEAy6/JspWreXQI651r4jw0K2daVusqX3qJMBpoIPJzeBDbl6egfiLWIZac/p31YJMJGy6Au54y/tnoKr195J6DbGP4ODCb5AgSgdu7hk+berTq+Pjljy9tnDe7ZljRDXchShVkO4RoeG3k/V7w1bnx8TPTLSzKhdWsJUEgjQOEHux0sRe2HYWkqiDPHP8lIe4NEs9wifiQnLOeP/BEWMY7YOILH+FnGb1YSgEOURW+aoNa6sUYgpWn95TPc5UpC+w/LZg8TzkuGMlnY8TK72nRYxoRlKEDgGdhsYRxLsR5svh9fHc/F8IL9L4blr3QrESUkYN151aYTxUPnq34FDgA65ir9GUEQLYJ0qHMmhXZEwrVu8aQOXgSrW68shpP353KMyANqvHjYHTkkNuQSqsy2TVj/QnuhTY0LTAU0Ll+LyqKJLxnnOUKNvnsjS6RyjoHbHTcy1Bvok9hDbsW4oVpFCnIbDOjvRIiAb4REpjZT04HGYJvx5peHRmfoz6QJI1nTqhIu9YUjeo5LnZLBTN+GQ3rEUYPX3t2tHd5o/tP9XKTPVSJilSuTzvbVQawtXTnUKn1XKubceF7Z9f7e6PlF0Srjjc1hLf
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB019;
 31:JgAW7NAoFO8SxbcZg5JWPvaxuZdSpxV3II0/Di8alZsmT5cON+djlUz2kHd09gZT38PCrq/CLhFB+3+Djh2S62O11IPnbSY+ITBEOKmPWYzLjo/M6lI8Uk9iBDON8dlSDBlw66GkDIY0f6voYKSPc8uh7U3R/AqnaTtcIt7C3UdUUU+HarAw0BB/e+c5Kg5nRpZ8zjlGvHXSpLbYZD/eLzPNhk2g1uH6fj0nTLbhyMmxGX5HZ+/6ygS8YgtuR3swtq05FRUQkyMsTiXWJFG0gA==;
 20:CgS5unamUMl0mccM+TrTQHVIA/fQM3RLDsXktj7NgKsLgdVDlL4lNZCjDkO2fR0a1kg+EzNPrC1Jnxn1fNTT76KbBMRe9ibnSAAFDzy1IYgK3+wpy753HeC1uFAijvv/8jzxtOBMlS8LG8SlC4+nBxO8ogGqgz4R7khtyFap6TTfTwZDIMU38QYdbZPCJ6k2yhbnaFxfziqxzoYMJg4CSDBxVqPWkk6P/uMxHcGDClcybbwszQTGF3kuogslRrdO7SNKaDQmu37NpxIRdwh8wX8aps3PsMYhWcqMwFVEVp9LbJA++jHB2SemE16DVPS1sk7w3oOX8xxAbOc0o59SZbgF0veLciVi0qzwChGQjk0Zr5TGxgEBRRtOPXtsqKXKYh/+bcRc63GoiDdJgPkOkZcx6OU2YHZp0KN36mUD1cX4PtLR/TP0AouUZuMIBlX9Aa3+6C2AKGovgzYuLjfUTuO66FeLWTCH+Tqy1l9KbN+0Vn8RJPS+frjsWV4HHPXb
X-Microsoft-Antispam-PRVS: <BLUPR02MB019994580EE03D5998D122EE2B10@BLUPR02MB019.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(21748063052155);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6060326)(6040281)(601004)(2401047)(13024025)(5005006)(8121501046)(13016025)(13018025)(13023025)(3002001)(10201501046)(6055026)(6041223)(6061324);
 SRVR:BLUPR02MB019; BCL:0; PCL:0; RULEID:; SRVR:BLUPR02MB019; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB019;
 4:2/kpv3pTmNdJDJJbu01UKMajhbo3coTa7fa9JSiYSES+U4DQUEmUre+2WINzPtqsPwxw1d1VvLT6Ml2h/5fJzvNw8K5EvrmyECpGaizMJphd9MKAqCVWMebt2XURJf/62KQkNr3qymePzkphL/8UDeP4IG+ChoisbYO+RehlKidbR3QBfMeNKpOu5vDaW2sogR/LO9ZkJJUPz6p9KD2SIGLi9W+iUdLX8MsMC82M/tD7NIhylawl77M0Jr/2Y9l/OMq64IDpJgrw2HfX1d+ANS5Hd5Wq7RPSk7DTNJnA5+1E2tC5kszRowSWkmLqxH5MaOpqbPSAZPerAu8NaDmzfO3u1Jsu7wsKjB3M93ofhJHVsvMnO6KN3skWdpW04+VCNdBqkUepb9JdeVB0qhq1kMi07C4BUYfm0jjNl1hkC9ELdCoKCuvNSPPgHLoqzYydj1rSsyytp2cL5xizb9SezNJhqFBd2XozckLLjuWQr3RhHI2Li+X8nHGqORYDE1T8bqauFjkt7mkHUGUDLb3SxoaS7TnyOBypiRry6DN4D/ZlGXfU4wxm3urpGAYK4yNgTpy1vLvdQsg33v0OY7hp9A==
X-Forefront-PRVS: 01294F875B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR02MB019;
 23:Uw0u2MidpcZ+e+VR0dsfo8BXX3wqRH81bGlU9Pjv63?=
 =?us-ascii?Q?akbSuzvdqw9T2IKbRDt9p2I+GUyf60BHF1rsXUy43qz1sjO3kA7Yr7hP4fWB?=
 =?us-ascii?Q?VB1NJZ208WUcKG5ciQBC3d6ebjbcvRfFsxW1obhllvZSMqLkscqDNZnvtwYM?=
 =?us-ascii?Q?gu+xjaEIAa3qK4FkwJcGNpWdSXjlAZ79UUVrPWxK0cdlFuVQYjY1FkULmoG0?=
 =?us-ascii?Q?aLX+Bx8jUqEvl8KqXST6ijmZuOUdFAJ4bgJjIQgVWrxlnatwI0q1be1iudXw?=
 =?us-ascii?Q?CgFuPn3j5WZEDjbXd2VeAUMB5KNfF7wkiuTeyWF0JH32GMH+XMJovjPHOKGy?=
 =?us-ascii?Q?HKTE54SPKM7LJCduEYRpvOXIGY0R3oY4HcmMLb2RlOfjThQU1UeSTrYo2OGp?=
 =?us-ascii?Q?cVmF6fPUStaTGm01+oAOJ0jZRYQ7JfsaKbdVORacQiXfVJUo32toX1qW1OD+?=
 =?us-ascii?Q?L7omAvND0JmY2XsHissvVkJ9CQX2l0CTPJ0XI+PcSWxyK3yOhy8CvHZwL8X0?=
 =?us-ascii?Q?5bD4suwk6SBZiXb59GRYLFow+AwWk6UYeUT1iMA0q+1sDf/6l2JnAPJzNpde?=
 =?us-ascii?Q?GkvB9DVm8dpb9zSwVXYZALzzFbpa8MyaVepXstBc4UjuAoWE8czRkhJ71dC8?=
 =?us-ascii?Q?F0BhhfyvIWraqq8FwLr8Wq3xSAuvTByakyy4SqJjOLtByOG3Vf4nbEMxGHGy?=
 =?us-ascii?Q?qKSvARZ3RCTEAAq6/VQPbmUwmstUDDzZgswThkCJkO3Tzz4ldcwBVRw8YV3i?=
 =?us-ascii?Q?6fYy50YilZm0EO6a+xPiYiZ2YfpC9K2G/CS43fSPOla08ak/fjvy2WL2NhBC?=
 =?us-ascii?Q?mP2KYGXV7lEQ45IriTdukKAO0W/WYj6Kc+ILzasMke3dNh5ULgyAzxuNQUEQ?=
 =?us-ascii?Q?AR46WcrLugX5BPUdSTMElFz4xkDtfCjXsfscVzngsPSCaEoxGyHuSduOclrB?=
 =?us-ascii?Q?RAjjiEdcU2FNHdKu2Czv5UOWyXPbhCG5CODQsUdAKgf/fEQXZ+V9EPLVtkcn?=
 =?us-ascii?Q?14Xz/1kK8uANXFUsCKtrRfbvbiM6Ll/JrF7V5PkR2cynch2YBSRI6ByB1Iw7?=
 =?us-ascii?Q?qAPxxtd2q+hiw6UM5C+drw8C9Cy37vtputzzbBgeVd7iIodWJulw9SRIcjFQ?=
 =?us-ascii?Q?t7XwoQhu9+wpuHDlNsQlB9+2xX8By/+vqaanAkzSJiuKc2i6jArF5rvlF0VD?=
 =?us-ascii?Q?CS1ONhgI+hfHx1UpmDd3FPFYH2Re7zbiOXUnJWHowfUnc+CcwalKEIZUGbjK?=
 =?us-ascii?Q?EGkjxBfPvpGMkeM408JmAXNPlrpaQIYGnS6c3bVRFzb62Cte4tXw559AyrmV?=
 =?us-ascii?Q?pBbbbNX+YbN/MmD303YES+FcPkICaNciH0R/V4zansW0RxzW9HF1P/XoOp49?=
 =?us-ascii?Q?lysw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB019;
 6:Lx8jDCDiAUQyLPUbLMY3J481/LkFKho3kods3JaQAwoRawLsnBA/BBEwwHTJ2sdKhKKmS46kmnXacuyZ5AUK565hTAANADIsXQ3HsmLSu2dNlleOyu7C5HEmjawlLRDf7RAP/Ofq2nA8yFuwFMNyfOYqcuJP8njgRWOJSUcExVLHSAk8m/JaOX6vxoNG62aqosPWOdv+h5Nl5We5QcfHPeAY5/PE03AxZEnqbsTF8SDr2kUAt5GAq9PZ+XUD95IthyQQ4qfF7cmGLgnQHMbsNx16QdpxBcKoNNo3W+2ezx+p6ycWNFD72sRiVSzJhO2p/16dpJKxGPQKM41fhEDMlkQBjTaJREUqFhEcksbMVPQSTNIg8GxciNFA0rZC12Jq;
 5:P1wnGmoham/95FwFTYkehXdSGW3d+PXSAyS+B94gm8CWuXQA3VzT0Ycyre0OhpuDyYjyN8sXxvFm1NAOP3H6CizqqxbeTmV0wF6zXvlEWrUyA2n6LW6HmL+W0Up9a/j9zBEp+orsK6phyRE/boqTgw==;
 24:xuSsTBGXTagK1V79EV5UCVlO01iUonqNA5H3PIQl06NEJiooaj6Yx8fjTsH3RA6EisXFQrfHSYog0UtruoOZ/gF5doWezriNnT/7P0+uLGY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB019;
 7:HgKbdIQfol5dG1EoCiW0miN7O0hkPUXMmmzgTU8as857/Mj5Kk+1QvATkIvIzIia8WK7QNrVoN+O2ZHylLcI6glByfW7nhXEdiY6Yhn7ehgNOEDMSwUGuXPykpvzALHucvECdtoasrTrrVR7nDD/5zr41V8yxKLfCdDPpQQwYKB6Ps4krVCvH2UEvpsba0RQ3ZveYeRTk915oYF9JctV2HV+2V43qSlT/WDD3LzhC40MmfhxqL5wjOPOwbKU0oObVWNsWJD0n4YGnkQXJlhP1cSrkmC/1K5Ry5IlHRnfxge7Mdrbc30EM1E6vWDZh5K/tGcVvSWK44NjZYleWxG0kVOaFNaCu7vgngIAqnC3HdE=
X-OriginatorOrg: microsemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2016 04:26:05.8320 (UTC)
X-MS-Exchange-CrossTenant-Id: f267a5c8-86d8-4cc9-af71-1fd2c67c8fad
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f267a5c8-86d8-4cc9-af71-1fd2c67c8fad; Ip=[208.19.100.20];
 Helo=[avsrvexchhts2.microsemi.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB019
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
X-List-Received-Date: Thu, 17 Nov 2016 04:26:16 -0000

--_000_C160D2872FE0DE4683E1910F9BF82941574257CEavsrvexchmbx2mi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

We purchased ASPEED demo board(2400).

We need to set up the openbmc environment on the board.

Is there any document/steps where I can refer to for building and deploying=
 the openbmc image on ASPEED board and boot it up with the image?

Regards
Arjun Padmanabhan
Software Design Engineer
Microsemi Storage Solutions India Pvt. Ltd.

--_000_C160D2872FE0DE4683E1910F9BF82941574257CEavsrvexchmbx2mi_
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
<p class=3D"MsoNormal">We purchased ASPEED demo board(2400). <o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We need to set up the openbmc environment on the boa=
rd.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there any document/steps where I can refer to for=
 building and deploying the openbmc image on ASPEED board and boot it up wi=
th the image?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Arjun Padmanabhan<o:p></o:p></p>
<p class=3D"MsoNormal">Software Design Engineer<o:p></o:p></p>
<p class=3D"MsoNormal">Microsemi Storage Solutions India Pvt. Ltd.<o:p></o:=
p></p>
</div>
</body>
</html>

--_000_C160D2872FE0DE4683E1910F9BF82941574257CEavsrvexchmbx2mi_--
