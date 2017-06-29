Return-Path: <c_mykolak@mellanox.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0073.outbound.protection.outlook.com [104.47.2.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyzWj3v87zDr5x
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 22:30:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="tW9ECYOX";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4SUtGHLnIw/CCozL1EHY84R/ZAghgYRx55Lira+IVn8=;
 b=tW9ECYOXMelMMMAqlUi36AFEcwGxReY1YmWacpjWkPp2uhDkSn/BrHMkT+NeUkCKXPWYm9RSKIQWP1iHQW5kZxmSGTtR8Ag8HOR1EEhCy7rU4cfSL0tOnyrhw1RsqdIqVPglq5DnH7ayINESocKkhgk6y56tFu2PJGVvWOY2PKA=
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com (10.161.245.11) by
 DB5PR05MB1224.eurprd05.prod.outlook.com (10.161.245.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1199.15; Thu, 29 Jun 2017 12:30:03 +0000
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::9d62:a5ed:bc3c:1272]) by DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::9d62:a5ed:bc3c:1272%13]) with mapi id 15.01.1199.021; Thu, 29 Jun
 2017 12:30:03 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Patrick Venture <venture@google.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: quanta: Enable pwm
 fans
Thread-Topic: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: quanta: Enable pwm
 fans
Thread-Index: AQHS8BoZN15io9RwCEO0oGF57/+jh6I7wRUV
Date: Thu, 29 Jun 2017 12:30:02 +0000
Message-ID: <DB5PR05MB12247989FD121B27F422DCB4EFD20@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170628142304.34433-1-venture@google.com>
In-Reply-To: <20170628142304.34433-1-venture@google.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [82.166.227.17]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR05MB1224;
 7:ySKYvWOWUWf8ueWVFlk5OqQYVK9h0VhhltNtNu3/VtigqvMWSZAh12SqAaZdQ7a3sT9SjKCJW9zxxfkX5CdBhu58i4feO4uLguX3ERtmPjxJavjETxOm+wp9Zl7+zbtO8KH/WTEdyErqi67iJlCAnlJt5rfk31clYIUyQlPpZZh3kprFLFFRJk8+TH56ap3ocZj2oH6PeQa4gwCgzsDyrjwXihp9vTIlOi5kdVeR1nzKTtA8PHurFCCNmDxRfJPeoRJinZkq448oYtXK9B2FKrmf2fS+g0S7/oqMvbGYDrPilXBkNCkN+NB9RG0Z0sgbLicOSC18OM5sn4cvG2ATOFXRJ0c4xhDTYK13tIHdDICat7BD5ChlXI3xvO5rUTC/WlsddLe3qEt5OdhTkIDyZiufFdxuFbGv/xsNIDydwvAyOaVjtX9fes29SVLaNVDlWtK4kSDc9X+usrXmmVHs+nkapvGM+lm8esFiNEmXgEOBmWDz+2KUi+eouVaaLNBK+dHGRZwo1+Ajx5ZBIOQ5efLsDmgde/YfI9xufwjDpfYLm38uxijrHr24AzG3V0QkcwW+zKSzc595cxq/XDL+iJTkshhv5yD5N59YwKiQaRv2JtiKLxpswSdPv7e+rY2DDnsCgWSVwElsQlx83tcBgSE3B1sqTMYEvOaJyLjZ/KuTphxfdp85x8wILEM0BbosznvUBywsJTfsTC451rtxp/ALeK8vf1ODZWC2cQCeWsWGLAti4SK89FOvGYRWFmEAvnwsnZVbMlPYlWEnS8pwLAEPP18/DYbtiX/G+hqRxA4=
x-ms-office365-filtering-correlation-id: 86a3e77b-37a8-4c57-3316-08d4beea9105
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:DB5PR05MB1224; 
x-ms-traffictypediagnostic: DB5PR05MB1224:
x-microsoft-antispam-prvs: <DB5PR05MB1224D0F5D1C4D8329274D484EFD20@DB5PR05MB1224.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(26388249023172)(65623756079841)(211936372134217); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123555025)(20161123564025)(20161123558100)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:DB5PR05MB1224; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:DB5PR05MB1224; 
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39840400002)(39860400002)(39450400003)(39400400002)(39850400002)(39410400002)(45080400002)(3660700001)(6506006)(6436002)(86362001)(478600001)(33656002)(2900100001)(229853002)(2201001)(25786009)(3280700002)(2906002)(38730400002)(8936002)(50986999)(7696004)(6246003)(54356999)(76176999)(7736002)(66066001)(5250100002)(5660300001)(189998001)(8676002)(81166006)(53936002)(102836003)(54896002)(9686003)(6116002)(2950100002)(3846002)(99286003)(14454004)(74316002)(2501003)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR05MB1224;
 H:DB5PR05MB1224.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB5PR05MB12247989FD121B27F422DCB4EFD20DB5PR05MB1224eurp_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2017 12:30:02.9025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR05MB1224
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Jun 2017 12:30:11 -0000

