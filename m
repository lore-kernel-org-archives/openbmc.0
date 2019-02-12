Return-Path: <prvs=9946a23049=awilliams@marvell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=marvell.com
 (client-ip=67.231.156.173; helo=mx0b-0016f401.pphosted.com;
 envelope-from=prvs=9946a23049=awilliams@marvell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=marvell.com header.i=@marvell.com header.b="DU1PFtXy"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=marvell.onmicrosoft.com
 header.i=@marvell.onmicrosoft.com header.b="roEuSEz1"; 
 dkim-atps=neutral
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z4tm0S5KzDqQQ
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 12:33:47 +1100 (AEDT)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1C1TkDG025499; Mon, 11 Feb 2019 17:33:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfpt0818;
 bh=d4fc6KTu6XGzJeYE2jUWE/lrD6Rzq/OJGX9dvb/DGgA=;
 b=DU1PFtXyqjYVDaLZA98LwIvxb+Lhn2BWyn0+vvWosAhLYi7LlXotaXJCHeTMv5fvmKYE
 kNYsQVPlLCmvqK6jQz0nO5/oRVLDiZZ5kVyP8ihIrByKbqo3F8G5KHOQm8DryfPRIpDG
 A2y97c/5mEfABa/52WRV1AdnEZL1IQ2oOkJgAQmVhu52Jqo8MoTSRTbIk6Gl4ajWxiLC
 GgqQ8797YNlQMoZJuBM1E8pp9Dpo1171HJC24iKF2qgOJBc2EBKL6XSSXhwzY/FD/05R
 7Ck+uOgoTsDiEeXzaujNngYGJAS1gwA8BFG3iVymAQOM+ForqKErlV3MwhFY84LQ4Xnt Dg== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
 by mx0b-0016f401.pphosted.com with ESMTP id 2qkktn83uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 11 Feb 2019 17:33:35 -0800
Received: from SC-EXCH02.marvell.com (10.93.176.82) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1367.3; Mon, 11 Feb
 2019 17:33:33 -0800
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (104.47.50.56) by
 SC-EXCH02.marvell.com (10.93.176.82) with Microsoft SMTP Server
 (TLS) id
 15.0.1367.3 via Frontend Transport; Mon, 11 Feb 2019 17:33:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4fc6KTu6XGzJeYE2jUWE/lrD6Rzq/OJGX9dvb/DGgA=;
 b=roEuSEz10n3r6f51/yGiW6Qgfiu0VIPL7z1VzR4D5oqnOXqlO4Dcw7BBXdsaAVi1R/J6EptPEk6BrF2HgflK0jK4n+0nd6o70YTHMjcccW5F6xbsSMS2XcdmYNMG0jvaJrpGPbE/ys6i/c5QijfryXAY89eJ+GfDQyebUrLqDqM=
Received: from DM6PR18MB2443.namprd18.prod.outlook.com (20.179.104.81) by
 DM6PR18MB2761.namprd18.prod.outlook.com (20.179.49.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.21; Tue, 12 Feb 2019 01:33:32 +0000
Received: from DM6PR18MB2443.namprd18.prod.outlook.com
 ([fe80::44c:97af:9111:dbde]) by DM6PR18MB2443.namprd18.prod.outlook.com
 ([fe80::44c:97af:9111:dbde%2]) with mapi id 15.20.1601.023; Tue, 12 Feb 2019
 01:33:32 +0000
From: Aaron Williams <awilliams@marvell.com>
To: Andrew Jeffery <andrew@aj.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [EXT] Re: Issues with SPI NOR flash
Thread-Topic: [EXT] Re: Issues with SPI NOR flash
Thread-Index: AQHUp0Rj+WHheyyKZkKEjLa1XeO5r6Xba7OAgAArsIA=
Date: Tue, 12 Feb 2019 01:33:31 +0000
Message-ID: <2555495.3aIyl02WbI@awilliams-suse>
References: <2947580.vCq4SJ4yDf@awilliams-suse>
 <1549925829.1673864.1655912104.34B09B10@webmail.messagingengine.com>
In-Reply-To: <1549925829.1673864.1655912104.34B09B10@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.233.58.37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 954713ee-f32a-4822-e2b5-08d6908a1922
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR18MB2761; 
x-ms-traffictypediagnostic: DM6PR18MB2761:
x-microsoft-exchange-diagnostics: 1; DM6PR18MB2761;
 20:tSyrI2AjJpsitokmShIomPWz3twKR3eZ9q4wCPq++3sVweS+yz5ldexR9hyrgW0ecGiA8m6lFDEm/J8vQDLU5Eg1wyMIuqIfaqABqwIsvC4ypWMnutivXWPeY8EJ1FKLumHyrqfy2/4/kmC1bCqjQNfe/dg6VPOnyhG7r2vwXiM=
x-microsoft-antispam-prvs: <DM6PR18MB2761369BBA6C6B24C9279D57B1650@DM6PR18MB2761.namprd18.prod.outlook.com>
x-forefront-prvs: 0946DC87A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(7916004)(396003)(136003)(366004)(39860400002)(346002)(376002)(53754006)(52314003)(189003)(199004)(30594003)(68736007)(305945005)(11346002)(486006)(54906003)(316002)(476003)(446003)(66066001)(33716001)(99286004)(26005)(33896004)(186003)(76176011)(6486002)(105586002)(106356001)(102836004)(6506007)(53546011)(2906002)(6436002)(6916009)(6116002)(53936002)(14454004)(3846002)(4326008)(81166006)(66574012)(97736004)(86362001)(7736002)(229853002)(81156014)(25786009)(478600001)(256004)(14444005)(71190400001)(71200400001)(217873002)(6246003)(9686003)(6512007)(8936002)(8676002)(39026011)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR18MB2761;
 H:DM6PR18MB2443.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C2Ji6fWjEdan5/2aaYfXMXdiEonAZ58xGtXF5bRlziSFS7qaXLhnzZnvm4ej4WZmSakHhRMirwQ4Sxoq1rnUOe2Q+JIjb+CHRFqbA1gAKkqMjDM+8La3ds4nY1tivtB6eXV6UBOq7VYH/NNFfseNk5qlMLCLyy0/HF4Qwc4A/a8wVvEPrx5KpI2qU3epuZCWNrDyVVUyKhLDgtBmBPYk3TO/o78Loz75GJ4N1aZFFHF8+8FWykcGOtO+Ujbz07VRkuXs6cRiAYf+JBfKTXhNCDOkLd8YQsQ4F9/re3JpO+BHz5kWqGqiMDuI3b9BzRVk9s37ChM0H0/gAPqMaE5nOTE/ikLMk36rDUqLZ+R+LGl7UKA692iBDlTQpr/I3sa9M56XalqXF3VPmqfuPWont/qKXX7gTq8K7ppVrW7TwvY=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D4FEFCD734A03F498127553D9E301A8B@namprd18.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 954713ee-f32a-4822-e2b5-08d6908a1922
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2019 01:33:31.9866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2761
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-12_01:, , signatures=0
X-Proofpoint-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902120008
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
X-List-Received-Date: Tue, 12 Feb 2019 01:33:53 -0000

Hi Andrew,=0A=
=0A=
I did, thank you.=0A=
=0A=
The issue is that I had to unbind the driver when powering on our SOC and b=
ind =0A=
it again when we power our SOC off. That solved the problem and allows the =
SPI =0A=
NOR to be reinitialized into the proper mode. Right now I have this in our =
=0A=
power management process.=0A=
=0A=
-Aaron=0A=
=0A=
On Monday, February 11, 2019 2:57:18 PM PST Andrew Jeffery wrote:=0A=
> External Email=0A=
> =0A=
> ----------------------------------------------------------------------=0A=
> Hi Aaron,=0A=
> =0A=
> On Tue, 8 Jan 2019, at 21:52, Aaron Williams wrote:=0A=
> > Hi all,=0A=
> > =0A=
> > I'm running into a problem with the SPI NOR connected to our host=0A=
> > processor. We're using a Macronix MX25L25645GMI-08G connected to the sp=
i1=0A=
> > device on an AST2500. This device is muxed between our host processor a=
nd=0A=
> > the BMC. When our host processor is powered off, the BMC has exclusive=
=0A=
> > access to it.=0A=
> > =0A=
> > Anyway, the behavior is that I can read the SPI NOR without any=0A=
> > difficulty,=0A=
> > however, when I write to it the SPI nor appears to be filled with garba=
ge.=0A=
> > If I had to guess, I'd guess that the SPI driver is not waiting for the=
=0A=
> > SPI NOR to complete the write operation before moving to the next block=
.=0A=
> > =0A=
> > Here is the relevant section from our device tree:=0A=
> > =0A=
> > &spi1 {=0A=
> > =0A=
> > 	status =3D "okay";=0A=
> > 	flash@0 {=0A=
> > 	=0A=
> > 		status =3D "okay";=0A=
> > 		compatible =3D "jedec,spi-nor", "spi-nor";=0A=
> > 		label =3D "host";=0A=
> > 		m25p,fast-read;=0A=
> > 		spi-tx-bus-width =3D <1>;=0A=
> > 		spi-rx-bus-width =3D <1>;=0A=
> > 		spi-max-frequency =3D <50000000>;=0A=
> > 		partitions {=0A=
> > 		=0A=
> > 			compatible =3D "fixed-partitions";=0A=
> > 			#address-cells =3D <1>;=0A=
> > 			#size-cells =3D <1>;=0A=
> > 			=0A=
> > 			bootloader@0 {=0A=
> > 			=0A=
> > 				reg =3D <0x0 0x1000000>;=0A=
> > 				label =3D "host-=0A=
> > =0A=
> > bootloader";=0A=
> > =0A=
> > 			};=0A=
> > 			kernel@1000000 {=0A=
> > 			=0A=
> > 				reg =3D <0x1000000=0A=
> > =0A=
> > 0x1000000>;=0A=
> > =0A=
> > 				label =3D "host-kernel";=0A=
> > 			=0A=
> > 			};=0A=
> > 		=0A=
> > 		};=0A=
> > 	=0A=
> > 	};=0A=
> > =0A=
> > };=0A=
> > =0A=
> > Note that our host is also running 4.19 and has no trouble writing to t=
he=0A=
> > SPI NOR. The corruption seems worse when flashcp is used compared to ju=
st=0A=
> > cp. I noticed that flashcp writes in 4K blocks. The Macronix device has=
 a=0A=
> > 256 byte page buffer. I have tried slowing down the bus to 5MHz and tha=
t=0A=
> > made no difference. Note that we are currently using single bit mode fo=
r=0A=
> > both the host and BMC processors for this flash, though we plan to move=
=0A=
> > to move to QPI on the host processor later.=0A=
> > =0A=
> > Before the write operation the host processor has not had any access to=
=0A=
> > the=0A=
> > SPI NOR. The host is powered down and the BMC is rebooted to force a cl=
ean=0A=
> > state.=0A=
> =0A=
> Did you find the problem? I've added C=E9dric to Cc in case you haven't -=
 he=0A=
> should be able to answer questions about the flash stack.=0A=
> =0A=
> Andrew=0A=
=0A=
-- =0A=
Aaron Williams=0A=
Senior Software Engineer=0A=
Marvell Semiconductor, Inc.=0A=
(408) 943-7198	(510) 789-8988 (cell)=0A=
