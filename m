Return-Path: <pietro.maltoni@studio.unibo.it>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=studio.unibo.it
 (client-ip=40.107.6.130; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=pietro.maltoni@studio.unibo.it; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=studio.unibo.it
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=liveunibo.onmicrosoft.com
 header.i=@liveunibo.onmicrosoft.com header.b="MygiDgQu"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60130.outbound.protection.outlook.com [40.107.6.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42L3lw5pmwzF3Lc
 for <openbmc@lists.ozlabs.org>; Thu, 27 Sep 2018 02:48:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=liveunibo.onmicrosoft.com; s=selector1-studio-unibo-it;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXDCU2Ceq9X0vyVG0ZVxl+l7xgOd3RDi7QTQaaowmXc=;
 b=MygiDgQuCYi/rYpWfM+R1J1TpsVoH6EKeXr96StoDe7esD3n5GHbk3JU2uauyoOcbV9Bzxam7e5+cndx9gzk3oN6saVhY6q0MhamxkKsZQdyh/zoSqOstMSNa16nu8CbP3C0T52IeDF3EiiQR0Ck5PW8JyacGC3WpFSRE3Q+DqM=
Received: from AM6PR01MB4038.eurprd01.prod.exchangelabs.com (20.176.242.147)
 by AM6PR01MB4517.eurprd01.prod.exchangelabs.com (20.177.191.26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1164.22; Wed, 26 Sep
 2018 16:48:04 +0000
Received: from AM6PR01MB4038.eurprd01.prod.exchangelabs.com
 ([fe80::5506:f5e1:b3ff:fe21]) by AM6PR01MB4038.eurprd01.prod.exchangelabs.com
 ([fe80::5506:f5e1:b3ff:fe21%4]) with mapi id 15.20.1143.017; Wed, 26 Sep 2018
 16:48:03 +0000
From: Pietro Maltoni <pietro.maltoni@studio.unibo.it>
To: Lei YU <mine260309@gmail.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrea Bartolini
 <a.bartolini@unibo.it>
Subject: Re: Question on flashing firmware and bmc image
Thread-Topic: Question on flashing firmware and bmc image
Thread-Index: AQHUVBERksb5vURt0EuGa8fOXEbZjqUB5WaAgACDFQ4=
Date: Wed, 26 Sep 2018 16:48:03 +0000
Message-ID: <AM6PR01MB4038E359689A3867507AAC7BCF150@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>
References: <AM6PR01MB40382A2AF6BB37B46FD74C1CCF170@AM6PR01MB4038.eurprd01.prod.exchangelabs.com>,
 <CAARXrtmyz50-LrWh2UpfiPWuPLB3djkiKZUHFwfDhiN7qkEQ1A@mail.gmail.com>
In-Reply-To: <CAARXrtmyz50-LrWh2UpfiPWuPLB3djkiKZUHFwfDhiN7qkEQ1A@mail.gmail.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pietro.maltoni@studio.unibo.it; 
x-originating-ip: [137.204.150.23]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR01MB4517;
 6:VOnlwdMMdJj27HqgO7azCGeTuTdhrWVm/3huoBG0s+9+aWinoRBvm/+QP47uWHKAmpeJ352wuhclRGrPBde3N+1DGGtOjarVk8AWqNUhffQcFdQCiBMSfZ4mSvlX2CYb7G3UlPmyDsWGhfzPABKvdyP+IUEDB+ZAR9OH0VZ4/RR6lb9CE6z2/+8fRvOWReLWEwDR9XO0O9YAdNqb7j4CPdQxYXzhdCfznyOEU0NneX8iiTQprcG5wkdS1f2hehwlln0HzG57J5T8ZvxiWJyoUhdLVsv8+TH/bsSVOS/BNOOm76as++WPjxsbuHGpFiPPoKL/4vPIv3PZNmceZX0K4CDyIm57TwiVwgmmA39DIVhxWqYKJpAY4hz6/2vDOLNQu2NYT9Tf0flKIptyH6XXnacvCUNstzyAj6cs52Un8FUCtv+tuXqQGiTXxDIypYIgaGKqDJdw9hi+0nhhUhwu1A==;
 5:MJ2zWYNliZkMG+qvuX+CtNmQddxPQOKvOFRmith9O/JbAe23twP1q05F92ceEhRwxJNH5ogtc0Uu83x/YoRcLlsHkKXvglWTohdS25SL20gmlcjBRd9eq61Ip2NvR0ifnaEzehHVErViwSHzTUAUWVcJRkk+p7DHChLGmwVm5Ic=;
 7:mkLRqoXcQQ8NSQY8/1fhTH9UgO0rzBOIDwW7LlBhZpqwdscI6HbW9dLTalHWSbL8xwhP1npyjSkNJ/OsQjlA3/oieiK6Y0gyKWTX1DxMg8esCQv9C0CJOavq6IT+wXnthSMBWebxDB9oqtfTgDZo1RHQdaGdF4cJzycYbDJfuoI/0uwPa+WkcQ6f9+QmY9kPcgb+j0FwBn11dfuCbGDkS3D3lIOVEGStps6SmZxTjUuhnMLl63nmjRBZ9hh5hUQp
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(136003)(366004)(376002)(346002)(199004)(189003)(25786009)(606006)(8676002)(81156014)(81166006)(68736007)(33656002)(8936002)(26005)(107886003)(7696005)(229853002)(102836004)(4326008)(97736004)(71200400001)(71190400001)(39060400002)(14454004)(76176011)(53546011)(186003)(966005)(6606003)(478600001)(6506007)(66066001)(34290500001)(6916009)(1015004)(54906003)(99286004)(55016002)(9686003)(236005)(6306002)(54896002)(6436002)(316002)(5660300001)(786003)(53936002)(446003)(2906002)(44832011)(74482002)(14444005)(486006)(3846002)(476003)(1411001)(7736002)(19627405001)(74316002)(575784001)(6246003)(5250100002)(11346002)(86362001)(106356001)(6116002)(256004)(105586002)(2900100001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR01MB4517;
 H:AM6PR01MB4038.eurprd01.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
x-ms-office365-filtering-correlation-id: cf7827d0-22da-4a9d-bab9-08d623cfd38e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:AM6PR01MB4517; 
x-ms-traffictypediagnostic: AM6PR01MB4517:
x-microsoft-antispam-prvs: <AM6PR01MB4517C8FD985A91CBE497827FCF150@AM6PR01MB4517.eurprd01.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(274839183919467)(104084551191319)(85827821059158)(177671612209276)(166708455590820);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(3231355)(944501410)(52105095)(93006095)(93001095)(149066)(150057)(6041310)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281529075)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(201708071742011)(7699051);
 SRVR:AM6PR01MB4517; BCL:0; PCL:0; RULEID:; SRVR:AM6PR01MB4517; 
x-forefront-prvs: 08076ABC99
received-spf: None (protection.outlook.com: studio.unibo.it does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: gNUvsxzNSV4SylFIub+++aB88C/fk5nLb7F1RXsNkFrI5lEs0U1IaTLLhvudtGIYj7QMP2zx44/eJuYPdv/vGWb7I5ix4yN1Zq+4GG6ENQnHxcp5SXeqDiF/gMR7JJymLyCTj7j2D3hhk+k/2asL/FA+cxhgmo4NEsOBSzrz0eiCz2PXsS4Qc7NvJkciH7SxVAnA6Risq0qQNLtu07rFfxkxtuWzDwbwiErVChpZtuJMftvB3PQAuwsDLX3bA3Matbn3NVMQqHPVRy5DTO8PJb8tbntpZZ9Dc2jONoeiRbrwozpbaPveTOCbUi1sEgG5tKxfTD5VyFQf6zAxVONtGDjT7v2zc6vr7s/v+MpZd9k=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_AM6PR01MB4038E359689A3867507AAC7BCF150AM6PR01MB4038eurp_"
MIME-Version: 1.0
X-OriginatorOrg: studio.unibo.it
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7827d0-22da-4a9d-bab9-08d623cfd38e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2018 16:48:03.3052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR01MB4517
X-Mailman-Approved-At: Sat, 29 Sep 2018 18:28:19 +1000
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
X-List-Received-Date: Wed, 26 Sep 2018 16:48:14 -0000

--_000_AM6PR01MB4038E359689A3867507AAC7BCF150AM6PR01MB4038eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thank for your reply,

Now i see the openpower sensors and if I issue the ipmitool  sel elist comm=
and I see the OCC represented as follow:

=93
occ_3_0050       | 08h | ok  |  0.0 | Device Enabled
=93


However when I try to issue ipmitool raw 0x3A command we do not get passthr=
ough toward OCC, as it seems that the OCC netfn codes is not defined.


=93RAW Commands:  raw <netfn> <cmd> [data]

Network Function Codes:

  VAL   HEX     STRING
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  0     0x00    Chassis
  2     0x02    Bridge
  4     0x04    SensorEvent
  6     0x06    Application
  8     0x08    Firmware
  10    0x0a    Storage
  12    0x0c    Transport
=93

This is my version of BMC image
commit 282ba3dea1b56d620202e7ffe24cfdb671ceed6d
Author: Alexander Filippov <a.filippov@yadro.com>
Date:   Mon Sep 10 09:47:35 2018 +0300

And this is the pnor image version.
commit 4fd251a60984d2eb39ed5895a8f84b979f5d0b4a (HEAD -> master, origin/mas=
ter, origin/HEAD)
Merge: c50dae9 d8de440
Author: Corey Swenson <cswenson@us.ibm.com>
Date:   Tue Sep 4 12:18:44 2018 -0500



________________________________
Da: Lei YU <mine260309@gmail.com>
Inviato: mercoled=EC 26 settembre 2018 05:12
A: Pietro Maltoni
Cc: OpenBMC Maillist; Andrea Bartolini
Oggetto: Re: Question on flashing firmware and bmc image

The questions in the mail does not reflect to the title, hope you could use=
 a
more specific title.

On Wed, Sep 26, 2018 at 7:53 AM Pietro Maltoni
<pietro.maltoni@studio.unibo.it> wrote:

> After installing it I've recognized that oem openpower commands and senso=
rs are not available.
>
> For instance when doing ipmitool sdr elist I do not see openpower sensors=
(occ ones) as well as netfn in ipmi does not contain commands for the occ.

What is the revision of your build?
The ipmi related configs are not complete for Palmetto, and there is a
[recent commit][1] to add part of the sensors for ipmi.
With the commit, ipmi sdr elist works ok.
If you are looking to adding more sensors, patches are welcome!

And what do you mean by "netfn in ipmi does not contain commands for the oc=
c"?

>
> By searching on the code I've recognized that these are in meta-openpower=
 recipes. How can i enable them? Is there a standard procedure for enabling=
 them on openpower hardware or in palmetto?

Please refer to the below link as an example of ipmi config for Palmetto's
sensors.


[1]: https://github.com/openbmc/openbmc/commit/f47fb7cf87e6d69132f4ca101206=
dbf091097027#diff-d90eaa8cd7210f2f005894b7f7001d9d

--_000_AM6PR01MB4038E359689A3867507AAC7BCF150AM6PR01MB4038eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"color:rgb(0,0,0); fon=
t-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quo=
t;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&q=
uot;Android Emoji&quot;,EmojiSymbols">
<p style=3D"margin-top:0px; margin-bottom:0px"><span style=3D"font-size:14.=
6667px">Thank for your reply,&nbsp;</span></p>
<p style=3D"margin-top:0px; margin-bottom:0px"><span style=3D"font-size:14.=
6667px">Now i see the openpower sensors and if I&nbsp;</span><span style=3D=
"font-size:11pt; font-family:Calibri,sans-serif; color:rgb(33,33,33)">issue=
 the ipmitool &nbsp;sel elist command I see the
 OCC represented as follow:</span><span style=3D"font-size:14.6667px"></spa=
n></p>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">=93</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB"></span></span></font><span style=3D"font-size:11pt; f=
ont-family:Calibri,sans-serif">occ_3_0050&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 08h | ok&nbsp; |&nbsp; 0.0 | Device Enabled</span></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">=93</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB"><br>
</span></span></font></div>
<p></p>
<p style=3D"margin-top:0px; margin-bottom:0px">However when I try to issue =
ipmitool raw 0x3A&nbsp;<span style=3D"color:rgb(33,33,33); font-family:Cali=
bri,sans-serif; font-size:14.6667px">command we do not get passthrough towa=
rd OCC,&nbsp;</span><span style=3D"font-size:11pt; font-family:Calibri,sans=
-serif; color:rgb(33,33,33)">as
 it seems that the OCC netfn codes is not defined.</span><span style=3D"col=
or:rgb(33,33,33); font-family:Calibri,sans-serif; font-size:14.6667px"></sp=
an></p>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">&nbsp;</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">=93RAW Commands:&nbsp; raw &lt;netfn&gt; &lt;cmd&gt; =
[data]</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">&nbsp;</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">Network Function Codes:</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">&nbsp;</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">&nbsp; VAL&nbsp;&nbsp; HEX&nbsp;&nbsp;&nbsp;&nbsp; ST=
RING</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0x00&nbsp;&nbsp;&nbs=
p; Chassis</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp; 0x02&nbsp;&nbsp;&nbs=
p; Bridge</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">&nbsp; 4&nbsp;&nbsp;&nbsp;&nbsp; 0x04&nbsp;&nbsp;&nbs=
p; SensorEvent</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">&nbsp; 6&nbsp;&nbsp;&nbsp;&nbsp; 0x06&nbsp;&nbsp;&nbs=
p; Application</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">&nbsp; 8&nbsp;&nbsp;&nbsp;&nbsp; 0x08&nbsp;&nbsp;&nbs=
p; Firmware</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">&nbsp; 10&nbsp;&nbsp;&nbsp; 0x0a&nbsp;&nbsp;&nbsp; St=
orage</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">&nbsp; 12&nbsp;&nbsp;&nbsp; 0x0c&nbsp;&nbsp;&nbsp; Tr=
ansport</span></span></font></div>
<div style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:15px; margin:0px">
<font face=3D"Calibri,sans-serif" size=3D"2"><span style=3D"font-size:11pt"=
><span lang=3D"en-GB">=93</span></span></font></div>
<p></p>
<div>This is my version of BMC image&nbsp;</div>
<div>commit 282ba3dea1b56d620202e7ffe24cfdb671ceed6d</div>
<div>Author: Alexander Filippov &lt;a.filippov@yadro.com&gt;</div>
<div>Date:&nbsp; &nbsp;Mon Sep 10 09:47:35 2018 &#43;0300</div>
<div><br>
</div>
<div>And this is the&nbsp;pnor image&nbsp;<span style=3D"font-family:Calibr=
i,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe =
UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emo=
ji&quot;,EmojiSymbols; font-size:16px">version.</span></div>
<div>commit 4fd251a60984d2eb39ed5895a8f84b979f5d0b4a (HEAD -&gt; master, or=
igin/master, origin/HEAD)</div>
<div>Merge: c50dae9 d8de440</div>
<div>Author: Corey Swenson &lt;cswenson@us.ibm.com&gt;</div>
<div>Date:&nbsp; &nbsp;Tue Sep 4 12:18:44 2018 -0500</div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"color:rgb(0,0,0); fon=
t-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple Color Emoji&quo=
t;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI Symbol&quot;,&q=
uot;Android Emoji&quot;,EmojiSymbols">
<br>
</div>
<br>
<br>
<div style=3D"font-size:12pt; color:rgb(0,0,0)">
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>Da:</b> Lei YU &lt;mine260309@g=
mail.com&gt;<br>
<b>Inviato:</b> mercoled=EC 26 settembre 2018 05:12<br>
<b>A:</b> Pietro Maltoni<br>
<b>Cc:</b> OpenBMC Maillist; Andrea Bartolini<br>
<b>Oggetto:</b> Re: Question on flashing firmware and bmc image</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">The questions in the mail does not reflect to the =
title, hope you could use a<br>
more specific title.<br>
<br>
On Wed, Sep 26, 2018 at 7:53 AM Pietro Maltoni<br>
&lt;pietro.maltoni@studio.unibo.it&gt; wrote:<br>
<br>
&gt; After installing it I've recognized that oem openpower commands and se=
nsors are not available.<br>
&gt;<br>
&gt; For instance when doing ipmitool sdr elist I do not see openpower sens=
ors(occ ones) as well as netfn in ipmi does not contain commands for the oc=
c.<br>
<br>
What is the revision of your build?<br>
The ipmi related configs are not complete for Palmetto, and there is a<br>
[recent commit][1] to add part of the sensors for ipmi.<br>
With the commit, ipmi sdr elist works ok.<br>
If you are looking to adding more sensors, patches are welcome!<br>
<br>
And what do you mean by &quot;netfn in ipmi does not contain commands for t=
he occ&quot;?<br>
<br>
&gt;<br>
&gt; By searching on the code I've recognized that these are in meta-openpo=
wer recipes. How can i enable them? Is there a standard procedure for enabl=
ing them on openpower hardware or in palmetto?<br>
<br>
Please refer to the below link as an example of ipmi config for Palmetto's<=
br>
sensors.<br>
<br>
<br>
[1]: <a href=3D"https://github.com/openbmc/openbmc/commit/f47fb7cf87e6d6913=
2f4ca101206dbf091097027#diff-d90eaa8cd7210f2f005894b7f7001d9d" id=3D"LPlnk6=
50958" class=3D"OWAAutoLink" previewremoved=3D"true">
https://github.com/openbmc/openbmc/commit/f47fb7cf87e6d69132f4ca101206dbf09=
1097027#diff-d90eaa8cd7210f2f005894b7f7001d9d</a><br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_AM6PR01MB4038E359689A3867507AAC7BCF150AM6PR01MB4038eurp_--
