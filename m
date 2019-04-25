Return-Path: <sboylan@ircona.com>
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-he1-obe.outbound.protection.outlook.com
 (client-ip=40.107.1.122; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=sboylan@ircona.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ircona.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Ircona.onmicrosoft.com header.i=@Ircona.onmicrosoft.com
 header.b="jN53vO1O"; dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10122.outbound.protection.outlook.com [40.107.1.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qXdH5HlNzDqZV
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 19:56:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Ircona.onmicrosoft.com; s=selector1-ircona-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csI7xHWxrnJz5vLlXBia2trNDIYC3jTObEz+mhy6dlQ=;
 b=jN53vO1Onqw2NHmNaFu6RPUEvz/LIwoAFGM44XhQPoCdDJy0v6rKctT3fE7r1eLW9fllT0EsE+hSVisT86bkt2rzhdT49l+Ni5YBhyJcr8GPDJ4YVXpmyabP/0AUxwEb4duA4inZbuRttkb7CdWDYLEkAq1sY/Y58YquOsozZKc=
Received: from AM0PR04MB5218.eurprd04.prod.outlook.com (20.176.215.146) by
 AM0PR04MB6180.eurprd04.prod.outlook.com (20.179.34.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Thu, 25 Apr 2019 09:56:11 +0000
Received: from AM0PR04MB5218.eurprd04.prod.outlook.com
 ([fe80::31a7:1ea4:3668:f40c]) by AM0PR04MB5218.eurprd04.prod.outlook.com
 ([fe80::31a7:1ea4:3668:f40c%4]) with mapi id 15.20.1835.010; Thu, 25 Apr 2019
 09:56:11 +0000
From: Stephen Boylan <sboylan@ircona.com>
To: Matthew Barth <msbarth@linux.ibm.com>, Patrick Venture <venture@google.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Fan control service issues - service will not start "Uncaught
 DBus service lookup failure exception"
Thread-Topic: Fan control service issues - service will not start "Uncaught
 DBus service lookup failure exception"
Thread-Index: AdT6ueaOpTUjQysESgWYcotM1jhn3gAAj+AAAAMnMoAAAL889Q==
Date: Thu, 25 Apr 2019 09:56:10 +0000
Message-ID: <AM0PR04MB521859872EEEFC9332114A6CC93D0@AM0PR04MB5218.eurprd04.prod.outlook.com>
References: <AM6PR04MB5224A33032E47CE691601881C93C0@AM6PR04MB5224.eurprd04.prod.outlook.com>
 <CAO=notzd6KOAqoYE_BXsrCDts6gGv7OOROKRgKMaLayAqEPESw@mail.gmail.com>,
 <8edee610-90b5-5a77-6732-356a2719eba6@linux.ibm.com>
In-Reply-To: <8edee610-90b5-5a77-6732-356a2719eba6@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sboylan@ircona.com; 
x-originating-ip: [87.198.164.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2a4565c-a1ee-4cf4-9754-08d6c9643f68
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR04MB6180; 
x-ms-traffictypediagnostic: AM0PR04MB6180:
x-microsoft-antispam-prvs: <AM0PR04MB6180DC652684FE5977374EEEC93D0@AM0PR04MB6180.eurprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(136003)(39830400003)(376002)(396003)(199004)(189003)(53754006)(53946003)(508600001)(2906002)(53936002)(186003)(86362001)(5660300002)(53546011)(102836004)(4326008)(6506007)(76176011)(6246003)(26005)(68736007)(476003)(486006)(7696005)(14454004)(110136005)(99286004)(11346002)(66066001)(446003)(9686003)(6306002)(54896002)(55016002)(229853002)(71190400001)(71200400001)(6436002)(97736004)(81156014)(8676002)(6116002)(73956011)(66946007)(3846002)(81166006)(66446008)(66556008)(64756008)(76116006)(25786009)(66476007)(790700001)(33656002)(52536014)(74316002)(14444005)(256004)(7736002)(8936002)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR04MB6180;
 H:AM0PR04MB5218.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ircona.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /Onp4s2OJaKTsngwL34KN5BIvaxPs/Ob+iJeTm3n3OkW8b4iQ+i1nH315VxL+sUbFKooqx5sxdalUTjseX2pIMYQGhqeOnShyBxCR0es389dV92vul7BFGiV6d8MvGFXz9amDQZi4ITqkNtsMV27ffBh0tCJB1dj/QmR6DGM4X0I8b20IA0yM6GJ8xRww9ZU3WgPCuU9FSc/N1iebpX01AwjrXLp/X3UBYJ59LOnra9j44PaAqHhbBDD4oU0Kjzvt2GQHUuH7gFfTlu3afenPySxS/zi9WAyB3M3ScKsb11pBYHuy6WS5ayi9u41/7EbaogzhS/a8CjOrRP+XjcyFQU1WG2itjIwMK7dj/p88W0oKNiLLuNCzAsRjF7CQkpzyi388yU211O2kxR1u9HSYjMnQU+gsswCxJC52ZN96/8=
Content-Type: multipart/alternative;
 boundary="_000_AM0PR04MB521859872EEEFC9332114A6CC93D0AM0PR04MB5218eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ircona.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a4565c-a1ee-4cf4-9754-08d6c9643f68
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 09:56:10.9990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b5c9eba5-d9aa-4fea-9ead-d4e7d7f623f9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6180
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
X-List-Received-Date: Thu, 25 Apr 2019 09:56:22 -0000

--_000_AM0PR04MB521859872EEEFC9332114A6CC93D0AM0PR04MB5218eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

After looking at my configuration file for /sensors/phosphor-hwmon/obmc/hwm=
on/ahb/apb/ I noticed I had in an error to try fix an issue I set PWM_TARGE=
T_fan1 =3D "0". Since I changed this back to what is below, now I get the f=
ollowing error when trying to start fan control services, similar to the or=
iginal one but for a different fan.

{
        "__CURSOR" : "s=3Dfdd5653de8ca4f298bf0d04f018a68d7;i=3D219;b=3D445f=
19f9668b4129b216ec827ed31ddb;m=3Dad54afd;t=3D58757bd23b204;x=3D757e520ccf3b=
4259",
        "__REALTIME_TIMESTAMP" : "1556185788690948",
        "__MONOTONIC_TIMESTAMP" : "181750525",
        "_BOOT_ID" : "445f19f9668b4129b216ec827ed31ddb",
        "_UID" : "0",
        "_GID" : "0",
        "_MACHINE_ID" : "a361a071fa454d939ee5c5a7324cf2de",
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
        "TRANSACTION_ID" : "2273921040",
        "PATH" : "/xyz/openbmc_project/sensors/fan_tach/fan2",
        "INTERFACE" : "xyz.openbmc_project.Control.FanPwm",
        "SYSLOG_IDENTIFIER" : "phosphor-fan-control",
        "_PID" : "1198",
        "_COMM" : "phosphor-fan-co",
        "_EXE" : "/usr/sbin/phosphor-fan-control",
        "_CMDLINE" : "phosphor-fan-control --control",
        "_SYSTEMD_CGROUP" : "/system.slice/system-phosphor\\x2dfan\\x2dcont=
rol.slice/phosphor-fan-control@0.service",
        "_SYSTEMD_UNIT" : "phosphor-fan-control@0.service",
        "_SYSTEMD_SLICE" : "system-phosphor\\x2dfan\\x2dcontrol.slice",
        "_SYSTEMD_INVOCATION_ID" : "140d38d6360847c389c67d0bfa162589",
        "_SOURCE_REALTIME_TIMESTAMP" : "1556185788690865"
}

What I don't understand here is why it's trying to access fan2 at all? I kn=
ow that path does not exist and as far as I understand it I haven't tried t=
o set it up through any configuration file.

> Also, what target mode do you have configured for the hwmon instance?
>The *.Control.FanPWM interface is created for the fan objects by the
>hwmon instance, when `TARGET_MODE =3D "PWM"` in the config.

Here is my configuration file for the fans, it's primarily based on the met=
a-romulus .conf file

  1 LABEL_fan1 =3D "fan0"
  2 LABEL_fan2 =3D "fan1"
  3
  4 PWM_TARGET_fan1 =3D "1"
  5 PWM_TARGET_fan2 =3D "2"
  6
  7 WARNLO_fan1 =3D 1500
  8 WARNHI_fan1 =3D 5000
  9 CRITLO_fan1 =3D 1000
 10 CRITHI_fan1 =3D 5500
 11
 12 WARNLO_fan2 =3D 1500
 13 WARNHI_fan2 =3D 5000
 14 CRITLO_fan2 =3D 1000
 15 CRITHI_fan2 =3D 5500

Here is the pwm_tacho section of my dts file

153 &pwm_tacho {
154         status =3D "okay";
155         pinctrl-names =3D "default";
156         pinctrl-0 =3D <&pinctrl_pwm0_default
157         &pinctrl_pwm1_default>;
158
159         fan@0 {
160                 reg =3D <0x00>;
161                 aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
162         };
163
164         fan@1 {
165                 reg =3D <0x01>;
166                 aspeed,fan-tach-ch =3D /bits/ 8 <0x01>;
167         };
168 };

> It looks like they don't have that PWM interface.  You can check if
> the pwm files exist under /sys/class/hwmon/hwmon*/  for the hwmon*
> that has your fans.

Here's the contents of hwmon0. I know I can manually echo values into pwm1 =
and pwm2 and I can see the effect on the fans as they spin.

root@evb-ast2500:/sys/class/hwmon/hwmon0# ls
device      fan1_input  fan2_input  name        of_node     pwm1        pwm=
2        subsystem   uevent


My understanding is that through the DTS file I've set up fan0 and fan1. Th=
ese are represented in sys/class/hwmon/hwmon0 as fan1_input and fan2_input.=
 Though the conf file set up in /sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/=
 I've assigned a "pretty name" of fan0 and fan1 to
LABEL_fan1 and LABEL_fan2. Those "pretty name" values are used throughout t=
he various configuration files for monitor/presence and control.


________________________________
From: Matthew Barth <msbarth@linux.ibm.com>
Sent: 24 April 2019 18:08
To: Patrick Venture; Stephen Boylan
Cc: openbmc@lists.ozlabs.org
Subject: Re: Fan control service issues - service will not start "Uncaught =
DBus service lookup failure exception"



On 4/24/19 11:38 AM, Patrick Venture wrote:
> On Wed, Apr 24, 2019 at 9:25 AM Stephen Boylan <sboylan@ircona.com> wrote=
:
>>
>> Hello all,
>>
>> I've run into an issue with my fan control. I have a simple two fan syst=
em which is failing to start phosphor-fan-control@.service
>>
>>
>>
>> This is the status
>>
>> root@evb-ast2500:/lib/systemd/system# systemctl status phosphor-fan-cont=
rol@0.service --no-page
>>
>> ? phosphor-fan-control@0.service - Phosphor Fan Control Daemon
>>
>>     Loaded: loaded (/lib/systemd/system/phosphor-fan-control@.service; s=
tatic; vendor preset: enabled)
>>
>>     Active: failed (Result: exit-code) since Wed 2019-04-24 16:22:36 UTC=
; 16s ago
>>
>>    Process: 1218 ExecStart=3D/usr/bin/env phosphor-fan-control --control=
 (code=3Dexited, status=3D1/FAILURE)
>>
>> Main PID: 1218 (code=3Dexited, status=3D1/FAILURE)
>>
>>
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: =
Service RestartSec=3D1s expired, scheduling restart.
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: =
Scheduled restart job, restart counter is at 2.
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: Stopped Phosphor Fan Control Dae=
mon.
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: =
Start request repeated too quickly.
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.service: =
Failed with result 'exit-code'.
>>
>> Apr 24 16:22:36 evb-ast2500 systemd[1]: Failed to start Phosphor Fan Con=
trol Daemon.
>>
>>
>>
>> And I noticed this in the journalctl
>>
>> {
>>
>>          "__CURSOR" : "s=3Defc0b033c5f243798b56446bcaffc0f5;i=3D23d;b=3D=
2de3ccbcea7940f5b51652e55e900cd2;m=3D2f22198c;t=3D5874871dec1c2;x=3Df1ba902=
c2ec1feae",
>>
>>          "__REALTIME_TIMESTAMP" : "1556120101372354",
>>
>>          "__MONOTONIC_TIMESTAMP" : "790763916",
>>
>>          "_BOOT_ID" : "2de3ccbcea7940f5b51652e55e900cd2",
>>
>>          "_UID" : "0",
>>
>>          "_GID" : "0",
>>
>>          "_MACHINE_ID" : "4c5bf4049b5e4751b70a17eaeeb55a49",
>>
>>          "_HOSTNAME" : "evb-ast2500",
>>
>>          "_TRANSPORT" : "journal",
>>
>>          "_CAP_EFFECTIVE" : "3fffffffff",
>>
>>          "CODE_FILE" : "/home/ircadmin/OpenBMC/openbmc/build/tmp/work/ar=
mv6-openbmc-linux-gnueabi/phosphor-fan/1.0+gitAUTOINC+4b258ac8b6-r1/recipe-=
sysroot/usr
>>
>> /include/phosphor-logging/log.hpp",
>>
>>          "CODE_LINE" : "105",
>>
>>          "CODE_FUNC" : "helper_log",
>>
>>          "PRIORITY" : "3",
>>
>>          "MESSAGE" : "Uncaught DBus service lookup failure exception",
>>
>>          "TRANSACTION_ID" : "114915536",
>>
>>          "PATH" : "/xyz/openbmc_project/sensors/fan_tach/fan0",
>>
>>          "INTERFACE" : "xyz.openbmc_project.Control.FanPwm",
>>
>>          "SYSLOG_IDENTIFIER" : "phosphor-fan-control",
>>
>>          "_PID" : "1273",
>>
>>          "_COMM" : "phosphor-fan-co",
>>
>>          "_EXE" : "/usr/sbin/phosphor-fan-control",
>>
>>          "_CMDLINE" : "phosphor-fan-control --control",
>>
>>          "_SYSTEMD_CGROUP" : "/system.slice/system-phosphor\\x2dfan\\x2d=
control.slice/phosphor-fan-control@0.service",
>>
>>          "_SYSTEMD_UNIT" : "phosphor-fan-control@0.service",
>>
>>          "_SYSTEMD_SLICE" : "system-phosphor\\x2dfan\\x2dcontrol.slice",
>>
>>          "_SYSTEMD_INVOCATION_ID" : "21572a9f879c44cab2b9b6b4c5e9a504",
>>
>>          "_SOURCE_REALTIME_TIMESTAMP" : "1556120101372269"
>>
>> }
>>
>>
>>
>> I know the PATH exists, though I'm not entirely sure about the INTERFACE=
. I've checked systemctl to see if I can find it and I don't see it. Should=
 I be checking elsewhere for it?
>>
>>
>>
>>
>>
>> I can see my fan_tach sensors and my chassis entries as such
>>
>> /xyz/openbmc_project/sensors/fan_tach/enumerate
>>
>> {
>>
>>      "data": {
>>
>>          "/xyz/openbmc_project/sensors/fan_tach/fan0": {
>>
>>              "CriticalAlarmHigh": false,
>>
>>              "CriticalAlarmLow": false,
>>
>>              "CriticalHigh": 5500,
>>
>>              "CriticalLow": 1000,
>>
>>              "MaxValue": 0,
>>
>>              "MinValue": 0,
>>
>>              "Scale": 0,
>>
>>              "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>>
>>              "Value": 4292,
>>
>>              "WarningAlarmHigh": false,
>>
>>              "WarningAlarmLow": false,
>>
>>              "WarningHigh": 5000,
>>
>>              "WarningLow": 1500
>>
>>          },
>>
>>          "/xyz/openbmc_project/sensors/fan_tach/fan1": {
>>
>>              "CriticalAlarmHigh": false,
>>
>>              "CriticalAlarmLow": false,
>>
>>              "CriticalHigh": 5500,
>>
>>              "CriticalLow": 1000,
>>
>>              "MaxValue": 0,
>>
>>              "MinValue": 0,
>>
>>              "Scale": 0,
>>
>>              "Target": 255,
>>
>>              "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>>
>>              "Value": 3551,
>>
>>              "WarningAlarmHigh": false,
>>
>>              "WarningAlarmLow": false,
>>
>>              "WarningHigh": 5000,
>>
>>              "WarningLow": 1500
>>
>>          }
>>
>>      },
>>
>>      "message": "200 OK",
>>
>>      "status": "ok"
>>
>> }
>>
>>
>>
>> /xyz/openbmc_project/inventory/system/chassis/motherboard/enumerate
>>
>> {
>>
>>      "data": {
>>
>>          "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0=
": {
>>
>>              "Functional": true,
>>
>>              "Present": true,
>>
>>             "PrettyName": "fan0"
>>
>>          },
>>
>>          "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0=
/fan0": {
>>
>>              "Functional": true
>>
>>          },
>>
>>          "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1=
": {
>>
>>              "Functional": true,
>>
>>              "Present": true,
>>
>>              "PrettyName": "fan1"
>>
>>          },
>>
>>          "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1=
/fan1": {
>>
>>              "Functional": true
>>
>>          }
>>
>>      },
>>
>>      "message": "200 OK",
>>
>>      "status": "ok"
>>
>> }
>
> It looks like they don't have that PWM interface.  You can check if
> the pwm files exist under /sys/class/hwmon/hwmon*/  for the hwmon*
> that has your fans.

