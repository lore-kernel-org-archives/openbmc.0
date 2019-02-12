Return-Path: <prvs=9946a23049=awilliams@marvell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=marvell.com
 (client-ip=67.231.156.173; helo=mx0b-0016f401.pphosted.com;
 envelope-from=prvs=9946a23049=awilliams@marvell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=marvell.com header.i=@marvell.com header.b="SNjdSrcL"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=marvell.onmicrosoft.com
 header.i=@marvell.onmicrosoft.com header.b="Ir+4kCvh"; 
 dkim-atps=neutral
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zG8s2Cv0zDqML
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 19:31:40 +1100 (AEDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1C8Kn9g010062; Tue, 12 Feb 2019 00:31:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfpt0818;
 bh=HeleTvN0/tyojMj7SstOkh34tNelfDfjTbwLAFY9tR8=;
 b=SNjdSrcLjUR0Ge0+tf9uAMqYUk1HIQgUi0rYLVbrU0g8UUJsur/Xe7hIjuGeFnLkrz4V
 eC+tYkNTfvAC7g17i6RoR4HzHw3d918ITmXZ7seGGdrTdYscAgnS4dLgU13jyNgABHLi
 NYuMf4eChUrlhY06z3oIi2rltORLdZ+Qh5r0aRZ7IzovFOV+jA/XWe1HY1mRJvIKhjgI
 jV9uwiqQd3miOOyWUhfXRmP0MBOjmbUQidhqrexmCol2YLZGe3Z2yK2IBmT1xG34ELbV
 C7zPABShw0tjKK3uRz9SmDqsq/9klGxtJoZgTfOFZp98Y1252kkHbbb/SQGkl8zDh/x4 jQ== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
 by mx0b-0016f401.pphosted.com with ESMTP id 2qkktn92r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 12 Feb 2019 00:31:27 -0800
Received: from SC-EXCH02.marvell.com (10.93.176.82) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1367.3; Tue, 12 Feb
 2019 00:31:26 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.54) by
 SC-EXCH02.marvell.com (10.93.176.82) with Microsoft SMTP Server
 (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 12 Feb 2019 00:31:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeleTvN0/tyojMj7SstOkh34tNelfDfjTbwLAFY9tR8=;
 b=Ir+4kCvh2dF5yIx+8CM3oedL0zqKBaXhrx/B7/fcz4O0HyO3w1x4SYKy8BDXW7VUtMlI6XUFMOznIcSyrM35pIuIkoXSp0+e6d3CUBSrOzbyIHQrm5c/sTyD+d2QxcY/NyXUksttivMpnSX5tQ0b8Fqedc65NJQs5EFSskJT7o4=
Received: from BYAPR18MB2440.namprd18.prod.outlook.com (20.179.91.209) by
 BYAPR18MB2646.namprd18.prod.outlook.com (20.179.92.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.19; Tue, 12 Feb 2019 08:31:24 +0000
Received: from BYAPR18MB2440.namprd18.prod.outlook.com
 ([fe80::44b9:ff7e:6021:7c7]) by BYAPR18MB2440.namprd18.prod.outlook.com
 ([fe80::44b9:ff7e:6021:7c7%2]) with mapi id 15.20.1622.016; Tue, 12 Feb 2019
 08:31:24 +0000
From: Aaron Williams <awilliams@marvell.com>
To: =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
CC: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [EXT] Re: Issues with SPI NOR flash
Thread-Topic: [EXT] Re: Issues with SPI NOR flash
Thread-Index: AQHUp0Rj+WHheyyKZkKEjLa1XeO5r6Xba7OAgACcygCAAAOmgA==
Date: Tue, 12 Feb 2019 08:31:24 +0000
Message-ID: <5233256.VOdTxZz7ya@awilliams-suse>
References: <2947580.vCq4SJ4yDf@awilliams-suse>
 <1549925829.1673864.1655912104.34B09B10@webmail.messagingengine.com>
 <89d815b2-2b9f-b132-5a9d-c4995b7637dd@kaod.org>
In-Reply-To: <89d815b2-2b9f-b132-5a9d-c4995b7637dd@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.233.58.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17e7e8c7-ed68-4d3e-b307-08d690c47970
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR18MB2646; 
x-ms-traffictypediagnostic: BYAPR18MB2646:
x-microsoft-exchange-diagnostics: 1; BYAPR18MB2646;
 20:f2IgOoBJN3ezT1/YYnb1haNYnfBKnxYoZLOD2k3Bawu53jZOQxleQw4EMyGBD3QAw35qCqK+mZtnXnU15185eAkKHUJnpg3EQmOjdSlitMcC2Yb+H1YwjUMujOfJAOnaqdA/U6HqHrBVYEtt9z/tsU5tDsZXl7+a3X2hR6A6T1g=
x-microsoft-antispam-prvs: <BYAPR18MB2646017A3A92CD96916FF38FB1650@BYAPR18MB2646.namprd18.prod.outlook.com>
x-forefront-prvs: 0946DC87A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(39860400002)(346002)(376002)(396003)(366004)(136003)(52314003)(30594003)(189003)(199004)(53754006)(14444005)(102836004)(6506007)(256004)(97736004)(446003)(486006)(476003)(106356001)(11346002)(6486002)(33896004)(53546011)(66574012)(6916009)(3846002)(229853002)(316002)(6116002)(86362001)(33716001)(8936002)(26005)(186003)(68736007)(2906002)(71200400001)(71190400001)(6436002)(54906003)(76176011)(99286004)(81156014)(81166006)(217873002)(8676002)(66066001)(305945005)(9686003)(53936002)(6512007)(7736002)(6246003)(105586002)(25786009)(478600001)(4326008)(14454004)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR18MB2646;
 H:BYAPR18MB2440.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FZHhaCMz6o/7x0UxSTFrUeBEF4ZwIGA5a2pjGmq9kCoIwX3vAFX5sGDRCBGuJz+kwTx7dTe7U34sBZ+Nto9O/C/1aZGe8OljvsQcIYSOj++sbWgBuEmW46TrXUpUT4JigZlrt0p+iGIJwX1/PqyiyrlfGDzbpMky7vaadr+cimQs+EhT6BwKJ5Huzxa83k30GfR7vELVO5rKrJIzbpTgntZ/d+JfpqAPB3WGWByfGLBHj4QuhLRNMIWtE3U2xH+zNX/Lo8dI7IYHsfngihO1GLAHrj8ARZQs24QeJVAf8W6gFls4U3ogMu+iguM2P0LXEn963hqIicgC+B2f6qILNpbxjA+PWo0u534VhHISy/v9+ZD0ZAFbzPEI7GmnBITj3hlPALDSUDnzUvkTlFlVxBG8eSCvWTlandy+zDgXNHQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <18E6AB8B30F4914DB078A6F4AFC99322@namprd18.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e7e8c7-ed68-4d3e-b307-08d690c47970
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2019 08:31:24.2520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2646
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-12_06:, , signatures=0
X-Proofpoint-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902120063
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
X-List-Received-Date: Tue, 12 Feb 2019 08:31:42 -0000

Hi,=0A=
=0A=
In this case, only one side controls it at a time. The drivers are =0A=
incompatible. The BMC relinquishes control before the SOC is powered on and=
 =0A=
cannot access it again until after the SOC is powered off. By using unbind =
and =0A=
bind on the BMC it allows the BMC to reinitialize the SPI NOR into the prop=
er =0A=
mode when it binds (after the SOC is powered off). There is also a reset =
=0A=
control line driven by the BMC to the SPI NOR as well.=0A=
=0A=
So the procedure is when power is on to the SOC the BMC cannot access the S=
PI =0A=
NOR (there is also a mux). When the SOC is powered off the SPI NOR is reset=
 =0A=
and the mux switches to the BMC which then binds the driver to the SPI NOR,=
 =0A=
initializing it so it can write to the SPI NOR.=0A=
=0A=
Reads don't seem to be a problem when switching between the SOC and the BMC=
 =0A=
and the SOC has hardware support for arbitration but this is not used (and =
the =0A=
current BMC driver lacks support for doing arbitration).=0A=
=0A=
-Aaron=0A=
=0A=
On Tuesday, February 12, 2019 12:18:45 AM PST C=E9dric Le Goater wrote:=0A=
> External Email=0A=
> =0A=
> ----------------------------------------------------------------------=0A=
> Hello,=0A=
> =0A=
> On 2/11/19 11:57 PM, Andrew Jeffery wrote:=0A=
> > Hi Aaron,=0A=
> > =0A=
> > On Tue, 8 Jan 2019, at 21:52, Aaron Williams wrote:=0A=
> >> Hi all,=0A=
> >> =0A=
> >> I'm running into a problem with the SPI NOR connected to our host=0A=
> >> processor. We're using a Macronix MX25L25645GMI-08G connected to the=
=0A=
> >> spi1 device on an AST2500. This device is muxed between our host=0A=
> >> processor and the BMC. When our host processor is powered off, the BMC=
=0A=
> >> has exclusive access to it.=0A=
> yes but there could be different (incompatible) states in the SPI control=
ler=0A=
> drivers on each kernel (BMC, Host) and in the flash module as well. That =
is=0A=
> why having only one side doing the control is usually preferred.=0A=
> =0A=
> >> Anyway, the behavior is that I can read the SPI NOR without any=0A=
> >> difficulty,=0A=
> >> however, when I write to it the SPI nor appears to be filled with=0A=
> >> garbage.=0A=
> >> I had to guess, I'd guess that the SPI driver is not waiting for the S=
PI=0A=
> >> NOR to complete the write operation before moving to the next block.=
=0A=
> =0A=
> When the host is powered off, you seem to be able to read the PNOR=0A=
> correctly, (I assume you did the write from the host side then) but the=
=0A=
> first write from the BMC trashes the contents ?=0A=
> =0A=
> >> Here is the relevant section from our device tree:=0A=
> >> =0A=
> >> &spi1 {=0A=
> >> =0A=
> >> 	status =3D "okay";=0A=
> >> 	flash@0 {=0A=
> >> 	=0A=
> >> 		status =3D "okay";=0A=
> >> 		compatible =3D "jedec,spi-nor", "spi-nor";=0A=
> >> 		label =3D "host";=0A=
> >> 		m25p,fast-read;=0A=
> >> 		spi-tx-bus-width =3D <1>;=0A=
> >> 		spi-rx-bus-width =3D <1>;=0A=
> >> 		spi-max-frequency =3D <50000000>;=0A=
> >> 		partitions {=0A=
> >> 		=0A=
> >> 			compatible =3D "fixed-partitions";=0A=
> >> 			#address-cells =3D <1>;=0A=
> >> 			#size-cells =3D <1>;=0A=
> >> 			=0A=
> >> 			bootloader@0 {=0A=
> >> 			=0A=
> >> 				reg =3D <0x0 0x1000000>;=0A=
> >> 				label =3D "host-=0A=
> >> =0A=
> >> bootloader";=0A=
> >> =0A=
> >> 			};=0A=
> >> 			kernel@1000000 {=0A=
> >> 			=0A=
> >> 				reg =3D <0x1000000=0A=
> >> =0A=
> >> 0x1000000>;=0A=
> >> =0A=
> >> 				label =3D "host-kernel";=0A=
> >> 			=0A=
> >> 			};=0A=
> >> 		=0A=
> >> 		};=0A=
> >> 	=0A=
> >> 	};=0A=
> >> =0A=
> >> };=0A=
> >> =0A=
> >> Note that our host is also running 4.19 and has no trouble writing to =
the=0A=
> >> SPI NOR. The corruption seems worse when flashcp is used compared to=
=0A=
> >> just cp. I noticed that flashcp writes in 4K blocks. The Macronix devi=
ce=0A=
> >> has a 256 byte page buffer. I have tried slowing down the bus to 5MHz=
=0A=
> >> and that made no difference. Note that we are currently using single b=
it=0A=
> >> mode for both the host and BMC processors for this flash, though we pl=
an=0A=
> >> to move to move to QPI on the host processor later.=0A=
> =0A=
> What about 4BYTE mode ? have you checked in which mode the flash device i=
s=0A=
> left by the host ? That could be a problem.=0A=
> =0A=
> C.=0A=
> =0A=
> >> Before the write operation the host processor has not had any access t=
o=0A=
> >> the=0A=
> >> SPI NOR. The host is powered down and the BMC is rebooted to force a=
=0A=
> >> clean=0A=
> >> state.=0A=
> > =0A=
> > Did you find the problem? I've added C=E9dric to Cc in case you haven't=
 - he=0A=
> > should be able to answer questions about the flash stack.=0A=
> > Andrew=0A=
=0A=
-- =0A=
Aaron Williams=0A=
Senior Software Engineer=0A=
Marvell Semiconductor, Inc.=0A=
(408) 943-7198	(510) 789-8988 (cell)=0A=
