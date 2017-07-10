Return-Path: <c_mykolak@mellanox.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0075.outbound.protection.outlook.com [104.47.2.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x5npR3yNyzDqBr
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 00:36:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="m93viTKr";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KVHNSwhQdqlLtB9gQFj1gKVkHE5l3cJT4+XbNMX2aBQ=;
 b=m93viTKrs8UkPRdn6ubzJbpZnyfu1DSgZvWzYtndT3pli7g+GmhKcMnrsagPG7GYg6F2hoAQYP4+08BMpmtRgn7tkn4awJtBK8xB+eMVQUeeU6hBJ6iYK/GZC0VWQIqvyDf7Q2xhzTdAPu9msXBJdp+N4lNFG2mYQXTnxr6twr0=
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com (10.161.245.11) by
 VI1PR05MB3343.eurprd05.prod.outlook.com (10.170.238.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1240.13; Mon, 10 Jul 2017 14:36:18 +0000
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::21e6:bfbb:dbbc:3bd5]) by DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::21e6:bfbb:dbbc:3bd5%14]) with mapi id 15.01.1240.020; Mon, 10 Jul
 2017 14:36:17 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.com>, "linux-hwmon@vger.kernel.org"
 <linux-hwmon@vger.kernel.org>, Jaghathiswari Rankappagounder Natarajan
 <jaghu@google.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>, Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1] hwmon: (aspeed-pwm-tacho) cooling device support.
Thread-Topic: [patch v1] hwmon: (aspeed-pwm-tacho) cooling device support.
Thread-Index: AQHS9msIRawOhM8MdkWqg+N4A53AyKJIq04AgAR1dmA=
Date: Mon, 10 Jul 2017 14:36:17 +0000
Message-ID: <DB5PR05MB1224342E024F68EE43790E53EFA90@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170706142338.32732-1-c_mykolak@mellanox.com>
 <20170707180844.GA25433@roeck-us.net>
In-Reply-To: <20170707180844.GA25433@roeck-us.net>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB3343;
 7:TWlOM28BWJjYpKMsKHlKnWvUXgh9KG47Z1NqgvuZoKFrH4yFbd9H6/E8h7JveqR56kzFfeLAH33NnDzItUrxGbQsYowtmPmTUxVfO8f+47JViBQoitsc4vWE9w3r0vVfFEO+7dthvs8rWrLNwrJ6olle5ioEkEBOo6PfZtX3u92CEC2AiE5mUwbHQS3RaiDWsHCvwxEdEgYi93VVzqZbz4UTs8jNIwCTe3klW4CPt33YRV+/q4QEASvON4FtWyHKYc4S0sHCd4pG7rK3fkBZ+ZAn934JKxYat+doN4JXne6kMXgyf/yS5xK/AdhWkZLqdJX/vW+GYjoF6GKXwsb6x+K1IZ/5U15XYQR2HQ3FNI+2Nub78Dlp1KTmWVE7kMVTBJzUTziJu9gKqyrYg7leSLXa6RNHBXrakdPAl4fL/JljiBM3aMJnfR0mmDslA+oWU0nfZDjSZh5mdWfJeeR+uMLgZ1tlKpEoAKM0y0Orq1oEzcynptBF99Nix3PjdrZcA5/0k1txMLf6GatHJUJxm1HBfiImjQXm4qXLTQOYQsVWT9g/PI/qheHfiZU61tF80A0YgsJZezUb3XDwbIywObW4hqZWmctuJmULBtOH/3zamUlIoIQeP2oVd1Ng2lQ9Wu5sAJKk8DJCJA8Z9qgWnBudLNZbFUv0rNLJvQa/T4goKdj9w94SlI4dhk+Zuf1rdsZYK28EuMAXvRNxQKb6Anu0vOfKROT1V9bJvKVMU5Bzu9Bw3h0eAOOysWN58cF8h7B8jku6cWqlIf8Z2/C43ozo2+wAtSxBHVNAOZ4aIhk=
