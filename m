Return-Path: <yupalani@microsoft.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=104.47.38.104; helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=yupalani@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="OnNa0ciJ"; dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0104.outbound.protection.outlook.com [104.47.38.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40n3GW3gkGzF26F
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 06:45:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gMY5sfNi/tVuH8D50PiYEI65S6Gk2Zrrvr0EhvsWrI=;
 b=OnNa0ciJtYmOT+DtY8HbjOfaJLNnYrizAUuKXERfcvriCbIxMOyjU4bh0nM+Vu4h2YyWb6WsUM++CCmCZkezcPV8kacaH3P0a8+LClx+PZt/1yAHhsAemAeoqelXAZ1Z2/pBdSU5hz6yqvbtwcUMoxadwPmkSO9/qWFKRGNqUJg=
Received: from MWHPR21MB0864.namprd21.prod.outlook.com (10.173.51.146) by
 MWHPR21MB0160.namprd21.prod.outlook.com (10.173.52.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.797.3; Thu, 17 May 2018 20:45:16 +0000
Received: from MWHPR21MB0864.namprd21.prod.outlook.com
 ([fe80::b85a:5aef:f32a:d034]) by MWHPR21MB0864.namprd21.prod.outlook.com
 ([fe80::b85a:5aef:f32a:d034%6]) with mapi id 15.20.0797.007; Thu, 17 May 2018
 20:45:16 +0000
From: Yugi Mani <yupalani@microsoft.com>
To: "Michael.E.Brown@dell.com" <Michael.E.Brown@dell.com>,
 "ed.tanous@intel.com" <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 "hramasub@in.ibm.com" <hramasub@in.ibm.com>, "Balaji.B.Rao@dell.com"
 <Balaji.B.Rao@dell.com>, "bradleyb@fuzziesquirrel.com"
 <bradleyb@fuzziesquirrel.com>, "pradeep.kumar36@tcs.com"
 <pradeep.kumar36@tcs.com>, "rolfb@us.ibm.com" <rolfb@us.ibm.com>, Chris Ong
 <Chris.Ong@microsoft.com>, Ali Larijani <alirhas@microsoft.com>
Subject: RE: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group working
 call
Thread-Topic: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group
 working call
Thread-Index: AdPsYkRv1Xl4DXIGTxCVOcJsabY0fQBvTmKA
Date: Thu, 17 May 2018 20:45:16 +0000
Message-ID: <MWHPR21MB086447F0749C77694C01B331D6910@MWHPR21MB0864.namprd21.prod.outlook.com>
References: <0af13b580c2e4930a98204349822a82b@ausx13mps334.AMER.DELL.COM>
In-Reply-To: <0af13b580c2e4930a98204349822a82b@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=yupalani@microsoft.com; 
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2018-05-17T20:45:14.7274583Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic;
 Sensitivity=General
x-originating-ip: [2001:4898:80e8:e::83]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR21MB0160;
 7:F6u4nfCEUkYPP3UDqVHqSXECdG2VuZSmWLKCOXK+pXLhEWOWU3X8deuMZWm9Eev/IVlsRV8607dB5gH+4Dn9Lcd+nT0lINVvTR0g7EGkRxERJgO6buinp/XdIHBOxaMyNRssl6ZyHzMf37/5nkUNDsnyFSjhX2aEqohrMn451VM1Vb822bHp5fa/V7DlJeimvKrRMJgXJi5zdRsMtHYkX9ihXDP+WVUzRhXzjfSY4mpbS8CynZLwAt3cMEewxmiu;
 20:/MHvoo/V58PFgadYaaDcAgA7pWDnE3vn5Sg5pa4HPRJhte4WXokk/sJdb1M6nuA1bFIQmRiz9nuD0bKN/Xo/a8EvY9017IxO99xhwCoff5ysZ1S/8uIrYEWTNQWvv8N0D7aV/w5lJj0dk1B73duqMFPucaL9MtcCFrv7lvSiskU=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7193020);
 SRVR:MWHPR21MB0160; 
x-ms-traffictypediagnostic: MWHPR21MB0160:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yupalani@microsoft.com; 
x-microsoft-antispam-prvs: <MWHPR21MB016081D007CC1773AE09C4A5D6910@MWHPR21MB0160.namprd21.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(89211679590171)(189930954265078)(65623756079841)(114017886912203)(274839183919467)(219752817060721)(280536654915231)(21748063052155)(104084551191319);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231254)(2018427008)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR21MB0160; BCL:0; PCL:0; RULEID:; SRVR:MWHPR21MB0160; 
x-forefront-prvs: 067553F396
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(39860400002)(366004)(39380400002)(396003)(497574002)(50944005)(199004)(189003)(8676002)(2201001)(8936002)(478600001)(81156014)(81166006)(1511001)(86362001)(3660700001)(5250100002)(25786009)(3280700002)(2501003)(7736002)(2906002)(8656006)(2900100001)(6636002)(7696005)(10290500003)(76176011)(476003)(5660300001)(19609705001)(790700001)(68736007)(6116002)(11346002)(74316002)(486006)(446003)(33656002)(8990500004)(6306002)(54896002)(9686003)(236005)(186003)(105586002)(106356001)(10090500001)(110136005)(316002)(6506007)(59450400001)(53546011)(46003)(22452003)(86612001)(99286004)(606006)(6246003)(53936002)(554214002)(97736004)(102836004)(14454004)(229853002)(8666007)(6436002)(55016002)(921003)(42262002)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0160;
 H:MWHPR21MB0864.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: QXpcOt6hFbGbrLX2tnm5SIydp41unQPN0AoPwrvy+nWrAfcnZEkjiviA81nNgfIMyGN1riaXupzWk1kurdIN4egLImkX3Yb+Cpmd4nAgUs1tSLvzv4Qkr2OYWISaIktOOsfVpEndUc1ewFvovgwJ49zOilAbhXSlZX2CcCQ63p9uXTb6K4dKLzbRQ4KQLgvX
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_MWHPR21MB086447F0749C77694C01B331D6910MWHPR21MB0864namp_"
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 4fd1f7ee-7389-443b-4e5e-08d5bc3718ac
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd1f7ee-7389-443b-4e5e-08d5bc3718ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2018 20:45:16.3419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0160
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2018 20:45:25 -0000

