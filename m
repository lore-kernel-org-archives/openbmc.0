Return-Path: <openbmc+bounces-1804-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D44F34C64
	for <openbmc@archiver.kernel.org>; Mon, 13 Apr 2026 16:11:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fvXT66s9Hz2ywy;
	Tue, 14 Apr 2026 02:11:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:c10d::1"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776096666;
	cv=fail; b=D+IwQ9uqOC+4A830fxRu38t0GNiZXXuwUdDfgmSDcybaXLlJIoFICylMxY3g+rRYcX4jdhH70kxYrw6IYjpk4u9IMx+QmLjvbtuiL+EsL8LYP4GORaew15KRiCKIt1wghKM+dySNMprI+cLaqlOfbNXyCDJpuwaKn5FAM5u1V9IA//3E8A0We4NQu5Jjx16kcw9yowTVMhftxlGkNty+ZO7/1XlYnYfMqypWlPShNCuxzDN/2gV2fTF3IweQLP3vSDS+nxLZthVKnPPq/YC6Q6mRgqqYYw3CMBAX4lD//Pogb0gAPgCpBpgUOuwQtYwK0JxDvJCLRHJs1Mu8J6FKsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776096666; c=relaxed/relaxed;
	bh=Gh7DVdI3s694utcUmQY5Dr5GGaRN0dQWHFzYVTsey10=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hfoeGbOb1acllsTBjLnfMdcQYdGA2a8/siyG4RbyqTTgY8AHGwRJKfLSByaZRL8DYU3J4+uBtENSMMTwMFXPq/sFTkx4IyimmOYwc+UQDdjI70APU1hXvofN54K/V5s771Y8n+7hV1dTqIB981QrjO/sEK/lZq9OhYp3tb/D67GVctrEOk0czZjx+FlN9knEZZ9OieDj2UFadJSgJAivEMZljRMRTRu7ajxVfgZ5TqWmyjeQYot0fYP0M92UDivZzN8zxvqntgEtinmVxUUubiY8gd+UdUwNNomfvDvAbvYLk7ARr0sHWJtD4KCKVsENEGxoGHNkMOby6/B8lQntQw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=J5uZ5sfw; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=garybeihl@microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=J5uZ5sfw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microsoft.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=garybeihl@microsoft.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fvXT42NHQz2ytV
	for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 02:11:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSyMUudfoY7k28iQ07ZzJyJTswkas5K+lhqZY8vPS5Iz2rD9QkS5U3NV6EKXCt/VT7WIz9vxDn9cmcc22F1AA/DfhXt+FP61lKE1klI/vWZN8BldIoMDEo/0Fm9rmq2ETiOuEz8afDUqj4M5PnL6EIPPm9S44oLD5dBRge/bEVqgFz2hcLZi4ZeK62J6sf/kQZudP7x9wn00yudVgbmKPZ4miRVUa5/LTph+NyfFdWT64D3oLvD8A70IhwjZCxmg8I6EbPUW/gteFfheFl9jMTSN1CWFtpmlzE+IAK/AXW09DjGoznyiRmDSLcXsykS+IaFTbp9J6NxAT+PwSghDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gh7DVdI3s694utcUmQY5Dr5GGaRN0dQWHFzYVTsey10=;
 b=SLOSzfT1IqdmEioLCoLwbmcxjyAWm26P9iXEzRt3VNzlgiT+dLIW/y/MC1gd1aQMpB5YvjAOP8D9WMPMtEeZHiQamJBzKL1sZhoTt+LkAZk8ZQhohN2GOkq9pmN5fK6eWg9COQOe6cRUbhGR3mNLjCnM+OfKXL40pgX1H87h1aK+Yk0dkoMNauOVYYH08hIVeAZw+7RVT5DkqXd4a9AYA5kJJf9XG/DD4nYcvm3+1LczBQrmAXuQJctBb1RpXEg7oAF1W6hH+Npnpl0wqUDg02Cn4+jaGBGJTnWXKr7nQvWiLq8MtDanJW3ZOI8n3RI8frr80yZnbJlciUmepZA0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gh7DVdI3s694utcUmQY5Dr5GGaRN0dQWHFzYVTsey10=;
 b=J5uZ5sfw3evEKsk7aA45Sptr6+I2TM8hQztPX6g2TQcAMIPeqA8iHUHZWUMq8bpdG0RkhehCKEK4AmHbI2sNO7kAzOEMvvgzad7rkcF2O1IFflbRUhvtuexRG0k2Q4jDATqPR5BmaxkJmKRj9p+g8VvAKHlUK6VoPC1SRQS8gqI=
