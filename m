Return-Path: <prvs=28074a2eee=amithash@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=28074a2eee=amithash@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="PFbR+fZV"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="difiyJby"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42L5X84X5GzF3Lc;
 Thu, 27 Sep 2018 04:08:01 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.22/8.16.0.22) with SMTP id w8QHwgff004444;
 Wed, 26 Sep 2018 11:07:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=PgnTgHixerthHsJDNozeOGADF5ZXpGrZKu7IA9rHkKc=;
 b=PFbR+fZVtf6iajxE97lb9pbZNloGMGFylU86yVdl7EL5wgsSEIOnWwS7I3vRMHI4zm9b
 pP+P2v7v0NLGhGnEdEet5telPanFLNZvDT+tbyyDx/8Hg5oo008DqZplHiVbGGvktmxK
 sBfxPvTdRmaFy0mLbBjf4alNRc++7Dvy6Dw= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2mretj83fs-3
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 26 Sep 2018 11:07:57 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.17) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 26 Sep 2018 11:07:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgnTgHixerthHsJDNozeOGADF5ZXpGrZKu7IA9rHkKc=;
 b=difiyJbylbORLgEn9XGT3m17Ej5xTqsJhddm4u4bZqvKo5GKHBItTuoo+uOf2wampYjZiNBNacZbaqv6v0yTok8kh61MiiR6Bn09KGRHCfI0q/Dxpjj3hm1XX633Tw0uyq3xgK6E6d2l1aRNxpfVU8AqibbYb7+dKuJ0uOL/qTg=
Received: from MWHPR15MB1486.namprd15.prod.outlook.com (10.173.235.7) by
 MWHPR15MB1374.namprd15.prod.outlook.com (10.173.234.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.25; Wed, 26 Sep 2018 18:07:54 +0000
Received: from MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::95c3:c255:4645:a776]) by MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::95c3:c255:4645:a776%10]) with mapi id 15.20.1164.024; Wed, 26 Sep
 2018 18:07:54 +0000
From: Amithash Prasad <amithash@fb.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Samuel Mendoza-Jonas
 <sam@mendozajonas.com>, Joel Stanley <joel@jms.id.au>
CC: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "OpenBMC
 Maillist" <openbmc@lists.ozlabs.org>, Sai Dasari <sdasari@fb.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Justin.Lee1@Dell.com"
 <Justin.Lee1@Dell.com>
Subject: Re: [PATCH] net/ncsi: Add NCSI OEM command for FB Tiogapass
Thread-Topic: [PATCH] net/ncsi: Add NCSI OEM command for FB Tiogapass
Thread-Index: AQHUVGQBjOnbXvhvf0ediAPKxzBB4aUAJQyAgAEqCQCAAKxhAIAA0qKAgAAQGdM=
Date: Wed, 26 Sep 2018 18:07:54 +0000
Message-ID: <MWHPR15MB14861AED8F8AF652CE5E62B3B2150@MWHPR15MB1486.namprd15.prod.outlook.com>
References: <20180925000840.4111212-1-vijaykhemka@fb.com>
 <CACPK8XcDExGvCNBcFqOOP+1zQFFs6pMao+7rsZrJFqxPgcY+1Q@mail.gmail.com>
 <F570466E-4F6C-4AE1-91E0-0B4ECC193BE0@fb.com>
 <7cd8a49a057f1032e126b1e104fcf61e4956e06d.camel@mendozajonas.com>,
 <FC2694E0-2F55-4089-8544-668243C6ECA2@fb.com>
