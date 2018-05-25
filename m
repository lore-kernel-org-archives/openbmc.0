Return-Path: <yupalani@microsoft.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=2a01:111:f400:fe44::726;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=yupalani@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="hNxzT32U"; dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on0726.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe44::726])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40sbWL3jx6zF1fm
 for <openbmc@lists.ozlabs.org>; Fri, 25 May 2018 16:12:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYkQaWlzNhpFhLpmcrmJ6/qcUdstTmNDHZZ7cohrXl0=;
 b=hNxzT32UZF6s9uMfPYyh2qRQ/vr0Wx2ismoI3Ctb3zxNYAKz18zdhYLwoLHRWF6tjQ0Nk+0jWHh35AmPFQZR5/xRzqViA7w0RPbQRgLc/Oz+7iH+SbyQpUGireka2OT3pgUH/fvpkReCbjX1SIlJgBW0ctMBEtHDAJcv7G3vV4Y=
Received: from MWHPR21MB0864.namprd21.prod.outlook.com (10.173.51.146) by
 MWHPR21MB0191.namprd21.prod.outlook.com (10.173.52.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.820.2; Fri, 25 May 2018 06:12:08 +0000
Received: from MWHPR21MB0864.namprd21.prod.outlook.com
 ([fe80::1997:efdf:da7:2500]) by MWHPR21MB0864.namprd21.prod.outlook.com
 ([fe80::1997:efdf:da7:2500%5]) with mapi id 15.20.0820.001; Fri, 25 May 2018
 06:12:08 +0000
From: Yugi Mani <yupalani@microsoft.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Request for review: Redfish OEM extensions
Thread-Topic: Request for review: Redfish OEM extensions
Thread-Index: AdPzltrM33ibQy9QQmKXV4lisgoMpAAWBQDw
Date: Fri, 25 May 2018 06:12:08 +0000
Message-ID: <MWHPR21MB086427F0296C47E1C18BBF6AD6690@MWHPR21MB0864.namprd21.prod.outlook.com>
References: <7E9441B1E5EFFD4681F54958E82169933A0BC863@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169933A0BC863@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=yupalani@microsoft.com; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-05-25T06:12:06.8507760Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
 Sensitivity=General
x-originating-ip: [24.16.71.179]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0191;
 7:UdNDp7AAboHIMK7tHPdDaQdiiQ7kNmeo+9OEpt55RmuH4cbdy00SPwbxRWgrsg5ks/ldJvYjV0QHy6Xh+v8H0gbIW9EM+3KryS6ekGd4ct3BGiNV/xYnafzbYhxfkmb0LgeqAhqOt2mg7zUq4WO3VhU9A7Bhyd1JlJEwcXLUO472Bpar+O8tcGrGuYqwImvp+suPB4Me1TlWx8W4ZiP+Ld7Q9hMl/bHDpiZnNhYYbeTzFijDqTe/ZtFFPgrAY/sO;
 20:/0WCt8Rekx77mLBUKp0sthf1Ou1nFKbLIp0SVdYGNlHadxZfBaEgBQf0oV5ZJjTa+XdAn9bs+ztBp8hQXUIfmWvD7ejotU1M02Bv3krqrurk+xQa9UCiTpcj4D8nz77fbBQ4JHOWz5lRjJEU6PQ3fjXfvUqCNhpcsJQSPsj4qUI=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7193020);
 SRVR:MWHPR21MB0191; 
x-ms-traffictypediagnostic: MWHPR21MB0191:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yupalani@microsoft.com; 
x-microsoft-antispam-prvs: <MWHPR21MB01918215A31C97659393F857D6690@MWHPR21MB0191.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(189930954265078)(65623756079841)(219752817060721)(228905959029699);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231254)(2018427008)(944501410)(52105095)(3002001)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR21MB0191; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0191; 
x-forefront-prvs: 06833C6A67
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(39380400002)(39860400002)(346002)(396003)(199004)(189003)(13464003)(6436002)(102836004)(55016002)(22452003)(6506007)(25786009)(10090500001)(5660300001)(26005)(476003)(446003)(11346002)(68736007)(10290500003)(76176011)(59450400001)(7736002)(229853002)(966005)(74316002)(478600001)(7696005)(14454004)(305945005)(186003)(2900100001)(486006)(53546011)(97736004)(99286004)(8990500004)(86612001)(105586002)(2501003)(81156014)(106356001)(3660700001)(6306002)(9686003)(3280700002)(81166006)(6246003)(5250100002)(3846002)(6116002)(86362001)(575784001)(33656002)(8676002)(316002)(53936002)(8936002)(2906002)(110136005)(66066001)(42262002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0191;
 H:MWHPR21MB0864.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: f2eO6K3/+2P6VfVvLkDnLu0BDN6nieTEfyEq8XUPQhbu9EQGofTCXQxrjwwaW3OY75awfisvYW8ueADF+gezBEncpn6Ds7FRdA2NEBmVoh+yYjjE0z7iuyPynb6HSQF5ccHHMgV+c/hUrzK1olITDO4WIy4QdYG2x+6WvgkJo/WQI7kliJ5K9WlAnDtU6A68
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 1474eb0a-bede-4faa-5e8b-08d5c206724a
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1474eb0a-bede-4faa-5e8b-08d5c206724a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2018 06:12:08.5080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0191
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 25 May 2018 06:12:17 -0000

Ed,=20

Is your gerrit server accessible from outside? Browser (chrome) couldn't re=
ach the server's IP address.=20

Yugi

-----Original Message-----
From: openbmc <openbmc-bounces+yupalani=3Dmicrosoft.com@lists.ozlabs.org> O=
n Behalf Of Tanous, Ed
Sent: Thursday, May 24, 2018 12:43 PM
To: openbmc@lists.ozlabs.org
Subject: Request for review: Redfish OEM extensions

The document we discussed last week in the Redfish call is open for review =
and comment.  It attempts to propose a solution to the "How do I extend red=
fish in OpenBMC?"  Pawel would very much appreciate comments a broader audi=
ence.

https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit-amr-=
2.devtools.intel.com%2Fgerrit%2F%23%2Fc%2F130414%2F&data=3D02%7C01%7Cyupala=
ni%40microsoft.com%7C6a04083be7ff41e398fe08d5c1aee6b9%7C72f988bf86f141af91a=
b2d7cd011db47%7C1%7C0%7C636627879299887599&sdata=3DN9%2FJlO36maY7cI0yexYHlO=
dh3Hm%2BfDQo2Ezu3BsT%2Fgg%3D&reserved=3D0

Along with looking at the review, if anyone has input on any of the followi=
ng, we'd love to hear about it.
1. Requirements for redfish OEM extensions in OpenBmc 2. Specific use cases=
 that aren't covered by OpenBMC today (for example, uploading an ssl certif=
icate) 3. Performance concerns and extension concerns 4. Requests for schem=
a support not already in review

Thanks,

-Ed