Received: from LV2PR21MB6760.namprd21.prod.outlook.com (2603:10b6:408:350::10)
 by LV0PR21MB5926.namprd21.prod.outlook.com (2603:10b6:408:331::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 16:10:35 +0000
Received: from LV2PR21MB6760.namprd21.prod.outlook.com
 ([fe80::dd7d:5598:a56c:893b]) by LV2PR21MB6760.namprd21.prod.outlook.com
 ([fe80::dd7d:5598:a56c:893b%6]) with mapi id 15.20.9791.011; Mon, 13 Apr 2026
 16:10:35 +0000
From: Gary Beihl <garybeihl@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Thirupathaiah Annapureddy <thiruan@microsoft.com>, Sagar Dharia
	<Sagar.Dharia@microsoft.com>, Giri Mudusuru <girimudusuru@microsoft.com>,
	Matt Johnston <matt@codeconstruct.com.au>, Ratan Gupta
	<ratankgupta31@gmail.com>, Chinmay Shripad Hegde <hosmanechinmay@gmail.com>,
	Archana Kakani <archana.kakani@ibm.com>, Manjeet Singh
	<itsmanjeet1998@gmail.com>
Subject: Re: [RFC] SPDM attestation E2E findings from Renode testing
Thread-Topic: [RFC] SPDM attestation E2E findings from Renode testing
Thread-Index: AQHcy2AP+tAiJ52YY0ul7ZW+nViUrw==
Date: Mon, 13 Apr 2026 16:10:35 +0000
Message-ID:
 <LV2PR21MB676012961B86F8E3884F65E2A6242@LV2PR21MB6760.namprd21.prod.outlook.com>
References:
 <LV2PR21MB6760DEE956E328854F20CE6BA650A@LV2PR21MB6760.namprd21.prod.outlook.com>
 <91704f59fe5c3ab763927f66b6582d32975a1764.camel@codeconstruct.com.au>
 <DS0SPRMB0144E17B9D846259CD076C54A65AA@DS0SPRMB0144.namprd21.prod.outlook.com>
In-Reply-To:
 <DS0SPRMB0144E17B9D846259CD076C54A65AA@DS0SPRMB0144.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=f589bca7-86a1-4d7e-8347-4864843d8ff8;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-04-07T20:45:51Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR21MB6760:EE_|LV0PR21MB5926:EE_
x-ms-office365-filtering-correlation-id: 8100c5c5-27fb-4f93-b762-08de99773217
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|13003099007|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 efFBb1Z+pQCZd2v0OH0WTs41/+rDZhio9yFoaoOMsppHjON7jdUoYJCA2dWPJHAROZGSzDudus1IJ7eY3PUQxuJ/d5FM2iflJLpzyD+UCv1CJ4Tfwp7XQveSu8yg2h47/oPhbXi9GXSYxHx+uL9tA71e7qtiFr5W9VUyGnITGDWyagkaLFo38YciSkM1GiwF9ULqmG443iJ0mlXJn73jg+fztx0hiiHoNRR1Gc4kHnK3ba3V1JQI1z+SKi2wFolNMpmwPOnR53tTglbB+EFy6vzYdPhHLY8CE9EodaNX8T6scyKpPBBcGa4c2tAE9L240zZaYQfQwco+utGYVMj/Mb9zTlX6Cet3CVuGOL/pTA68s4X/qPGkAGgQl9w3nuM3PYwmiEL84nPIV+wSQ1il7XjV2OmUl49A0sBgnnZ3nKdffsHp6MTnKbrpzRmbL9mKHwHC19r8DV8nyVyXRGWmo5n8/t2BU+1kt1SzU+T3rme+V4BPniavnCqz7VZqtNMIvVJUsdTUvJpJgCOE+xSsUr54aYsXC02pyC0TDOEZLVTPt7K0siakEJ3AO/nBjNEeATRqSG2Gq+SNpqAGWbjVxPHktP58pnyzCNQIXJJshRaimkZ0RWYVqd/EtxxP8B9uVmr+gP+OW1XF40vdfbgIxR/DX/zkXhrStwMMH5LYbHOCWwnMOf6tJKxttYLtz9825axNSyVG0QUKXRRC63pYoVOPZE3a4HXhJNjdqDbiPlZzhXEN/df4OuH3h43t/sPr
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR21MB6760.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ha8li9WLUxdEwyv3wGExszwSkEyW/vdf9SJq5bq4ARYsh5OczESzlGZ46HdK?=
 =?us-ascii?Q?1KIZnG8u4qxeKDB5xTuaosa92rKQkerqb5PYP0kXLgPvUh85/DCWO/9DPEZR?=
 =?us-ascii?Q?likgQ6Fo2t6hFpJ9PODmJM6Smnaq33feBV4n1DB024PwND/E/rrYVyF5PKmS?=
 =?us-ascii?Q?l0Fcvf11RNXP6xn9e8ciDeeE4J1IYwiHIHmzUKPGVdXLTi8X9ijZKcYyPBSP?=
 =?us-ascii?Q?EOZnNouXCOw+UGUnc8nHg+A6KfP2n+j7u9tfiGstWeNqWp9kn7sHvRXvlDVu?=
 =?us-ascii?Q?BW9o10/cSQI69sx0WQ7HaqNd4B+t57c14NHE98CDVlt9Q/scxcLX6WQBhYie?=
 =?us-ascii?Q?vXCLNCkoxbADjAG0Uc/gqSkx/j8V7jFzohbTs12VS3bqsASdo6RKNFq4zcjK?=
 =?us-ascii?Q?u8sv5fc3Z5JFKw9k/Jx8NmiaAfH2tm59T3A4UBPKRvBztAW1ksHbIdYdqYt5?=
 =?us-ascii?Q?5qLg3BueBruNng/L1+g0EznG4TRrXJPyxjPQmXsOm9H2xiB6HbdNanNIPKYN?=
 =?us-ascii?Q?Eg7ZyfTa5rEUiQhNnh7FzCpdws9F7eU4kNSTCO0icxdAdBBHqTYaDhmxctEy?=
 =?us-ascii?Q?i8MR0sPtOhbPGisRbbpHMtfL78t4c6ia8r3Dydowuge0eAZOBdneDPe8WuC+?=
 =?us-ascii?Q?8raUXFNi/4yJE1jxBZx2jj3qZNcXGHatP0IMryKyJjHeShHxtHjLbU05Z6T4?=
 =?us-ascii?Q?g5x6JApQCT1ZqVyybuX2gMtesbAYZ7iW3vH7Ug6f/lBoOsCEYXLSfX8SwLoh?=
 =?us-ascii?Q?QhMunKrjfmCmPNVM/m49zLwGelHnM+AEtbs3GRQHWG+cvMcX9GBKJ78ReyyX?=
 =?us-ascii?Q?h+EhF9FyQgfIcCH4+ElpWkt86RKGb8vu1flI0z/SPX6zrTBWMFY3rizfWBcz?=
 =?us-ascii?Q?ejzvlgAtPWKVcEbul2GqXeD+Fk9H1dhl7e+yetxPijEzdNWv8LGYKBVh7amu?=
 =?us-ascii?Q?16ApkWNr99GclYiC1eeg76ExMkR53WMFR4MlUNogcE/QSplv0g7u/A5KM6cO?=
 =?us-ascii?Q?4b1xP/JTTtLtR9grvt2qNbXZ24V3u8c9Mv9w8OxMPzzNtudRBcsCKQ7i5ma9?=
 =?us-ascii?Q?06NaE+uNb/5i6zreAeO68xAS1R8bnwGsD3umtXAA6QLg62XhMREL7Ojt+r7c?=
 =?us-ascii?Q?GvCdrLEgThnTxYdxlewiUdnNhuop/0nQ9YciGD5do8qnlC+HyqniZhYEdanv?=
 =?us-ascii?Q?TtUGQT9jD0/ebDyD2KLEWnts7Ur/VPrMJkdFT1ZUYqyxGmTTP2pSOCw1CSaR?=
 =?us-ascii?Q?Z0PPIuPb6g9e5Z6xXTlONWVXymIG3LD0xWGlLl6NTfxV4VbE5CJ9K5h6Tt4P?=
 =?us-ascii?Q?meRRKM85xVa2jM4zlHZa2PshMsM3J54Krvu0cKvLTigQVwch7WxEuI2tSXSi?=
 =?us-ascii?Q?2z/R1ZjNp9+TIA30vZTbGZfK6yOBPNMEwNBfXDKnGn2j/OHyusLBXFF1jTQa?=
 =?us-ascii?Q?mdIVitWapAYAxxqtI33/to7SEywcWET5+aBV0FEGkkSoRFPbUM0KTA3Zv0ky?=
 =?us-ascii?Q?xXKSi0D/YxLNrBk7dS6Zia9ou2FG6bYVPGGdQkSXux1R9XMsxCKMyeuFZFn3?=
 =?us-ascii?Q?YqC4S1LM/8oaHLi6iPps8D9MApYJRmiEl4QnlZcoGuiPPfPag40L5VMLrfLC?=
 =?us-ascii?Q?qrxzNorfQhK/NQY3xiMY80639ent7RovUyCr+nBSUuJK22AkszPOGJ7db1h4?=
 =?us-ascii?Q?5Am65g=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_LV2PR21MB676012961B86F8E3884F65E2A6242LV2PR21MB6760namp_"
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR21MB6760.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8100c5c5-27fb-4f93-b762-08de99773217
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 16:10:35.3331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Ec3cPXtZTR0y17lVQ75fG588qIpudACzNRVWcfevPTVRWM9Ei7FE5gJDJgGrDLNDfdbtXR/Lfmp6PRBMEKKFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR21MB5926

--_000_LV2PR21MB676012961B86F8E3884F65E2A6242LV2PR21MB6760namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

(CC'ing the SPDM chain maintainers directly for visibility; posting to the =
list so the discussion stays searchable alongside the April 2 thread.)

Following up on the April 2 RFC [1] and Matt's reply [2]: I now have a grou=
p of six patches on a local branch that take the SPDM E2E suite
from 0/13 to 17/17 passing on Renode evb-ast2600 (14 attestation scenarios =
+ 1 boot + 2 new SPDMGetSignedMeasurements scenarios I added to cover the o=
n-demand D-Bus path).

I'd like input from the SPDM chain maintainers on how you'd prefer to recei=
ve these patches before I start pushing to Gerrit.

Here are the 6 patches: All are small and independent. Each has a one-parag=
raph rationale in the commit message plus a "Tested:" trailer describing wh=
at the Renode E2E suite exercises.

1. spdmd: Handle missing MCTP endpoints gracefully - mctp_transport_discove=
ry.cpp. Catches ResourceNotFound and per-endpoint query exceptions so spdmd=
 doesn't terminate on a freshly booted system with no MCTP endpoints yet co=
nfigured. Same pattern as Archana's fix in 88794 for the TCP discovery path=
.

2. spdmd: Search the full object tree in mapper lookups - utils/mapper.cpp.=
 Changes get_sub_tree("/xyz/openbmc_project", ...) to get_sub_tree("/", ...=
) so the search finds mctpd-managed endpoints under /au/com/codeconstruct/m=
ctp1/... - mctpd implements both xyz.openbmc_project.MCTP.Endpoint and au.c=
om.codeconstruct.MCTP.Endpoint1 on the same object, but the xyz-rooted sear=
ch never finds it.

3. spdmd: Remove unnecessary MCTP socket bind() - mctp_helper.hpp. This is =
the fix Matt recommended in [2]. Removes the wildcard bind(ANY, ANY, SPDM, =
OWNER) that prevented multi-device discovery from working - multiple MctpIo=
Class instances would collide on the same bound tuple. spdmd is a pure sync=
hronous requester so no bind() is needed. Same pattern as the pldmtool fix =
Matt referenced (openbmc/pldm 83626).

4. spdmd: Set MCTP socket receive timeout in mctp_helper.hpp. Adds SO_RCVTI=
MEO=3D10s at socket creation. The existing MctpIoClass::read() marks its ti=
meout parameter as [[maybe_unused]] and recvfrom() blocks forever on unreac=
hable devices, so libspdm never returns LIBSPDM_STATUS_RECEIVE_FAIL and sys=
temd's start-timeout kills spdmd before it becomes active.

5. spdmd: Implement eager SPDM attestation on discovery spdm_dbus_responder=
.cpp/hpp, spdmd.cpp. Adds a performEagerAttestation() method that runs VCA =
+ GET_DIGESTS + GET_CERTIFICATE + CHALLENGE on every discovered device and =
updates the ComponentIntegrity.ResponderVerificationStatus D-Bus property. =
Called from main() after ctx.request_name() so attestation timing can't tri=
gger systemd's TimeoutStartSec.

CHALLENGE is the critical step for the security gap I mentioned in the orig=
inal RFC - without it, a wrong or compromised private key still passes atte=
station because GET_CERTIFICATE alone does not prove key ownership.

This is the commit I'm least sure about architecturally.

Archana: I see 88873 adds an SPDMResponderManager with a connectSPDMDevice(=
) stub. Would you rather I rebase the attestation logic into your manager c=
lass instead of adding it as a method on SPDMDBusResponder? Happy to do eit=
her.

6. spdmd: Surface SPDMGetSignedMeasurements errors component_integrity_dbus=
.cpp. The catch block in method_call() currently swallows all std::exceptio=
n subtypes and returns a tuple of empty strings as if the call had succeede=
d, so bmcweb returns HTTP 200 with "SignedMeasurements":"" on any libspdm f=
ailure. Fix is to split the catch: sdbusplus::exception::exception subtypes=
 are rethrown (preserving InvalidArgument), generic std::exception is conve=
rted to InternalFailure. Bmcweb then maps the D-Bus error to HTTP 500 with =
a Redfish @Message.ExtendedInfo body.

TCP discovery exception handling - I had also fixed the TCP ResourceNotFoun=
d crash, but then noticed Archana's 88794 already does this. So that one's =
dropped from my stack.

## Questions for the chain maintainers

The chain I'm targeting is NVIDIA's (80262, 80355, 80264, 80272, 80311, 803=
58, 84019, ...) since my fixes touch files that only exist there. I underst=
and the IBM chain (88112, 88124, 88873, 88794, 89179) is a parallel track -=
 fixes 1-4 and 6 are on files IBM's chain doesn't touch, and fix 5 will nee=
d to be reconciled once the two chains merge.

Before I start pushing, could you let me know:

  a) Are you okay with fixes 1, 2, 3, 4, and 6 landing as a five-commit sta=
