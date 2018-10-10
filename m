Return-Path: <Feng_Xie2@jabil.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=jabil.com
 (client-ip=104.47.32.110; helo=nam01-sn1-obe.outbound.protection.outlook.com;
 envelope-from=feng_xie2@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jabil.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.onmicrosoft.com header.i=@jabil.onmicrosoft.com
 header.b="aBteRLkk"; dkim-atps=neutral
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam01on0110.outbound.protection.outlook.com [104.47.32.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Vl7Z739yzF0yy
 for <openbmc@lists.ozlabs.org>; Thu, 11 Oct 2018 06:50:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.onmicrosoft.com; 
 s=selector1-jabil-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ar696rwJ8GAYlLTHE4B1El7dH4fb0oKy/Ho1HvA6P7k=;
 b=aBteRLkk5GfGqhkBHjHQ6ayGen0Kf2SEZHCrHSL9Ea9OpUIAx8iaF8wPQkKdA4DiE73hFdHX6Emqbgpci9ZYGbrLPtqpoy/6glyMBTpDkjXBWFZimzfXBoFaBx4MnWzMNiiKhzQGpvPpYZeJqDl0Hanx/GHhfNYqSbQ+QX/wXA8=
Received: from BN7PR02MB5300.namprd02.prod.outlook.com (20.176.176.214) by
 BN7PR02MB5234.namprd02.prod.outlook.com (20.176.176.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1207.21; Wed, 10 Oct 2018 19:50:11 +0000
Received: from BN7PR02MB5300.namprd02.prod.outlook.com
 ([fe80::4184:bbd8:7834:d92f]) by BN7PR02MB5300.namprd02.prod.outlook.com
 ([fe80::4184:bbd8:7834:d92f%3]) with mapi id 15.20.1228.020; Wed, 10 Oct 2018
 19:50:11 +0000
From: Feng Xie <Feng_Xie2@jabil.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
CC: Feng Xie <Feng_Xie2@jabil.com>
Subject: Off-the-shelf platforms for OpenBMC
Thread-Topic: Off-the-shelf platforms for OpenBMC
Thread-Index: AdRg0ObE3zsdoTvLQp6nMG7+o8hlVg==
Date: Wed, 10 Oct 2018 19:50:11 +0000
Message-ID: <BN7PR02MB5300DFB69593AA2DFACE8CBFCAE00@BN7PR02MB5300.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcZnhpZVxhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLWJlNDE1MTg1LWNjYzUtMTFlOC04NWNkLTE4NWUwZmU1ZTcyY1xhbWUtdGVzdFxiZTQxNTE4Ny1jY2M1LTExZTgtODVjZC0xODVlMGZlNWU3MmNib2R5LnR4dCIgc3o9IjI1OCIgdD0iMTMxODM2NzQ2MzE3OTU1ODk3IiBoPSJSVnlXR0NON0hOc3NNMnJyZmU0RkVoRWRYV1U9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Feng_Xie2@jabil.com; 
x-originating-ip: [184.185.47.46]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN7PR02MB5234;
 20:NuTyyATKEvUhBct9sLq89qIEqYusRg44ufibNSy/89e0sYaaGs5wh01EyUU0JQ+e/yxW/P7dASlRfKx7ZZqVkNPBCNmrS/gduq6OHtkTYKzYhhM2y8Oy/JSX3qSPT7FnyedOYDw3FMkS0vKib7TCrItSsBw/TclOcay6ipsBeEs=
x-ms-office365-filtering-correlation-id: 956be801-86d9-4e3d-f0dc-08d62ee99730
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:BN7PR02MB5234; 
x-ms-traffictypediagnostic: BN7PR02MB5234:
x-microsoft-antispam-prvs: <BN7PR02MB52341390341535AF656F3C53CAE00@BN7PR02MB5234.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231355)(944501410)(52105095)(93006095)(93001095)(10201501046)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991055);
 SRVR:BN7PR02MB5234; BCL:0; PCL:0; RULEID:; SRVR:BN7PR02MB5234; 
x-forefront-prvs: 08213D42D3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(51874003)(33656002)(25786009)(66066001)(81166006)(6116002)(3846002)(74316002)(81156014)(106356001)(476003)(107886003)(7736002)(105586002)(305945005)(8936002)(53936002)(26005)(6916009)(9686003)(55016002)(186003)(102836004)(8676002)(316002)(5250100002)(256004)(72206003)(558084003)(2906002)(86362001)(71190400001)(478600001)(71200400001)(2900100001)(7696005)(68736007)(5660300001)(6506007)(97736004)(14454004)(6436002)(4326008)(99286004)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN7PR02MB5234;
 H:BN7PR02MB5300.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: jabil.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: NNR4i1og3xBCCmYIKvjup2P9L1V8fFOO/rK6af+xttTQ/NMoalcPQcEDK3oDNVb044bc6xIoKC01h2+cKQdaJv9crcFlGtxdd7R2A3kIqBE7/lAr0VUEE8FD6mMbmZpQY7x53BAwAvZvzD60VZz90op+9gKmrz4bM3+K/zM3/X7XtcEHUqMaKREj7F9gHckGYmhoOiAywRhUqzVp0hbCU0XVZKT3jYpqbYr5SJFxxIxbSwbLs42Vy7VkFp5x6iCFPvsNEKV4zdBrooAZakxRH9L1EBd5F78r1pR16zQOr3GCElTjs+DvyQPUnDffwRCxGhsHkAKWCSluVhsHOhIlFVwoewpULfDEErW2nGXsRgw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956be801-86d9-4e3d-f0dc-08d62ee99730
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2018 19:50:11.8018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5234
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
X-List-Received-Date: Wed, 10 Oct 2018 19:50:20 -0000

Hi,

      I am new to OpenBMC. I want to try OpenBMC on some off-the-shelf hard=
ware platforms. Can anybody recommend some products (with development toolk=
its)? Thanks in advance!

Feng =20