--_000_DB5PR05MB12247989FD121B27F422DCB4EFD20DB5PR05MB1224eurp_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Hi!


We want to add pwm_tacho for msn platform too.

Is there some special reason why you add pwm_tacho: pwm-tacho-controller@1e=
786000  to .dts not .dtsi file?


What about add this:

       pwm_tacho: pwm-tacho-controller@1e786000 {
               #address-cells =3D <1>;
               #size-cells =3D <1>;
              reg =3D <0x1e786000 0x1000>;
               compatible =3D "aspeed,ast2500-pwm-tacho";
               clocks =3D <&pwm_tacho_fixed_clk>;
               pinctrl-names =3D "default";


to aspeed-g5.dtsi?


And specific like pinctrl and fan:

               pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_default
                       &pinctrl_pwm2_default &pinctrl_pwm3_default>;

               fan@0 {
                       reg =3D <0x00>;
                       aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
               };


 to .dts file.


Thanks.

Best regards, Mykola Kostenok.

________________________________
=EF=D4: openbmc <openbmc-bounces+c_mykolak=3Dmellanox.com@lists.ozlabs.org>=
 =CF=D4 =C9=CD=C5=CE=C9 Patrick Venture <venture@google.com>
=EF=D4=D0=D2=C1=D7=CC=C5=CE=CF: 28 =C9=C0=CE=D1 2017 =C7. 17:23:04
=EB=CF=CD=D5: venture@google.com; joel@jms.id.au; openbmc@lists.ozlabs.org
=F4=C5=CD=C1: [PATCH linux dev-4.10 v3] ARM: dts: aspeed: quanta: Enable pw=
m fans

Signed-off-by: Patrick Venture <venture@google.com>
---
v3: lowercased hex address
v2: Moved pwm_tacho_fixed_clk to clocks.
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 51 ++++++++++++++++++++++++=
++++
 arch/arm/boot/dts/aspeed-g4.dtsi             |  5 +++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/d=
ts/aspeed-bmc-quanta-q71l.dts
index e609c53d58f5..3abc2954d26e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -46,6 +46,57 @@
                         gpios =3D <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_LOW=
>;
                 };
         };