--_000_MWHPR21MB086447F0749C77694C01B331D6910MWHPR21MB0864namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am looking for DSP# for FRU Schema that is currently DMTF work in progres=
s.

Paul, Ed,

I remember you mentioning that FRU schema is under review. Do you have the =
DSP# by any chance?

Yugi

From: Michael.E.Brown@dell.com <Michael.E.Brown@dell.com>
Sent: Tuesday, May 15, 2018 8:35 AM
To: ed.tanous@intel.com; openbmc@lists.ozlabs.org; Paul.Vancil@dell.com; hr=
amasub@in.ibm.com; Balaji.B.Rao@dell.com; bradleyb@fuzziesquirrel.com; prad=
eep.kumar36@tcs.com; rolfb@us.ibm.com; Chris Ong <Chris.Ong@microsoft.com>;=
 Ali Larijani <alirhas@microsoft.com>; Yugi Mani <yupalani@microsoft.com>
Subject: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group working =
call

Meeting minutes for 5/14
*       Pavel presented POC for implementing custom Redfish endpoints and a=
ttributes/properties
*       DBUS based approach where individual processes put custom Redfish i=
nterfaces on dbus and bmcweb notices them and adds them to the tree.

--
Michael

-----Original Appointment-----
From: Tanous, Ed [mailto:ed.tanous@intel.com]
Sent: Monday, April 16, 2018 12:40 PM
To: Tanous, Ed; OpenBMC Maillist; Brown, Michael E; Vancil, Paul; Hariharas=
ubramanian Ramasubramanian; Rao, Balaji B; Brad Bishop; pradeep.kumar36@tcs=
.com; rolfb@us.ibm.com; Chris.Ong@microsoft.com; alirhas@microsoft.com; yup=
alani@microsoft.com
Subject: OpenBMC Redfish working group working call
When: Monday, May 14, 2018 2:00 PM-3:00 PM (UTC-08:00) Pacific Time (US & C=
anada).
Where: Skype Meeting



