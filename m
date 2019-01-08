Return-Path: <prvs=89111b8d1f=awilliams@marvell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=marvell.com
 (client-ip=67.231.156.173; helo=mx0b-0016f401.pphosted.com;
 envelope-from=prvs=89111b8d1f=awilliams@marvell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=marvell.com header.i=@marvell.com header.b="VmdQMS5t"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=marvell.onmicrosoft.com
 header.i=@marvell.onmicrosoft.com header.b="hWNLl7Iw"; 
 dkim-atps=neutral
X-Greylist: delayed 1076 seconds by postgrey-1.36 at bilbo;
 Tue, 08 Jan 2019 22:40:14 AEDT
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Yr0Z33V0zDqSW
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 22:40:13 +1100 (AEDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x08BL2Zu004199
 for <openbmc@lists.ozlabs.org>; Tue, 8 Jan 2019 03:22:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=pfpt0818;
 bh=IP/i0n9ImBQd2+BF1ZsP5B4VSRHJvODYRafNXPcXkg0=;
 b=VmdQMS5t5+MGSCvyX/vmBhCKHKfpKXPWWDo+BETj/g/dzHlgpeDSlUEoUQ5q/8tcfqrR
 /reOv/YsSTfvxq26TBUtYQXTKO4SnTb79f+t99xbBZQ9U1Y6YFtnqpUw6Yhfrv0BqlsC
 q8PDwsRiz4WLsmfMItVB7gNC3hVnkiGdotSMIgCzlO1p/zQ3Ll0Jok9i77l1HR07xwKb
 c17IG2p2O+IWVrYAvekURGGQcyRi+Bi09wZ0rIUQAavv+dDoNKbjEq43C+/5+aQ5M9CC
 8zbrh2ybtrwBJ9nar4Y5WkRCJjrECjatS1UgMC8MZmbj09G+6aCyZLJqZNtTUATfLd4o Rg== 
Received: from sc-exch04.marvell.com ([199.233.58.184])
 by mx0b-0016f401.pphosted.com with ESMTP id 2pvsk98a1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jan 2019 03:22:13 -0800
Received: from SC-EXCH01.marvell.com (10.93.176.81) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server (TLS) id 15.0.1367.3; Tue, 8 Jan
 2019 03:22:12 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.52) by
 SC-EXCH01.marvell.com (10.93.176.81) with Microsoft SMTP Server
 (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 8 Jan 2019 03:22:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IP/i0n9ImBQd2+BF1ZsP5B4VSRHJvODYRafNXPcXkg0=;
 b=hWNLl7Iw/FOAKxk6MtHJ30OstLARsetWu2oBZcXbUf51nEcsxnqr5Y1CM1Xg/HK6+WBNYnapwv916+teb+yc1GhDgZWirX/YSQIDOy1scy64wzze+TQ5vN0qFnpEcU1JG5+BIrgRAIT75k3XJKqhP2FF/5kOtq4SRM0JoaLHJbI=
Received: from BYAPR18MB2440.namprd18.prod.outlook.com (20.179.91.209) by
 BYAPR18MB3063.namprd18.prod.outlook.com (20.179.57.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.13; Tue, 8 Jan 2019 11:22:07 +0000
Received: from BYAPR18MB2440.namprd18.prod.outlook.com
 ([fe80::bd74:6077:7322:97c5]) by BYAPR18MB2440.namprd18.prod.outlook.com
 ([fe80::bd74:6077:7322:97c5%2]) with mapi id 15.20.1495.011; Tue, 8 Jan 2019
 11:22:07 +0000
From: Aaron Williams <awilliams@marvell.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Issues with SPI NOR flash
Thread-Topic: Issues with SPI NOR flash
Thread-Index: AQHUp0Rj+WHheyyKZkKEjLa1XeO5rw==
Date: Tue, 8 Jan 2019 11:22:07 +0000
Message-ID: <2947580.vCq4SJ4yDf@awilliams-suse>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.233.58.37]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR18MB3063;
 20:m7jzOEiljKcMQC2kWofabx185Y6O/vuAz5D4axQmk0aciT46ASjXQPZf1ICyQr8BRVZmLuxj0J9zgKQ26s/0WwYBgoUoImJKxmXKf0kFTXWaWdj1+KUqg6B4xHhv1C9y/WscPHHqoJ2UtLb5zRthxtnP/ovJp9/p4UUnk26j/w0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 058132bd-f25a-4025-4cbc-08d6755b8653
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR18MB3063; 
x-ms-traffictypediagnostic: BYAPR18MB3063:
x-microsoft-antispam-prvs: <BYAPR18MB3063F06D4417A22420204CDAB18A0@BYAPR18MB3063.namprd18.prod.outlook.com>
x-forefront-prvs: 0911D5CE78
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(39860400002)(346002)(396003)(376002)(136003)(366004)(52314003)(53754006)(30594003)(199004)(189003)(102836004)(2351001)(105586002)(106356001)(478600001)(71200400001)(71190400001)(6916009)(33896004)(6506007)(5660300001)(14454004)(476003)(2906002)(66066001)(6436002)(6486002)(33716001)(68736007)(5640700003)(316002)(2501003)(6116002)(1730700003)(81156014)(81166006)(25786009)(305945005)(7736002)(8676002)(53936002)(256004)(14444005)(86362001)(3846002)(97736004)(217873002)(6512007)(9686003)(26005)(99286004)(8936002)(486006)(186003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR18MB3063;
 H:BYAPR18MB2440.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: J5A8+80Otu756TOaA6bizdAyz+aZXeVp6QtmgPvcMOO9MjHuFiV0115ADFv0NPLhnXbGABvIXk7CFETFMN8kV2oJpEHiVdQ52/Redzjea4kfC2UjnH/+VwKKQh9qNlWvX1JmLBrGpwuoSbbg1qEVugw03sIhUt1CmO1PyhhkvHTIWupdSvB4wEeKkcXcT/OxLf8tqpcJiBYmsIHnYeEhcmQp3eT6rLPRSnSht31iKZLy9ihCNy96Qbxov8os2yO+WTEvxjS8z3b3JB7HamnoFWhNg+QKdo4twLe8M0SsudHxORWPhtd01lOfsG6pcQXt
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3C301AD0A24AA145807931B627BBF97C@namprd18.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 058132bd-f25a-4025-4cbc-08d6755b8653
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2019 11:22:07.4582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB3063
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-08_07:, , signatures=0
X-Proofpoint-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=817 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901080094
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
X-List-Received-Date: Tue, 08 Jan 2019 11:40:15 -0000

Hi all,=0A=
=0A=
I'm running into a problem with the SPI NOR connected to our host processor=
. =0A=
We're using a Macronix MX25L25645GMI-08G connected to the spi1 device on an=
 =0A=
AST2500. This device is muxed between our host processor and the BMC. When =
our =0A=
host processor is powered off, the BMC has exclusive access to it.=0A=
=0A=
Anyway, the behavior is that I can read the SPI NOR without any difficulty,=
 =0A=
however, when I write to it the SPI nor appears to be filled with garbage. =
If =0A=
I had to guess, I'd guess that the SPI driver is not waiting for the SPI NO=
R =0A=
to complete the write operation before moving to the next block.=0A=
=0A=
Here is the relevant section from our device tree:=0A=
=0A=
&spi1 {=0A=
	status =3D "okay";=0A=
	flash@0 {=0A=
		status =3D "okay";=0A=
		compatible =3D "jedec,spi-nor", "spi-nor";=0A=
		label =3D "host";=0A=
		m25p,fast-read;=0A=
		spi-tx-bus-width =3D <1>;=0A=
		spi-rx-bus-width =3D <1>;=0A=
		spi-max-frequency =3D <50000000>;=0A=
		partitions {=0A=
			compatible =3D "fixed-partitions";=0A=
			#address-cells =3D <1>;=0A=
			#size-cells =3D <1>;=0A=
=0A=
			bootloader@0 {=0A=
				reg =3D <0x0 0x1000000>;=0A=
				label =3D "host-=0A=
bootloader";=0A=
			};=0A=
			kernel@1000000 {=0A=
				reg =3D <0x1000000 =0A=
0x1000000>;=0A=
				label =3D "host-kernel";=0A=
			};=0A=
		};=0A=
	};=0A=
};=0A=
=0A=
Note that our host is also running 4.19 and has no trouble writing to the S=
PI =0A=
NOR. The corruption seems worse when flashcp is used compared to just cp. I=
 =0A=
noticed that flashcp writes in 4K blocks. The Macronix device has a 256 byt=
e =0A=
page buffer. I have tried slowing down the bus to 5MHz and that made no =0A=
difference. Note that we are currently using single bit mode for both the h=
ost =0A=
and BMC processors for this flash, though we plan to move to move to QPI on=
 =0A=
the host processor later.=0A=
=0A=
Before the write operation the host processor has not had any access to the=
 =0A=
SPI NOR. The host is powered down and the BMC is rebooted to force a clean =
=0A=
state.=0A=
=0A=
-Aaron=0A=
=0A=
-- =0A=
Aaron Williams=0A=
Senior Software Engineer=0A=
Marvell Semiconductor, Inc.=0A=
(408) 943-7198	(510) 789-8988 (cell)=