ck on Gerrit depending on the NVIDIA chain (specifically 80262 PS19, 80355,=
 and 84019)? I'd submit them under my Microsoft email and reference the Apr=
il 2 RFC in each commit message.

  b) For fix 5 (eager attestation): does it make more sense to (i) post it =
as a stand-alone Gerrit change stacked on 84019 now, and reconcile with 888=
73's SPDMResponderManager later, (ii) post it as an amendment to 88873 that=
 fills in the connectSPDMDevice() TODO, or (iii) hold until the NVIDIA and =
IBM chains converge upstream?

  c) Is there a planned coordination point where the two chains merge? I se=
e 88873 intends to drive NVIDIA's SpdmTransport eventually. Happy to help b=
ridge them if that's a blocker for landing the attestation flow.

If any of the six descriptions look off to you, please push back before I p=
ush them to Gerrit - I'd rather have the discussion in email than after N p=
atchsets back-and-forth.

Full commit messages and diffs are on a local branch; I can either (a) uplo=
ad to Gerrit as a draft and share links, (b) post patches inline to the lis=
t as a v1 series, or (c) share them privately if you'd prefer. Let me know =
which you'd like.

Thanks,
Gary

[1] https://lists.ozlabs.org/pipermail/openbmc/2026-April/038553.html
[2] https://lists.ozlabs.org/pipermail/openbmc/2026-April/038554.html