Also, what target mode do you have configured for the hwmon instance?
The *.Control.FanPWM interface is created for the fan objects by the
hwmon instance, when `TARGET_MODE =3D "PWM"` in the config.

>
>>
>>
>

--_000_AM0PR04MB521859872EEEFC9332114A6CC93D0AM0PR04MB5218eurp_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Times New Roman",serif;
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">After l=
ooking at my configuration file for</span>
<span style=3D"font-size:12.0pt;color:black">/sensors/phosphor-hwmon/obmc/h=
wmon/ahb/apb/ I noticed I had in an error to try fix an issue I set PWM_TAR=
GET_fan1 =3D &#8220;0&#8221;. Since I changed this back to what is below, n=
ow I get the following error when trying to start
 fan control services, similar to the original one but for a different fan.=
 <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">{<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;__CURSOR&quot; : &quot;s=3Dfdd565=
3de8ca4f298bf0d04f018a68d7;i=3D219;b=3D445f19f9668b4129b216ec827ed31ddb;m=
=3Dad54afd;t=3D58757bd23b204;x=3D757e520ccf3b4259&quot;,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;__REALTIME_TIMESTAMP&quot; : &quo=
t;1556185788690948&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;__MONOTONIC_TIMESTAMP&quot; : &qu=
ot;181750525&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_BOOT_ID&quot; : &quot;445f19f966=
8b4129b216ec827ed31ddb&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_UID&quot; : &quot;0&quot;,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_GID&quot; : &quot;0&quot;,<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_MACHINE_ID&quot; : &quot;a361a07=
1fa454d939ee5c5a7324cf2de&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_HOSTNAME&quot; : &quot;evb-ast25=
00&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_TRANSPORT&quot; : &quot;journal&=
quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_CAP_EFFECTIVE&quot; : &quot;3fff=
ffffff&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CODE_FILE&quot; : &quot;/home/irc=
admin/OpenBMC/openbmc/build/tmp/work/armv6-openbmc-linux-gnueabi/phosphor-f=
an/1.0&#43;gitAUTOINC&#43;4b258ac8b6-r1/recipe-sysroot/usr<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">/includ=
e/phosphor-logging/log.hpp&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CODE_LINE&quot; : &quot;105&quot;=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CODE_FUNC&quot; : &quot;helper_lo=
g&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PRIORITY&quot; : &quot;3&quot;,<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MESSAGE&quot; : &quot;Uncaught DB=
us service lookup failure exception&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;TRANSACTION_ID&quot; : &quot;2273=
921040&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PATH&quot; : &quot;/xyz/openbmc_p=
roject/sensors/fan_tach/fan2&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;INTERFACE&quot; : &quot;xyz.openb=
mc_project.Control.FanPwm&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SYSLOG_IDENTIFIER&quot; : &quot;p=
hosphor-fan-control&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_PID&quot; : &quot;1198&quot;,<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_COMM&quot; : &quot;phosphor-fan-=
co&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_EXE&quot; : &quot;/usr/sbin/phos=
phor-fan-control&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_CMDLINE&quot; : &quot;phosphor-f=
an-control --control&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SYSTEMD_CGROUP&quot; : &quot;/sy=
stem.slice/system-phosphor\\x2dfan\\x2dcontrol.slice/phosphor-fan-control@0=
.service&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SYSTEMD_UNIT&quot; : &quot;phosp=
hor-fan-control@0.service&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SYSTEMD_SLICE&quot; : &quot;syst=
em-phosphor\\x2dfan\\x2dcontrol.slice&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SYSTEMD_INVOCATION_ID&quot; : &q=
uot;140d38d6360847c389c67d0bfa162589&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SOURCE_REALTIME_TIMESTAMP&quot; =
: &quot;1556185788690865&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">}<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">What I =
don&#8217;t understand here is why it&#8217;s trying to access fan2 at all?=
 I know that path does not exist and as far as I understand it I haven&#821=
