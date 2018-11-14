Return-Path: <Supreeth.Venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=40.107.4.49; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.b="rxawE1/F"; dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40049.outbound.protection.outlook.com [40.107.4.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42w8gj3vg5zF3Xw
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 03:13:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sa7hMWW71fZD4oqJYrJVtmQmRjSXDmlKHcwfzrVhxxk=;
 b=rxawE1/FPg+OMnz55S3iTDqIW+v9mqimcoFWxMTvSr3jP86y6YnHfJHjt+pPQ8vMkxuN5q1bWUBUFIuLPHdTOW/FmAbfAMfjMp5Kxvnqly14uIJUnROANFc0P7J+VVx0H9XVwahhjjifSSgc7juQJCKTfC6Vgsicz5vTqzVWDV4=
Received: from AM4PR08MB2788.eurprd08.prod.outlook.com (10.171.191.18) by
 AM4PR08MB2660.eurprd08.prod.outlook.com (10.171.190.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.26; Wed, 14 Nov 2018 16:13:44 +0000
Received: from AM4PR08MB2788.eurprd08.prod.outlook.com
 ([fe80::5cb7:eb15:2e30:f981]) by AM4PR08MB2788.eurprd08.prod.outlook.com
 ([fe80::5cb7:eb15:2e30:f981%4]) with mapi id 15.20.1294.045; Wed, 14 Nov 2018
 16:13:44 +0000
From: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
To: Jeremy Kerr <jk@ozlabs.org>, David Thompson <dthompson@mellanox.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Dong Wei <Dong.Wei@arm.com>
Subject: RE: MCTP protocol support in OpenBMC?
Thread-Topic: MCTP protocol support in OpenBMC?
Thread-Index: AQHUfCJoZ2bFOUp/A0K9OmK5coEMtqVPcbPg
Date: Wed, 14 Nov 2018 16:13:44 +0000
Message-ID: <AM4PR08MB2788ACA6457591EF7862078880C30@AM4PR08MB2788.eurprd08.prod.outlook.com>
References: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
 <799b6a6f-992c-200e-c42c-35d469f696b9@ozlabs.org>
In-Reply-To: <799b6a6f-992c-200e-c42c-35d469f696b9@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Supreeth.Venkatesh@arm.com; 
x-originating-ip: [99.185.131.209]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM4PR08MB2660;
 6:X24T/OTfnflUSmsGbDMSp9ytmiOTPyfDADcwNF0EbwhLbZdn1HhOA7uFRAdtEjzdHFbh8zvCrowvAB/Z0mcsjyn5ciKwDT37q4v8WqDAo1RsZZ4bNglHSE/Ostv+Vm+q3xAymTlX2KwJ8RTi+85Bg9gETkYkRi7x2dyWKdJjxLp5PqN6ue55+Rrr+L2xaJaomCn9JLvVH+Gt9baohtc6Bd8joe0x8gPY/DqF1hAZR8zMtU+2Qh7KTlW+Fc5RWnC4cSotK05nvFThEuc42bKqLTwqa+wZ/RYmXD6/hUTn7Qqo4MPkcM/u5U0yvx2j4ShVKaMaLFmqxli1++W5m2ONJiwtFTS5TgRKeu35Es87t+xApOqNxUhLo1vRf5ZRzAvDBlZK6Q8qXmzcFBCZ/9Amk2NWhZbbWZM+swWeqbmHfjfN5Z1jD8Q5+XbtKnHAc/qV0iCJG4qxZ6o5OQd4wZKjRA==;
 5:N8ejIdHryE2zysP78MsNgJodM+HkTgItVgLh+SDmEqjdKcxxBe+BBei0VMDMjX2Gpa7g7lexefE4G27QrUIIE82SiqukXidcO1MhQqCFZfv/4kwabjwJLKLDfazjpAysMBBE7xY64NmiaGWf46UgA9C5947sMM8c9sStPpZ2pII=;
 7:DvSSGDZJjVO8Y3OHvY2mWMf+0npMlGfZl+PyaG6LMmBXqOIPLgvK5MfFRDaQjbny7zHvfBw5trIeO9R7BJR9vULCOGxe9GS3K61SU33ILSlFAYFJbexEpSoNx4FUX5aLgpWv50gOcSpak7UNa4XpLA==
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: da5082f5-905f-477d-c378-08d64a4c2672
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:AM4PR08MB2660; 
x-ms-traffictypediagnostic: AM4PR08MB2660:
x-microsoft-antispam-prvs: <AM4PR08MB26609466923212ABAC122B7280C30@AM4PR08MB2660.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(65623756079841);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231382)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:AM4PR08MB2660; BCL:0; PCL:0; RULEID:; SRVR:AM4PR08MB2660; 
x-forefront-prvs: 085634EFF4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(396003)(376002)(346002)(136003)(13464003)(40434004)(189003)(199004)(74316002)(7736002)(68736007)(256004)(5024004)(53546011)(5660300001)(186003)(14444005)(305945005)(66066001)(6246003)(26005)(53936002)(102836004)(6436002)(71200400001)(71190400001)(8936002)(446003)(476003)(6116002)(3846002)(9686003)(110136005)(6506007)(11346002)(2906002)(55016002)(7696005)(99286004)(76176011)(486006)(72206003)(33656002)(2501003)(2900100001)(14454004)(316002)(4326008)(8676002)(86362001)(81166006)(81156014)(97736004)(478600001)(229853002)(106356001)(25786009)(105586002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR08MB2660;
 H:AM4PR08MB2788.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Tbtjjj6C6XjiX02nuM9RRIyEnv4fEUAuKgSBHtRQKFWaEGZFTtxeteDj8VmUpZ89s6M0PORbTLMTsGdc/1aJM30pOyMrelP3oE7rUCTdShcfjPd5lEqW723iEzxWF1uRCgrNhr9dYWBmAlv0bAhpJ14fiG7oxPgp68i4yNczdWna1e+j29IGAPL9K9RipGs+rCom+XrT8IyBCBHzInb5imJp7lUfNYmrWRHQF847LLbsFD0qvOMTgB66K3e/srURVh8imjx3bxR09rXNkYv3ObVgLi9UEpMebfUQzX1H54jnxNNmInR2j07Zy0NUbmMFGuwR5CwCTKem4SO8fwwgx1gdvwUX3/7CPnsNI7Dwyvk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5082f5-905f-477d-c378-08d64a4c2672
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2018 16:13:44.1398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2660
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
X-List-Received-Date: Wed, 14 Nov 2018 16:13:55 -0000

David/Jeremy,

We (@ arm) are also interested in contributing MCTP to OpenBMC.
We are in the process of getting CLA signed.
We have the same concern regarding duplicating work.
We would like to collaborate with OpenBMC folks  who are interested in this=
 topic. (maybe form a Workgroup to discuss this).

Thanks,
Supreeth

-----Original Message-----
From: openbmc <openbmc-bounces+supreeth.venkatesh=3Darm.com@lists.ozlabs.or=
g> On Behalf Of Jeremy Kerr
Sent: Wednesday, November 14, 2018 8:00 AM
To: David Thompson <dthompson@mellanox.com>; openbmc@lists.ozlabs.org
Subject: Re: MCTP protocol support in OpenBMC?

Hi David and Rick,

> Does OpenBMC currently have any support for MCTP protocol layer, or is
> there a plan to deliver something like this in the future?  I'd be
> very interested to hear about any future plans related to MCTP stack.

Us too! I'm interested in looking at MCTP, and am in the middle of doing a =
little prototyping with our host firmware stack.

I'd also like to avoid duplicating work though, have you (or others) made p=
rogress on this since this initial email? I know there was a presentation o=
n MCTP at the recent hackathon, but I'm not sure if any solid plans came fr=
om that.

If not, I'd be happy to sketch out an architecture for this...

Cheers,


Jeremy
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