From: Gary Beihl <garybeihl@microsoft.com>
Sent: Tuesday, April 7, 2026 4:51 PM
To: Matt Johnston <matt@codeconstruct.com.au>; openbmc@lists.ozlabs.org
Cc: Thirupathaiah Annapureddy <thiruan@microsoft.com>; Sagar Dharia <Sagar.=
Dharia@microsoft.com>; Giri Mudusuru <girimudusuru@microsoft.com>
Subject: RE: [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from Renode=
 testing

Hi Matt,

Thank you for the recommendation - I followed your suggestion and dropped t=
he call to bind() altogether. Since spdmd only does request/response (no as=
ync SPDM messages), regular sendto()/recvfrom() with SO_RCVTIMEO) works jus=
t fine. Each endpoint gets its own socket with no EADDRINUSE conflict.

All 14 SPDM E2E Robot Framework tests continue to pass with this change, in=
cluding the multi-endpoint scenarios that previously hit EADDRINUSE.

Per-endpoint bind() from Linux 6.17 is good to know about for future work i=
n case we need to handle async SPDM notifications (e.g, KEY_UPDATE).

Thanks,
Gary


From: Matt Johnston <matt@codeconstruct.com.au<mailto:matt@codeconstruct.co=
m.au>>
Sent: Wednesday, April 1, 2026 10:09 PM
To: Gary Beihl <garybeihl@microsoft.com<mailto:garybeihl@microsoft.com>>; o=
penbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>
Cc: Thirupathaiah Annapureddy <thiruan@microsoft.com<mailto:thiruan@microso=
ft.com>>; Sagar Dharia <Sagar.Dharia@microsoft.com<mailto:Sagar.Dharia@micr=
osoft.com>>; Giri Mudusuru <girimudusuru@microsoft.com<mailto:girimudusuru@=
microsoft.com>>
Subject: [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from Renode tes=
ting

You don't often get email from matt@codeconstruct.com.au<mailto:matt@codeco=
nstruct.com.au>. Learn why this is important<https://aka.ms/LearnAboutSende=
rIdentification>
Hi Gary,

On Wed, 2026-04-01 at 21:35 +0000, Gary Beihl wrote:
(c) Shared AF_MCTP socket (affects 80311: mctp_helper.hpp)

Only one socket can bind to (MCTP_ADDR_ANY, MCTP_TYPE_SPDM).  When spdmd at=
tests multiple endpoints sequentially, the second   MctpIoClass::createSock=
et() fails with EADDRINUSE. The fix is a process-lifetime shared socket (si=
ngleton pattern), draining stale responses between endpoint attestations wi=
th recv(MSG_DONTWAIT).

Since Linux 6.17 it is possible to restrict a bind() to only receive from a=
 single remote endpoint [1]. Call connect() with the remote address before =
the bind().

Is the SPDM implementation using asynchronous messages sent by the responde=
r? (KEY_UPDATE, HEARTBEAT, END_SESSION)
If not, I think the bind() could be removed altogether.
bind() isn't needed in the case where the Linux host is performing a plain =
send() then receiving a response. A similar situation was fixed in pldmtool=
 [2].

[1] https://lore.kernel.org/all/20250710-mctp-bind-v4-6-8ec2f6460c56@codeco=
nstruct.com.au/
[2] https://gerrit.openbmc.org/c/openbmc/pldm/+/83626

Cheers,
Matt


--_000_LV2PR21MB676012961B86F8E3884F65E2A6242LV2PR21MB6760namp_
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
	{font-family:Aptos;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
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
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">(CC'ing the SPDM ch=
ain maintainers directly for visibility; posting to the list so the discuss=
ion stays searchable alongside the April 2 thread.)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Following up on the=
 April 2 RFC [1] and Matt's reply [2]: I now have a group of six patches on=
 a local branch that take the SPDM E2E suite<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">from 0/13 to 17/17 =
passing on Renode evb-ast2600 (14 attestation scenarios + 1 boot + 2 new SP=
DMGetSignedMeasurements scenarios I added to cover the on-demand D-Bus path=
).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I'd like input from=
 the SPDM chain maintainers on how you'd prefer to receive these patches be=
fore I start pushing to Gerrit.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Here are the 6 patc=
hes: All are small and independent. Each has a one-paragraph rationale in t=
he commit message plus a &quot;Tested:&quot; trailer describing what the Re=
node E2E suite exercises.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">1. spdmd: Handle mi=
ssing MCTP endpoints gracefully - mctp_transport_discovery.cpp. Catches Res=
ourceNotFound and per-endpoint query exceptions so spdmd doesn't terminate =
on a freshly booted system with no MCTP
 endpoints yet configured. Same pattern as Archana's fix in 88794 for the T=
CP discovery path.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">2. spdmd: Search th=
e full object tree in mapper lookups - utils/mapper.cpp. Changes get_sub_tr=
ee(&quot;/xyz/openbmc_project&quot;, ...) to get_sub_tree(&quot;/&quot;, ..=
.) so the search finds mctpd-managed endpoints under /au/com/codeconstruct/=
mctp1/...
 &#8212; mctpd implements both xyz.openbmc_project.MCTP.Endpoint and au.com=
.codeconstruct.MCTP.Endpoint1 on the same object, but the xyz-rooted search=
 never finds it.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">3. spdmd: Remove un=
necessary MCTP socket bind() - mctp_helper.hpp. This is the fix Matt recomm=
ended in [2]. Removes the wildcard bind(ANY, ANY, SPDM, OWNER) that prevent=
ed multi-device discovery from working
 &#8212; multiple MctpIoClass instances would collide on the same bound tup=
le. spdmd is a pure synchronous requester so no bind() is needed. Same patt=
ern as the pldmtool fix Matt referenced (openbmc/pldm 83626).<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">4. spdmd: Set MCTP =
socket receive timeout in mctp_helper.hpp. Adds SO_RCVTIMEO=3D10s at socket=
 creation. The existing MctpIoClass::read() marks its timeout parameter as =
[[maybe_unused]] and recvfrom() blocks
 forever on unreachable devices, so libspdm never returns LIBSPDM_STATUS_RE=
CEIVE_FAIL and systemd's start-timeout kills spdmd before it becomes active=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">5. spdmd: Implement=
 eager SPDM attestation on discovery spdm_dbus_responder.cpp/hpp, spdmd.cpp=
. Adds a performEagerAttestation() method that runs VCA + GET_DIGESTS + GET=
_CERTIFICATE + CHALLENGE on every discovered
 device and updates the ComponentIntegrity.ResponderVerificationStatus D-Bu=
s property. Called from main() after ctx.request_name() so attestation timi=
ng can't trigger systemd's TimeoutStartSec.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">CHALLENGE is the cr=
itical step for the security gap I mentioned in the original RFC &#8212; wi=
thout it, a wrong or compromised private key still passes attestation becau=
se GET_CERTIFICATE alone does not prove key
 ownership.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This is the commit =
I'm least sure about architecturally.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Archana: I see 8887=
3 adds an SPDMResponderManager with a connectSPDMDevice() stub. Would you r=
ather I rebase the attestation logic into your manager class instead of add=
ing it as a method on SPDMDBusResponder?
 Happy to do either.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">6. spdmd: Surface S=
PDMGetSignedMeasurements errors component_integrity_dbus.cpp. The catch blo=
ck in method_call() currently swallows all std::exception subtypes and retu=
rns a tuple of empty strings as if the
 call had succeeded, so bmcweb returns HTTP 200 with &quot;SignedMeasuremen=
ts&quot;:&quot;&quot; on any libspdm failure. Fix is to split the catch: sd=
busplus::exception::exception subtypes are rethrown (preserving InvalidArgu=
ment), generic std::exception is converted to InternalFailure.
 Bmcweb then maps the D-Bus error to HTTP 500 with a Redfish @Message.Exten=
dedInfo body.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">TCP discovery excep=
tion handling &#8212; I had also fixed the TCP ResourceNotFound crash, but =
then noticed Archana's 88794 already does this. So that one's dropped from =
my stack.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">## Questions for th=
e chain maintainers<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The chain I'm targe=
ting is NVIDIA's (80262, 80355, 80264, 80272, 80311, 80358, 84019, ...) sin=
ce my fixes touch files that only exist there. I understand the IBM chain (=
88112, 88124, 88873, 88794, 89179) is
 a parallel track &#8212; fixes 1-4 and 6 are on files IBM's chain doesn't =
touch, and fix 5 will need to be reconciled once the two chains merge.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Before I start push=
ing, could you let me know:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; a) Are you o=
kay with fixes 1, 2, 3, 4, and 6 landing as a five-commit stack on Gerrit d=
epending on the NVIDIA chain (specifically 80262 PS19, 80355, and 84019)? I=
'd submit them under my Microsoft email and
 reference the April 2 RFC in each commit message.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; b) For fix 5=
 (eager attestation): does it make more sense to (i) post it as a stand-alo=