+
+       pwm_tacho: pwm-tacho-controller@1e786000 {
+               #address-cells =3D <1>;
+               #size-cells =3D <1>;
+               reg =3D <0x1e786000 0x1000>;
+               compatible =3D "aspeed,ast2500-pwm-tacho";
+               clocks =3D <&pwm_tacho_fixed_clk>;
+               pinctrl-names =3D "default";
+               pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_default
+                       &pinctrl_pwm2_default &pinctrl_pwm3_default>;
+
+               fan@0 {
+                       reg =3D <0x00>;
+                       aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
+               };
+
+               fan@1 {
+                       reg =3D <0x01>;
+                       aspeed,fan-tach-ch =3D /bits/ 8 <0x01>;
+               };
+
+               fan@2 {
+                       reg =3D <0x02>;
+                       aspeed,fan-tach-ch =3D /bits/ 8 <0x02>;
+               };
+
+               fan@3 {
+                       reg =3D <0x03>;
+                       aspeed,fan-tach-ch =3D /bits/ 8 <0x03>;
+               };
+
+               fan@4 {
+                       reg =3D <0x00>;
+                       aspeed,fan-tach-ch =3D /bits/ 8 <0x04>;
+               };
+
+               fan@5 {
+                       reg =3D <0x01>;
+                       aspeed,fan-tach-ch =3D /bits/ 8 <0x05>;
+               };
+
+               fan@6 {
+                       reg =3D <0x02>;
+                       aspeed,fan-tach-ch =3D /bits/ 8 <0x06>;
+               };
+
+               fan@7 {
+                       reg =3D <0x03>;
+                       aspeed,fan-tach-ch =3D /bits/ 8 <0x07>;
+               };
+       };
 };

 &fmc {
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4=
.dtsi
index a998a00a2728..9cc959fccfa0 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -36,6 +36,11 @@
         };

         clocks {
+               pwm_tacho_fixed_clk: fixedclk {
+                       compatible =3D "fixed-clock";
+                       #clock-cells =3D <0>;
+                       clock-frequency =3D <24000000>;
+               };
         };

         ahb {
--
2.13.1.611.g7e3b11ae1-goog


--_000_DB5PR05MB12247989FD121B27F422DCB4EFD20DB5PR05MB1224eurp_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Hi!</p>
<p><br>
</p>
<p>We want to add&nbsp;<span style=3D"color:rgb(33,33,33); font-family:wf_s=
egoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-=
serif,serif,EmojiFont; font-size:13.3333px">pwm_tacho for msn platform too.=
</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px">Is there some special reason why you add&nbsp;<span=
 style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Segoe U=
I&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-=
size:13.3333px">pwm_tacho:
 pwm-tacho-controller@1e786000 &nbsp;to .dts not&nbsp;<span style=3D"color:=
rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Se=
goe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-size:13.3333px">=
.dtsi file?</span></span></span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px"><span style=3D"color:rgb(33,33,33); font-family:wf_=
segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans=
-serif,serif,EmojiFont; font-size:13.3333px"><span style=3D"color:rgb(33,33=
,33); font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&qu=
ot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-size:13.3333px"><br>
</span></span></span></p>
<p><font color=3D"#212121" face=3D"wf_segoe-ui_normal, Segoe UI, Segoe WP, =
Tahoma, Arial, sans-serif, serif, EmojiFont"><span style=3D"font-size:13.33=
33px">What about&nbsp;add this:&nbsp;<span style=3D"color:rgb(33,33,33); fo=
nt-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Taho=
ma,Arial,sans-serif,serif,EmojiFont; font-size:13.3333px"></span></span></f=
ont></p>
<p><font color=3D"#212121" face=3D"wf_segoe-ui_normal, Segoe UI, Segoe WP, =
Tahoma, Arial, sans-serif, serif, EmojiFont"><span style=3D"font-size:13.33=
33px"><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&q=
uot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,Emoji=
Font; font-size:13.3333px">&nbsp;
 &nbsp; &nbsp; &nbsp;pwm_tacho: pwm-tacho-controller@1e786000 {</span><br s=
tyle=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Segoe UI&=
quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-si=
ze:13.3333px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;#address-cells =3D &lt;1&gt;;</span><br style=3D"color:rgb(33,33,33); font=
-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma=
,Arial,sans-serif,serif,EmojiFont; font-size:13.3333px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;#size-cells =3D &lt;1&gt;;</span><br style=3D"color:rgb(33,33,33); font-fa=
mily:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Ar=
ial,sans-serif,serif,EmojiFont; font-size:13.3333px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =
=3D &lt;0x1e786000 0x1000&gt;;</span><br style=3D"color:rgb(33,33,33); font=
-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma=
,Arial,sans-serif,serif,EmojiFont; font-size:13.3333px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;compatible =3D &quot;aspeed,ast2500-pwm-tacho&quot;;</span><br style=3D"co=
lor:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quo=
t;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-size:13.3333=
px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;clocks =3D &lt;&amp;pwm_tacho_fixed_clk&gt;;</span><br style=3D"color:rgb(=
33,33,33); font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe =
WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-size:13.3333px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;pinctrl-names =3D &quot;default&quot;;</span><br>
</span></font></p>
<p><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px"><br>
</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px">to&nbsp;</span><span style=3D"color:rgb(33,33,33); =
font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Ta=
homa,Arial,sans-serif,serif,EmojiFont; font-size:13.3333px">aspeed-g5.dtsi?=
</span><br>
</p>
<p><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px"><br>
</span></p>
<p>And specific like pinctrl and fan:</p>
<p><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;pinctrl-0 =3D &lt;&amp;pinctrl_pwm0_default &amp;pinctrl_pwm1_default</=
span><br style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;&amp;pinctrl_pwm2_default &amp;pinctrl_pwm3_de=
fault&gt;;</span><br style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_=
normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,se=
rif,EmojiFont; font-size:13.3333px">
<br style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Sego=
e UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; fo=
nt-size:13.3333px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;fan@0 {</span><br style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_no=
rmal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,seri=
f,EmojiFont; font-size:13.3333px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D &lt;0x00&gt;;</span><br style=3D"color=
:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;S=
egoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-size:13.3333px"=
>
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;aspeed,fan-tach-ch =3D /bits/ 8 &lt;0x00&gt;;<=
/span><br style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quo=
t;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFo=
nt; font-size:13.3333px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:13.3333px">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;};</span><br>
</p>
<p><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px"><br>
</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px"><span style=3D"font-family:Calibri,Helvetica,sans-s=
erif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,Not=
oColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymb=
ols; font-size:16px">&nbsp;to
 .dts file.</span><br>
</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px"><br>
</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px">Thanks.</span></p>
<p><span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot=
;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFon=
t; font-size:13.3333px">Best regards, Mykola Kostenok.</span></p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=EF=D4:</b> openbmc &lt;openb=
mc-bounces&#43;c_mykolak=3Dmellanox.com@lists.ozlabs.org&gt; =CF=D4 =C9=CD=
=C5=CE=C9 Patrick Venture &lt;venture@google.com&gt;<br>
<b>=EF=D4=D0=D2=C1=D7=CC=C5=CE=CF:</b> 28 =C9=C0=CE=D1 2017 =C7. 17:23:04<b=
r>
<b>=EB=CF=CD=D5:</b> venture@google.com; joel@jms.id.au; openbmc@lists.ozla=
bs.org<br>
<b>=F4=C5=CD=C1:</b> [PATCH linux dev-4.10 v3] ARM: dts: aspeed: quanta: En=
able pwm fans</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Signed-off-by: Patrick Venture &lt;venture@google.=
com&gt;<br>
---<br>
v3: lowercased hex address<br>
v2: Moved pwm_tacho_fixed_clk to clocks.<br>
---<br>
&nbsp;arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 51 &#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;arch/arm/boot/dts/aspeed-g4.dtsi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 5 &#43;&#43;&#43;<br>
&nbsp;2 files changed, 56 insertions(&#43;)<br>
<br>
diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/d=
ts/aspeed-bmc-quanta-q71l.dts<br>
index e609c53d58f5..3abc2954d26e 100644<br>
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts<br>
&#43;&#43;&#43; b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts<br>
@@ -46,6 &#43;46,57 @@<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpios=
 =3D &lt;&amp;gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_LOW&gt;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; };<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pwm_tacho: pwm-tacho-controller@1=
e786000 {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; #address-cells =3D &lt;1&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; #size-cells =3D &lt;1&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; reg =3D &lt;0x1e786000 0x1000&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; compatible =3D &quot;aspeed,ast2500-pwm-tacho&quot;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; clocks =3D &lt;&amp;pwm_tacho_fixed_clk&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pinctrl-names =3D &quot;default&quot;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pinctrl-0 =3D &lt;&amp;pinctrl_pwm0_default &amp;pinctrl_pwm=
1_default<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;pinctrl=
_pwm2_default &amp;pinctrl_pwm3_default&gt;;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fan@0 {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;=
0x00&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed,fan-t=
ach-ch =3D /bits/ 8 &lt;0x00&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fan@1 {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;=
0x01&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed,fan-t=
ach-ch =3D /bits/ 8 &lt;0x01&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fan@2 {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;=
0x02&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed,fan-t=
ach-ch =3D /bits/ 8 &lt;0x02&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fan@3 {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;=
0x03&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed,fan-t=
ach-ch =3D /bits/ 8 &lt;0x03&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fan@4 {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;=
0x00&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed,fan-t=
ach-ch =3D /bits/ 8 &lt;0x04&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fan@5 {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;=
0x01&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed,fan-t=
ach-ch =3D /bits/ 8 &lt;0x05&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fan@6 {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;=
0x02&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed,fan-t=
ach-ch =3D /bits/ 8 &lt;0x06&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; fan@7 {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;=
0x03&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aspeed,fan-t=
ach-ch =3D /bits/ 8 &lt;0x07&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; };<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;&amp;fmc {<br>
diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4=
.dtsi<br>
index a998a00a2728..9cc959fccfa0 100644<br>
--- a/arch/arm/boot/dts/aspeed-g4.dtsi<br>
&#43;&#43;&#43; b/arch/arm/boot/dts/aspeed-g4.dtsi<br>
@@ -36,6 &#43;36,11 @@<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clocks {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pwm_tacho_fixed_clk: fixedclk {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible =
=3D &quot;fixed-clock&quot;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #clock-cells=
 =3D &lt;0&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-freque=
ncy =3D &lt;24000000&gt;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; };<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ahb {<br>
-- <br>
2.13.1.611.g7e3b11ae1-goog<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_DB5PR05MB12247989FD121B27F422DCB4EFD20DB5PR05MB1224eurp_--
