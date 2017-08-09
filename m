Return-Path: <c_mykolak@mellanox.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00057.outbound.protection.outlook.com [40.107.0.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSF794SFqzDqjk
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 01:09:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="SIFghVYb";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UBdUbl6fIAMjE5exHrYlm3pXB+hyD7todNCByX+45cI=;
 b=SIFghVYbvL5TKzdPqeq3A+5up/LY9kzFHcdLdtP5Ss0LctLKy8pTxUaTmr0hUfkuseF5jElcB/6hNWcnnK/boiURBqe11RLNLi041jPM1pfJkjFQkM7tx9SBZH10tb3mIlznqdHdbhNITVJkkx6nYDy/uEbeEla+l2ngcxV/z0o=
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com (10.161.245.11) by
 DB5PR05MB1255.eurprd05.prod.outlook.com (10.162.157.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1320.16; Wed, 9 Aug 2017 15:09:51 +0000
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::e96a:76a1:8f05:384e]) by DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::e96a:76a1:8f05:384e%18]) with mapi id 15.01.1320.012; Wed, 9 Aug 2017
 15:09:51 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Vadim Pasternak
 <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>
Subject: RE: [PATCH linux dev-4.10] aspeed_g5_defconfig: add CONFIG_OF_DYNAMIC.
Thread-Topic: [PATCH linux dev-4.10] aspeed_g5_defconfig: add
 CONFIG_OF_DYNAMIC.
Thread-Index: AQHTEEeGjXmiw4MdfUaW3puuzmn576J6gSVQgAF9UwCAABAv0A==
Date: Wed, 9 Aug 2017 15:09:51 +0000
Message-ID: <DB5PR05MB122479BEFABDDF4A5DB75868EF8B0@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170803144813.28010-1-c_mykolak@mellanox.com>
 <CACPK8XfC6=K7MUak2AQa9c1L-C4WBBWoxd8AbpXiM2KukQMUVQ@mail.gmail.com>
 <HE1PR05MB1227ECACCB6080B179026C54EF8A0@HE1PR05MB1227.eurprd05.prod.outlook.com>
 <87shh0nbep.fsf@concordia.ellerman.id.au>
In-Reply-To: <87shh0nbep.fsf@concordia.ellerman.id.au>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=c_mykolak@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR05MB1255;
 6:72AScduk+lnryTfyQ41pJ/IZINcFO7jBCaIpDLlMHU/i771u7Vjt0Xh1TliY76O2nQvQ2+XWPLH/0MDpkPt0ZWbHZz/Nn6qF++3xmwGYq9ulfeWCYEorh8wGXkHQeJX0aACjHw8yH/FWaWvTmazVzb1XojJX5ZGYxTd2ieHlBmKkiuCulMzRESSDSOHdJKX+kaLTRJ+SCCK/TnpKp1ixZ7VqWM6qyQf4BqIC4iMFMd8Gf2ZJX3wXysq8TD5lnAG2RPhrBI5Xj0vi0+LugN2yLSIH2MOwilsJ7++S/ZwFPtMgzH7VbuEDGR63EENBtpuu0Y1aLgZ2jhjap63mPyivwg==;
 5:AT6rY28mji0MYPSZb/bqlCT7MDtywBm03csdTqbfmBs4eAfq3s4yfJnBfj8SUplzLIskCsXzEXXZkboxNjsq46i6ESnHz7bwpHRmQ9qOHT/DK5Wpt377QfhzjDaCpDv9WPYL3jJuH1CubjaLfVYKVw==;
 24:ThOtw7pgElSERNnXQxKdf3tbFG8dNC+J3FBVE38tj/iYm1TaxYS7yTv3+rHqaiul3G/yFu0WQAkzIPvmuIJ+PYX2CXjsTaEt7HrPxz+ZEjE=;
 7:wk3o6Lqvm030KfDAUS9HhifupmZ6AiCC2/nF4OzvZLpRMfOPCRA7PcYzUAhq84VlAdykMvUqPy3qby9EjFWMnR9YAprPJ8ehqhXzYdp9zkmKEkjkSgMkEgw9EGyK8+tRs+HPrxvNxnExYzDjo0J+TABXYKZure3VFpOUbEZCDq/Pp7+WaxotG3b93x3Tb1B3zT+DifqIePfd2xedscT2M3QkDDvJ+j5bvL1wsjPMlCM=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 24070efd-b719-4363-b0dc-08d4df38aef4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:DB5PR05MB1255; 
