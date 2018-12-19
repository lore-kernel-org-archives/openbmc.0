Return-Path: <prvs=5891528a1c=benwei@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5891528a1c=benwei@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ZDJdQtav"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="C94SYgxE"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KFh46dMzzDqPg
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 11:12:17 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id wBJ03rbW015762;
 Tue, 18 Dec 2018 16:12:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=ARR4KUUJPr5EpbJhf6d/zVGvFLRiC3FGv3Wd6RPUw/M=;
 b=ZDJdQtavqAOBTCatEm/cLf7Uqxxl6p6FFZRhRB5xpiyDkRqPISGOtlWHyE2feOhpu8to
 UAeDuknIn6i5aQSo7nXWPwl7RlpYBpZnuIACxi3rLZmVL+qhqRncpJyFyrAjdiKWQaBH
 KHlswAf7fjN/NYPZySSSh0GlgTgbk6Q3rhg= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2pf9c1geep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 18 Dec 2018 16:12:13 -0800
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 18 Dec 2018 16:12:12 -0800
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 18 Dec 2018 16:12:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARR4KUUJPr5EpbJhf6d/zVGvFLRiC3FGv3Wd6RPUw/M=;
 b=C94SYgxEEEq9pdWUNmpItelWB0ypMdy5yIrrONNIcgbDJaCvA0+x56V4Zd2IZihl+SiSeYG7NzCEjKtOMuqmBsJOkWHZr+xRe2Qx93fIaeLzWxZalRpWS+S9/ZHHZpD6PTuJcRUumA1q30zu51XM4Au5cYAAHn+Kba+oT12yd4s=
Received: from MWHPR15MB1327.namprd15.prod.outlook.com (10.175.3.141) by
 MWHPR15MB1647.namprd15.prod.outlook.com (10.175.138.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Wed, 19 Dec 2018 00:11:55 +0000
Received: from MWHPR15MB1327.namprd15.prod.outlook.com
 ([fe80::a097:53de:9102:3a76]) by MWHPR15MB1327.namprd15.prod.outlook.com
 ([fe80::a097:53de:9102:3a76%4]) with mapi id 15.20.1425.023; Wed, 19 Dec 2018
 00:11:55 +0000
From: Ben Wei <benwei@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "dkodihal@linux.vnet.ibm.com" <dkodihal@linux.vnet.ibm.com>
Subject: PLDM design proposal
Thread-Topic: PLDM design proposal
Thread-Index: AdSXKzT+NQe+9zAJQFiksKuSYEtb1w==
Date: Wed, 19 Dec 2018 00:11:55 +0000
Message-ID: <MWHPR15MB13272D38C34B33E8EB82F298A3BE0@MWHPR15MB1327.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:55e9]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1647;
 20:1AhmQe3dzI4uR7ESvVMiXscHmojHYInRVVc4pvxSqmC+gYTHUUHQIadyZXeI1yesKD41hXfCHWCUHPORSuSpy9r1wFYdbTF7s7evISdmsyM001f/H/gCQGLa3K7jiVfgnrXDUEClm2y+btKEQ8+c0Anl6EaxQA10FqXEg//t52E=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 86a26bcd-7f00-404c-1d5b-08d6654695d0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1647; 
x-ms-traffictypediagnostic: MWHPR15MB1647:
x-microsoft-antispam-prvs: <MWHPR15MB164784942C7C3E956BABE5E2A3BE0@MWHPR15MB1647.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(11241501185)(5005020)(6040522)(2401047)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231475)(944501520)(52105112)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1647; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1647; 
x-forefront-prvs: 0891BC3F3D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(39860400002)(346002)(366004)(376002)(53754006)(189003)(199004)(25786009)(6116002)(256004)(2906002)(6506007)(14444005)(55016002)(81166006)(7736002)(102836004)(2501003)(486006)(74316002)(305945005)(106356001)(478600001)(476003)(110136005)(81156014)(9686003)(8936002)(8676002)(53936002)(14454004)(316002)(68736007)(3480700005)(99286004)(7696005)(33656002)(86362001)(97736004)(71190400001)(6436002)(561944003)(46003)(7116003)(5660300001)(71200400001)(105586002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1647;
 H:MWHPR15MB1327.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 5bqfpL3LxiylAv/DY07TBk1xl98Qhcc3MjJ8ZTuyM1YPqkA+LWv9qi2Q996MXhDwZaIoFI7KRbePe8CGMcNFWzYzMSFD0lAsNtEfgcMNxUmzP5pwy3PAfd2jUCQ/MW8Ni2xUmWtRD76CqUMxTx9x1ymYpssueX3V4tmLjrK2QFpxdNEyh4azpfp02irUYRSM5uUAT8F2WhTWFtGCYeR+LwrqAQwCk0IiDHE9ztCgEedqijWakJbUkIg0eDXc6g4qQHPgtirUs4CXAw+l1ipmU+p6PufR3rXDMHtfMzP7xy3O6yRMHGUoJAPJ8Gw5Nh9q
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a26bcd-7f00-404c-1d5b-08d6654695d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2018 00:11:55.3062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1647
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-18_11:, , signatures=0
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
X-List-Received-Date: Wed, 19 Dec 2018 00:12:22 -0000

>> Hi All,
>>
>> I've put down some thoughts below on an initial PLDM design on OpenBMC.=
=20
>> Thie structure of the document is based on the OpenBMC design template.=
=20
>> Please review and let me know your feedback. Once we've had a discussion=
=20
>> here on the list, I can move this to Gerrit with some more details. I'd=
=20
>> say reading the MCTP proposal from Jeremy should be a precursor to=20
>> reading this.

Hi Deepak,=20

Do you see any issues with running PLDM over NCSI/RBT? =20
If the NCSI daemon implements the same in-process callbacks as the MCTP dae=
mon,=20
(or if it supports the same D-Bus interface which takes PLDM payload and en=
capsulate it as NCSI commands)

Also do you have plans on which PLDM functionalities to implement first?
I'm looking at creating a prototype user library for PLDM firmware update w=
ould love to collaborate.

 Thanks!
-Ben
