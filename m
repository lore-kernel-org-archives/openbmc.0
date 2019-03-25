Return-Path: <sboylan@ircona.com>
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur03-am5-obe.outbound.protection.outlook.com
 (client-ip=40.107.3.108; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=sboylan@ircona.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ircona.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Ircona.onmicrosoft.com header.i=@Ircona.onmicrosoft.com
 header.b="qioq5bSu"; dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30108.outbound.protection.outlook.com [40.107.3.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44SjJ95kJrzDqGC
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 05:21:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Ircona.onmicrosoft.com; s=selector1-ircona-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PuRxI1W21xFKZ2XT1kut0ddR38ooqz/cW+ISeMFY3E=;
 b=qioq5bSubNrLM35wfzeL5mF6k2eEgMSfUWodchAEuhgQgeYwDZLUZThD7eqan5bJP/WTsTWk9dA5rhckVPXC4xcSx2Tsj+KX3cNJROh1w60k4+rnCj6RVYx3GQPkDf+GYgbPAZNUI4yRxk6D7r/Mb3d71PwtSqXeYlcb15CLAv8=
Received: from AM0PR04MB5218.eurprd04.prod.outlook.com (20.176.215.146) by
 AM0PR04MB5457.eurprd04.prod.outlook.com (20.178.113.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Mon, 25 Mar 2019 18:21:05 +0000
Received: from AM0PR04MB5218.eurprd04.prod.outlook.com
 ([fe80::3487:b417:ff4d:6fe0]) by AM0PR04MB5218.eurprd04.prod.outlook.com
 ([fe80::3487:b417:ff4d:6fe0%4]) with mapi id 15.20.1730.019; Mon, 25 Mar 2019
 18:21:05 +0000
From: Stephen Boylan <sboylan@ircona.com>
To: "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>
Subject: Issue powering on - org.openbmc.control.Power & pgood_wait
Thread-Topic: Issue powering on - org.openbmc.control.Power & pgood_wait
Thread-Index: AQHU4zPgI/FVUBX2406zmXyR/NT8+A==
Date: Mon, 25 Mar 2019 18:21:05 +0000
Message-ID: <AM0PR04MB5218589AFDE438AB4927EF89C95E0@AM0PR04MB5218.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sboylan@ircona.com; 
x-originating-ip: [2a02:8084:26c2:c900:7db9:7a99:d126:7497]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47f92691-ebfb-460d-695c-08d6b14ea4ed
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:AM0PR04MB5457; 
x-ms-traffictypediagnostic: AM0PR04MB5457:
x-microsoft-antispam-prvs: <AM0PR04MB5457F4D61247726FB89630E5C95E0@AM0PR04MB5457.eurprd04.prod.outlook.com>
x-forefront-prvs: 0987ACA2E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(376002)(39830400003)(136003)(366004)(53754006)(199004)(189003)(5660300002)(256004)(7736002)(81156014)(486006)(97736004)(7696005)(2906002)(54896002)(81166006)(74316002)(14454004)(6436002)(25786009)(9686003)(8676002)(6506007)(33656002)(186003)(14444005)(508600001)(52536014)(86362001)(6916009)(55016002)(99286004)(8936002)(71190400001)(105586002)(106356001)(71200400001)(53936002)(316002)(105004)(6116002)(46003)(476003)(102836004)(19627405001)(68736007)(491001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR04MB5457;
 H:AM0PR04MB5218.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ircona.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uyCg0Bj55H3Z8pcfdNJUrhV+Wrs4qwVj+rFT6yQzWdXVzOI8K3DImEI3ajbb1gV20HWD80HPOwmvlzZgpAx6PPQ+5yn0H0tvi6kgMDCqlrMzfqiAxpPaGPLSMp7timniAnNsU1Swf51dXe4GLU865+g+AdLWkbG83RLvajdvTFioSYenrgSoh4ZeEUwAD+9n05MwAebKi9hSHxLBY52zoxxm3vx/+lMlc0cEkWugZseUxnV7phkRZm1PODzeukaXOI+Y2VDOwESpYtaNgEg4rBY9WvBEqJSe9N5oSPWabsEQK6kWa65PGoPkvoQw57jCR2RifeNTqItWk1nHl9uJG3vacKLTZf4lN6zBOVeS2BYRSKX2u+s8qbNxexhN9OXdsiSGUlE0FJRiE+A/UZpL7T6oVxI5Dep73Jrka+LLkS8=
Content-Type: multipart/alternative;
 boundary="_000_AM0PR04MB5218589AFDE438AB4927EF89C95E0AM0PR04MB5218eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ircona.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f92691-ebfb-460d-695c-08d6b14ea4ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2019 18:21:05.0190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b5c9eba5-d9aa-4fea-9ead-d4e7d7f623f9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5457
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
X-List-Received-Date: Mon, 25 Mar 2019 18:21:15 -0000

--_000_AM0PR04MB5218589AFDE438AB4927EF89C95E0AM0PR04MB5218eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello all,

On the board I'm using - based on the evb2500 phosphor build - I've run int=
o an issue trying to power the system on. Here is what I've noticed occurri=
ng

A basic overview of the power on request - the AST2500 sends a PWR_ON signa=
l to an FPGA to request that the server power on. The FPGA sends back PGOOD=
 and powers on the system. If the FPGA receives a continuous PWR_ON signal =
for more than 4 seconds, it will immediately shut down the server.

When I momentarily press the power button on the server or issue an "ipmito=
ol chassis power on" command I see the following occurring by monitoring th=
e pin of each related signal

  1.  "power_up_outs" GPIOs get asserted as per the configuration from gpio=
_defs.json
  2.  The FPGA starts to power the system up and asserts it's PGOOD pin, ti=
ed to "power_good_in".
  3.  "power_up_outs" remain asserted and cross over the 4 second limit.
  4.  The FPGA de-asserts "power_good_in" and immediately turns the system =
off.
  5.  A short time after the FPGA de-asserts "power_good_in", the "reset_ou=
ts" pins are asserted.
  6.  The "power_up_outs" signals stay asserted for 30 seconds, until the p=
good_wait service times out, then they de-assert.

Additionally I can view /org/openbmc/control/power0 and see pgood in the da=
ta change to reflect the state of the pin.

My understanding is that pgood_wait is meant to signal that pgood has been =
received and then de-assert the "power_up_outs", however this is not happen=
ing. I can also see a message via journalctl about it timing out.

Does anyone have any idea why despite me seeing the pin receive the signal,=
 that pgood_wait isn't recognising the change and triggering?

If I manually drive the power_up_outs pins to high and low within 1 second,=
 using something like "echo 1 > gpio#/value ; sleep 1 ; echo 0 > gpio#/valu=
e" then everything works fine and the system will power up.

Regards,
Stephen Boylan


--_000_AM0PR04MB5218589AFDE438AB4927EF89C95E0AM0PR04MB5218eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello all,&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
On the board I'm using - based on the evb2500 phosphor build - I've run int=
o an issue trying to power the system on. Here is what I've noticed occurri=
ng</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
A basic overview of the power on request - the AST2500 sends a PWR_ON signa=
l to an FPGA to request that the server power on. The FPGA sends back PGOOD=
 and powers on the system. If the FPGA receives a continuous PWR_ON signal =
for more than 4 seconds, it will
 immediately shut down the server.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: calibri, arial, helvetica,=
 sans-serif; font-size: 12pt;"><br>
</span></div>
<div style=3D""><span style=3D"color: rgb(0, 0, 0); font-family: calibri, a=
rial, helvetica, sans-serif; font-size: 12pt;">When I momentarily press the=
 power button on the server or issue an &quot;ipmitool chassis power on&quo=
t; command I see the following&nbsp;</span><font color=3D"#000000" face=3D"=
calibri, arial, helvetica, sans-serif">occurring
 by monitoring the pin of each related signal</font></div>
<div style=3D"">
<ol>
<li style=3D"font-family: calibri, arial, helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
&quot;power_up_outs&quot; GPIOs get asserted as per the configuration from =
gpio_defs.json<br>
</li><li style=3D"font-family: calibri, arial, helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);">
The FPGA starts to power the system up and asserts it's PGOOD pin, tied to =
&quot;power_good_in&quot;.</li><li style=3D"font-family: calibri, arial, he=
lvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;power_up_outs&quot; remain asserted and cross over the 4 second limit=
.</li><li style=3D"font-family: calibri, arial, helvetica, sans-serif; font=
-size: 12pt; color: rgb(0, 0, 0);">
The FPGA de-asserts &quot;power_good_in&quot; and immediately turns the sys=
tem off.</li><li style=3D"font-family: calibri, arial, helvetica, sans-seri=
f; font-size: 12pt; color: rgb(0, 0, 0);">
A short time after the FPGA de-asserts &quot;power_good_in&quot;, the &quot=
;reset_outs&quot; pins are asserted.&nbsp;</li><li style=3D"font-family: ca=
libri, arial, helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"=
>
The &quot;power_up_outs&quot; signals stay asserted for 30 seconds, until t=
he pgood_wait service times out, then they de-assert.</li></ol>
<div>Additionally I can view&nbsp;/org/openbmc/control/power0 and see pgood=
 in the data change to reflect the state of the pin.&nbsp;</div>
<div><br>
</div>
<div>My understanding is that pgood_wait is meant to signal that pgood has =
been received and then de-assert the &quot;power_up_outs&quot;, however thi=
s is not happening. I can also see a message via journalctl about it timing=
 out.&nbsp;</div>
<div><br>
</div>
<div>Does anyone have any idea why despite me seeing the pin receive the si=
gnal, that pgood_wait isn't recognising the change and triggering?<br>
<br>
If I manually drive the power_up_outs pins to high and low within 1 second,=
 using something like &quot;echo 1 &gt; gpio#/value ; sleep 1 ; echo 0 &gt;=
 gpio#/value&quot; then everything works fine and the system will power up.=
&nbsp;</div>
<div><br>
</div>
<div>Regards,</div>
<div>Stephen Boylan<br>
<br>
</div>
<font color=3D"#000000" face=3D"calibri, arial, helvetica, sans-serif"></fo=
nt></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
</div>
</body>
</html>

--_000_AM0PR04MB5218589AFDE438AB4927EF89C95E0AM0PR04MB5218eurp_--