ne Gerrit change stacked on 84019 now, and reconcile with 88873's SPDMRespo=
nderManager later, (ii) post it as an amendment
 to 88873 that fills in the connectSPDMDevice() TODO, or (iii) hold until t=
he NVIDIA and IBM chains converge upstream?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; c) Is there =
a planned coordination point where the two chains merge? I see 88873 intend=
s to drive NVIDIA's SpdmTransport eventually. Happy to help bridge them if =
that's a blocker for landing the attestation
 flow.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">If any of the six d=
escriptions look off to you, please push back before I push them to Gerrit =
&#8212; I'd rather have the discussion in email than after N patchsets back=
-and-forth.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Full commit message=
s and diffs are on a local branch; I can either (a) upload to Gerrit as a d=
raft and share links, (b) post patches inline to the list as a v1 series, o=
r (c) share them privately if you'd
 prefer. Let me know which you'd like.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Gary<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">[1] <a href=3D"http=
s://lists.ozlabs.org/pipermail/openbmc/2026-April/038553.html">
https://lists.ozlabs.org/pipermail/openbmc/2026-April/038553.html</a><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">[2] <a href=3D"http=
s://lists.ozlabs.org/pipermail/openbmc/2026-April/038554.html">
https://lists.ozlabs.org/pipermail/openbmc/2026-April/038554.html</a><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;mso-ligatures:none">From:</span></b><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-ligatur=
es:none"> Gary Beihl &lt;garybeihl@microsoft.com&gt;
<br>
<b>Sent:</b> Tuesday, April 7, 2026 4:51 PM<br>
<b>To:</b> Matt Johnston &lt;matt@codeconstruct.com.au&gt;; openbmc@lists.o=
zlabs.org<br>
<b>Cc:</b> Thirupathaiah Annapureddy &lt;thiruan@microsoft.com&gt;; Sagar D=
haria &lt;Sagar.Dharia@microsoft.com&gt;; Giri Mudusuru &lt;girimudusuru@mi=
crosoft.com&gt;<br>
<b>Subject:</b> RE: [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from=
 Renode testing<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi Matt,<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thank you for the r=
ecommendation &#8211; I followed your suggestion and dropped the call to bi=
nd() altogether. Since spdmd only does request/response (no async SPDM mess=
ages), regular sendto()/recvfrom() with SO_RCVTIMEO)
 works just fine. Each endpoint gets its own socket with no EADDRINUSE conf=