In-Reply-To: <FC2694E0-2F55-4089-8544-668243C6ECA2@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:c51e]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1374;
 20:SoOZEpGfTZXHaJhczFS1uTiwEEFCgeTavL7lzAvAdKfA6UqxwrF7co0ifhz1HvdcDDU2iuXw6kk3383H19P03tffjSY96RCjd/QnfWx/i9tr7hDkiRxml3EpmUz8efACboxjkQlnzcSH/z6LeCvnr1Y5d+rOaavsphkpJdYDBKw=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(376002)(346002)(366004)(136003)(396003)(39860400002)(51914003)(199004)(189003)(86362001)(256004)(5250100002)(25786009)(229853002)(6116002)(6436002)(7736002)(4326008)(186003)(46003)(11346002)(476003)(486006)(99286004)(2900100001)(102836004)(76176011)(217873002)(6506007)(446003)(7696005)(6246003)(97736004)(2906002)(93886005)(19627405001)(71200400001)(71190400001)(316002)(14454004)(53936002)(110136005)(478600001)(54906003)(33656002)(81166006)(55016002)(74316002)(34290500001)(9686003)(54896002)(5660300001)(6606003)(68736007)(8676002)(106356001)(81156014)(8936002)(105586002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1374;
 H:MWHPR15MB1486.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: 3af9ae4c-1d83-4847-3afa-08d623dafb24
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1374; 
x-ms-traffictypediagnostic: MWHPR15MB1374:
x-microsoft-antispam-prvs: <MWHPR15MB1374A16FD20ACC60844F25DFB2150@MWHPR15MB1374.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231355)(11241501184)(944501410)(52105095)(10201501046)(3002001)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);
 SRVR:MWHPR15MB1374; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1374; 
x-forefront-prvs: 08076ABC99
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: oDFf0+zcHxpqNeTkIuorKY/w8nEBRfhJ9JAaAvSzxlxBkRXz9UV04le7p2Ipdq85m5CxFI/hHFVluc/3kTLpnVZclcuUjqMekC0ITjCFNln3B95DXM8W8DxZTfqZ0aWpMk/AUeQYhCKQF9rtypFtMnGGBKC0F7EdUuKpY07SV8aBvKO/xziDDfm5hZ8kZpdTFb+WWPIEUQIITk61gt5IeSY55MhAR/Fc/KZTE6949qaUZt0GM9saeaBgHLpP2gHNoCxyO4ranhh9+/wwWkRyAc/AfD3a4v7fopjvkix5JRJ0qhm3VEQOl8tnYgTHGWi4A/kw0kQ8cuXtjqd2sIdYQIPZFVJNxFi1GT8G9ufxOUM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_MWHPR15MB14861AED8F8AF652CE5E62B3B2150MWHPR15MB1486namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af9ae4c-1d83-4847-3afa-08d623dafb24
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2018 18:07:54.1708 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1374
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-26_08:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Wed, 26 Sep 2018 18:08:09 -0000

--_000_MWHPR15MB14861AED8F8AF652CE5E62B3B2150MWHPR15MB1486namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

 >  As I understand Justin's version adds a generic handler, using the NCSI

 >  Netlink interface to pass OEM commands and responses to and from
 >  userspace, which does the actual packet handling.
Thanks for the direction Sam! Justin, if you don't mind, can you share the =
patches you have to add the support? This actually would solve a few other =
things we are trying to accomplish.

--_000_MWHPR15MB14861AED8F8AF652CE5E62B3B2150MWHPR15MB1486namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-size: 11pt;">=
&nbsp;&gt;&nbsp; As I understand Justin's version adds a generic handler, u=
sing the NCSI</span><br>
</p>
<div style=3D"color: rgb(0, 0, 0);">
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">&nbsp;&gt;&nbsp; Netlink interface to pass OEM com=
mands and responses to and from<br>
&nbsp;&gt;&nbsp; userspace, which does the actual packet handling.<br>
</div>
<div class=3D"PlainText">Thanks for the direction Sam! Justin, if you don't=
 mind, can you share the patches you have to add the support? This actually=
 would solve a few other things we are trying to accomplish.</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_MWHPR15MB14861AED8F8AF652CE5E62B3B2150MWHPR15MB1486namp_--
