Return-Path: <mkbrown32@hotmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.9.49; helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=mkbrown32@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="NEAI58Aa"; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-oln040092009049.outbound.protection.outlook.com [40.92.9.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44nsKR1bm4zDqL9
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 02:21:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+nMKfLGJH/tHGHFYV/7t0Dad6nqJ15tN9HvFFo2Us4=;
 b=NEAI58AaG1AE2krnaaU2UURsq0qoHe4lVUjmU07Z3baEjoZqW+YrTnN9poljaZmd6ahJu/6GfaZoZ7S7iZ2yjwe73wpOMYNbufj0NX0+sRmqppGSYIz6ro7RL+KJyIfVJg48scl5oCLfvtaN2YNfAm0JydBOKO+tknX5eFefQ8vzVGvq1hb84FniX4S+7LIkKhzforyXFRFCFBV2XSf+QNaMNbS+JzXEYcukYlo3Qd7pjjOx1xPf6519iS8uGy9Ojz8LTPp98GlqkzR9SKpCU9zw9Pu70BqvTYCpS31lTDKYrXCLNoNCmTVFaMeaVV/NUJrtF/QgmBTDN+3RhRUG/g==
Received: from BN3NAM04FT018.eop-NAM04.prod.protection.outlook.com
 (10.152.92.56) by BN3NAM04HT074.eop-NAM04.prod.protection.outlook.com
 (10.152.93.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1771.16; Mon, 22 Apr
 2019 16:21:41 +0000
Received: from BYAPR02MB5847.namprd02.prod.outlook.com (10.152.92.52) by
 BN3NAM04FT018.mail.protection.outlook.com (10.152.92.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1771.16 via Frontend Transport; Mon, 22 Apr 2019 16:21:41 +0000
Received: from BYAPR02MB5847.namprd02.prod.outlook.com
 ([fe80::458:7638:5c3d:4ec1]) by BYAPR02MB5847.namprd02.prod.outlook.com
 ([fe80::458:7638:5c3d:4ec1%6]) with mapi id 15.20.1813.017; Mon, 22 Apr 2019
 16:21:41 +0000
From: Mark Brown <mkbrown32@hotmail.com>
To: Patrick Venture <venture@google.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Seeking openbmc programmer's editor info
Thread-Topic: Seeking openbmc programmer's editor info
Thread-Index: AQHU99lZjX3kq29ZfEeJqOC6txbbb6ZIPvCAgAAbJzqAAAPLAIAAAJwM
Date: Mon, 22 Apr 2019 16:21:41 +0000
Message-ID: <BYAPR02MB58475342BB3F33226E6446C9AE220@BYAPR02MB5847.namprd02.prod.outlook.com>
References: <CAO=notwmhWoeCry_Z+xL=7N1Pp+74tJ9BCF7nr4Jq1MwqRjfOA@mail.gmail.com>
 <BYAPR02MB58478B07866A63D01DA3EB25AE210@BYAPR02MB5847.namprd02.prod.outlook.com>
 <CAO=notzqWthZ29ghauXdzS7Y8WYeVrnMbbmz6Tgt=R6n_mRRAA@mail.gmail.com>
 <BYAPR02MB5847D889707010DEF7F58A95AE220@BYAPR02MB5847.namprd02.prod.outlook.com>,
 <CAO=notyZ8Qj96iGYqcPMnkMFSL-Q38-OC8F88oAgpsmu030pxQ@mail.gmail.com>
In-Reply-To: <CAO=notyZ8Qj96iGYqcPMnkMFSL-Q38-OC8F88oAgpsmu030pxQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:75DD9125146AED6776A5D2937E276449B58B0B0C6AC88E19313A8F68C8C5B2E8;
 UpperCasedChecksum:4F67A0550658FEABC1FCA630AEF40992C2BD8E0A72651057E09F2955418074FA;
 SizeAsReceived:7120; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [c3akDG743BsyHk/eP7L2X8pdVlUx/nJ9]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
 SRVR:BN3NAM04HT074; 
x-ms-traffictypediagnostic: BN3NAM04HT074:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-message-info: D0Tbx0NB6/v/rGPF4IYo1IejbMY2V8ejg5urRoYgjrp1djI0KYRn85IcWny+HSDlHuv9gCdQT1LB9eR3iH/0mCGNPhUHG4JKG6ipOv+RfquU9h04zNPSy5fVwJWvsScSg7CZiOmQqU9IQ5Tdk2nHriXsFyJEsPlLSmwaZTXHqVJn9l10GeR1M9nfexN281hI
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bbc916-9496-4f77-2608-08d6c73e9a70
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2019 16:21:41.1493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT074
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2019 16:21:50 -0000

On the official github   openbmc/openbmc   page:=0A=
=0A=
https://github.com/openbmc/openbmc=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=0A=
1) Prerequisite=0A=
Ubuntu 14.04=0A=
sudo apt-get install -y git build-essential libsdl1.2-dev texinfo gawk chrp=
ath diffstat=0A=
Fedora 28=0A=
sudo dnf install -y git patch diffstat texinfo chrpath SDL-devel bitbake rp=
cgen=0A=
sudo dnf groupinstall "C Development Tools and Libraries"=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=0A=
=0A=
________________________________________=0A=
From: Patrick Venture <venture@google.com>=0A=
Sent: Monday, April 22, 2019 9:16 AM=0A=
To: Mark Brown=0A=
Cc: OpenBMC Maillist=0A=
Subject: Re: Seeking openbmc programmer's editor info=0A=
=0A=
+ openbmc mailing list=0A=
=0A=
On Mon, Apr 22, 2019 at 9:11 AM Mark Brown <mkbrown32@hotmail.com> wrote:=
=0A=
>=0A=
> The openbmc build instructions state that Ubuntu 14=0A=
> should be used.=0A=
> Are you saying that you read, navigate, modify source code=0A=
> in a different development platform from the build ?=0A=
=0A=
Yes, what documentation are you reading that says to use ubuntu 14?=0A=
It's likely just out of date.=0A=
=0A=
>=0A=
> Also, someone else mentioned Vim/C-scope -- however, I experience=0A=
> many "cannot find file" errors and then hangs of the Term window=0A=
> under C-scope.=0A=
=0A=
I don't use C-scope.=0A=
=0A=
>=0A=
>=0A=
> ________________________________________=0A=
> From: Patrick Venture <venture@google.com>=0A=
> Sent: Monday, April 22, 2019 7:26 AM=0A=
> To: Mark Brown=0A=
> Subject: Re: Seeking openbmc programmer's editor info=0A=
>=0A=
> I don't use Ubuntu 14, but generally grep/sed/vim are used most.=0A=
>=0A=
> On Sat, Apr 20, 2019 at 5:30 PM Mark Brown <mkbrown32@hotmail.com> wrote:=
=0A=
> >=0A=
> > I am a firmware guy watching the traffic on this email list.=0A=
> > I am interested to know what programmer's editor is most useful,=0A=
> > under Ubuntu 14,=0A=
> > to navigate and read the source code here, perform multi-file searches,=
=0A=
> > and help find bugs.=0A=
> > Which editor is most commonly used here ?=0A=
> >=0A=
> > Mark=0A=
> >=0A=
> > ________________________________________=0A=
> > From: openbmc <openbmc-bounces+mkbrown32=3Dhotmail.com@lists.ozlabs.org=
> on behalf of Patrick Venture <venture@google.com>=0A=
> > Sent: Friday, April 19, 2019 12:43 PM=0A=
> > To: Joel Stanley; Brad Bishop; Andrew Jeffery=0A=
> > Cc: OpenBMC Maillist=0A=
> > Subject: meta-ingrasys patches required for new merged drivers=0A=
> >=0A=
> > If you don't work on or maintain meta-ingrasys/meta-zaius you can stop=
=0A=
> > reading and go on with your Friday. :D=0A=
> >=0A=
> > All;=0A=
> >=0A=
> > https://gerrit.openbmc-project.xyz/20692 and below are all ready-to-go=
=0A=
> > and some are required for the meta-aspeed bump staged for=0A=
> > openbmc/openbmc.=0A=
> >=0A=
> > I wanted to throw this into an email to it jumps out more.=0A=
> >=0A=
> > Patrick=0A=
