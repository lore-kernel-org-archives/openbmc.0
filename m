Return-Path: <prvs=69142cd7ec=benwei@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=69142cd7ec=benwei@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="F9XkcNy6"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="NHvBmlMM"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bZ463qVjzDr08
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 18:19:13 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0B7Dw7r020872
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 23:19:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=Gez138rzI3p5L9xXzabFyxY9adP5wRjtunAkoahQAOg=;
 b=F9XkcNy67S2vYS1ZXcFqZilp52aHP+qILvrS0f4U/YBE+AhOcjLeT7wFWymC80Qly1Z4
 qtHQOTlTOiZuWcB4L409F277nKaVG/aAUqMnSiwwJplcjd2/M3GPU53O565p3EXZ8tEM
 WsX+aAxwGDOWl4KF9zmwsY4p36bGA/Z1cfw= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2pxjuf0hcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 23:19:11 -0800
Received: from prn-mbx08.TheFacebook.com (2620:10d:c081:6::22) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 10 Jan 2019 23:19:10 -0800
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx08.TheFacebook.com (2620:10d:c081:6::22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 10 Jan 2019 23:19:09 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 10 Jan 2019 23:19:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gez138rzI3p5L9xXzabFyxY9adP5wRjtunAkoahQAOg=;
 b=NHvBmlMMSiLfhouU8+ay9ImUa90NwkKnwpcUsji5g+COj5FIidq2ZOKjI9NQH3CnkvTS1yQHTu3n21ahIjCrUsmS4KgEULpfR5vXCvXgd6papCD+iEyTtqtr1dDp6OGW4r7uiN1dSmX5WwNPjYRPGdRlufdE91zmz3pr1nPN9Es=
Received: from DM5PR15MB1321.namprd15.prod.outlook.com (10.173.210.11) by
 DM5PR15MB1865.namprd15.prod.outlook.com (10.174.247.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.11; Fri, 11 Jan 2019 07:18:52 +0000
Received: from DM5PR15MB1321.namprd15.prod.outlook.com
 ([fe80::817c:99ce:10a0:3da1]) by DM5PR15MB1321.namprd15.prod.outlook.com
 ([fe80::817c:99ce:10a0:3da1%5]) with mapi id 15.20.1516.016; Fri, 11 Jan 2019
 07:18:52 +0000
From: Ben Wei <benwei@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: PLDM design proposal 
Thread-Topic: PLDM design proposal 
Thread-Index: AdSpfeQCAKeBZqVhSDSk6ayC7Iw+mw==
Date: Fri, 11 Jan 2019 07:18:52 +0000
Message-ID: <DM5PR15MB1321D93F03A352850967EEEEA3850@DM5PR15MB1321.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2600:1700:1150:8cc0:45b5:a690:2b04:60bd]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR15MB1865;
 20:KaJdpw4jSOOg7FuWDaln6PwMkV2PoZ2iNTB7apF7m/SWiJQjw0/kpfZirkpzjH5eUKA6apVDVx7+Z/r9hsWBEY/1uwsn2OOVMTbCLhPjnNThrki1+y7XbWYb1mWrb9D5MWsXWueFR5JY5gxewlFrpqVtXEjy5q+jHSC19y8jBkc=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: f13f0863-3b4a-43e1-bf2d-08d677950a3c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:DM5PR15MB1865; 
x-ms-traffictypediagnostic: DM5PR15MB1865:
x-microsoft-antispam-prvs: <DM5PR15MB18657EFF5577163EBFC67A96A3850@DM5PR15MB1865.namprd15.prod.outlook.com>
x-forefront-prvs: 09144DB0F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(136003)(366004)(39860400002)(396003)(189003)(199004)(53754006)(2351001)(105586002)(316002)(33656002)(97736004)(5640700003)(229853002)(6436002)(25786009)(55016002)(2906002)(106356001)(99286004)(561944003)(4743002)(2501003)(7736002)(68736007)(6116002)(53936002)(478600001)(9686003)(74316002)(5660300001)(86362001)(46003)(8936002)(14444005)(256004)(3480700005)(7696005)(1730700003)(305945005)(486006)(14454004)(53546011)(6916009)(6506007)(186003)(81166006)(8676002)(81156014)(71190400001)(7116003)(102836004)(6246003)(476003)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR15MB1865;
 H:DM5PR15MB1321.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CjDvgq5oRT8ovuo59bdnF136CnCvFSvT4cCBtMQr3a2B3XwmcIHOhVQ0Je2S4bZkMs3euWeMGiBdk4yXAeJKpHWU1Ujn8TNcVd9I6pO32KZzXUfB1quXnRMq6V6tk5oS62Obf3Yz8vo/KTCiuxzmU+/ahSZEj0BlYlJTs9FoJP8srHPjuI0CKyHLwow4X6TZpM6yxo2YGrd2SOJeDI4vBiJGZDURXinjopi7B8hWy2dkc96CkD+YfyH8pqRVnP8h/K7V4CkP7q01WOnZVuWu7P4y/nHZB/rJAbbKUVb8QkgaOrf+6SAdn7j4jojYFw2zuhJWnkN95i5mOvEE5gAE6KppmwOsCPivpBnbQWpJD6idqBDx4q6e2LGc1YGG3Xb2qj2zcOPatllG6T9loq6pLsxp04PjdGWdYLf0WPVWp7c=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f13f0863-3b4a-43e1-bf2d-08d677950a3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2019 07:18:52.3370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR15MB1865
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-11_04:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Fri, 11 Jan 2019 07:19:21 -0000

Hi Deepak,=20

On 19/12/18 5:41 AM, Ben Wei wrote:
>>>>> Hi All,
>>>>>
>>>>> I've put down some thoughts below on an initial PLDM design on OpenBM=
C.
>>>>> The structure of the document is based on the OpenBMC design template=
.
>>>>> Please review and let me know your feedback. Once we've had a=20
>>>>> discussion here on the list, I can move this to Gerrit with some=20
>>>>> more details. I'd say reading the MCTP proposal from Jeremy should=20
>>>>> be a precursor to reading this.
>>=20
>>> Hi Deepak,
>>>=20
>>> Do you see any issues with running PLDM over NCSI/RBT?
>>> If the NCSI daemon implements the same in-process callbacks as the=20
>>> MCTP daemon, (or if it supports the same D-Bus interface which takes=20
>>> PLDM payload and encapsulate it as NCSI commands)
>
>Nothing jumps out as a problem with this.
>
>>> Also do you have plans on which PLDM functionalities to implement first=
?
>>> I'm looking at creating a prototype user library for PLDM firmware upda=
te would love to collaborate.
>=20
> That sounds great! PLDM platform monitoring and BIOS are likely to be fir=
st on our list in terms of the order of implementation.  I did see some cod=
e being dropped at facebook/openbmc, related to PLDM firmware upgrade. Is t=
hat a prototype=20
> and/or do you eventually plan to drop that openbmc as well? I'd love to h=
ear feedback from you on the high level design that I sent. I'm planning to=
 push that to Gerrit, so you could review there as well.

Great,  I'm currently prototyping PDLM firmware update functionality on one=
 of facebook's platforms.  I plan to port that to openbmc once my prototypi=
ng is done.
At the moment it's in a shared library libpldm that parses and generate som=
e base PLDM command parsing but mainly type 5 commands for PLDM firmware up=
date.=20
It's using NCSI as transporting layer for now but I can port it to MCTP as =
well.  I will review the high level design you sent earlier and comment.=20

Thanks!
-Ben