x-ms-office365-filtering-correlation-id: 1f8d7bf8-f61a-4141-83df-08d4c7a1067c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:VI1PR05MB3343; 
x-ms-traffictypediagnostic: VI1PR05MB3343:
x-microsoft-antispam-prvs: <VI1PR05MB3343B4E5F318C288AE7BE50CEFA90@VI1PR05MB3343.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(133145235818549)(236129657087228)(9452136761055)(65623756079841)(211936372134217)(209349559609743)(247924648384137)(17755550239193);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(2017060910075)(5005006)(8121501046)(100000703101)(100105400095)(3002001)(10201501046)(93006095)(93001095)(6055026)(6041248)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:VI1PR05MB3343; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:VI1PR05MB3343; 
x-forefront-prvs: 03648EFF89
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39450400003)(39400400002)(39410400002)(39850400002)(39860400002)(39840400002)(377454003)(24454002)(57704003)(13464003)(2906002)(6916009)(86362001)(5660300001)(2950100002)(33656002)(8676002)(575784001)(3280700002)(6436002)(53936002)(478600001)(3660700001)(229853002)(9686003)(6506006)(54356999)(99286003)(55016002)(54906002)(74316002)(76176999)(50986999)(7696004)(6116002)(102836003)(2900100001)(6246003)(305945005)(14454004)(5250100002)(3846002)(25786009)(8936002)(38730400002)(66066001)(4326008)(107886003)(110136004)(81166006)(53546010)(189998001)(230783001)(345774005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3343;
 H:DB5PR05MB1224.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2017 14:36:17.7318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3343
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
X-List-Received-Date: Mon, 10 Jul 2017 14:36:34 -0000

> -----Original Message-----
> From: Guenter Roeck [mailto:linux@roeck-us.net]
> Sent: Friday, July 7, 2017 9:09 PM
> To: Mykola Kostenok <c_mykolak@mellanox.com>
> Cc: Jean Delvare <jdelvare@suse.com>; linux-hwmon@vger.kernel.org;
> Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>;
> openbmc@lists.ozlabs.org; Patrick Venture <venture@google.com>; Vadim
> Pasternak <vadimp@mellanox.com>
> Subject: Re: [patch v1] hwmon: (aspeed-pwm-tacho) cooling device support.
>=20
> On Thu, Jul 06, 2017 at 05:23:38PM +0300, Mykola Kostenok wrote:
> > Add support in aspeed-pwm-tacho driver for cooling device creation.
> > This cooling device could be bound to a thermal zone for the thermal
> > control. Device will appear in /sys/class/thermal folder as
> > cooling_deviceX. Then it could be bound to particular thermal zones.
> > Allow specification of the cooling levels vector - PWM duty cycle
> > values in a range from 0 to 255 which correspond to thermal cooling
> > states.
> >
> > Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> > ---
> >  .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt |  52 ++++++--
>=20
> You'll need devicetree maintainer approval for any devicetree changes.
>=20
> >  drivers/hwmon/aspeed-pwm-tacho.c                   | 141
> ++++++++++++++++++++-
> >  2 files changed, 179 insertions(+), 14 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> > b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> > index cf44605..293a994 100644
> > --- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> > +++ b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-
> tacho.txt
> > @@ -23,9 +23,14 @@ Required properties for pwm-tacho node:
> >  - clocks : a fixed clock providing input clock frequency(PWM
> >  	   and Fan Tach clock)
> >
> > -fan subnode format:
> > +tach-channels subnode format:
>=20
> I don't like the notion of renaming "fan subnode" to "tach-channels
> subnode". To me that is just a personal preference. Tomorrow I might get
> another patch changing it back or changing it to something else.
>=20
> But, as mentioned above, you'll need DT maintaier approval for those
> changes in the first place.
>=20
> Guenter
>=20

Hi, Guenter.
Thank you for reply.

Actually we didn't rename fan subnode. We add one more level hierarchy
tach-channels and put fan subnodes inside it.
And also we add pwm-channels subnode with pwm subnodes inside=20
for cooling device.

We found issue with of_node_put in this patch, so we want to send=20
you patch v2.

Do we need send this changes in 2 separated patches,=20
one with driver aspeed-pwm-tacho.c to you, and another=20
with doc aspeed-pwm-tacho.txt to DT maintainer?

Best regards. Mykola Kostenok.

> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -Under fan subnode there can upto 8 child nodes, with each child node
> > +Required properties for tach-channels node:
> > +- #address-cells : should be 1.
> > +
> > +- #size-cells : should be 0.
> > +
> > +Under tach-channels subnode there can be upto 8 child nodes, with
> > +each child node
> >  representing a fan. If there are 8 fans each fan can have one PWM
> > port and  one/two Fan tach inputs.
> >
> > @@ -39,6 +44,22 @@ Required properties for each child node:
> >  		Fan tach channel 0 and 15 indicating Fan tach channel 15.
> >  		Atleast one Fan tach input channel is required.
> >
> > +pwm-channels subnode format:
> > +Under pwm-channels subnode there can be pwm child nodes.
> > +Required properties for tach-channels node:
> > +- #address-cells : should be 1.
> > +
> > +- #size-cells : should be 0.
> > +
> > +- #cooling-cells : should be 2;
> > +
> > +pwm subnode format:
> > +- reg : should be <0x00>.
> > +
> > +- cooling-levels      : PWM duty cycle values in a range from 0 to 255
> > +			which correspond to thermal cooling states.
> > +
> > +
> >  Examples:
> >
> >  pwm_tacho_fixed_clk: fixedclk {
> > @@ -55,14 +76,25 @@ pwm_tacho: pwmtachocontroller@1e786000 {
> >  	clocks =3D <&pwm_tacho_fixed_clk>;
> >  	pinctrl-names =3D "default";
> >  	pinctrl-0 =3D <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> > -
> > -	fan@0 {
> > -		reg =3D <0x00>;
> > -		aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
> > +	tach-channels {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		fan@0 {
> > +			reg =3D <0x00>;
> > +			aspeed,fan-tach-ch =3D /bits/ 8 <0x00>;
> > +		};
> > +		fan@1 {
> > +			reg =3D <0x01>;
> > +			aspeed,fan-tach-ch =3D /bits/ 8 <0x01 0x02>;
> > +		};
> >  	};
> > -
> > -	fan@1 {
> > -		reg =3D <0x01>;
> > -		aspeed,fan-tach-ch =3D /bits/ 8 <0x01 0x02>;
> > +	pwm-channels {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		#cooling-cells =3D <2>;
> > +		pwm@0 {
> > +			reg =3D <0x00>;
> > +			cooling-levels =3D /bits/ 8 <125 151 177 203 229 255>;
> > +		};
> >  	};
> >  };
> > diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
> > b/drivers/hwmon/aspeed-pwm-tacho.c
> > index ddfe66b..c10a37e 100644
> > --- a/drivers/hwmon/aspeed-pwm-tacho.c
> > +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/sysfs.h>
> >  #include <linux/regmap.h>
> > +#include <linux/thermal.h>
> >
> >  /* ASPEED PWM & FAN Tach Register Definition */
> >  #define ASPEED_PTCR_CTRL		0x00
> > @@ -166,6 +167,16 @@
> >  /* How long we sleep in us while waiting for an RPM result. */
> >  #define ASPEED_RPM_STATUS_SLEEP_USEC	500
> >
> > +struct aspeed_cooling_device {
> > +	char name[16];
> > +	struct aspeed_pwm_tacho_data *priv;
> > +	struct thermal_cooling_device *tcdev;
> > +	int pwm_port;
> > +	u8 *cooling_levels;
> > +	u8 max_state;
> > +	u8 cur_state;
> > +};
> > +
> >  struct aspeed_pwm_tacho_data {
> >  	struct regmap *regmap;
> >  	unsigned long clk_freq;
> > @@ -180,6 +191,7 @@ struct aspeed_pwm_tacho_data {
> >  	u8 pwm_port_type[8];
> >  	u8 pwm_port_fan_ctrl[8];
> >  	u8 fan_tach_ch_source[16];
> > +	struct aspeed_cooling_device *cdev[8];
> >  	const struct attribute_group *groups[3];  };
> >
> > @@ -794,10 +806,111 @@ static int aspeed_create_fan(struct device *dev,
> >  	return 0;
> >  }
> >
> > +static int
> > +aspeed_pwm_cz_get_max_state(struct thermal_cooling_device *tcdev,
> > +			    unsigned long *state)
> > +{
> > +	struct aspeed_cooling_device *cdev =3D
> > +				(struct aspeed_cooling_device *)tcdev-
> >devdata;
> > +
> > +	*state =3D cdev->max_state;
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +aspeed_pwm_cz_get_cur_state(struct thermal_cooling_device *tcdev,
> > +			    unsigned long *state)
> > +{
> > +	struct aspeed_cooling_device *cdev =3D
> > +				(struct aspeed_cooling_device *)tcdev-
> >devdata;
> > +
> > +	*state =3D cdev->cur_state;
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +aspeed_pwm_cz_set_cur_state(struct thermal_cooling_device *tcdev,
> > +			    unsigned long state)
> > +{
> > +	struct aspeed_cooling_device *cdev =3D
> > +				(struct aspeed_cooling_device *)tcdev-
> >devdata;
> > +
> > +	if (state > cdev->max_state)
> > +		return -EINVAL;
> > +
> > +	cdev->cur_state =3D state;
> > +	cdev->priv->pwm_port_fan_ctrl[cdev->pwm_port] =3D *(cdev-
> >cooling_levels
> > +							  + cdev->cur_state);
> > +	aspeed_set_pwm_port_fan_ctrl(cdev->priv, cdev->pwm_port,
> > +				     *(cdev->cooling_levels +
> > +				       cdev->cur_state));
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct thermal_cooling_device_ops aspeed_pwm_cool_ops =3D
> {
> > +	.get_max_state =3D aspeed_pwm_cz_get_max_state,
> > +	.get_cur_state =3D aspeed_pwm_cz_get_cur_state,
> > +	.set_cur_state =3D aspeed_pwm_cz_set_cur_state, };
> > +
> > +static int aspeed_create_pwm_cooling(struct device *dev,
> > +				     struct device_node *child,
> > +				     struct aspeed_pwm_tacho_data *priv) {
> > +	u32 pwm_port;
> > +	int ret;
> > +
> > +	ret =3D of_property_read_u32(child, "reg", &pwm_port);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D of_property_count_u8_elems(child, "cooling-levels");
> > +	if (ret <=3D 0) {
> > +		dev_err(dev, "Wrong cooling-levels data.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	priv->cdev[pwm_port] =3D devm_kzalloc(dev, sizeof(*priv-
> >cdev[pwm_port]),
> > +					    GFP_KERNEL);
> > +	if (!priv->cdev[pwm_port])
> > +		return -ENOMEM;
> > +
> > +	priv->cdev[pwm_port]->cooling_levels =3D devm_kzalloc(dev, ret *
> > +							    sizeof(u8),
> > +							    GFP_KERNEL);
> > +	if (!priv->cdev[pwm_port]->cooling_levels)
> > +		return -ENOMEM;
> > +
> > +	priv->cdev[pwm_port]->max_state =3D ret - 1;
> > +	ret =3D of_property_read_u8_array(child, "cooling-levels",
> > +					priv->cdev[pwm_port]-
> >cooling_levels,
> > +					ret);
> > +	if (ret) {
> > +		dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
> > +		return ret;
> > +	}
> > +
> > +	sprintf(priv->cdev[pwm_port]->name, "%s%d", child->name,
> pwm_port);
> > +	priv->cdev[pwm_port]->tcdev =3D
> thermal_of_cooling_device_register(child,
> > +						priv->cdev[pwm_port]-
> >name,
> > +						priv->cdev[pwm_port],
> > +						&aspeed_pwm_cool_ops);
> > +	if (PTR_ERR_OR_ZERO(priv->cdev[pwm_port]->tcdev))
> > +		return PTR_ERR(priv->cdev[pwm_port]->tcdev);
> > +
> > +	priv->cdev[pwm_port]->priv =3D priv;
> > +	priv->cdev[pwm_port]->pwm_port =3D pwm_port;
> > +
> > +	return 0;
> > +}
> > +
> >  static int aspeed_pwm_tacho_probe(struct platform_device *pdev)  {
> >  	struct device *dev =3D &pdev->dev;
> > -	struct device_node *np, *child;
> > +	struct device_node *np, *child, *grandchild;
> >  	struct aspeed_pwm_tacho_data *priv;
> >  	void __iomem *regs;
> >  	struct resource *res;
> > @@ -833,10 +946,30 @@ static int aspeed_pwm_tacho_probe(struct
> platform_device *pdev)
> >  	aspeed_create_type(priv);
> >
> >  	for_each_child_of_node(np, child) {
> > -		ret =3D aspeed_create_fan(dev, child, priv);
> > +		if (!of_node_cmp(child->name, "tach-channels")) {
> > +			for_each_child_of_node(child, grandchild) {
> > +				ret =3D aspeed_create_fan(dev, grandchild,
> priv);
> > +				of_node_put(grandchild);
> > +				if (ret) {
> > +					of_node_put(child);
> > +					return ret;
> > +				}
> > +			}
> > +		}
> > +
> > +		if (!of_node_cmp(child->name, "pwm-channels")) {
> > +			for_each_child_of_node(child, grandchild) {
> > +				ret =3D aspeed_create_pwm_cooling(dev,
> > +								grandchild,
> > +								priv);
> > +				of_node_put(grandchild);
> > +				if (ret) {
> > +					of_node_put(child);
> > +					return ret;
> > +				}
> > +			}
> > +		}
> >  		of_node_put(child);
> > -		if (ret)
> > -			return ret;
> >  	}
> >
> >  	priv->groups[0] =3D &pwm_dev_group;
> > --
> > 2.8.4
> >
