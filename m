Return-Path: <sboylan@ircona.com>
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur01-he1-obe.outbound.protection.outlook.com
 (client-ip=40.107.13.137; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=sboylan@ircona.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ircona.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Ircona.onmicrosoft.com header.i=@Ircona.onmicrosoft.com
 header.b="Xgh419Vv"; dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130137.outbound.protection.outlook.com [40.107.13.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44q5JJ1GgDzDq5W
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 02:25:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Ircona.onmicrosoft.com; s=selector1-ircona-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMkIybcwSznaHi8cAPktg54Ux2PsnM/I+/GR85LnyHY=;
 b=Xgh419VvtW71nEC+MfuxYQf+zDfxFI37TVs/eqzIdZ3gJ2Dc11cna2BDom41YIc+yETiyFnTolJijQomZH+QFcluxZLkV8RQYEFgzE1uIcxfKTsZqgQPLQb/j9wL/uMfu9rGMitrhJiwo6w2jCtmOjd6WHHSsk50bVUkn6mtYP0=
Received: from AM6PR04MB5224.eurprd04.prod.outlook.com (20.177.35.205) by
 AM6PR04MB5509.eurprd04.prod.outlook.com (20.178.95.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Wed, 24 Apr 2019 16:24:56 +0000
Received: from AM6PR04MB5224.eurprd04.prod.outlook.com
 ([fe80::842a:a3a0:2cb:14a2]) by AM6PR04MB5224.eurprd04.prod.outlook.com
 ([fe80::842a:a3a0:2cb:14a2%6]) with mapi id 15.20.1813.017; Wed, 24 Apr 2019
 16:24:56 +0000
From: Stephen Boylan <sboylan@ircona.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Fan control service issues - service will not start "Uncaught DBus
 service lookup failure exception"
Thread-Topic: Fan control service issues - service will not start "Uncaught
 DBus service lookup failure exception"
Thread-Index: AdT6ueaOpTUjQysESgWYcotM1jhn3g==
Date: Wed, 24 Apr 2019 16:24:56 +0000
Message-ID: <AM6PR04MB5224A33032E47CE691601881C93C0@AM6PR04MB5224.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sboylan@ircona.com; 
x-originating-ip: [87.198.164.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6969c0e8-fc47-4fa9-b980-08d6c8d1636f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM6PR04MB5509; 
x-ms-traffictypediagnostic: AM6PR04MB5509:
x-microsoft-antispam-prvs: <AM6PR04MB55094644105C99839495683FC93C0@AM6PR04MB5509.eurprd04.prod.outlook.com>
x-forefront-prvs: 00179089FD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(376002)(346002)(39830400003)(189003)(199004)(53754006)(1730700003)(81156014)(6916009)(53936002)(476003)(6116002)(790700001)(71200400001)(6306002)(97736004)(54896002)(14444005)(256004)(9686003)(33656002)(2501003)(236005)(66066001)(81166006)(102836004)(2351001)(8676002)(316002)(2906002)(8936002)(6506007)(99286004)(7736002)(52536014)(14454004)(66476007)(66556008)(73956011)(5660300002)(71190400001)(64756008)(66446008)(74316002)(186003)(66946007)(5640700003)(3846002)(68736007)(486006)(25786009)(76116006)(26005)(508600001)(6436002)(55016002)(86362001)(7696005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR04MB5509;
 H:AM6PR04MB5224.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: ircona.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vdxuX8ODhevyLdJcVTuA+407n2xLAcjrEno+kJZBypzLDwSUh/GaKohsJcrYod0ZwuwdpsSTnIjsjc6/6nj8wWNjLkl2v4YWWniB+GVcCJf2OniKy3q9pdrVgS8TD0b5FkoDU0UoHT1V6S9FNhZ/szA3Ks5A4XVOSHGLlGHD0oR5IGF0xevI0PQ/TpQxtC3/jcz0MqYxxfU2njhtDOwywPiKdnukccF4mQtEXD89KCM7nfCfHIW2XccihBADX+1bUScCl8WbNBpRA/rXqphqwQ7lpWFB2Xkdpsx+U8cnjIrd+aLbrIBrMcqcUaTs7ObFC4JKmGby9oK2ts5BVpzV3a6FRKfNSvD7RaHIrHk5VbMYNJwO/f/OVjTp5SuzVqxWqg3xXyOptnSndLaGnSJmBYjQfxt+uQ2fCh2nCvB8uJM=
Content-Type: multipart/alternative;
 boundary="_000_AM6PR04MB5224A33032E47CE691601881C93C0AM6PR04MB5224eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ircona.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6969c0e8-fc47-4fa9-b980-08d6c8d1636f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2019 16:24:56.0509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b5c9eba5-d9aa-4fea-9ead-d4e7d7f623f9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5509
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
X-List-Received-Date: Wed, 24 Apr 2019 16:25:06 -0000

--_000_AM6PR04MB5224A33032E47CE691601881C93C0AM6PR04MB5224eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

I've run into an issue with my fan control. I have a simple two fan system =
which is failing to start phosphor-fan-control@.service<mailto:phosphor-fan=
-control@.service>

This is the status
root@evb-ast2500:/lib/systemd/system# systemctl status phosphor-fan-control=
@0.service --no-page
? phosphor-fan-control@0.service - Phosphor Fan Control Daemon
   Loaded: loaded (/lib/systemd/system/phosphor-fan-control@.service; stati=
c; vendor preset: enabled)
   Active: failed (Result: exit-code) since Wed 2019-04-24 16:22:36 UTC; 16=
s ago
  Process: 1218 ExecStart=3D/usr/bin/env phosphor-fan-control --control (co=
de=3Dexited, status=3D1/FAILURE)
Main PID: 1218 (code=3Dexited, status=3D1/FAILURE)

Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: Ser=
vice RestartSec=3D1s expired, scheduling restart.
Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: Sch=
eduled restart job, restart counter is at 2.
Apr 24 16:22:36 evb-ast2500 systemd[1]: Stopped Phosphor Fan Control Daemon=
.
Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: Sta=
rt request repeated too quickly.
Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: Fai=
led with result 'exit-code'.
Apr 24 16:22:36 evb-ast2500 systemd[1]: Failed to start Phosphor Fan Contro=
l Daemon.

And I noticed this in the journalctl
{
        "__CURSOR" : "s=3Defc0b033c5f243798b56446bcaffc0f5;i=3D23d;b=3D2de3=
ccbcea7940f5b51652e55e900cd2;m=3D2f22198c;t=3D5874871dec1c2;x=3Df1ba902c2ec=
1feae",
        "__REALTIME_TIMESTAMP" : "1556120101372354",
        "__MONOTONIC_TIMESTAMP" : "790763916",
        "_BOOT_ID" : "2de3ccbcea7940f5b51652e55e900cd2",
        "_UID" : "0",
        "_GID" : "0",
        "_MACHINE_ID" : "4c5bf4049b5e4751b70a17eaeeb55a49",
        "_HOSTNAME" : "evb-ast2500",
        "_TRANSPORT" : "journal",
        "_CAP_EFFECTIVE" : "3fffffffff",
        "CODE_FILE" : "/home/ircadmin/OpenBMC/openbmc/build/tmp/work/armv6-=
openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC+4b258ac8b6-r1/recipe-sysr=
oot/usr
/include/phosphor-logging/log.hpp",
        "CODE_LINE" : "105",
        "CODE_FUNC" : "helper_log",
        "PRIORITY" : "3",
        "MESSAGE" : "Uncaught DBus service lookup failure exception",
        "TRANSACTION_ID" : "114915536",
        "PATH" : "/xyz/openbmc_project/sensors/fan_tach/fan0",
        "INTERFACE" : "xyz.openbmc_project.Control.FanPwm",
        "SYSLOG_IDENTIFIER" : "phosphor-fan-control",
        "_PID" : "1273",
        "_COMM" : "phosphor-fan-co",
        "_EXE" : "/usr/sbin/phosphor-fan-control",
        "_CMDLINE" : "phosphor-fan-control --control",
        "_SYSTEMD_CGROUP" : "/system.slice/system-phosphor\\x2dfan\\x2dcont=
rol.slice/phosphor-fan-control@0.service",
        "_SYSTEMD_UNIT" : "phosphor-fan-control@0.service",
        "_SYSTEMD_SLICE" : "system-phosphor\\x2dfan\\x2dcontrol.slice",
        "_SYSTEMD_INVOCATION_ID" : "21572a9f879c44cab2b9b6b4c5e9a504",
        "_SOURCE_REALTIME_TIMESTAMP" : "1556120101372269"
}

I know the PATH exists, though I'm not entirely sure about the INTERFACE. I=
've checked systemctl to see if I can find it and I don't see it. Should I =
be checking elsewhere for it?


I can see my fan_tach sensors and my chassis entries as such
/xyz/openbmc_project/sensors/fan_tach/enumerate

{

    "data": {

        "/xyz/openbmc_project/sensors/fan_tach/fan0": {

            "CriticalAlarmHigh": false,

            "CriticalAlarmLow": false,

            "CriticalHigh": 5500,

            "CriticalLow": 1000,

            "MaxValue": 0,

            "MinValue": 0,

            "Scale": 0,

            "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",

            "Value": 4292,

            "WarningAlarmHigh": false,

            "WarningAlarmLow": false,

            "WarningHigh": 5000,

            "WarningLow": 1500

        },

        "/xyz/openbmc_project/sensors/fan_tach/fan1": {

            "CriticalAlarmHigh": false,

            "CriticalAlarmLow": false,

            "CriticalHigh": 5500,

            "CriticalLow": 1000,

            "MaxValue": 0,

            "MinValue": 0,

            "Scale": 0,

            "Target": 255,

            "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",

            "Value": 3551,

            "WarningAlarmHigh": false,

            "WarningAlarmLow": false,

            "WarningHigh": 5000,

            "WarningLow": 1500

        }

    },

    "message": "200 OK",

    "status": "ok"

}


/xyz/openbmc_project/inventory/system/chassis/motherboard/enumerate
{
    "data": {
        "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0": {
            "Functional": true,
            "Present": true,
           "PrettyName": "fan0"
        },
        "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0/fan=
0": {
            "Functional": true
        },
        "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1": {
            "Functional": true,
            "Present": true,
            "PrettyName": "fan1"
        },
        "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1/fan=
1": {
            "Functional": true
        }
    },
    "message": "200 OK",
    "status": "ok"
}


--_000_AM6PR04MB5224A33032E47CE691601881C93C0AM6PR04MB5224eurp_
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
code
	{mso-style-priority:99;
	font-family:"Courier New";}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";
	mso-fareast-language:EN-IE;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IE" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello all, <br>
<br>
I&#8217;ve run into an issue with my fan control. I have a simple two fan s=
ystem which is failing to start
<a href=3D"mailto:phosphor-fan-control@.service">phosphor-fan-control@.serv=
ice</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is the status<o:p></o:p></p>
<p class=3D"MsoNormal">root@evb-ast2500:/lib/systemd/system# systemctl stat=
us phosphor-fan-control@0.service --no-page<o:p></o:p></p>
<p class=3D"MsoNormal">? phosphor-fan-control@0.service - Phosphor Fan Cont=
rol Daemon<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Loaded: loaded (/lib/systemd/system/pho=
sphor-fan-control@.service; static; vendor preset: enabled)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Active: failed (Result: exit-code) sinc=
e Wed 2019-04-24 16:22:36 UTC; 16s ago<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Process: 1218 ExecStart=3D/usr/bin/env phosph=
or-fan-control --control (code=3Dexited, status=3D1/FAILURE)<o:p></o:p></p>
<p class=3D"MsoNormal">Main PID: 1218 (code=3Dexited, status=3D1/FAILURE)<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan=
-control@0.service: Service RestartSec=3D1s expired, scheduling restart.<o:=
p></o:p></p>
<p class=3D"MsoNormal">Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan=
-control@0.service: Scheduled restart job, restart counter is at 2.<o:p></o=
:p></p>
<p class=3D"MsoNormal">Apr 24 16:22:36 evb-ast2500 systemd[1]: Stopped Phos=
phor Fan Control Daemon.<o:p></o:p></p>
<p class=3D"MsoNormal">Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan=
-control@0.service: Start request repeated too quickly.<o:p></o:p></p>
<p class=3D"MsoNormal">Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan=
-control@0.service: Failed with result 'exit-code'.<o:p></o:p></p>
<p class=3D"MsoNormal">Apr 24 16:22:36 evb-ast2500 systemd[1]: Failed to st=
art Phosphor Fan Control Daemon.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And I noticed this in the journalctl<o:p></o:p></p>
<p class=3D"MsoNormal">{<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;__C=
URSOR&quot; : &quot;s=3Defc0b033c5f243798b56446bcaffc0f5;i=3D23d;b=3D2de3cc=
bcea7940f5b51652e55e900cd2;m=3D2f22198c;t=3D5874871dec1c2;x=3Df1ba902c2ec1f=
eae&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;__R=
EALTIME_TIMESTAMP&quot; : &quot;1556120101372354&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;__M=
ONOTONIC_TIMESTAMP&quot; : &quot;790763916&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_BO=
OT_ID&quot; : &quot;2de3ccbcea7940f5b51652e55e900cd2&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_UI=
D&quot; : &quot;0&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_GI=
D&quot; : &quot;0&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&quot;_MA=
CHINE_ID&quot; : &quot;4c5bf4049b5e4751b70a17eaeeb55a49&quot;,<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_HO=
STNAME&quot; : &quot;evb-ast2500&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_TR=
ANSPORT&quot; : &quot;journal&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_CA=
P_EFFECTIVE&quot; : &quot;3fffffffff&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;COD=
E_FILE&quot; : &quot;/home/ircadmin/OpenBMC/openbmc/build/tmp/work/armv6-op=
enbmc-linux-gnueabi/phosphor-fan/1.0&#43;gitAUTOINC&#43;4b258ac8b6-r1/recip=
e-sysroot/usr<o:p></o:p></p>
<p class=3D"MsoNormal">/include/phosphor-logging/log.hpp&quot;,<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;COD=
E_LINE&quot; : &quot;105&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;COD=
E_FUNC&quot; : &quot;helper_log&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PRI=
ORITY&quot; : &quot;3&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MES=
SAGE&quot; : &quot;Uncaught DBus service lookup failure exception&quot;,<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;TRA=
NSACTION_ID&quot; : &quot;114915536&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PAT=
H&quot; : &quot;/xyz/openbmc_project/sensors/fan_tach/fan0&quot;,<o:p></o:p=
></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;INT=
ERFACE&quot; : &quot;xyz.openbmc_project.Control.FanPwm&quot;,<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SYS=
LOG_IDENTIFIER&quot; : &quot;phosphor-fan-control&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_PI=
D&quot; : &quot;1273&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_CO=
MM&quot; : &quot;phosphor-fan-co&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_EX=
E&quot; : &quot;/usr/sbin/phosphor-fan-control&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_CM=
DLINE&quot; : &quot;phosphor-fan-control --control&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SY=
STEMD_CGROUP&quot; : &quot;/system.slice/system-phosphor\\x2dfan\\x2dcontro=
l.slice/phosphor-fan-control@0.service&quot;,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SY=
STEMD_UNIT&quot; : &quot;phosphor-fan-control@0.service&quot;,<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SY=
STEMD_SLICE&quot; : &quot;system-phosphor\\x2dfan\\x2dcontrol.slice&quot;,<=
o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SY=
STEMD_INVOCATION_ID&quot; : &quot;21572a9f879c44cab2b9b6b4c5e9a504&quot;,<o=
:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SO=
URCE_REALTIME_TIMESTAMP&quot; : &quot;1556120101372269&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">}<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I know the PATH exists, though I&#8217;m not entirel=
y sure about the INTERFACE. I&#8217;ve checked systemctl to see if I can fi=
nd it and I don&#8217;t see it. Should I be checking elsewhere for it?<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I can see my fan_tach sensors and my chassis entries=
 as such<o:p></o:p></p>
<p class=3D"MsoNormal">/xyz/openbmc_project/sensors/fan_tach/enumerate<o:p>=
</o:p></p>
<pre><code><span style=3D"color:black">{<o:p></o:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp; &quot;data&quot;:=
 {<o:p></o:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;/xyz/openbmc_project/sensors/fan_tach/fan0&quot;: {<o:p></o:p>=
</span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CriticalAlarmHigh&quot;: false,<o:p></=
o:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CriticalAlarmLow&quot;: false,<o:p></o=
:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CriticalHigh&quot;: 5500,<o:p></o:p></=
span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CriticalLow&quot;: 1000,<o:p></o:p></s=
pan></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MaxValue&quot;: 0,<o:p></o:p></span></=
code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MinValue&quot;: 0,<o:p></o:p></span></=
code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Scale&quot;: 0,<o:p></o:p></span></cod=
e></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Unit&quot;: &quot;xyz.openbmc_project.=
Sensor.Value.Unit.RPMS&quot;,<o:p></o:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Value&quot;: 4292,<o:p></o:p></span></=
code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;WarningAlarmHigh&quot;: false,<o:p></o=
:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;WarningAlarmLow&quot;: false,<o:p></o:=
p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;WarningHigh&quot;: 5000,<o:p></o:p></s=
pan></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;WarningLow&quot;: 1500<o:p></o:p></spa=
n></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; },<o:p></o:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &quot;/xyz/openbmc_project/sensors/fan_tach/fan1&quot;: {<o:p></o:p>=
</span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CriticalAlarmHigh&quot;: false,<o:p></=
o:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CriticalAlarmLow&quot;: false,<o:p></o=
:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CriticalHigh&quot;: 5500,<o:p></o:p></=
span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CriticalLow&quot;: 1000,<o:p></o:p></s=
pan></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MaxValue&quot;: 0,<o:p></o:p></span></=
code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MinValue&quot;: 0,<o:p></o:p></span></=
code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Scale&quot;: 0,<o:p></o:p></span></cod=
e></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Target&quot;: 255,<o:p></o:p></span></=
code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Unit&quot;: &quot;xyz.openbmc_project.=
Sensor.Value.Unit.RPMS&quot;,<o:p></o:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Value&quot;: 3551,<o:p></o:p></span></=
code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;WarningAlarmHigh&quot;: false,<o:p></o=
:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;WarningAlarmLow&quot;: false,<o:p></o:=
p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;WarningHigh&quot;: 5000,<o:p></o:p></s=
pan></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;WarningLow&quot;: 1500<o:p></o:p></spa=
n></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; }<o:p></o:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp; },<o:p></o:p></sp=
an></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp; &quot;message&quo=
t;: &quot;200 OK&quot;,<o:p></o:p></span></code></pre>
<pre><code><span style=3D"color:black">&nbsp;&nbsp;&nbsp; &quot;status&quot=
;: &quot;ok&quot;<o:p></o:p></span></code></pre>
<pre><code><span style=3D"color:black">}<o:p></o:p></span></code></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<p class=3D"MsoNormal">/xyz/openbmc_project/inventory/system/chassis/mother=
board/enumerate<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">{<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp; =
&quot;data&quot;: {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &quot;/xyz/openbmc_project/inventory/system/chassis=
/motherboard/fan0&quot;: {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Functional&quot;: tru=
e,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Present&quot;: true,<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;PrettyName&quot;: &quo=
t;fan0&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &quot;/xyz/openbmc_project/inventory/system/chassis=
/motherboard/fan0/fan0&quot;: {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Functional&quot;: tru=
e<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &quot;/xyz/openbmc_project/inventory/system/chassis=
/motherboard/fan1&quot;: {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Functional&quot;: tru=
e,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Present&quot;: true,<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PrettyName&quot;: &qu=
ot;fan1&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &quot;/xyz/openbmc_project/inventory/system/chassis=
/motherboard/fan1/fan1&quot;: {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Functional&quot;: tru=
e<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp; =
},<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp; =
&quot;message&quot;: &quot;200 OK&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">&nbsp;&nbsp;&nbsp; =
&quot;status&quot;: &quot;ok&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;;color:black;mso-fareast-language:EN-IE">}<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_AM6PR04MB5224A33032E47CE691601881C93C0AM6PR04MB5224eurp_--