7;t tried to set it up through any configuration file.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&nb=
sp;</span><span style=3D"color:#333333;background:white">Also, what target =
mode do you have configured for the hwmon instance?&nbsp;</span><span style=
=3D"color:#333333"><br>
<span style=3D"background:white">&gt;The *.Control.FanPWM interface is crea=
ted for the fan objects by the&nbsp;</span><br>
<span style=3D"background:white">&gt;hwmon instance, when `TARGET_MODE =3D =
&quot;PWM&quot;` in the config.</span></span><span style=3D"font-size:12.0p=
t;color:black"><o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Here is=
 my configuration file for the fans, it's primarily based on the meta-romul=
us .conf file<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
1 LABEL_fan1 =3D &quot;fan0&quot;<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
2 LABEL_fan2 =3D &quot;fan1&quot;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
3 <o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
4 PWM_TARGET_fan1 =3D &quot;1&quot;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
5 PWM_TARGET_fan2 =3D &quot;2&quot;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
6 <o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
7 WARNLO_fan1 =3D 1500<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
8 WARNHI_fan1 =3D 5000<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp; =
9 CRITLO_fan1 =3D 1000<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;1=
0 CRITHI_fan1 =3D 5500<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;1=
1 <o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;1=
2 WARNLO_fan2 =3D 1500<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;1=
3 WARNHI_fan2 =3D 5000<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;1=
4 CRITLO_fan2 =3D 1000<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;1=
5 CRITHI_fan2 =3D 5500<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Here is=
 the pwm_tacho section of my dts file<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">153 &am=
