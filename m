Return-Path: <sboylan@ircona.com>
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur04-he1-obe.outbound.protection.outlook.com
 (client-ip=40.107.7.98; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=sboylan@ircona.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ircona.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Ircona.onmicrosoft.com header.i=@Ircona.onmicrosoft.com
 header.b="RXpT1oa9"; dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70098.outbound.protection.outlook.com [40.107.7.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qhJn0RxfzDqXN
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 01:42:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Ircona.onmicrosoft.com; s=selector1-ircona-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IONaYXFDFdoUj+1VooQNCTAFWkhW6zT/kU0XB5ELoVg=;
 b=RXpT1oa9rqIAkGgn0pvcKuPd9e8can+RBs6GnpP4oOWcDnRtexjYl3V38tV6/TbH+x+diWrk5v/HrCjJOjMBQHGHAil6fJkgyr6QzlzXWcxnnwP8Br8a5B1eg//2wMT8C70PHoivYxx9Y8hTvAiiM2HOSspgSPrgCi2y7TKqj/Y=
Received: from AM0PR04MB5218.eurprd04.prod.outlook.com (20.176.215.146) by
 AM0PR04MB6625.eurprd04.prod.outlook.com (20.179.255.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Thu, 25 Apr 2019 15:42:24 +0000
Received: from AM0PR04MB5218.eurprd04.prod.outlook.com
 ([fe80::31a7:1ea4:3668:f40c]) by AM0PR04MB5218.eurprd04.prod.outlook.com
 ([fe80::31a7:1ea4:3668:f40c%4]) with mapi id 15.20.1835.010; Thu, 25 Apr 2019
 15:42:24 +0000
From: Stephen Boylan <sboylan@ircona.com>
To: Matthew Barth <msbarth@linux.ibm.com>, Patrick Venture <venture@google.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Fan control service issues - service will not start "Uncaught
 DBus service lookup failure exception"
Thread-Topic: Fan control service issues - service will not start "Uncaught
 DBus service lookup failure exception"
Thread-Index: AdT6ueaOpTUjQysESgWYcotM1jhn3gAAj+AAAAMnMoAAAL889QAqkqgAAAA+/CA=
Date: Thu, 25 Apr 2019 15:42:24 +0000
Message-ID: <AM0PR04MB5218C2DCDA42D3A688FB200EC93D0@AM0PR04MB5218.eurprd04.prod.outlook.com>
References: <AM6PR04MB5224A33032E47CE691601881C93C0@AM6PR04MB5224.eurprd04.prod.outlook.com>
 <CAO=notzd6KOAqoYE_BXsrCDts6gGv7OOROKRgKMaLayAqEPESw@mail.gmail.com>
 <8edee610-90b5-5a77-6732-356a2719eba6@linux.ibm.com>
 <AM0PR04MB521859872EEEFC9332114A6CC93D0@AM0PR04MB5218.eurprd04.prod.outlook.com>
 <269e980d-875c-7e91-3fae-6a5adb7e2a4a@linux.ibm.com>
In-Reply-To: <269e980d-875c-7e91-3fae-6a5adb7e2a4a@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sboylan@ircona.com; 
x-originating-ip: [87.198.164.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28cab3cd-320b-4575-696b-08d6c9949d01
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR04MB6625; 
x-ms-traffictypediagnostic: AM0PR04MB6625:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM0PR04MB66251A0F438ABA7525DA4E17C93D0@AM0PR04MB6625.eurprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39830400003)(396003)(366004)(136003)(376002)(189003)(199004)(53754006)(13464003)(26005)(33656002)(966005)(55016002)(93886005)(66446008)(64756008)(66946007)(14454004)(76116006)(8676002)(66556008)(30864003)(73956011)(81156014)(81166006)(66476007)(86362001)(446003)(11346002)(97736004)(53546011)(71200400001)(71190400001)(6436002)(6506007)(229853002)(102836004)(486006)(305945005)(6246003)(110136005)(7736002)(316002)(66066001)(8936002)(25786009)(68736007)(99286004)(186003)(74316002)(6116002)(3846002)(7696005)(9686003)(6306002)(53936002)(508600001)(52536014)(76176011)(4326008)(256004)(5660300002)(14444005)(2906002)(476003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR04MB6625;
 H:AM0PR04MB5218.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: ircona.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KAEEscOKcMO+3ryKeOkRzhtLwC0Shyuv9QV5RntGO3IKX56KRCHNU9UlPR0j6zrPnvtKXcCT7KKSCDoVp4g5WfLpEtjmhAtbPi4ErKk3tK7P4ePmVKZDaBEQcR63CrBI45+7dBh1q/PHwBAzToPtwb7nLU6XjowaR2sLfx4QRAmtQe3yWUqNOeok3rnepW73l0Jd/FFrPDov/7QewBPCEtHDBT7z/NdlDgipsLEm0x3swEgt/sG5QuJvUveIMSd8FzyvoJj2rpr9fGge5cEoN+f2wUBzVYSeY6n9FyzYHoX5Ga4Ohsfl9UgVWYcNdP5hdnFhuaKE9oQGCje6nw4KJqP8DoUJHyRrwGYjyipcr6aJIb+KCCyqdbvAs+UWPc/M6mCLZbhIIXirpMe5JtapNgzPbQfGF9M3UPUWDKm6X4k=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ircona.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cab3cd-320b-4575-696b-08d6c9949d01
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 15:42:24.4290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b5c9eba5-d9aa-4fea-9ead-d4e7d7f623f9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6625
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
X-List-Received-Date: Thu, 25 Apr 2019 15:42:34 -0000

Here's my fans.yaml, which doesn't contain any reference to a fan2

fans:
  - inventory: /system/chassis/motherboard/fan0
    cooling_zone: 0
    sensors:
      - fan0
    target_interface: xyz.openbmc_project.Control.FanPwm
  - inventory: /system/chassis/motherboard/fan1
    cooling_zone: 0
    sensors:
      - fan1
    target_interface: xyz.openbmc_project.Control.FanPwm

I've pushed my changes into the following repo as requested=20
https://github.com/JesusPhish/openbmc/tree/master/meta-evb/meta-evb-aspeed/=
meta-evb-ast2500/recipes-phosphor/fans?fbclid=3DIwAR3VgrLDBqzncNMhfuLZMAnZS=
4xopyfxTLfIC3IJHYxLKKxX3eqAL4x0oCE

-----Original Message-----
From: Matthew Barth <msbarth@linux.ibm.com>=20
Sent: 25 April 2019 15:49
To: Stephen Boylan <sboylan@ircona.com>; Patrick Venture <venture@google.co=
m>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Fan control service issues - service will not start "Uncaught =
DBus service lookup failure exception"



On 4/25/19 4:56 AM, Stephen Boylan wrote:
> After looking at my configuration file for=20
> /sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/ I noticed I had in an=20
> error to try fix an issue I set PWM_TARGET_fan1 =3D "0". Since I changed=
=20
> this back to what is below, now I get the following error when trying=20
> to start fan control services, similar to the original one but for a=20
> different fan.
>=20
> {
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "__CURSOR" :=20
> "s=3Dfdd5653de8ca4f298bf0d04f018a68d7;i=3D219;b=3D445f19f9668b4129b216ec8=
27e
> d31ddb;m=3Dad54afd;t=3D58757bd23b204;x=3D757e520ccf3b4259",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "__REALTIME_TIMESTAMP" : "1556185788690948",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "__MONOTONIC_TIMESTAMP" : "181750525",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_BOOT_ID" : "445f19f9668b4129b216ec827ed31ddb",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_UID" : "0",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_GID" : "0",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_MACHINE_ID" : "a361a071fa454d939ee5c5a7324cf2de"=
,
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_HOSTNAME" : "evb-ast2500",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_TRANSPORT" : "journal",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_CAP_EFFECTIVE" : "3fffffffff",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "CODE_FILE" :=20
> "/home/ircadmin/OpenBMC/openbmc/build/tmp/work/armv6-openbmc-linux-gnu
> eabi/phosphor-fan/1.0+gitAUTOINC+4b258ac8b6-r1/recipe-sysroot/usr
>=20
> /include/phosphor-logging/log.hpp",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "CODE_LINE" : "105",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "CODE_FUNC" : "helper_log",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "PRIORITY" : "3",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "MESSAGE" : "Uncaught DBus service lookup failure =
exception",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "TRANSACTION_ID" : "2273921040",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "PATH" : "/xyz/openbmc_project/sensors/fan_tach/fa=
n2",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "INTERFACE" : "xyz.openbmc_project.Control.FanPwm"=
,
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "SYSLOG_IDENTIFIER" : "phosphor-fan-control",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_PID" : "1198",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_COMM" : "phosphor-fan-co",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_EXE" : "/usr/sbin/phosphor-fan-control",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_CMDLINE" : "phosphor-fan-control --control",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_SYSTEMD_CGROUP" :=20
> "/system.slice/system-phosphor\\x2dfan\\x2dcontrol.slice/phosphor-fan-
> control@0.service",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_SYSTEMD_UNIT" : "phosphor-fan-control@0.service"=
,
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_SYSTEMD_SLICE" :=20
> "system-phosphor\\x2dfan\\x2dcontrol.slice",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_SYSTEMD_INVOCATION_ID" :=20
> "140d38d6360847c389c67d0bfa162589",
>=20
>  =A0=A0=A0=A0=A0=A0=A0 "_SOURCE_REALTIME_TIMESTAMP" : "1556185788690865"
>=20
> }
>=20
> What I don't understand here is why it's trying to access fan2 at all?=20
> I know that path does not exist and as far as I understand it I=20
> haven't tried to set it up through any configuration file.

What does your `fans.yaml` contain? Is there a "sensors:" entry with "fan2"=
 defined similar to romulus? If this does not contain it, would it be possi=
ble to push your openbmc repo to github containing all of your configs?
>=20
>> Also, what target mode do you have configured for the hwmon instance?
>>The *.Control.FanPWM interface is created for the fan objects by the=20
>>hwmon instance, when `TARGET_MODE =3D "PWM"` in the config.
>=20
> Here is my configuration file for the fans, it's primarily based on=20
> the meta-romulus .conf file
>=20
>  =A0 1 LABEL_fan1 =3D "fan0"
>=20
>  =A0 2 LABEL_fan2 =3D "fan1"
>=20
>  =A0 3
>=20
>  =A0 4 PWM_TARGET_fan1 =3D "1"
>=20
>  =A0 5 PWM_TARGET_fan2 =3D "2"
>=20
>  =A0 6
>=20
>  =A0 7 WARNLO_fan1 =3D 1500
>=20
>  =A0 8 WARNHI_fan1 =3D 5000
>=20
>  =A0 9 CRITLO_fan1 =3D 1000
>=20
>  =A010 CRITHI_fan1 =3D 5500
>=20
>  =A011
>=20
>  =A012 WARNLO_fan2 =3D 1500
>=20
>  =A013 WARNHI_fan2 =3D 5000
>=20
>  =A014 CRITLO_fan2 =3D 1000
>=20
>  =A015 CRITHI_fan2 =3D 5500
>=20
> Here is the pwm_tacho section of my dts file
>=20
> 153 &pwm_tacho {
>=20
> 154=A0=A0=A0=A0=A0=A0=A0=A0 status =3D "okay";
>=20
> 155=A0=A0=A0=A0=A0=A0=A0=A0 pinctrl-names =3D "default";
>=20
> 156=A0=A0=A0=A0=A0=A0=A0=A0 pinctrl-0 =3D <&pinctrl_pwm0_default
>=20
> 157=A0=A0=A0=A0=A0=A0=A0=A0 &pinctrl_pwm1_default>;
>=20
> 158
>=20
> 159=A0=A0=A0=A0=A0=A0=A0=A0 fan@0 {
>=20
> 160=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x00>;
>=20
> 161=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 aspeed,fan-tach-ch =
=3D /bits/ 8 <0x00>;
>=20
> 162=A0=A0=A0=A0=A0=A0=A0=A0 };
>=20
> 163
>=20
> 164=A0=A0=A0=A0=A0=A0=A0=A0 fan@1 {
>=20
> 165=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x01>;
>=20
> 166=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0aspeed,fan-tach-ch =
=3D /bits/ 8 <0x01>;
>=20
> 167=A0=A0=A0=A0=A0=A0=A0=A0 };
>=20
> 168 };
>=20
>> It looks like they don't have that PWM interface.=A0 You can check if=20
>> the pwm files exist under /sys/class/hwmon/hwmon*/=A0 for the hwmon*=20
>> that has your fans.
>=20
> Here's the contents of hwmon0. I know I can manually echo values into
> pwm1 and pwm2 and I can see the effect on the fans as they spin.
>=20
> root@evb-ast2500:/sys/class/hwmon/hwmon0# ls
>=20
> device =A0 =A0 =A0fan1_input =A0fan2_input =A0name =A0 =A0 =A0 =A0of_node=
 =A0 =A0 pwm1      =20
>  =A0pwm2 =A0 =A0 =A0 =A0subsystem =A0 uevent
>=20
> My understanding is that through the DTS file I've set up fan0 and fan1.=
=20
> These are represented in sys/class/hwmon/hwmon0 as fan1_input and=20
> fan2_input. Though the conf file set up in=20
> /sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/ I've assigned a "pretty=20
> name" of fan0 and fan1 to
>=20
> LABEL_fan1 and LABEL_fan2. Those "pretty name" values are used=20
> throughout the various configuration files for monitor/presence and contr=
ol.
>=20
> ----------------------------------------------------------------------
> --
>=20
> *From:*Matthew Barth <msbarth@linux.ibm.com>
> *Sent:* 24 April 2019 18:08
> *To:* Patrick Venture; Stephen Boylan
> *Cc:* openbmc@lists.ozlabs.org
> *Subject:* Re: Fan control service issues - service will not start=20
> "Uncaught DBus service lookup failure exception"
>=20
>=20
>=20
> On 4/24/19 11:38 AM, Patrick Venture wrote:
>  > On Wed, Apr 24, 2019 at 9:25 AM Stephen Boylan <sboylan@ircona.com>
> wrote:
>  >>
>  >> Hello all,
>  >>
>  >> I've run into an issue with my fan control. I have a simple two=20
> fan system which is failing to start phosphor-fan-control@.service  >> =20
> >>  >>  >> This is the status  >>  >>=20
> root@evb-ast2500:/lib/systemd/system# systemctl status=20
> phosphor-fan-control@0.service --no-page  >>  >> ?=20
> phosphor-fan-control@0.service - Phosphor Fan Control Daemon  >>  >>=A0=
=A0=A0=A0=20
> Loaded: loaded (/lib/systemd/system/phosphor-fan-control@.service;=20
> static; vendor
> preset: enabled)
>  >>
>  >>=A0=A0=A0=A0 Active: failed (Result: exit-code) since Wed 2019-04-24=20
> 16:22:36 UTC; 16s ago  >>  >>=A0=A0=A0 Process: 1218 ExecStart=3D/usr/bin=
/env=20
> phosphor-fan-control --control (code=3Dexited, status=3D1/FAILURE)  >>  >=
>=20
> Main PID: 1218 (code=3Dexited, status=3D1/FAILURE)  >>  >>  >>  >> Apr 24=
=20
> 16:22:36 evb-ast2500 systemd[1]:
> phosphor-fan-control@0.service: Service RestartSec=3D1s expired,=20
> scheduling restart.
>  >>
>  >> Apr 24 16:22:36 evb-ast2500 systemd[1]:=20
> phosphor-fan-control@0.service: Scheduled restart job, restart counter=20
> is at 2.
>  >>
>  >> Apr 24 16:22:36 evb-ast2500 systemd[1]: Stopped Phosphor Fan=20
> Control Daemon.
>  >>
>  >> Apr 24 16:22:36 evb-ast2500 systemd[1]:=20
> phosphor-fan-control@0.service: Start request repeated too quickly.
>  >>
>  >> Apr 24 16:22:36 evb-ast2500 systemd[1]:=20
> phosphor-fan-control@0.service: Failed with result 'exit-code'.
>  >>
>  >> Apr 24 16:22:36 evb-ast2500 systemd[1]: Failed to start Phosphor=20
> Fan Control Daemon.
>  >>
>  >>
>  >>
>  >> And I noticed this in the journalctl  >>  >> {  >>  >>=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=20
> "__CURSOR" :
> "s=3Defc0b033c5f243798b56446bcaffc0f5;i=3D23d;b=3D2de3ccbcea7940f5b51652e=
55e
> 900cd2;m=3D2f22198c;t=3D5874871dec1c2;x=3Df1ba902c2ec1feae",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "__REALTIME_TIMESTAMP" : "1556120101372354=
",  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "__MONOTONIC_TIMESTAMP" : "790763916",  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 "_BOOT_ID" :=20
> "2de3ccbcea7940f5b51652e55e900cd2",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "_UID" : "0",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "_GID" : "0",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "_MACHINE_ID" : "4c5bf4049b5e4751b70a17eae=
eb55a49",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "_HOSTNAME" : "evb-ast2500",  >>  >>=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=20
> "_TRANSPORT" : "journal",  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "_CAP_EFFECT=
IVE" :=20
> "3fffffffff",  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "CODE_FILE" :
> "/home/ircadmin/OpenBMC/openbmc/build/tmp/work/armv6-openbmc-linux-gnu
> eabi/phosphor-fan/1.0+gitAUTOINC+4b258ac8b6-r1/recipe-sysroot/usr
>  >>
>  >> /include/phosphor-logging/log.hpp",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "CODE_LINE" : "105",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "CODE_FUNC" : "helper_log",  >>  >>=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 "PRIORITY" :=20
> "3",  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "MESSAGE" : "Uncaught DBus servic=
e lookup=20
> failure exception",  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "TRANSACTION_ID" :=
 "114915536", =20
> >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "PATH" : "/xyz/openbmc_project/sensors/=
fan_tach/fan0",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "INTERFACE" : "xyz.openbmc_project.Control=
.FanPwm",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "SYSLOG_IDENTIFIER" : "phosphor-fan-contro=
l",  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "_PID" : "1273",  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "_COMM" : "phosphor-f=
an-co",  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "_EXE" : "/usr/sbin/phosphor-fan-control",  >>  >>=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 "_CMDLINE"=20
> : "phosphor-fan-control --control",  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "_=
SYSTEMD_CGROUP"=20
> :
> "/system.slice/system-phosphor\\x2dfan\\x2dcontrol.slice/phosphor-fan-
> control@0.service",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "_SYSTEMD_UNIT" : "phosphor-fan-control@0.=
service",  >> =20
> >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "_SYSTEMD_SLICE" :=20
> "system-phosphor\\x2dfan\\x2dcontrol.slice",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "_SYSTEMD_INVOCATION_ID" :=20
> "21572a9f879c44cab2b9b6b4c5e9a504",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "_SOURCE_REALTIME_TIMESTAMP" : "1556120101=
372269"
>  >>
>  >> }
>  >>
>  >>
>  >>
>  >> I know the PATH exists, though I'm not entirely sure about the=20
> INTERFACE. I've checked systemctl to see if I can find it and I don't=20
> see it. Should I be checking elsewhere for it?
>  >>
>  >>
>  >>
>  >>
>  >>
>  >> I can see my fan_tach sensors and my chassis entries as such  >> =20
> >> /xyz/openbmc_project/sensors/fan_tach/enumerate
>  >>
>  >> {
>  >>
>  >>=A0=A0=A0=A0=A0 "data": {
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 "/xyz/openbmc_project/sensors/fan_tach/fan=
0": {  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "CriticalAlarmHigh": false,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 "CriticalAlarmLow":=20
> false,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "CriticalHigh": 550=
0,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "CriticalLow": 1000,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "MaxV=
alue": 0,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "MinValue": 0,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Scale": 0,=
  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "Unit": "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Value": 4292,
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "WarningAlarmHigh": false,  >>=
  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "WarningAlarmLow": false,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
"WarningHigh": 5000, =20
> >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "WarningLow": 1500  >>  >>=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 },  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "/xyz/openbmc_project/sensors/fan_tach/fan1": {  >>  >>=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=20
> "CriticalAlarmHigh": false,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 "CriticalAlarmLow":=20
> false,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "CriticalHigh": 550=
0,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "CriticalLow": 1000,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "MaxV=
alue": 0,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "MinValue": 0,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Scale": 0,=
  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "Target": 255,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Unit":=20
> "xyz.openbmc_project.Sensor.Value.Unit.RPMS",
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Value": 3551,
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "WarningAlarmHigh": false,  >>=
  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "WarningAlarmLow": false,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
"WarningHigh": 5000, =20
> >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "WarningLow": 1500  >>  >>=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 }  >>  >>=A0=A0=A0=A0=A0=20
> },  >>  >>=A0=A0=A0=A0=A0 "message": "200 OK",  >>  >>=A0=A0=A0=A0=A0 "st=
atus": "ok"
>  >>
>  >> }
>  >>
>  >>
>  >>
>  >>=20
> /xyz/openbmc_project/inventory/system/chassis/motherboard/enumerate
>  >>
>  >> {
>  >>
>  >>=A0=A0=A0=A0=A0 "data": {
>  >>
>  >>         =20
> "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0": { =20
> >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Functional": true,  >>  >>=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "Present": true,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "PrettyName"=
: "fan0"
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 },
>  >>
>  >>         =20
> "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0/fan0":=20
> {  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Functional": true  >>  =
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0 },  >>
>  >>         =20
> "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1": { =20
> >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Functional": true,  >>  >>=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=20
> "Present": true,  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "PrettyNa=
me": "fan1"
>  >>
>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0 },
>  >>
>  >>         =20
> "/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1/fan1":=20
> {  >>  >>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Functional": true  >>  =
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0 }  >>  >>=A0=A0=A0=A0=A0=20
> },  >>  >>=A0=A0=A0=A0=A0 "message": "200 OK",  >>  >>=A0=A0=A0=A0=A0 "st=
atus": "ok"
>  >>
>  >> }
>  >
>  > It looks like they don't have that PWM interface.=A0 You can check if =
=20
> > the pwm files exist under /sys/class/hwmon/hwmon*/=A0 for the hwmon* =20
> > that has your fans.
>=20
> Also, what target mode do you have configured for the hwmon instance?
> The *.Control.FanPWM interface is created for the fan objects by the=20
> hwmon instance, when `TARGET_MODE =3D "PWM"` in the config.
>=20
>  >
>  >>
>  >>
>  >
>=20
