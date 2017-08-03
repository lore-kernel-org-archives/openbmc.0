Return-Path: <oleksandrs@mellanox.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0083.outbound.protection.outlook.com [104.47.0.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNXxN3kbGzDqjy
 for <openbmc@lists.ozlabs.org>; Fri,  4 Aug 2017 00:48:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="ZyDcFiUk";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7xXcVADjNg1ut+qaCb68H9HIRkQ58nYHE0EA7lY+Mqc=;
 b=ZyDcFiUkbXlJA/WxgL2nU7klLTDMnXl8vN68dzrLVfGH6oKgoSxAUpWvF2cgiJwdoDQK3DuiqCk1tvuqGqcFU1IYRKIyt4U20gU3780qCPejZFvin2RZMsL6Fy9gPG6Pp1DzJxjLzRHKWoIydRVEAv1Zm5ATqdbjxveDDwSA7Rg=
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com (10.165.82.13) by
 VI1PR05MB1776.eurprd05.prod.outlook.com (10.165.236.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1304.22; Thu, 3 Aug 2017 14:48:34 +0000
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::7443:520e:1c48:c518]) by AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::7443:520e:1c48:c518%17]) with mapi id 15.01.1304.025; Thu, 3 Aug 2017
 14:48:34 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: kbuild test robot <lkp@intel.com>
CC: "kbuild-all@01.org" <kbuild-all@01.org>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "jiri@resnulli.us" <jiri@resnulli.us>, "tklauser@distanz.ch"
 <tklauser@distanz.ch>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "mec@shout.net" <mec@shout.net>,
 "vadimp@maellanox.com" <vadimp@maellanox.com>, system-sw-low-level
 <system-sw-low-level@mellanox.com>, Jiri Pirko <jiri@mellanox.com>
Subject: RE: [PATCH] drivers: jtag: fix resource_size.cocci warnings
Thread-Topic: [PATCH] drivers: jtag: fix resource_size.cocci warnings
Thread-Index: AQHTDGXjESRqb5m4/Euij9nC+FyF4KJyteFQ
Date: Thu, 3 Aug 2017 14:48:34 +0000
Message-ID: <AM4PR0501MB21941B05C805BF53E94ECF03B1B10@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <201708032250.cmVljGeY%fengguang.wu@intel.com>
 <20170803143544.GA34229@lkp-ib03.lkp.intel.com>
In-Reply-To: <20170803143544.GA34229@lkp-ib03.lkp.intel.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB1776;
 6:uzCTOfFApKS770byYwFDX7rAqCJMjhG8MbwttjEd7zxB/8YjdylLiZv9pTnVl5si/JOK97lKU5Z5xUA8de8uqwJ9VifWACwHYGU+mFfSPsBN5RpAOxmu4Po+22jvSh1p3d/GC7yT5f21wXF3bZWcfz27gBLIHTuiDaasvHXU524ht7YKF52vnYAeCOuiWDWdzQaryNXc/QR6s+TeG6jCRkL9hqTGgVRPeb7t2ykANEcR0C6Dn7oEhqrpQ/942xDiCb0P3viRU4BFDW4V4qNhqWNr+6yCu0vfzQZDXYLvsBLbgQs6cc4f/JCRjvSHa8Zs1BusS9mlItGmr2M0XhPScQ==;
 5:jMliOfmJEbOl4zaMr2ftb4fv3vdCD6S8XOVvT3g8hnkNnx43YzXzVpW3s8uVrOSIrJ4BxzdYK+sIMwIbRuOrgFmK+5vLhL8thMOpDUFk7PWkcJK71LBDdRTcjnTwqbAYz7cGIovJ7vityv9Nf5aKug==;
 24:lsepULE7QidB5miVS2BgefSLfsdKfVPhOoyD2fhu8Dyw2oE26Qfw1OOxvpfm+0pm9rKHVlsFFCgkWS7EapRxIWVk/E5Aw94Unvc9npHFiTk=;
 7:S6DmA60SmHaQ9QZGDopLsGbxcXyzuoO06sDaK5LBt8mg3IcYFHPaBUfn2MvMwHaN/59WENKbj5j4QaXChwBSwIpPzIvZBBEceVBf17YvsvChlLtuMC/45HUsJX9+mtbGEpZTIVYTpyM8bDzdEfKY8BR4sZZ7rJf7UR6ZIduQ0ITTt9hq86cNLM77wjf9w+D5ugAxq7kZaH0SUq0CKDVl9RKIsgTYAyAP++AWpXflOdg=
