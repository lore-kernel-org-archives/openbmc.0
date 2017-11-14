Return-Path: <c_mykolak@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=104.47.2.80; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=c_mykolak@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="cqqy03HP";
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0080.outbound.protection.outlook.com [104.47.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybkSH0YrHzDqlS
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 21:35:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fL+Nq5KFTs1hEl5/7pJ70Hi6ReX0hdHk8BMmF99WrQs=;
 b=cqqy03HPPmKErwEQvqf4VRLlO+WxJo0lxiUbenCW93kGj1sdUVVeStUtEaEwSqnnnwoFAauhRicjuLluUIaMjP9LJms0W8Vhq4kAORrke/pXIVP9RPBhmh17e8r6S4Qo1gRqsmLF+BELf8f3L/wS52bR8AzMBF0/6ORQ+P2/wZM=
Received: from VI1PR0502MB3999.eurprd05.prod.outlook.com (52.134.18.29) by
 VI1PR0502MB4000.eurprd05.prod.outlook.com (52.134.18.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.218.12; Tue, 14 Nov 2017 10:35:53 +0000
Received: from VI1PR0502MB3999.eurprd05.prod.outlook.com
 ([fe80::9098:d88b:21d8:d2ff]) by VI1PR0502MB3999.eurprd05.prod.outlook.com
 ([fe80::9098:d88b:21d8:d2ff%13]) with mapi id 15.20.0218.015; Tue, 14 Nov
 2017 10:35:52 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Andrew Jeffery <andrew@aj.id.au>, "joel@jms.id.au" <joel@jms.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Patrick Venture
 <venture@google.com>
Subject: RE: [PATCH linux dev-4.10] aspeed: dts: Update some platforms to mux
 RMII1 for MAC0
Thread-Topic: [PATCH linux dev-4.10] aspeed: dts: Update some platforms to mux
 RMII1 for MAC0
Thread-Index: AQHTXQjVQEAfFPQNdkOjluYTRNyA1qMTrf6g
Date: Tue, 14 Nov 2017 10:35:52 +0000
Message-ID: <VI1PR0502MB3999183BE8336DDF3786B21EEF280@VI1PR0502MB3999.eurprd05.prod.outlook.com>
References: <20171114052343.18808-1-andrew@aj.id.au>
In-Reply-To: <20171114052343.18808-1-andrew@aj.id.au>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=c_mykolak@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR0502MB4000;
 6:aRyumrot+K2K4NFewkyf5ug3yU0HxQTz4StXirOtvPcM2pgmC4iur0PgJKhlMpImA7o/YLt1fFAukvtf48oUvUqybo8SB3NJzdaxB+8vLmN0xoXEMBW1Ohav1hGfVa0y/Vq4AKZoM4vV82Mr5y0oX2Py0KmGiBTJY7pSQfvDjo2fC3mL8jqgkLhDZjOlujfqo6SjVIxl6G0Th8I72xk9uEVEitXu9sApc7c7vGHyvEJt8Rsx4lVP7tUj0bktWJI70+G2PkP6e0earHwXxSyjBwhZg2JsjIteayLdqHgUBEqRNlN5Ei9gbmbwWAlG2napmiISLnfGMCzh1G43Rd7YGR6+GRTgY4PNGPstSXnUB5Y=;
 5:pw9OekDlduBGFrk6BGtFAmyQjcJcaxcC00DoOQwEXId+Gy6aCDxCbU9k7Fi5BhjUhO4JLkQjSFAREZWOWLXqGiaiihzSrbyjm6mclCawxJ+gknvJpDq9S27Gj+dUEJrvgPDAEeWLsXhYms8DtiZGp+2kamgt4qgy5xTAMqRsj+Y=;
 24:+0R+1a3SVw9GyDxwHugqETgxqTDnyoWlH/HDa/JyVM22EcHrI6WjO84WUBA47KmRDWXVXlfxkRplob+lOrO/knSyRvjophKqRuoFpUQk13g=;
 7:oUyEWgH96zLumysuiSCRoTnc0zxCbVhX8LjTMML5kHRkiKAAOwFeuMzXYiQkDNw1KCuTvRmvRx+GUM3TsJmH0vCuvdw0cuss26NQARQH7iR59TEI5NSzaaRZYVxJ6H9j4hABXxZcPFfCRwzJka7AcTjoJtaE/Ds+PE1DKq1aZKrGYJJNYOtXosOALxQ7GhkBVElwrol474XqdG4ekY+utiN7KquixUSe/hfeyuXkzOQbeqUS7fPONcEZNkDT3GS/
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: f01c2f15-a34e-43f6-0b88-08d52b4b7b08
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(22001)(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
 SRVR:VI1PR0502MB4000; 
x-ms-traffictypediagnostic: VI1PR0502MB4000:
x-microsoft-antispam-prvs: <VI1PR0502MB4000A1D3B5250E8C0D84F116EF280@VI1PR0502MB4000.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(65623756079841)(211936372134217)(153496737603132); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93001095)(100000703101)(100105400095)(3002001)(3231022)(920507027)(10201501046)(6055026)(6041248)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:VI1PR0502MB4000; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:VI1PR0502MB4000; 
x-forefront-prvs: 04916EA04C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(376002)(346002)(39860400002)(13464003)(189002)(199003)(7736002)(478600001)(45080400002)(305945005)(74316002)(33656002)(106356001)(14454004)(53546010)(105586002)(8676002)(81156014)(81166006)(2900100001)(189998001)(34040400001)(3846002)(102836003)(2906002)(6116002)(5250100002)(3280700002)(3660700001)(2950100002)(15650500001)(5660300001)(2501003)(7696004)(25786009)(97736004)(229853002)(6506006)(68736007)(86362001)(575784001)(4326008)(66066001)(6436002)(55016002)(6246003)(9686003)(53936002)(76176999)(110136005)(101416001)(54906003)(316002)(50986999)(99286004)(8936002)(54356999);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB4000;
 H:VI1PR0502MB3999.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01c2f15-a34e-43f6-0b88-08d52b4b7b08
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2017 10:35:52.8053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB4000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 10:36:00 -0000

Acked-by: Mykola Kostenok <c_mykolak@mellanox.com>

Best regards. Mykola Kostenok.

> -----Original Message-----
> From: Andrew Jeffery [mailto:andrew@aj.id.au]
> Sent: Tuesday, November 14, 2017 7:24 AM
> To: joel@jms.id.au
> Cc: Andrew Jeffery <andrew@aj.id.au>; openbmc@lists.ozlabs.org; Mykola
> Kostenok <c_mykolak@mellanox.com>; Patrick Venture
> <venture@google.com>
> Subject: [PATCH linux dev-4.10] aspeed: dts: Update some platforms to mux
> RMII1 for MAC0
>=20
> I noticed that Witherspoon was missing its pinctrl properties for the mac=
0
> node. On auditing the rest of the DTS files, the MSN and Q71L platforms
> appeared to have the same issue.
>=20
> Add the pinctrl nodes to ensure MAC0 has RMII1 muxed. This provides
> mutual exclusion with the GPIO subsystem ensuring broken userspace can't
> interfere with networking.
>=20
> Cc: Mykola Kostenok <c_mykolak@mellanox.com>
> Cc: Patrick Venture <venture@google.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts    | 3 +++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 3 +++
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts     | 3 +++
>  3 files changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> index d1dc2ef1a162..1005d6becdba 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
> @@ -48,6 +48,9 @@
>  &mac0 {
>  	status =3D "okay";
>  	use-ncsi;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii1_default>;
>  };
>=20
>  &i2c5 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 68058eca1559..cc1fd0dc6677 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -239,6 +239,9 @@
>=20
>  	use-ncsi;
>  	no-hw-checksum;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii1_default>;
>  };
>=20
>  &i2c0 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index 7ed3a773b2d5..41368734f07d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -139,6 +139,9 @@
>=20
>  	use-ncsi;
>  	no-hw-checksum;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii1_default>;
>  };
>=20
>  &mac1 {
> --
> 2.14.1