lict.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">All 14 SPDM E2E Rob=
ot Framework tests continue to pass with this change, including the multi-e=
ndpoint scenarios that previously hit EADDRINUSE.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Per-endpoint bind()=
 from Linux 6.17 is good to know about for future work in case we need to h=
andle async SPDM notifications (e.g, KEY_UPDATE).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Gary<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;mso-ligatures:none">From:</span></b><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;mso-ligatur=
es:none"> Matt Johnston &lt;<a href=3D"mailto:matt@codeconstruct.com.au">ma=
tt@codeconstruct.com.au</a>&gt;
<br>
<b>Sent:</b> Wednesday, April 1, 2026 10:09 PM<br>
<b>To:</b> Gary Beihl &lt;<a href=3D"mailto:garybeihl@microsoft.com">garybe=
ihl@microsoft.com</a>&gt;;
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<b>Cc:</b> Thirupathaiah Annapureddy &lt;<a href=3D"mailto:thiruan@microsof=
t.com">thiruan@microsoft.com</a>&gt;; Sagar Dharia &lt;<a href=3D"mailto:Sa=
gar.Dharia@microsoft.com">Sagar.Dharia@microsoft.com</a>&gt;; Giri Mudusuru=
 &lt;<a href=3D"mailto:girimudusuru@microsoft.com">girimudusuru@microsoft.c=