x-ms-office365-filtering-correlation-id: 07471e88-61bd-4858-9fcd-08d4da7eb74b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:VI1PR05MB1776; 
x-ms-traffictypediagnostic: VI1PR05MB1776:
x-exchange-antispam-report-test: UriScan:(9452136761055)(65623756079841)(258649278758335)(228905959029699); 
x-microsoft-antispam-prvs: <VI1PR05MB177654C0ED967D182E103EACB1B10@VI1PR05MB1776.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(6055026)(6041248)(20161123564025)(20161123560025)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:VI1PR05MB1776; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:VI1PR05MB1776; 
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39850400002)(39840400002)(39400400002)(39410400002)(39860400002)(39450400003)(199003)(377454003)(189002)(13464003)(3660700001)(54356999)(76176999)(50986999)(4326008)(478600001)(101416001)(2950100002)(6916009)(6506006)(189998001)(97736004)(229853002)(81156014)(74316002)(81166006)(5660300001)(8936002)(68736007)(7416002)(7696004)(8676002)(106356001)(105586002)(33656002)(2906002)(2900100001)(6436002)(305945005)(3280700002)(86362001)(5250100002)(66066001)(575784001)(14454004)(99286003)(3846002)(9686003)(54906002)(7736002)(6246003)(102836003)(6116002)(53936002)(53546010)(55016002)(38730400002)(110136004)(107886003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB1776;
 H:AM4PR0501MB2194.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2017 14:48:34.0441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB1776
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
X-List-Received-Date: Thu, 03 Aug 2017 14:48:42 -0000

> -----Original Message-----
> From: kbuild test robot [mailto:lkp@intel.com]
> Sent: Thursday, August 3, 2017 5:36 PM
> To: Oleksandr Shamray <oleksandrs@mellanox.com>
> Cc: kbuild-all@01.org; gregkh@linuxfoundation.org; arnd@arndb.de; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; openbmc@lists.ozlabs.org; joel@jms.id.au;
> jiri@resnulli.us; tklauser@distanz.ch; linux-serial@vger.kernel.org;
> mec@shout.net; vadimp@maellanox.com; system-sw-low-level <system-sw-
> low-level@mellanox.com>; Oleksandr Shamray <oleksandrs@mellanox.com>;
> Jiri Pirko <jiri@mellanox.com>
> Subject: [PATCH] drivers: jtag: fix resource_size.cocci warnings
>=20
> drivers/jtag/jtag-aspeed.c:724:37-40: ERROR: Missing resource_size with r=
es
>=20
>=20
>  Use resource_size function on resource object  instead of explicit compu=
tation.
>=20
> Generated by: scripts/coccinelle/api/resource_size.cocci
>=20
> Fixes: acf0c42bb646 ("drivers: jtag: Add Aspeed SoC 24xx and 25xx familie=
s
> JTAG master driver")
> CC: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>

Acked-by: Oleksandr Shamray <oleksandrs@mellanox.com>

> ---
>=20
>  jtag-aspeed.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> --- a/drivers/jtag/jtag-aspeed.c
> +++ b/drivers/jtag/jtag-aspeed.c
> @@ -721,7 +721,7 @@ int aspeed_jtag_init(struct platform_dev
>  	return 0;
>=20
>  out_region:
> -	release_mem_region(res->start, res->end - res->start + 1);
> +	release_mem_region(res->start, resource_size(res));
>  	return err;
>  }
>=20