x-ms-traffictypediagnostic: DB5PR05MB1255:
x-exchange-antispam-report-test: UriScan:(65623756079841);
x-microsoft-antispam-prvs: <DB5PR05MB1255281F04BD02379733B859EF8B0@DB5PR05MB1255.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(93006095)(93001095)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:DB5PR05MB1255; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:DB5PR05MB1255; 
x-forefront-prvs: 0394259C80
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39400400002)(39450400003)(39840400002)(39860400002)(39850400002)(39410400002)(189002)(13464003)(199003)(377454003)(97736004)(66066001)(478600001)(7736002)(33656002)(305945005)(93886004)(102836003)(3846002)(6116002)(25786009)(105586002)(53936002)(106356001)(38730400002)(9686003)(6246003)(81166006)(81156014)(3660700001)(8936002)(189998001)(8676002)(2906002)(4326008)(99286003)(55016002)(86362001)(3280700002)(229853002)(68736007)(101416001)(74316002)(2900100001)(53546010)(76176999)(50986999)(14454004)(54906002)(6506006)(5660300001)(5250100002)(2950100002)(7696004)(6436002)(54356999)(15760500002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR05MB1255;
 H:DB5PR05MB1224.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2017 15:09:51.0798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR05MB1255
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
X-List-Received-Date: Wed, 09 Aug 2017 15:09:59 -0000

> -----Original Message-----
> From: Michael Ellerman [mailto:mpe@ellerman.id.au]
> Sent: Wednesday, August 9, 2017 4:01 PM
> To: Mykola Kostenok <c_mykolak@mellanox.com>; Joel Stanley
> <joel@jms.id.au>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Vadim Pasternak
> <vadimp@mellanox.com>; Ohad Oz <ohado@mellanox.com>; Benjamin
> Herrenschmidt <benh@kernel.crashing.org>; Jeremy Kerr <jk@ozlabs.org>
> Subject: RE: [PATCH linux dev-4.10] aspeed_g5_defconfig: add
> CONFIG_OF_DYNAMIC.
>=20
> Mykola Kostenok <c_mykolak@mellanox.com> writes:
> >> -----Original Message-----
> >> From: joel.stan@gmail.com [mailto:joel.stan@gmail.com] On Behalf Of
> >> Joel >> Stanley
> >>
> >> Can you explain what you're wanting to do here?
> >>
> >> I've added some of our device tree experts to cc so they can offer adv=
ice.
> >
> > Hi, Joel.
> >
> > We have now patchset supporting our CPLD device in upstream review.
> > There we have support for dynamic (hotplug) devices, like PSUs, FANs,
> ASIC, etc.
> >
> ...
> >
> > They all sets with the state "disabled", and driver activates it with t=
he
> below calls, when related hotplug event is received in interrupt handler:
> >
> > static struct property mlxreg_core_device_dis =3D {
> > 	.name =3D MLXREG_CORE_PROP_STATUS,
> > 	.value =3D MLXREG_CORE_PROP_DISABLED,
> > 	.length =3D sizeof(MLXREG_CORE_PROP_DISABLED),
> > };
> >
> > static void mlxreg_core_dev_enable(struct device_node *np) {
> > 	/* Enable and create device. */
> > 	of_update_property(np, &mlxreg_core_device_en); }
> >
> > static void mlxreg_core_dev_disable(struct device_node *np) {
> > 	/* Disable and unregister platform device. */
> > 	of_update_property(np, &mlxreg_core_device_dis);
> > 	of_node_clear_flag(np, OF_POPULATED); }
> >
> > For that we must have OF_DYNAMIC set, and last one required
> OF_UNITEST.
>=20
> But are you actually changing the structure of the device tree at run tim=
e?
>=20
> If all you're doing is using of_update_property() to change the status
> property I don't think you need OF_DYNAMIC.
>=20
> cheers

Hi, Michael.

In drivers/i2c/i2c-core.c:

#if IS_ENABLED(CONFIG_OF_DYNAMIC)
static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
			 void *arg)
So we need it.

Best regards. Mykola Kostenok.