om</a>&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: [RFC] SPDM attestation E2E findings from Ren=
ode testing<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"left" width=3D"100%" style=3D"width:100.0%">
<tbody>
<tr>
<td width=3D"0" style=3D"width:.3pt;background:#A6A6A6;padding:5.25pt 1.5pt=
 5.25pt 1.5pt">
</td>
<td width=3D"100%" style=3D"width:100.0%;background:#EAEAEA;padding:5.25pt =
3.75pt 5.25pt 11.25pt;aspect-ratio: revert !important;background:revert !im=
portant;block-size: revert !important;border:revert !important;bottom: reve=
rt !important;color:revert !important;color-scheme: revert !important;conte=
nt-visibility: revert !important;cursor:revert !important;direction:revert =
!important;display:revert !important;font-size:revert !important;height:rev=
ert !important;hyphens: revert !important;letter-spacing:revert !important;=
line-height:revert !important;margin:revert !important;opacity: revert !imp=
ortant;order: revert !important;outline: revert !important;overflow:revert =
!important;padding:revert !important;position:revert !important;resize: rev=
ert !important;rotate: revert !important;scale: revert !important;tab-size:=
 revert !important;table-layout:revert !important;text-align:revert !import=
ant;text-indent:revert !important;text-orientation: revert !important;text-=
overflow: revert !important;text-shadow:revert !important;text-transform:re=
vert !important;text-wrap: revert !important;top:revert !important;transiti=
on: revert !important;user-select: revert !important;vertical-align:revert =
!important;visibility:revert !important;white-space:revert !important;width=
:revert !important;word-break:revert !important;word-spacing:revert !import=
ant;writing-mode:revert !important;zoom: revert !important">
<div>
<p class=3D"MsoNormal" style=3D"mso-element:frame;mso-element-frame-hspace:=
2.25pt;mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-el=
ement-anchor-horizontal:column;mso-height-rule:exactly">
<span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;=
color:#212121;mso-ligatures:none">You don't often get email from
<a href=3D"mailto:matt@codeconstruct.com.au">matt@codeconstruct.com.au</a>.=
 <a href=3D"https://aka.ms/LearnAboutSenderIdentification">
