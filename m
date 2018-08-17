Return-Path: <prvs=17678ff81d=amithash@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=17678ff81d=amithash@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="GBJD37tH"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Osx8FwiI"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41sY9W5F0DzDrWY
 for <openbmc@lists.ozlabs.org>; Sat, 18 Aug 2018 05:26:50 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w7HJJRxB019705; Fri, 17 Aug 2018 12:26:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=uWs/Ozp4IsHE6mwc6Dz+lw9s4dlrQVpkH/gWH+Oi+Xk=;
 b=GBJD37tH2VIgg5q9S1XE9e1VHbb5leFLYZOuwa1rSg/g9KY0VbkcdhN1tnFALAOuSRDG
 eENSC6RfFeHvU7Hzysx9PQaC+sOEdyE3pG/yb5dNDphzsp0bR1y91/Hx/ITgmhORA1dG
 T2GmtRSAImjmvr+FAtVwr8P7Q0Odm3XzmQs= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2kx44dg2eb-13
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 17 Aug 2018 12:26:46 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.14) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Fri, 17 Aug 2018 12:26:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWs/Ozp4IsHE6mwc6Dz+lw9s4dlrQVpkH/gWH+Oi+Xk=;
 b=Osx8FwiIWvVmeiiABl5s9BqUei31OCPRWJ7ka9Y+k2ynRsJ222YRaPzIlA/PyPQKtLNayfjdIplrBl0PBx7wlyrrIfw2/XvWgK2crMVHuNg6tJJiKXBPYaK8S7a2sy2sPqw5koC7LTfD8XDT0PUUWd8AGQFl52GCtRe15HhNKEc=
Received: from MWHPR15MB1486.namprd15.prod.outlook.com (10.173.235.7) by
 MWHPR15MB1822.namprd15.prod.outlook.com (10.174.255.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1038.25; Fri, 17 Aug 2018 19:26:29 +0000
Received: from MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::41ad:1ba7:2a1e:654b]) by MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::41ad:1ba7:2a1e:654b%5]) with mapi id 15.20.1059.021; Fri, 17 Aug 2018
 19:26:29 +0000
From: Amithash Prasad <amithash@fb.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, Deepak Kodihalli
 <dkodihal@linux.vnet.ibm.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Streaming logs via rsyslog
Thread-Topic: Streaming logs via rsyslog
Thread-Index: AQHUNUr8FCA/p5CbS0GeZjKIH6ByAqTCrYUAgADPeACAAC9XAIAAZYyAgABBddM=
Date: Fri, 17 Aug 2018 19:26:29 +0000
Message-ID: <MWHPR15MB1486806D82DA44643BE9C175B23D0@MWHPR15MB1486.namprd15.prod.outlook.com>
References: <1c87c6bc-0f3b-73f2-e2a5-4b6ad7180f99@linux.vnet.ibm.com>
 <046e8fe9-1465-49ee-2170-0d06cd013218@intel.com>
 <b5f05749-ee42-a53c-5da2-f2fe04eaafd9@linux.vnet.ibm.com>
 <066e4ef8-a411-16bf-548a-b7698188f189@linux.vnet.ibm.com>,
 <7E9441B1E5EFFD4681F54958E821699345832152@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345832152@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:46c7]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1822;
 20:OH1OFYt1vTz8hoiemrnMqLlSBPYR1plHp7S33fsx2Sq+dQM+BzdwB7yrUODcIp9hHN4VzhFE+lhyip4jCvB9xaJ7fSXOgoyI9gu81ZZlONb9GT0RrFOkNTIy5/JmqZ+CsRQI3rgMtjA83iNSfdLYT0V1x/vMBRR3bB9D+T124Ro=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: d8216b77-03e2-4982-2748-08d60477550d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1822; 
x-ms-traffictypediagnostic: MWHPR15MB1822:
x-microsoft-antispam-prvs: <MWHPR15MB18223FD63BC646BFAB16105AB23D0@MWHPR15MB1822.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(5213294742642);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231311)(11241501184)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699016);
 SRVR:MWHPR15MB1822; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1822; 
x-forefront-prvs: 076777155F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(39860400002)(136003)(366004)(396003)(199004)(189003)(54896002)(476003)(46003)(186003)(74316002)(2906002)(99286004)(2900100001)(4326008)(5250100002)(93886005)(53936002)(7696005)(6246003)(76176011)(5660300001)(14454004)(316002)(11346002)(9686003)(81166006)(81156014)(7736002)(446003)(8676002)(97736004)(6506007)(6606003)(8936002)(106356001)(105586002)(229853002)(33656002)(19627405001)(486006)(587384001)(6116002)(256004)(478600001)(86362001)(68736007)(102836004)(25786009)(110136005)(3480700004)(55016002)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1822;
 H:MWHPR15MB1486.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: a0reR0nbmipF4eNBdvo5sVsqRValB7v86Uj+a8un2j1ACYKEM0TicN/MO4hT5FwMcJh3nxfaVTlNWNobS9fVI82oasnLJ62SeC08ABa1PR7qV3oODFJXe3gbVegUA+14Zvk7OelazfaSU7kB0qGXh4FOc1YddvlaKwKI804ZO0Why4wKAVbXSzQKdK8S65WWSYlYWIlsDWeywiC/sh22hk+NmpX5rILr7ajPUw9xsEiZM75iHmgHZnsxQhfjouHMsOpPXGnGWNxdu/OVIWWb3Uz9V4skYbEXmOAzChZPAtO0W+PMjrjUxk9SCuWn9EJlo+Zgz98nIqmCKcSLHjDU85b2PGnZkce5fkXKcFjY8bg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_MWHPR15MB1486806D82DA44643BE9C175B23D0MWHPR15MB1486namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d8216b77-03e2-4982-2748-08d60477550d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2018 19:26:29.2307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1822
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-08-17_06:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2018 19:26:57 -0000

--_000_MWHPR15MB1486806D82DA44643BE9C175B23D0MWHPR15MB1486namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Again, I am not a licensing expert, nor a lawyer so take my opinion with a =
grain of salt. That out of the way, shouldn't we worry about license restri=
ctions only if we are statically or dynamically linking these to other proj=
ects with a different license structure which might potentially be incompat=
ible with GPLv3?


We have been using rsyslog's remote logging at FB for a bit now and it brin=
gs with it a lot of flexibility since we can reuse a lot of the infrastruct=
ure already in place to aggregate the logs coming from the servers.

--_000_MWHPR15MB1486806D82DA44643BE9C175B23D0MWHPR15MB1486namp_
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
<p style=3D"margin-top:0;margin-bottom:0">Again, I am not a licensing exper=
t, nor a lawyer so take my opinion with a grain of salt.&nbsp;That out of t=
he way, shouldn't we worry about license restrictions only if we are static=
ally or dynamically linking these to other
 projects with a different license structure which might potentially be inc=
ompatible with GPLv3?<i style=3D""></i></p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">We have been using rsyslog's remo=
te logging at FB for a bit now and it brings with it a lot of flexibility s=
ince we can reuse a lot of the infrastructure already in place to aggregate=
 the logs coming from the servers.</p>
</div>
</body>
</html>

--_000_MWHPR15MB1486806D82DA44643BE9C175B23D0MWHPR15MB1486namp_--
