Return-Path: <fabrizio.castro@bp.renesas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bp.renesas.com
 (client-ip=40.107.140.91; helo=jpn01-ty1-obe.outbound.protection.outlook.com;
 envelope-from=fabrizio.castro@bp.renesas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bp.renesas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=renesasgroup.onmicrosoft.com
 header.i=@renesasgroup.onmicrosoft.com header.b="wGq9IHbQ"; 
 dkim-atps=neutral
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400091.outbound.protection.outlook.com [40.107.140.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CcPl2bKlzDq5x
 for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2019 21:55:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WzTnV/AP2xryydISl46YElgNNb1lLBls+cnaLq84B0=;
 b=wGq9IHbQKOp7ADstsidTZ3j0dYEt1J+HLIvfDytkVJKt7Dh2cUEoEaHif31BzAuXiShFwzfJtLkAm+35cwrJgPLG+0Jl6rlTqazPNeQALGu7QovnkGI7VjUY9mxxHevZ66ONmINCf2BgMhW49t37r/otXvFkt0Y2J3wMj1IRO0c=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1707.jpnprd01.prod.outlook.com (52.133.160.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.15; Mon, 4 Mar 2019 10:55:28 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273%4]) with mapi id 15.20.1665.019; Mon, 4 Mar 2019
 10:55:28 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven
 <geert@linux-m68k.org>
CC: Wen Yang <wen.yang99@zte.com.cn>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Russell King <linux@armlinux.org.uk>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, "linux-samsung-soc@vger.kernel.org"
 <linux-samsung-soc@vger.kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 =?iso-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, "open list:ARM/Rockchip SoC..."
 <linux-rockchip@lists.infradead.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij
 <linus.walleij@linaro.org>, "avifishman70@gmail.com"
 <avifishman70@gmail.com>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "venture@google.com" <venture@google.com>, "yuenn@google.com"
 <yuenn@google.com>, "brendanhiggins@google.com" <brendanhiggins@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Wei Xu
 <xuwei5@hisilicon.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu
 Tsai <wens@csie.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will.deacon@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio
 Estevam <fabio.estevam@nxp.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "wang.yi59@zte.com.cn" <wang.yi59@zte.com.cn>
Subject: RE: [PATCH 08/15] ARM: shmobile: fix a leaked reference by
 addingmissing of_node_put
Thread-Topic: [PATCH 08/15] ARM: shmobile: fix a leaked reference by
 addingmissing of_node_put
Thread-Index: AQHU0AzNbKz7yrFVwkeI8MRN0xB8OKX2iJOAgATAMwCAAAg4cA==
Date: Mon, 4 Mar 2019 10:55:27 +0000
Message-ID: <TY1PR01MB17701D48CA7E650507C2E010C0710@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551430616-42014-1-git-send-email-wen.yang99@zte.com.cn>
 <1551430616-42014-8-git-send-email-wen.yang99@zte.com.cn>
 <CAMuHMdWrY0UNhCA7a8oHVfdVNXaB=15qFuWqvuU9OZpf7-ecmg@mail.gmail.com>
 <20190304102423.bipib6frc6ma2ltv@verge.net.au>
In-Reply-To: <20190304102423.bipib6frc6ma2ltv@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7cf551b-ec5a-4428-8990-08d6a08fe9b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:TY1PR01MB1707; 
x-ms-traffictypediagnostic: TY1PR01MB1707:
x-microsoft-exchange-diagnostics: 1; TY1PR01MB1707;
 20:i7W2Bn5cw1MvSBLyG/kxuN9Q24rz0cgObwyz80s/NXh+PKxBtxZ4lVYSE6qeYDX092lJWckyZ4ipAgxIm6pbEwKpHqjkd8ZI2hA8iblUzBNjLvQcy1njh58z//UWmvGu8Vl2Y2GQJ00qIxk9OJPQRcvnWno5ULe5KkNC0AgEs7s=
x-microsoft-antispam-prvs: <TY1PR01MB1707620B53918462B1D48346C0710@TY1PR01MB1707.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09669DB681
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(7416002)(7406005)(97736004)(102836004)(26005)(9686003)(14454004)(8936002)(44832011)(186003)(66066001)(25786009)(74316002)(4326008)(256004)(71190400001)(71200400001)(2906002)(446003)(99286004)(11346002)(7696005)(476003)(305945005)(76176011)(106356001)(105586002)(6246003)(81166006)(8676002)(81156014)(486006)(7736002)(3846002)(55016002)(6116002)(478600001)(53936002)(53546011)(86362001)(54906003)(6506007)(52536013)(93886005)(229853002)(68736007)(33656002)(5660300002)(110136005)(6436002)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1707;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: v2WEl6k5ARi4C2ibwD6af0P8sgYnHbU9SIcwlFlXRaLd5IANpR9VljQCvRvf4SXIswEkqJRM3ITgc3Ke36NaiYOahsNMwB/Xt6D0EI9VfwzfqXRz3HeBhOuVXKA9003ilxmmX3LePt+Z+eOltdoaLTYVXkqR3iuE86TUsutJi9cZb5/gJ2RjQgw9ErEh2Fm87kFzZ5ticVXwYf3T0DX9mZw39/w48IDAxZO9PpbuFW6vTxotb20dmJ89pLX6wyCF4f6QgFFJfmcDcCuG/txkKDSjlU4gOz9NZ6+5G2EQrZbGmOGp1NzrKQtYcV+SYL4XkfHRI6jYUc5IxHHAwh5PNYPTjS2MUdoNmpBpbYnm0zsYTrbN67/1GmRA63v79Az7XhurbUBQkal1Ir3s30405JECPeDyRt9gCOBJYw5Syvg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7cf551b-ec5a-4428-8990-08d6a08fe9b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2019 10:55:27.5845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1707
X-Mailman-Approved-At: Tue, 05 Mar 2019 12:27:30 +1100
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
X-List-Received-Date: Mon, 04 Mar 2019 10:55:40 -0000

Hello Simon,

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vg=
er.kernel.org> On Behalf Of Simon Horman
> Sent: 04 March 2019 10:24
> Subject: Re: [PATCH 08/15] ARM: shmobile: fix a leaked reference by addin=
gmissing of_node_put
>=20
> On Fri, Mar 01, 2019 at 10:51:27AM +0100, Geert Uytterhoeven wrote:
> > On Fri, Mar 1, 2019 at 9:57 AM Wen Yang <wen.yang99@zte.com.cn> wrote:
> > > The call to of_get_next_child returns a node pointer with refcount
> > > incremented thus it must be explicitly decremented after the last
> > > usage.
> > >
> > > Detected by coccinelle with the following warnings:
> > > ./arch/arm/mach-shmobile/pm-rcar-gen2.c:77:2-8: ERROR: missing of_nod=
e_put; acquired a node pointer with refcount
> incremented on line 66, but without a corresponding object release within=
 this function.
> > > ./arch/arm/mach-shmobile/pm-rcar-gen2.c:85:2-8: ERROR: missing of_nod=
e_put; acquired a node pointer with refcount
> incremented on line 66, but without a corresponding object release within=
 this function.
> > > ./arch/arm/mach-shmobile/pm-rcar-gen2.c:90:2-8: ERROR: missing of_nod=
e_put; acquired a node pointer with refcount
> incremented on line 66, but without a corresponding object release within=
 this function.
> > >
> > > Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Thanks, applied for v5.2.

I am sorry for commenting on this just a moment after you took the patch, I=
 guess there is a space missing in the title s/addingmissing/adding missing=
/ ? Is that still fixable?

Thanks,
Fab