Due to the problems with Blue Jeans we had last week, and the fact that we =
don't seem to use the video conference feature, lets switch back to Skype. =
 Unfortunately, BlueJeans doesn't give an easy way to send out cancelations=
, and my account is in a state of flux,
Description:
Per meeting decision, this meeting invite is for the "OpenBMC Redfish worki=
ng group". This
working group will meet every Monday at 4pm CST and publish meeting minutes=
 to the mailing
list. The working group is open to anybody who would like to participate in=
 development of
Redfish on OpenBMC.


Base agenda:

Call for opens
Presentation of frameworks
Discussion of Redfish on OpenBMC



...........................................................................=
..............................................................
--> Join Skype Meeting<https://na01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fmeet.intel.com%2Fed.tanous%2FSQH2DRH7&data=3D02%7C01%7Cyup=
alani%40microsoft.com%7Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af=
91ab2d7cd011db47%7C1%7C0%7C636619953187357226&sdata=3D9ypBXFg7y2A3%2Fx2FSHf=
2fWTOJABSMuvMt2BAei21lz4%3D&reserved=3D0>
Trouble Joining? Try Skype Web App<https://na01.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Fmeet.intel.com%2Fed.tanous%2FSQH2DRH7%3Fsl%3D1&d=
ata=3D02%7C01%7Cyupalani%40microsoft.com%7Ce22ddc99a41b4c35429808d5ba797578=
%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636619953187367239&sdata=3D8H=
cwfwNU5Vic9cFLmzKqvYi4VO05X%2BZvwnlHPEh6FeQ%3D&reserved=3D0>
Join by phone
+1(916)356-2663 (or your local bridge access #) Choose bridge 5.<tel:+1(916=
)356-2663%20(or%20your%20local%20bridge%20access%20#)%20Choose%20bridge%205=
.> (Global)                English (United States)
Find a local number<https://na01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fdial.intel.com&data=3D02%7C01%7Cyupalani%40microsoft.com%7Ce22d=
dc99a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6=
36619953187367239&sdata=3DO5OJe99iv9KPzApWfI7aj2kOoInlAOLI%2BPhuLKqziSs%3D&=
reserved=3D0>

Conference ID: 205576574
Forgot your dial-in PIN?<https://na01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fdial.intel.com&data=3D02%7C01%7Cyupalani%40microsoft.com%7=
Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C=
0%7C636619953187377247&sdata=3DBjPZggjvZ0XbugnpPrRDNksMtByRRN6cdjzPSlB8ZaU%=
3D&reserved=3D0> |Help<https://na01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fo15.officeredir.microsoft.com%2Fr%2FrlidLync15%3Fclid%3D10=
33%26p1%3D5%26p2%3D2009&data=3D02%7C01%7Cyupalani%40microsoft.com%7Ce22ddc9=
9a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6366=
19953187387255&sdata=3DPkk8BwwbOeJq8J%2BAXNgFNJtu13yJEalYFhQEKaWVfdY%3D&res=
erved=3D0>

[!OC([1033])!]
...........................................................................=
..............................................................




--_000_MWHPR21MB086447F0749C77694C01B331D6910MWHPR21MB0864namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	border:none;
	padding:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:385221800;
	mso-list-template-ids:-1149736148;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1018046636;
	mso-list-template-ids:-313483180;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I am looking for DSP# for FRU Schema that is current=
ly DMTF work in progress.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Paul, Ed, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I remember you mentioning that FRU schema is under r=
eview. Do you have the DSP# by any chance?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Yugi<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Michael.E.Brown@dell.com &lt;Michael.E.=
Brown@dell.com&gt;
<br>
<b>Sent:</b> Tuesday, May 15, 2018 8:35 AM<br>
<b>To:</b> ed.tanous@intel.com; openbmc@lists.ozlabs.org; Paul.Vancil@dell.=
com; hramasub@in.ibm.com; Balaji.B.Rao@dell.com; bradleyb@fuzziesquirrel.co=
m; pradeep.kumar36@tcs.com; rolfb@us.ibm.com; Chris Ong &lt;Chris.Ong@micro=
soft.com&gt;; Ali Larijani &lt;alirhas@microsoft.com&gt;;
 Yugi Mani &lt;yupalani@microsoft.com&gt;<br>
<b>Subject:</b> Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group w=
orking call<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Meeting minutes for 5/=
14</span><o:p></o:p></p>
</div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:0in;text-indent:-.25in;mso-list:l1 level1 lfo1">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:#1F497D"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0=
pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">Pavel presente=
d POC for implementing custom Redfish endpoints and attributes/properties<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;margin-left:0in;text-indent:-.25in;mso-list:l0 level1 lfo2">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:#1F497D"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0=
pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">DBUS based app=
roach where individual processes put custom Redfish interfaces on dbus and =
bmcweb notices them and adds them to the tree.<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;</span><o:p></o:=
p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">--</span><o:p></o:p></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Michael</span><o:p></o=
:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;</span><o:p></o:=
p></p>
</div>
<div>
<p class=3D"MsoNormal">-----Original Appointment-----<br>
<b>From:</b> Tanous, Ed [<a href=3D"mailto:ed.tanous@intel.com">mailto:ed.t=
anous@intel.com</a>]
<br>
<b>Sent:</b> Monday, April 16, 2018 12:40 PM<br>
<b>To:</b> Tanous, Ed; OpenBMC Maillist; Brown, Michael E; Vancil, Paul; Ha=
riharasubramanian Ramasubramanian; Rao, Balaji B; Brad Bishop; pradeep.kuma=
r36@tcs.com; rolfb@us.ibm.com; Chris.Ong@microsoft.com; alirhas@microsoft.c=
om; yupalani@microsoft.com<br>
<b>Subject:</b> OpenBMC Redfish working group working call<br>
<b>When:</b> Monday, May 14, 2018 2:00 PM-3:00 PM (UTC-08:00) Pacific Time =
(US &amp; Canada).<br>
<b>Where:</b> Skype Meeting<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a name=3D"BM_BEGIN"></a><a name=3D"BM__InsertRtfSav=
edPosition"></a><a name=3D"_InsertRtfSavedPosition"></a><span style=3D"font=
-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif">&nbsp;</span><o=
:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Due to the problems with Blue Jeans we had last week=
, and the fact that we don&#8217;t seem to use the video conference feature=
, lets switch back to Skype.&nbsp; Unfortunately, BlueJeans doesn&#8217;t g=
ive an easy way to send out cancelations, and my account
 is in a state of flux, <o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Description:<br>
Per meeting decision, this meeting invite is for the &#8220;OpenBMC Redfish=
 working group&#8221;. This<br>
working group will meet every Monday at 4pm CST and publish meeting minutes=
 to the mailing<br>
list. The working group is open to anybody who would like to participate in=
 development of<br>
Redfish on OpenBMC.<br>
&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><br>
Base agenda:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Call for opens<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Presentation of frameworks<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Discussion of Redfish on OpenBMC<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;color:#404040">......=
...........................................................................=
........................................................</span><o:p></o:p><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><a name=3D"OutJoinLink"></a><span style=3D"font-size=
:14.0pt;font-family:Wingdings;color:#0066CC">&agrave;</span><span style=3D"=
font-size:14.0pt;color:#0066CC">
<a href=3D"https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fmeet.intel.com%2Fed.tanous%2FSQH2DRH7&amp;data=3D02%7C01%7Cyupalani%40mi=
crosoft.com%7Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd0=
11db47%7C1%7C0%7C636619953187357226&amp;sdata=3D9ypBXFg7y2A3%2Fx2FSHf2fWTOJ=
ABSMuvMt2BAei21lz4%3D&amp;reserved=3D0">
<span style=3D"font-size:16.0pt">Join Skype Meeting</span></a></span><span =
style=3D"font-size:14.0pt;color:black">&nbsp;
</span><a name=3D"OutSharedNoteBorder"></a><span style=3D"font-size:14.0pt;=
color:#0066CC">&nbsp;&nbsp;
</span><a name=3D"OutSharedNoteLink"></a><o:p></o:p></p>
</div>
<div style=3D"margin-top:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Trouble Joining? <a=
 href=3D"https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fmeet.intel.com%2Fed.tanous%2FSQH2DRH7%3Fsl%3D1&amp;data=3D02%7C01%7Cyupala=
ni%40microsoft.com%7Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af91a=
b2d7cd011db47%7C1%7C0%7C636619953187367239&amp;sdata=3D8HcwfwNU5Vic9cFLmzKq=
vYi4VO05X%2BZvwnlHPEh6FeQ%3D&amp;reserved=3D0">
<span style=3D"color:#0066CC">Try Skype Web App</span></a><u> </u></span><o=
:p></o:p></p>
</div>
<div style=3D"margin-top:12.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:13.0pt">Join by phone</span=
><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"tel:&#43;1(916)356-2663%20(or%20your%20lo=
cal%20bridge%20access%20#) Choose bridge 5."><span style=3D"font-size:10.0p=
t;color:#0066CC">&#43;1(916)356-2663 (or your local bridge access #) Choose=
 bridge 5.</span></a><span style=3D"font-size:10.0pt">
 (Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; English (United States) </span><o:p></o:p></p>
</div>
<div style=3D"margin-top:2.0pt">
<p class=3D"MsoNormal"><a href=3D"https://na01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fdial.intel.com&amp;data=3D02%7C01%7Cyupalani%40mi=
crosoft.com%7Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd0=
11db47%7C1%7C0%7C636619953187367239&amp;sdata=3DO5OJe99iv9KPzApWfI7aj2kOoIn=
lAOLI%2BPhuLKqziSs%3D&amp;reserved=3D0"><span style=3D"font-size:10.0pt;col=
or:#0066CC">Find
 a local number</span></a> <o:p></o:p></p>
</div>
<div style=3D"margin-top:2.0pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div style=3D"margin-top:2.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Conference ID: 2055=
76574</span><o:p></o:p></p>
</div>
<div style=3D"margin-top:2.0pt">
<p class=3D"MsoNormal"><a href=3D"https://na01.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Fdial.intel.com&amp;data=3D02%7C01%7Cyupalani%40mi=
crosoft.com%7Ce22ddc99a41b4c35429808d5ba797578%7C72f988bf86f141af91ab2d7cd0=
11db47%7C1%7C0%7C636619953187377247&amp;sdata=3DBjPZggjvZ0XbugnpPrRDNksMtBy=
RRN6cdjzPSlB8ZaU%3D&amp;reserved=3D0"><span style=3D"font-size:10.0pt;color=
:#0066CC">Forgot
 your dial-in PIN?</span></a><span style=3D"font-size:3.0pt"> </span>|<a hr=
ef=3D"https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fo1=
5.officeredir.microsoft.com%2Fr%2FrlidLync15%3Fclid%3D1033%26p1%3D5%26p2%3D=
2009&amp;data=3D02%7C01%7Cyupalani%40microsoft.com%7Ce22ddc99a41b4c35429808=
d5ba797578%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C636619953187387255&=
amp;sdata=3DPkk8BwwbOeJq8J%2BAXNgFNJtu13yJEalYFhQEKaWVfdY%3D&amp;reserved=
=3D0"><span style=3D"font-size:10.0pt;color:#0066CC">Help</span></a><span s=
tyle=3D"font-size:3.0pt">&nbsp;&nbsp;&nbsp;&nbsp;
</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><sub><span style=3D"font-size:8.0pt;color:#CFCFCF">[=
!OC([1033])!]</span></sub><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;color:#404040">......=
...........................................................................=
........................................................</span><o:p></o:p><=
/p>
</div>
<div style=3D"margin-top:10.0pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_MWHPR21MB086447F0749C77694C01B331D6910MWHPR21MB0864namp_--
