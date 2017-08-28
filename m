Return-Path: <c_mykolak@mellanox.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0075.outbound.protection.outlook.com [104.47.2.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgwcS0T0SzDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 01:27:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="M1+ON7Z1";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5FAkDLtJX9dEAd3QozLggS73L2U932Jr50NaXG/H+xg=;
 b=M1+ON7Z1RrMQYc/5i6i0w3fjSSFSfqFS3ILTVV++Z7lXy9YvXsdEo3DXrfIsjwtWsHcII7Ylx6XWEmaeIDGUEUIrijzeIY+gl12qH6766/6EowjoDHjloCIVsIXf1DmROcbW528YO2tVwSQUJkucmTAog9H9JPh1dDQybzBPzMs=
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com (10.161.245.11) by
 DB5PR05MB1848.eurprd05.prod.outlook.com (10.166.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1385.9; Mon, 28 Aug 2017 15:27:13 +0000
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::e96a:76a1:8f05:384e]) by DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::e96a:76a1:8f05:384e%18]) with mapi id 15.01.1385.013; Mon, 28 Aug
 2017 15:27:13 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Mellanox ipmi daemon discussion
Thread-Topic: Mellanox ipmi daemon discussion
Thread-Index: AdMgEhQatmPGhqKFRnqY7Yj+iiQazw==
Date: Mon, 28 Aug 2017 15:27:13 +0000
Message-ID: <DB5PR05MB1224502182F8C6EAF62E17C9EF9E0@DB5PR05MB1224.eurprd05.prod.outlook.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=c_mykolak@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR05MB1848;
 6:ATc1pU/SoPZZoAU/vXJkdVb059x1qfEv5MQ48W7oZi6N5IRLmgZUiu0lqI7DanTLYbl/8GQmLnzgClaUVX5oGDX2HeBrCzXzUZPqy4u/yyR+uRY9auYTcQXPTVmnyZTm0q7W/dNmBClZQS3vey78UqJObPPDVU6I/GdRdANCfq43dZnjvWXINqOc2JXIRX56hwiPFcDgv7wvhhVkckrySkmR2XlJbZw+nj+9kx21jlNaehG1/eUfNHECHiK7MKnLNxso3lPmyLKUrZ0NuyEVtd5I6KAZhAa5a7WIGfrWpAo7ZoVOKZ2ubCzEaBKfXo+HQMAOb0GESttKkjP7qvrZ4g==;
 5:GwJkltgiUG3bK+TzjtvwoavxDnRlxAzPS+rd+kHBVRw4dpAPemGuwQVpW+Iqe7wxlguTbaT5Mj5IJgM+ijMnRUWaFgvJ6fHMjkmbklPfKBzmjXpU1p0ZRJarhUcxvxvFjLmddOa/rYsG8HfTk/sPdQ==;
 24:aU8yIyNke9t3L5rPd6umyUwQCJGITi83oYBxjIcrR/nEHSsxBFc85LVgHrXAVHdGl2+kzfMoXy1i3342du50w+tW7dmfUXRQW8th1gcvuY8=;
 7:5pPKdvStrE0aIheipaF6GOPRAG5y5ZZ7uR7FSYVRgrcpt04rNbm23rpuv3ePDsxFgTg8s+5Lo4RSThs8pe9s/EL8aJJ9h2C0L8CJ6yhMjlG2JpgTI2SagInkY9yeJuO93HtvupKp8iCXJvGEywvzeH1eoP0hPIW+2CfId2kv/7wD9R7kfzh04ceCGKbIcxaNTxG2WMQIAB/l97Sy/2mSn9BLnPlx6HS6bJkK16LQm9s=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 3dd7c2e4-cbb5-4850-60fa-08d4ee29421b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:DB5PR05MB1848; 
x-ms-traffictypediagnostic: DB5PR05MB1848:
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <DB5PR05MB1848201EFC13BAF387764464EF9E0@DB5PR05MB1848.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(3002001)(6055026)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123560025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:DB5PR05MB1848; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:DB5PR05MB1848; 
x-forefront-prvs: 0413C9F1ED
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39860400002)(189002)(199003)(966005)(110136004)(97736004)(3280700002)(7696004)(25786009)(3660700001)(7736002)(99286003)(45080400002)(6916009)(3480700004)(66066001)(8656003)(86362001)(8936002)(81156014)(81166006)(8676002)(6306002)(9686003)(2900100001)(74316002)(5660300001)(50986999)(102836003)(54356999)(105586002)(101416001)(14454004)(6436002)(55016002)(106356001)(68736007)(6506006)(33656002)(2906002)(5250100002)(3846002)(305945005)(478600001)(4326008)(189998001)(6116002)(53936002)(36250200005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR05MB1848;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2017 15:27:13.5461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR05MB1848
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
X-List-Received-Date: Mon, 28 Aug 2017 15:27:22 -0000

Hi,

We'd like to add Mellanox ipmi daemon recipe to mellanox msn platform. It's=
 based on openipmi project.
Code review: https://gerrit.openbmc-project.xyz/#/c/5694/.

We added some hooks in openipmi code and also our specific module.=20
We use it for SoL, SEL, serial console redirection, console switching betwe=
en the host and BMC, PET/PEF, LAN related commands, time setting,, and also=
 a lot of OEM commands for LED, FAN control, reset signals, reset causes, B=
T connection with CPU, etc.
It doesn't use DBUS interface.

We are planning transition to OpenBMC ipmi demon, after we are done with al=
l kernel related patches. Our plan is to start transition in the following =
order SoL, SDR, SEL, LAN, LED and so on.
At his moment we'd like to have functional image, which can be built from O=
penBMC with no any patches.
We also have one customer and it's important for us to have a functional im=
age, which he can build by himself.

Reviewers welcome.

Best regards. Mykola Kostenok.
