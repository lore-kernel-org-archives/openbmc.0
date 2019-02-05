Return-Path: <Supreeth.Venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=40.107.13.57; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.b="J+NhDe6J"; dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130057.outbound.protection.outlook.com [40.107.13.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43vG4q3gdszDqML
 for <openbmc@lists.ozlabs.org>; Wed,  6 Feb 2019 07:14:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8LYomKi6/Tyfe32GeYGF/MWWMOt0pzXke6606Ygd4k=;
 b=J+NhDe6J6X3jejOdoTNQdx3cVhsyh8IyFQyJG5cjuW/mYQdkvQaFDKF6UOWqSLXZJYWgVSODSZUXGLq+IOM6RLdoK76nChOOzwujbLk561BPmN7NzF9Be7NHik4LziBgLZ6LkdpZ3gsgfWXxAMd3f8z8RBN0fe9S1Rcwdb+73bg=
Received: from AM4PR08MB2788.eurprd08.prod.outlook.com (10.171.191.18) by
 AM4PR08MB0850.eurprd08.prod.outlook.com (10.164.83.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Tue, 5 Feb 2019 20:14:11 +0000
Received: from AM4PR08MB2788.eurprd08.prod.outlook.com
 ([fe80::f8f8:9441:9bdf:a4b9]) by AM4PR08MB2788.eurprd08.prod.outlook.com
 ([fe80::f8f8:9441:9bdf:a4b9%4]) with mapi id 15.20.1580.019; Tue, 5 Feb 2019
 20:14:11 +0000
From: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
CC: Daniil Egranov <Daniil.Egranov@arm.com>, Dong Wei <Dong.Wei@arm.com>
Subject: RE: Secure boot for BMC
Thread-Topic: Secure boot for BMC
Thread-Index: AQHUvV0IW4Ejfk+cFEKOmrTsUhtfaKXRo0Nw
Date: Tue, 5 Feb 2019 20:14:11 +0000
Message-ID: <AM4PR08MB27880C2FE1350242F092CAA5806E0@AM4PR08MB2788.eurprd08.prod.outlook.com>
References: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
In-Reply-To: <20190205141403.y2yno3nmxvwgd6ex@thinkpad>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Supreeth.Venkatesh@arm.com; 
x-originating-ip: [2600:1700:8c61:400:a49f:d08d:ee4a:615c]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM4PR08MB0850;
 6:/iOP6g92Ywar5YEjGhIcpciKKi40Q+Cm14Ou4tFCcvzkUhDqOcxZDSebjHn2A9dt+86ASD/ixq0qBBCUe8Kr0d92b4sG5AbQJ6FmSikhFPkA7c9nSRxC9rPKMIFeqA3d/19eWLitHJZuXvSedXjQYRjqUOO0ePBBqEDjJjm8VtNJxJ3XAamYZH7IFMWK1OJV/PQHd0MZ7ith/IB840IyDA3dURnODj435zSYkjjS7R+Y3U8PiCqxFLSe35rumMX2V9WNz/3WVX7joY5bIzR9KDH63vXeW1QdKWMTBzcpzIalrCvrYa1lAJiom+uD/f/9NHi6DOkJIuEHMi/Smm6HXisXO0PBQojqo/+87xr90HF+UCIq51UolvuguGMN/fB0lodBiVlTRcGBN8+HEFKZMCNjfU1cVi4CLicWpiCUH5w28qxqb9CSU61FaXrRI3yCztNHFSVNGqQmQ44QQPJHHQ==;
 5:cPcSDCCh9OA76S/EeXIb61rvn5D0p4RVcBoZLtXek5H39c8hzrIkK5QMpR/G4Z+zN5sIKXplMsr3jf5r8GlDffAKHFOY5/IRwS9aVjJ69JK5/erohJHBz2h9KOBkx24FaM/rAKk1gZ/SeeN1XTGF1oMZmnfhSB2xtFetNyDbZqpOWIVVjaVZmLtmJ5YAXkZ0bahRqW6g+4MqpSg0GN9fbA==;
 7:StMQv+jjJg/NTrlAzZmG9a69k86nCgiFy+ugN5MZjivrwY7/BtTiC+SyE0THMhd/Ap/4XuyBgaxTHgctb/YdNpzgHcqieAnAEpRjuBVCoSutftb6gvY8F0ohTMaLOfaVl6Fty0WaXMAWDhmgnMxK3g==
x-ms-office365-filtering-correlation-id: bc4c2651-899e-4a9b-1b36-08d68ba67e46
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:AM4PR08MB0850; 
x-ms-traffictypediagnostic: AM4PR08MB0850:
x-microsoft-antispam-prvs: <AM4PR08MB08503463A7BDCFDCB52FDB06806E0@AM4PR08MB0850.eurprd08.prod.outlook.com>
x-forefront-prvs: 0939529DE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(376002)(346002)(396003)(39860400002)(40434004)(13464003)(199004)(189003)(53754006)(6116002)(99286004)(2906002)(71190400001)(14454004)(478600001)(68736007)(53546011)(6506007)(72206003)(4326008)(3480700005)(6246003)(53936002)(2501003)(74316002)(446003)(476003)(86362001)(97736004)(186003)(102836004)(71200400001)(11346002)(9686003)(4744005)(486006)(46003)(5024004)(33656002)(81156014)(81166006)(14444005)(229853002)(256004)(305945005)(316002)(105586002)(106356001)(7736002)(55016002)(8936002)(25786009)(76176011)(7696005)(6436002)(54906003)(110136005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR08MB0850;
 H:AM4PR08MB2788.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TfE6ksStgFk2Ud0gL6zPTp5vlLNRPXJUndrD3ST0d8h/LJBVSJaiJ0un8vHuFzE8/6/19vNiGYWFzbCLmJA3ONRmiZjLg6nq1zof8EU/Q0tGJwB206z30kdIXgASgY3zvIeBVzhkR9qqySFKGsP+FOpQ06NNS//vUZB6ZRe0mCKMMsCozL5KvEoRUUgCrLvd2ZZUZxC40v+72KzyOL1R/6V5LykRuErLjNJ2HlAWwhCE1xwrQlC1G6UB3x0k/m0mrwUvnfNlSAbu5810AemkMnHTCwt81la965tXFDYeRmqp1/d2Rc4e1OXrsfFLQS2RgCFZPt2ZX2zwWi7HVg96v6lDnz1OM761Hmcqb2/PDM/atA4QqLjZe/0mQRvRxgwHL7vXPu8T5Zqer9GFqABeUGtadYYyOHD7m/2Vc+xpOKY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4c2651-899e-4a9b-1b36-08d68ba67e46
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2019 20:14:11.7868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB0850
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
X-List-Received-Date: Tue, 05 Feb 2019 20:14:21 -0000

Brad,

We (Daniil and me from Arm) are happy to collaborate on Secure BMC Boot Des=
ign/Implementation.

Thanks,
Supreeth

-----Original Message-----
From: openbmc <openbmc-bounces+supreeth.venkatesh=3Darm.com@lists.ozlabs.or=
g> On Behalf Of Brad Bishop
Sent: Tuesday, February 5, 2019 8:14 AM
To: openbmc@lists.ozlabs.org
Subject: Secure boot for BMC

Hi everyone

Does anyone have plans to provide a secure BMC boot implementation to OpenB=
MC in the 2.7 or 2.8 timeframe?  Just trying to get a feel for who all want=
s to collaborate on this before I submit a design template.

thx - brad
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
