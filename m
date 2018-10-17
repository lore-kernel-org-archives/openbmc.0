Return-Path: <Feng_Xie2@jabil.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=jabil.com
 (client-ip=40.107.70.123; helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=feng_xie2@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jabil.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.onmicrosoft.com header.i=@jabil.onmicrosoft.com
 header.b="gx39ynA6"; dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700123.outbound.protection.outlook.com [40.107.70.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42b2tQ0SJbzF3TJ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 06:53:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.onmicrosoft.com; 
 s=selector1-jabil-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0EN3aCl9weVnEPjkQ2FU7W8mxd9z54hQMwu2ZnTY1c=;
 b=gx39ynA6lIdt4wS2D+lSkczkThgmfPECeP/2bDeoEObHG493Io916UvwoCG2VCrpmfM/ohyhdy+amIoHZbiKitWJrA01SChNUBiQG3M76SE+7DJwxjGBivuSJrAPB6ejZabyUWv/LT8aD+dINSI2cVMfqMwVMiqd4ndFz9z5LfQ=
Received: from BN7PR02MB5300.namprd02.prod.outlook.com (20.176.176.214) by
 BN7PR02MB4034.namprd02.prod.outlook.com (52.132.223.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Wed, 17 Oct 2018 19:53:44 +0000
Received: from BN7PR02MB5300.namprd02.prod.outlook.com
 ([fe80::4184:bbd8:7834:d92f]) by BN7PR02MB5300.namprd02.prod.outlook.com
 ([fe80::4184:bbd8:7834:d92f%3]) with mapi id 15.20.1228.032; Wed, 17 Oct 2018
 19:53:44 +0000
From: Feng Xie <Feng_Xie2@jabil.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
CC: Feng Xie <Feng_Xie2@jabil.com>
Subject: Is Raspberry Pi a supported platform for OpenBMC?
Thread-Topic: Is Raspberry Pi a supported platform for OpenBMC?
Thread-Index: AdRmUzMN6LgZrwdUSr2/JRtSl6yNbA==
Date: Wed, 17 Oct 2018 19:53:44 +0000
Message-ID: <BN7PR02MB5300381E6B487BF91CA6309DCAFF0@BN7PR02MB5300.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcZnhpZVxhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTcwY2E5MTE5LWQyNDYtMTFlOC04NWNlLTE4NWUwZmU1ZTcyY1xhbWUtdGVzdFw3MGNhOTExYi1kMjQ2LTExZTgtODVjZS0xODVlMGZlNWU3MmNib2R5LnR4dCIgc3o9IjI0OSIgdD0iMTMxODQyNzk2NjI4MzczNzE0IiBoPSI2ZUh0TFptSnQ0aWFsRFFzQWdaaWt2RFhVYzg9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Feng_Xie2@jabil.com; 
x-originating-ip: [184.185.47.46]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN7PR02MB4034;
 20:aqT7e/UtdrBgIRC8srRzs9MYK1C6Qw0G9DIIy57sg6mgen9831qqEOTjLha+uiIn517wWXIkM9bgFLVOHCuWeZwA2OF4ccXTW3JTaIYNU0wUKZZeLtpmrqp7ztxZ77aCyAQrOs+PdK85WavR9nAp3tmoJ3fFlzI/0ROU8LCiF4A=
x-ms-office365-filtering-correlation-id: 5e7e9aad-5be6-49cd-791c-08d6346a3eb4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN7PR02MB4034; 
x-ms-traffictypediagnostic: BN7PR02MB4034:
x-microsoft-antispam-prvs: <BN7PR02MB40342E3E307003DACBE5B22ACAFF0@BN7PR02MB4034.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:BN7PR02MB4034; BCL:0; PCL:0; RULEID:; SRVR:BN7PR02MB4034; 
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(136003)(376002)(366004)(346002)(199004)(189003)(3846002)(6116002)(476003)(9686003)(558084003)(6436002)(4326008)(55016002)(7696005)(25786009)(486006)(14454004)(72206003)(478600001)(66066001)(86362001)(316002)(256004)(6506007)(106356001)(33656002)(105586002)(8936002)(5250100002)(71200400001)(5660300001)(102836004)(53936002)(71190400001)(74316002)(2906002)(81166006)(6916009)(81156014)(8676002)(7736002)(107886003)(305945005)(68736007)(97736004)(2900100001)(186003)(99286004)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN7PR02MB4034;
 H:BN7PR02MB5300.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: jabil.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: /T1y5S8+azIzRzeGZHqfkp1FfhaI7QoZgvEtTRFU9VivwHrFCEmitU1g8kJ0nKmqP8NbJpJuM6euzG4ghKIXMal6xx8S3jfiqp/oVyXD5M0i4XRv1M1ZafPw+7WFIaOtSIsP7tOhCDeQhnTSWjluydDbWw2bZ1sZvvJIwm7TfspvwkasQeOyNCACtxM85aYT+dJpuO183CT+IiYR5y/+vkFigJybeSeZ3+rWMKYiD3/+miZl5r6QDAIGBvEVr/Q1KUphOfmDV9es4OMKIyWJUJgcGkHHX/gWb+Rb9qqdJvkgpK2szMoe8z1ts+uwmoFP8YQRdEOndnaVYLvh/9McYTOUJBfggBR0p/MKtWFlVUk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7e9aad-5be6-49cd-791c-08d6346a3eb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 19:53:44.2266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4034
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
X-List-Received-Date: Wed, 17 Oct 2018 19:53:51 -0000

Hi,

      I found a thread of discussion on supporting Raspberry Pi as a develo=
pment platform for OpenBMC in the email archive. Is this available? Thanks.=
=20

Feng =20