p;pwm_tacho {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">154&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D &quot;okay&quot;;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">155&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinctrl-names =3D &quot;defaul=
t&quot;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">156&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl=
_pwm0_default<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">157&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;pinctrl_pwm1_default&gt;;=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">158 <o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">159&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fan@0 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">160&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; reg =3D &lt;0x00&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">161&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; aspeed,fan-tach-ch =3D /bits/ 8 &lt;0x00&gt;;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">162&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">163 <o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">164&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fan@1 {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">165&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; reg =3D &lt;0x01&gt;;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">166&nbs=
p;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;aspeed,fan-tach-ch =3D /bits/ 8 &lt;0x01&gt;;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">167&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">168 };<=
o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&gt;&nb=
sp;</span><span style=3D"color:#333333;background:white">It looks like they=
 don't have that PWM interface.&nbsp; You can check if</span><span style=3D=
"color:#333333"><br>
<span style=3D"background:white">&gt; the pwm files exist under /sys/class/=
hwmon/hwmon*/&nbsp; for the hwmon*</span><br>
<span style=3D"background:white">&gt; that has your fans.</span></span><spa=
n style=3D"font-size:12.0pt;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Here's =
the contents of hwmon0. I know I can manually echo values into pwm1 and pwm=
2 and I can see the effect on the fans as they spin.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">r<span =
style=3D"background:white">oot@evb-ast2500:/sys/class/hwmon/hwmon0# ls</spa=
n><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;color:black">device &nbsp; &nbsp; &nbsp;fan1_input &nbsp;fan2_input =
&nbsp;name &nbsp; &nbsp; &nbsp; &nbsp;of_node &nbsp; &nbsp; pwm1 &nbsp; &nb=
sp; &nbsp; &nbsp;pwm2 &nbsp; &nbsp; &nbsp; &nbsp;subsystem &nbsp; uevent<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">My unde=
rstanding is that through the DTS file I&#8217;ve set up fan0 and fan1. The=
se are represented in sys/class/hwmon/hwmon0 as fan1_input and fan2_input. =
Though the conf file set up in /sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/
 I&#8217;ve assigned a &#8220;pretty name&#8221; of fan0 and fan1 to <o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">LABEL_f=
an1 and LABEL_fan2. Those &#8220;pretty name&#8221; values are used through=
out the various configuration files for monitor/presence and control.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Matthew Barth &lt;msbarth@linux.ibm.com&gt;<br>
<b>Sent:</b> 24 April 2019 18:08<br>
<b>To:</b> Patrick Venture; Stephen Boylan<br>
<b>Cc:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Re: Fan control service issues - service will not start &qu=
ot;Uncaught DBus service lookup failure exception&quot;</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
<br>
On 4/24/19 11:38 AM, Patrick Venture wrote:<br>
&gt; On Wed, Apr 24, 2019 at 9:25 AM Stephen Boylan &lt;sboylan@ircona.com&=
gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hello all,<br>
&gt;&gt;<br>
&gt;&gt; I&#8217;ve run into an issue with my fan control. I have a simple =
two fan system which is failing to start phosphor-fan-control@.service<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; This is the status<br>
&gt;&gt;<br>
&gt;&gt; root@evb-ast2500:/lib/systemd/system# systemctl status phosphor-fa=
n-control@0.service --no-page<br>
&gt;&gt;<br>
&gt;&gt; ? phosphor-fan-control@0.service - Phosphor Fan Control Daemon<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; Loaded: loaded (/lib/systemd/system/phosph=
or-fan-control@.service; static; vendor preset: enabled)<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; Active: failed (Result: exit-code) since W=
ed 2019-04-24 16:22:36 UTC; 16s ago<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; Process: 1218 ExecStart=3D/usr/bin/env phosphor-=
fan-control --control (code=3Dexited, status=3D1/FAILURE)<br>
&gt;&gt;<br>
&gt;&gt; Main PID: 1218 (code=3Dexited, status=3D1/FAILURE)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.ser=
vice: Service RestartSec=3D1s expired, scheduling restart.<br>
&gt;&gt;<br>
&gt;&gt; Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.ser=
vice: Scheduled restart job, restart counter is at 2.<br>
&gt;&gt;<br>
&gt;&gt; Apr 24 16:22:36 evb-ast2500 systemd[1]: Stopped Phosphor Fan Contr=
ol Daemon.<br>
&gt;&gt;<br>
&gt;&gt; Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.ser=
vice: Start request repeated too quickly.<br>
&gt;&gt;<br>
&gt;&gt; Apr 24 16:22:36 evb-ast2500 systemd[1]: phosphor-fan-control@0.ser=
vice: Failed with result 'exit-code'.<br>
&gt;&gt;<br>
&gt;&gt; Apr 24 16:22:36 evb-ast2500 systemd[1]: Failed to start Phosphor F=
an Control Daemon.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; And I noticed this in the journalctl<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;__CURS=
OR&quot; : &quot;s=3Defc0b033c5f243798b56446bcaffc0f5;i=3D23d;b=3D2de3ccbce=
a7940f5b51652e55e900cd2;m=3D2f22198c;t=3D5874871dec1c2;x=3Df1ba902c2ec1feae=
&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;__REAL=
TIME_TIMESTAMP&quot; : &quot;1556120101372354&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;__MONO=
TONIC_TIMESTAMP&quot; : &quot;790763916&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_BOOT_=
ID&quot; : &quot;2de3ccbcea7940f5b51652e55e900cd2&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_UID&q=
uot; : &quot;0&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_GID&q=
uot; : &quot;0&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_MACHI=
NE_ID&quot; : &quot;4c5bf4049b5e4751b70a17eaeeb55a49&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_HOSTN=
AME&quot; : &quot;evb-ast2500&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_TRANS=
PORT&quot; : &quot;journal&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_CAP_E=
FFECTIVE&quot; : &quot;3fffffffff&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CODE_F=
ILE&quot; : &quot;/home/ircadmin/OpenBMC/openbmc/build/tmp/work/armv6-openb=
mc-linux-gnueabi/phosphor-fan/1.0&#43;gitAUTOINC&#43;4b258ac8b6-r1/recipe-s=
ysroot/usr<br>
&gt;&gt;<br>
&gt;&gt; /include/phosphor-logging/log.hpp&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CODE_L=
INE&quot; : &quot;105&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CODE_F=
UNC&quot; : &quot;helper_log&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PRIORI=
TY&quot; : &quot;3&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;MESSAG=
E&quot; : &quot;Uncaught DBus service lookup failure exception&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;TRANSA=
CTION_ID&quot; : &quot;114915536&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PATH&q=
uot; : &quot;/xyz/openbmc_project/sensors/fan_tach/fan0&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;INTERF=
ACE&quot; : &quot;xyz.openbmc_project.Control.FanPwm&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;SYSLOG=
_IDENTIFIER&quot; : &quot;phosphor-fan-control&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_PID&q=
uot; : &quot;1273&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_COMM&=
quot; : &quot;phosphor-fan-co&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_EXE&q=
uot; : &quot;/usr/sbin/phosphor-fan-control&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_CMDLI=
NE&quot; : &quot;phosphor-fan-control --control&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SYSTE=
MD_CGROUP&quot; : &quot;/system.slice/system-phosphor\\x2dfan\\x2dcontrol.s=
lice/phosphor-fan-control@0.service&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SYSTE=
MD_UNIT&quot; : &quot;phosphor-fan-control@0.service&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SYSTE=
MD_SLICE&quot; : &quot;system-phosphor\\x2dfan\\x2dcontrol.slice&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SYSTE=
MD_INVOCATION_ID&quot; : &quot;21572a9f879c44cab2b9b6b4c5e9a504&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;_SOURC=
E_REALTIME_TIMESTAMP&quot; : &quot;1556120101372269&quot;<br>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I know the PATH exists, though I&#8217;m not entirely sure about t=
he INTERFACE. I&#8217;ve checked systemctl to see if I can find it and I do=
n&#8217;t see it. Should I be checking elsewhere for it?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I can see my fan_tach sensors and my chassis entries as such<br>
&gt;&gt;<br>
&gt;&gt; /xyz/openbmc_project/sensors/fan_tach/enumerate<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;data&quot;: {<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/xyz/o=
penbmc_project/sensors/fan_tach/fan0&quot;: {<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;CriticalAlarmHigh&quot;: false,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;CriticalAlarmLow&quot;: false,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;CriticalHigh&quot;: 5500,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;CriticalLow&quot;: 1000,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;MaxValue&quot;: 0,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;MinValue&quot;: 0,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Scale&quot;: 0,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Unit&quot;: &quot;xyz.openbmc_project.Sensor.Value.Unit.R=
PMS&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Value&quot;: 4292,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;WarningAlarmHigh&quot;: false,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;WarningAlarmLow&quot;: false,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;WarningHigh&quot;: 5000,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;WarningLow&quot;: 1500<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/xyz/o=
penbmc_project/sensors/fan_tach/fan1&quot;: {<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;CriticalAlarmHigh&quot;: false,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;CriticalAlarmLow&quot;: false,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;CriticalHigh&quot;: 5500,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;CriticalLow&quot;: 1000,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;MaxValue&quot;: 0,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;MinValue&quot;: 0,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Scale&quot;: 0,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Target&quot;: 255,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Unit&quot;: &quot;xyz.openbmc_project.Sensor.Value.Unit.R=
PMS&quot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Value&quot;: 3551,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;WarningAlarmHigh&quot;: false,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;WarningAlarmLow&quot;: false,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;WarningHigh&quot;: 5000,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;WarningLow&quot;: 1500<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;message&quot;: &quot;200 OK&qu=
ot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;status&quot;: &quot;ok&quot;<b=
r>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; /xyz/openbmc_project/inventory/system/chassis/motherboard/enumerat=
e<br>
&gt;&gt;<br>
&gt;&gt; {<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;data&quot;: {<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/xyz/o=
penbmc_project/inventory/system/chassis/motherboard/fan0&quot;: {<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Functional&quot;: true,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Present&quot;: true,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &quot;PrettyName&quot;: &quot;fan0&quot;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/xyz/o=
penbmc_project/inventory/system/chassis/motherboard/fan0/fan0&quot;: {<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Functional&quot;: true<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/xyz/o=
penbmc_project/inventory/system/chassis/motherboard/fan1&quot;: {<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Functional&quot;: true,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Present&quot;: true,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;PrettyName&quot;: &quot;fan1&quot;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/xyz/o=
penbmc_project/inventory/system/chassis/motherboard/fan1/fan1&quot;: {<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;Functional&quot;: true<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;message&quot;: &quot;200 OK&qu=
ot;,<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;status&quot;: &quot;ok&quot;<b=
r>
&gt;&gt;<br>
&gt;&gt; }<br>
&gt; <br>
&gt; It looks like they don't have that PWM interface.&nbsp; You can check =
if<br>
&gt; the pwm files exist under /sys/class/hwmon/hwmon*/&nbsp; for the hwmon=
*<br>
&gt; that has your fans.<br>
<br>
Also, what target mode do you have configured for the hwmon instance? <br>
The *.Control.FanPWM interface is created for the fan objects by the <br>
hwmon instance, when `TARGET_MODE =3D &quot;PWM&quot;` in the config.<br>
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_AM0PR04MB521859872EEEFC9332114A6CC93D0AM0PR04MB5218eurp_--
