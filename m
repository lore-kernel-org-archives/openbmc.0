Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.4.42; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="qPqP9uUq";
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40042.outbound.protection.outlook.com [40.107.4.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zJ8Cx2MvmzDqFl
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jan 2018 04:01:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eDa45LnaUOO6XQIwKkZSkBgGpswr3OMPYAmBolXUu9c=;
 b=qPqP9uUq80DrX/9s0Rjwh24ol2EUFWEgVdPMGd1uy7x63nwSvLUmf/ToZWniORugw/pS7FDjf1vs+Dpm2Afm/jo1igiQhfLW+O7IAY/0q0Q3nfN23aJpupyB0GZeFwEa+948Mprfkbo+uCxP/7aTXv+v8xDs+V1EkTr8hwolYUQ=
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com (10.165.82.13) by
 AM4PR0501MB2724.eurprd05.prod.outlook.com (10.172.215.149) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.407.7; Fri, 12
 Jan 2018 17:01:27 +0000
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::bca2:72f5:8623:b9b6]) by AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::bca2:72f5:8623:b9b6%18]) with mapi id 15.20.0386.005; Fri, 12 Jan
 2018 17:01:27 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: Oleksandr Shamray <oleksandrs@mellanox.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "arnd@arndb.de" <arnd@arndb.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "jiri@resnulli.us" <jiri@resnulli.us>, "tklauser@distanz.ch"
 <tklauser@distanz.ch>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, Vadim Pasternak <vadimp@mellanox.com>,
 system-sw-low-level <system-sw-low-level@mellanox.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
 "mchehab@kernel.org" <mchehab@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: RE: [patch v16 1/4] Linux 4.15-rc6
Thread-Topic: [patch v16 1/4] Linux 4.15-rc6
Thread-Index: AQHTi8ZIBzmK801CkUyVYfdy2HfhJ6Nwdjqw
Date: Fri, 12 Jan 2018 17:01:27 +0000
Message-ID: <AM4PR0501MB219429B8B04B4246818D3CD7B1170@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <1515776101-25482-1-git-send-email-oleksandrs@mellanox.com>
 <1515776101-25482-2-git-send-email-oleksandrs@mellanox.com>
In-Reply-To: <1515776101-25482-2-git-send-email-oleksandrs@mellanox.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [79.135.198.29]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM4PR0501MB2724;
 7:+b6Bnoqj28qLcVvHNIrs7KvaRM//B1osOec2wfPTYb7A4AZUQkv+IRDh+YjYMV7fcKjsSZH3Rkuv6b2VOBX4uXy6E+yQgf1y/uHAjYQkEewqT2i6VCdk5ifqgiFAqs/ZQtfRMerDUeS+mpED/BFYEG+P6Qiz4xIUCzGnxBh5+TIHS8h57JLwOBcjHmx4jNihD/XBCKTFqMNGVpsRM27nzCe8OjoMfbd1pJaRXdhQvBeHbZ9s1qKcjkOPxUiI38KA
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cf0281a5-ec20-42f8-91e2-08d559de1e7f
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020084)(4652020)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
 SRVR:AM4PR0501MB2724; 
x-ms-traffictypediagnostic: AM4PR0501MB2724:
x-microsoft-antispam-prvs: <AM4PR0501MB2724461D0CE1E533A19923A7B1170@AM4PR0501MB2724.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(143289334528602)(9452136761055)(65623756079841)(258649278758335)(42262312472803);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040470)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231023)(944501145)(10201501046)(3002001)(6055026)(6041268)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
 SRVR:AM4PR0501MB2724; BCL:0; PCL:0; RULEID:(100000803101)(100110400095);
 SRVR:AM4PR0501MB2724; 
x-forefront-prvs: 0550778858
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(39380400002)(39860400002)(376002)(346002)(189003)(13464003)(199004)(229853002)(6246003)(55016002)(76176011)(9686003)(6346003)(86362001)(99286004)(5250100002)(53936002)(5660300001)(478600001)(6116002)(3846002)(6436002)(14454004)(7416002)(53546011)(7696005)(4326008)(66066001)(2201001)(97736004)(6506007)(68736007)(8676002)(110136005)(54906003)(81166006)(81156014)(7736002)(33656002)(305945005)(25786009)(3660700001)(106356001)(2900100001)(8936002)(2501003)(105586002)(2950100002)(102836004)(316002)(3280700002)(2906002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0501MB2724;
 H:AM4PR0501MB2194.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-microsoft-antispam-message-info: eXpS3ZqGBM9OwbMzHFo60qW5bIN7eaiJY5/UMU3Sa+tH2GiWKitPgVkp2E0NI8U+MMGRD5rK+6AnTp0gSaut5A==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0281a5-ec20-42f8-91e2-08d559de1e7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2018 17:01:27.1300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0501MB2724
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
X-List-Received-Date: Fri, 12 Jan 2018 17:01:34 -0000

do not pay attention about this.

Best Regards,
Oleksandr Shamray

> -----Original Message-----
> From: Oleksandr Shamray [mailto:oleksandrs@mellanox.com]
> Sent: 12 =D1=CE=D7=C1=D2=D1 2018 =C7. 18:55
> To: gregkh@linuxfoundation.org; arnd@arndb.de
> Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; openbmc@lists.ozlabs.org; joel@jms.id.au;
> jiri@resnulli.us; tklauser@distanz.ch; linux-serial@vger.kernel.org; Vadi=
m
> Pasternak <vadimp@mellanox.com>; system-sw-low-level <system-sw-low-
> level@mellanox.com>; robh+dt@kernel.org; openocd-devel-
> owner@lists.sourceforge.net; linux-api@vger.kernel.org;
> davem@davemloft.net; mchehab@kernel.org; Linus Torvalds
> <torvalds@linux-foundation.org>
> Subject: [patch v16 1/4] Linux 4.15-rc6
>=20
> From: Linus Torvalds <torvalds@linux-foundation.org>
>=20
> ---
>  Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 92b74bc..eb1f597 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2,7 +2,7 @@
>  VERSION =3D 4
>  PATCHLEVEL =3D 15
>  SUBLEVEL =3D 0
> -EXTRAVERSION =3D -rc5
> +EXTRAVERSION =3D -rc6
>  NAME =3D Fearless Coyote
>=20
>  # *DOCUMENTATION*
> --
> 1.7.1
