Return-Path: <maheswari.a@atos.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=atos.net
 (client-ip=193.56.114.164; helo=smtppost.atos.net;
 envelope-from=maheswari.a@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=atos.net
Received: from smtppost.atos.net (smtppost.atos.net [193.56.114.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43BzRy046TzDrfW
 for <openbmc@lists.ozlabs.org>; Sun,  9 Dec 2018 06:10:01 +1100 (AEDT)
Received: from mail2-ext.my-it-solutions.net (mail2-ext.my-it-solutions.net)
 by smarthost1.atos.net with smtp
 (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
 id 6269_1511_e225a17f_189b_469f_bf06_2c658cca3e42;
 Sat, 08 Dec 2018 20:09:56 +0100
Received: from mail1-int.my-it-solutions.net ([10.92.32.11])
 by mail2-ext.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id wB8J9tF9011923
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sat, 8 Dec 2018 20:09:55 +0100
Received: from DEERLM99ETXMSX.ww931.my-it-solutions.net ([10.86.142.46])
 by mail1-int.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id wB8J9tpP029855
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Sat, 8 Dec 2018 20:09:55 +0100
Received: from DEFTHW99ETRMSX.ww931.my-it-solutions.net (10.86.142.99) by
 DEERLM99ETXMSX.ww931.my-it-solutions.net (10.86.142.46) with Microsoft SMTP
 Server (TLS) id 14.3.408.0; Sat, 8 Dec 2018 20:09:55 +0100
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (10.86.142.137)
 by hybridsmtp.it-solutions.atos.net (10.86.142.99) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sat, 8 Dec 2018 20:09:51 +0100
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com (20.177.195.218) by
 DB7PR02MB3900.eurprd02.prod.outlook.com (20.176.237.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.20; Sat, 8 Dec 2018 19:09:44 +0000
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::d8e4:2dfd:19f5:1b93]) by DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::d8e4:2dfd:19f5:1b93%4]) with mapi id 15.20.1404.023; Sat, 8 Dec 2018
 19:09:43 +0000
From: "A, Maheswari" <maheswari.a@atos.net>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Help: Host powered ON and after seconds Host Power OFF script is
 started.
Thread-Topic: Help: Host powered ON and after seconds Host Power OFF script is
 started.
Thread-Index: AdSPKSqgkpWJpBkuRN+sti0pzv2s3A==
Date: Sat, 8 Dec 2018 19:09:43 +0000
Message-ID: <DB7PR02MB43933CFF8148D4AEA9328D3E92AB0@DB7PR02MB4393.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maheswari.a@atos.net; 
x-originating-ip: [103.43.203.195]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR02MB3900;
 6:+DqnfVnQS+wNe2zsGSsuZbEWOaOlsa/uxk4sZJHMQWn19BtyWJ3HQynn5wNskM77IOgcyahLyEABx6L3NEPbMJhfyC6okDtMMXFnXol916jeguiR6jZnQrteGxxVlJcxaz9Jor7Qzg84iY25HCiSd9joc7Pq0IliRHxNJlRXDtXgISkWW0LxUCy9UuKr6bm7UHcvG3RUScLqeZGC32bPVHrO883NpM7jJMSB98bkKv6re7OxCUIMY3ZeO7Zwj4FDyTX+zGx2o+dbVi7/+0TY6b8UHKPqAFM0tauh6jJkockMP5WGWvzeqzMZY2vFpKPtye5uwUfCMDStuz/tuhcAA3aS+0v60HUXtHd40wCJikbFJFF9B4nGkjwec/oT6N5yjOmDO+8HMiLZxH1aNC+E6k/Np0sS8aBr5bEWCFZJ57L/OZI9OlM3R32vkx2GsiySs7b+/yGTsWA/HIckeoV+5w==;
 5:v3hDkUEcuLJgT2DMnz65lUYhbgcNKj1/Th8P9sLuPmSIqKm5264T+7kiX3RpsZqXN5TtTPD8Wb1BYf4wXdErIyD9tZPTxcu4sWAxc3eY4naYQ8Xc3s+nB9UB5HJYCEiJxY6AZPkaCrIR2SlKVcat2lmu0AifZjVPUmbo90ZPsio=;
 7:A90+BPK2VrkZ+R+eN7NGu87mtSBg/FAdDDvT4SqEz4edX02Sp9knFCxtismfKkZel/AfWaXJaWIYY8B7+pGdQaa1i35bcXjGt+3mJPWfhohZ+EgCdT+vgylGMOJartPhQn+b9F3w3wK/FJPQ9Mqfpg==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 7588ef88-06ea-4e77-6600-08d65d40b66a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:DB7PR02MB3900; 
x-ms-traffictypediagnostic: DB7PR02MB3900:
x-microsoft-antispam-prvs: <DB7PR02MB39000E9B1FCC722AD549908992AB0@DB7PR02MB3900.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
 SRVR:DB7PR02MB3900; BCL:0; PCL:0; RULEID:; SRVR:DB7PR02MB3900; 
x-forefront-prvs: 0880FB6EC1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(376002)(39860400002)(366004)(396003)(199004)(189003)(14454004)(68736007)(106356001)(105586002)(97736004)(486006)(6116002)(790700001)(3846002)(7696005)(86362001)(26005)(14444005)(256004)(6506007)(102836004)(6916009)(99286004)(6436002)(316002)(476003)(551934003)(54896002)(53936002)(55016002)(9326002)(25786009)(6306002)(9686003)(7736002)(33656002)(81156014)(8676002)(71190400001)(71200400001)(81166006)(5660300001)(186003)(478600001)(74316002)(66066001)(8936002)(2906002)(460985005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB7PR02MB3900;
 H:DB7PR02MB4393.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: atos.net does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: YfP9WWG2HpBVPqVmQue3u+v1kGcmBmceu8RJeWmGf0DlTfck+amIuvBreHfjX56xRuhc/q2j2T9JzmXXtkcgJ7x8vf+qTUdygU5DxrLUDpKBIbXS42sDBq+O2Z3FnzaaZvH1S6r7diJ3CJe5XaWPhCeqbhPkXliZAynKaff63Ll2P/23mcQBTB+ceFY9M2o8c4fLgAxZif0pGWSsTq5hPdvmD6zvWtu21Xrmx4VHfYcIzDMYVD39u6OdQn+dK+/b6h5CxpN/kwhBqK5t1DTjop3o3nGvM8GGnrMa02+8cQgq3ft6vVInfjm2CuQPtf+2J98GVVfhh5wiCj9LkiMJpvoZxsAnXTh62GmuGnbXJUk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB7PR02MB43933CFF8148D4AEA9328D3E92AB0DB7PR02MB4393eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7588ef88-06ea-4e77-6600-08d65d40b66a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2018 19:09:43.7839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB3900
X-OriginatorOrg: atos.net
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
X-List-Received-Date: Sat, 08 Dec 2018 19:10:08 -0000

--_000_DB7PR02MB43933CFF8148D4AEA9328D3E92AB0DB7PR02MB4393eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I had basic understanding of below processes and its dependency in openbmc.

button_power.exe
power_control.exe ( without timeout and interval for GPIO Pgood pin polling=
 ).
Chassis_control.py
System_manager.py ( which is again depends on skeleton/configs/Platform.py.
                                       In my case I have created one dummy =
Platform.py by referring existing openbmc platform).

Issues is observed in below two scenarios:

  1.  Whenever I am pressing power button.
  2.  Whenever sending REST command to Power On the Host. (RequestedHostTra=
nsition --> ON).

Issue:

    In both scenarios I am able to power on the host, But We are getting wa=
tchdog Timeout and,
   after some time target is reached quiesce state, and Host power OFF scri=
pt is also started Running.
   (Linked host-poweroff script in  obmc-host-stop.target.requires ).

    Also phosphor-state-manager is always getting Host state as HOST_STATE_=
QUIESCE_TGT in sysStateChange() functionality.



  1.  What are all the process is responsible to send Host state signal as =
quiesce to phosphor-host-state-manager. ?.
  2.  If phosphor-watchdog or system_manager is responsible.Please let us k=
now clear view of understanding.
  3.  In our platform, We are not using BOOTCOUNT sensor concept as initial=
 phase.

Please refer short journal log:
Nov 09 05:38:04 HOSTNAME phosphor-watchdog[1338]: Timer Expired
Nov 09 05:38:04 HOSTNAME systemd-journald[640]: Forwarding to syslog missed=
 11 messages.
Nov 09 05:38:04 HOSTNAME phosphor-watchdog[1338]: watchdog: Timed out
Nov 09 05:38:04 HOSTNAMEi systemd[1]: Created slice system-op\x2docc\x2ddis=
able.slice.
Nov 09 05:38:04 HOSTNAME systemd[1]: Detaching egress BPF program from cgro=
up failed: Invalid argument
Nov 09 05:38:04 HOSTNAME systemd[1]: Starting OpenPOWER OCC Active Disable.=
..
Nov 09 05:38:04 HOSTNAME systemd[1]: Reached target Quiesce Target.
Nov 09 05:38:04 HOSTNAME systemd[1]: Stopping Phosphor poweron watchdog...
Nov 09 05:38:04 HOSTNAME systemd[1]: Stopped Phosphor poweron watchdog.
Nov 09 05:38:04 HOSTNAME phosphor-host-state-manager[1215]: Auto reboot ena=
bled, rebooting
Nov 09 05:38:04 HOSTNAME phosphor-host-state-manager[1215]: Beginning reboo=
t...
Nov 09 05:38:04 HOSTNAME phosphor-host-state-manager[1215]: Host State tran=
saction request

Thanks
Maheswari A

--_000_DB7PR02MB43933CFF8148D4AEA9328D3E92AB0DB7PR02MB4393eurp_
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
@font-face
	{font-family:"Calibri Light";
	panose-1:2 15 3 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Arial Unicode MS";
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"\@Arial Unicode MS";
	panose-1:2 11 6 4 2 2 2 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:803473414;
	mso-list-type:hybrid;
	mso-list-template-ids:68707086 1951446436 1074331673 1074331675 1074331663=
 1074331673 1074331675 1074331663 1074331673 1074331675;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:28.5pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:64.5pt;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:100.5pt;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:136.5pt;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:172.5pt;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:208.5pt;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:244.5pt;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:280.5pt;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:316.5pt;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:1250429227;
	mso-list-type:hybrid;
	mso-list-template-ids:150498628 1074331663 1074331673 1074331675 107433166=
3 1074331673 1074331675 1074331663 1074331673 1074331675;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2
	{mso-list-id:1352225124;
	mso-list-type:hybrid;
	mso-list-template-ids:237827062 -468663140 1074331673 1074331675 107433166=
3 1074331673 1074331675 1074331663 1074331673 1074331675;}
@list l2:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:28.5pt;
	text-indent:-18.0pt;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:64.5pt;
	text-indent:-18.0pt;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:100.5pt;
	text-indent:-9.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:136.5pt;
	text-indent:-18.0pt;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:172.5pt;
	text-indent:-18.0pt;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:208.5pt;
	text-indent:-9.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:244.5pt;
	text-indent:-18.0pt;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:280.5pt;
	text-indent:-18.0pt;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:316.5pt;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I had basic understanding of below processes and its=
 dependency in openbmc.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">button_power.exe <o:p></o:p></p>
<p class=3D"MsoNormal">power_control.exe ( without timeout and interval for=
 GPIO Pgood pin polling ).
<o:p></o:p></p>
<p class=3D"MsoNormal">Chassis_control.py <o:p></o:p></p>
<p class=3D"MsoNormal">System_manager.py ( <span style=3D"font-family:&quot=
;Calibri Light&quot;,sans-serif">
which is again depends on skeleton/configs/Platform.py.<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri Light&quot;=
,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &nbsp;In my case I have created one dummy Platform.py by referri=
ng existing openbmc platform</span>).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>Issues is observed in below two scenarios:<o:p></=
o:p></b></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l1 level1 =
lfo1">Whenever I am pressing power button.
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso=
-list:l1 level1 lfo1">Whenever sending REST command to Power On the Host. (=
RequestedHostTransition
<span style=3D"font-family:Wingdings">&agrave;</span> ON). <o:p></o:p></li>=
</ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>Issue:<o:p></o:p></b></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;In both scenarios I am able =
to power on the host, But We are getting watchdog Timeout and,<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp; after some time target is reached quies=
ce state, and Host power OFF script is also started Running.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;(Linked host-poweroff script in &n=
bsp;obmc-host-stop.target.requires ). &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;Also phosphor-state-manager =
is always getting Host state as
<span style=3D"font-size:9.0pt;font-family:Consolas;color:#24292E;backgroun=
d:white">
HOST_STATE_QUIESCE_TGT in sysStateChange() </span>functionality.<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#24292E;background:white"><o:p>&nbsp;</o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"color:#24292E;margin-left:-7.5pt;ms=
o-list:l2 level1 lfo3">
<span style=3D"font-size:9.0pt;font-family:Consolas;background:white">What =
are all the process is responsible to send Host state signal as quiesce to =
phosphor-host-state-manager. ?.<o:p></o:p></span></li><li class=3D"MsoListP=
aragraph" style=3D"color:#24292E;margin-left:-7.5pt;mso-list:l2 level1 lfo3=
">
<span style=3D"font-size:9.0pt;font-family:Consolas;background:white">If ph=
osphor-watchdog or system_manager is responsible.Please let us know clear v=
iew of understanding.
<o:p></o:p></span></li><li class=3D"MsoListParagraph" style=3D"color:#24292=
E;margin-left:-7.5pt;mso-list:l2 level1 lfo3">
<span style=3D"font-size:9.0pt;font-family:Consolas;background:white">In ou=
r platform, We are not using BOOTCOUNT sensor concept as initial phase.
<o:p></o:p></span></li></ol>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Consolas;=
color:#24292E;background:white">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b>Please refer short journal log: <o:p></o:p></b></=
p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAME phosphor-watchdog[1338]: Ti=
mer Expired<o:p></o:p></p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAME systemd-journald[640]: Forw=
arding to syslog missed 11 messages.<o:p></o:p></p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAME phosphor-watchdog[1338]: wa=
tchdog: Timed out<o:p></o:p></p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAMEi systemd[1]: Created slice =
system-op\x2docc\x2ddisable.slice.<o:p></o:p></p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAME systemd[1]: Detaching egres=
s BPF program from cgroup failed: Invalid argument<o:p></o:p></p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAME systemd[1]: Starting OpenPO=
WER OCC Active Disable...<o:p></o:p></p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAME systemd[1]: Reached target =
Quiesce Target.<o:p></o:p></p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAME systemd[1]: Stopping Phosph=
or poweron watchdog...<o:p></o:p></p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAME systemd[1]: Stopped Phospho=
r poweron watchdog.<o:p></o:p></p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAME phosphor-host-state-manager=
[1215]: Auto reboot enabled, rebooting<o:p></o:p></p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAME phosphor-host-state-manager=
[1215]: Beginning reboot...<o:p></o:p></p>
<p class=3D"MsoNormal">Nov 09 05:38:04 HOSTNAME phosphor-host-state-manager=
[1215]: Host State transaction request<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
<p class=3D"MsoNormal">Maheswari A<o:p></o:p></p>
</div>
</body>
</html>

--_000_DB7PR02MB43933CFF8148D4AEA9328D3E92AB0DB7PR02MB4393eurp_--