Learn why this is important</a> <o:p></o:p></span></p>
</div>
</td>
<td width=3D"75" style=3D"width:56.25pt;background:#EAEAEA;padding:5.25pt 3=
.75pt 5.25pt 3.75pt;aspect-ratio: revert !important;background:revert !impo=
rtant;block-size: revert !important;border:revert !important;bottom: revert=
 !important;color:revert !important;color-scheme: revert !important;content=
-visibility: revert !important;cursor:revert !important;direction:revert !i=
mportant;display:revert !important;font-size:revert !important;height:rever=
t !important;hyphens: revert !important;letter-spacing:revert !important;li=
ne-height:revert !important;margin:revert !important;opacity: revert !impor=
tant;order: revert !important;outline: revert !important;overflow:revert !i=
mportant;padding:revert !important;position:revert !important;resize: rever=
t !important;rotate: revert !important;scale: revert !important;tab-size: r=
evert !important;table-layout:revert !important;text-align:revert !importan=
t;text-indent:revert !important;text-orientation: revert !important;text-ov=
erflow: revert !important;text-shadow:revert !important;text-transform:reve=
rt !important;text-wrap: revert !important;top:revert !important;transition=
: revert !important;user-select: revert !important;vertical-align:revert !i=
mportant;visibility:revert !important;white-space:revert !important;width:r=
evert !important;word-break:revert !important;word-spacing:revert !importan=
t;writing-mode:revert !important;zoom: revert !important;align: left !impor=
tant">
</td>
</tr>
</tbody>
</table>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Hi Gary,<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">On Wed, 2026-04-0=
1 at 21:35 +0000, Gary Beihl wrote:<o:p></o:p></span></p>
</div>
<blockquote style=3D"border:none;border-left:solid #729FCF 1.5pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">(c) Shared AF_MCTP =
socket (affects 80311: mctp_helper.hpp)</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Only one socket can=
 bind to (MCTP_ADDR_ANY, MCTP_TYPE_SPDM).&nbsp; When spdmd attests multiple=
 endpoints sequentially, the second &nbsp;&nbsp;MctpIoClass::createSocket()=
 fails with EADDRINUSE. The fix is a process-lifetime
 shared socket (singleton pattern), draining stale responses between endpoi=
nt attestations with recv(MSG_DONTWAIT).</span><o:p></o:p></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Since Linux 6.17 =
it is possible to restrict a bind() to only receive from a single remote en=
dpoint [1]. Call connect() with the remote address before the bind().<o:p><=
/o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Is the SPDM imple=
mentation using asynchronous messages sent by the responder? (KEY_UPDATE, H=
EARTBEAT, END_SESSION)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">If not, I think t=
he bind() could be removed altogether.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">bind() isn't need=
ed in the case where the Linux host is performing a plain send() then recei=
ving a response. A similar situation was fixed in pldmtool [2].<o:p></o:p><=
/span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">[1]&nbsp;<a href=
=3D"https://lore.kernel.org/all/20250710-mctp-bind-v4-6-8ec2f6460c56@codeco=
nstruct.com.au/">https://lore.kernel.org/all/20250710-mctp-bind-v4-6-8ec2f6=
460c56@codeconstruct.com.au/</a><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">[2]&nbsp;<a href=
=3D"https://gerrit.openbmc.org/c/openbmc/pldm/+/83626">https://gerrit.openb=
mc.org/c/openbmc/pldm/+/83626</a>&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Cheers,<o:p></o:p=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none">Matt<o:p></o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p>=
</span></p>
</div>
</div>
</div>
</body>
</html>

--_000_LV2PR21MB676012961B86F8E3884F65E2A6242LV2PR21MB6760namp_--

