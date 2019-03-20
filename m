Return-Path: <sboylan@ircona.com>
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur03-ve1-obe.outbound.protection.outlook.com
 (client-ip=40.107.5.102; helo=eur03-ve1-obe.outbound.protection.outlook.com;
 envelope-from=sboylan@ircona.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ircona.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Ircona.onmicrosoft.com header.i=@Ircona.onmicrosoft.com
 header.b="dXYWyRcs"; dkim-atps=neutral
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50102.outbound.protection.outlook.com [40.107.5.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Pc0l4wZPzDqBv
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 04:12:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Ircona.onmicrosoft.com; s=selector1-ircona-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9vhsZE6WqNAJUBUMMLvc5+KQcBkWdXAPU8pIRHyJuE=;
 b=dXYWyRcszZ8tAUF7k6VWX1P1CFyyN311YUZ14I4uotVsDle/NnBtYwZb+RXKPMIPnwTTDNXX7Kv0nYyw6ghlHWwgTBZZsSMNqWsyLpP4X+ZIzcqJ+rHDXJ5M+49iHMIsJZg4+B5koCJC/OCnjExOOvpFPO8YmGbjkPmuGYkSAfc=
Received: from AM0PR04MB5218.eurprd04.prod.outlook.com (20.176.215.146) by
 AM0PR04MB4227.eurprd04.prod.outlook.com (52.134.94.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.15; Wed, 20 Mar 2019 17:11:58 +0000
Received: from AM0PR04MB5218.eurprd04.prod.outlook.com
 ([fe80::7424:ea7f:a81f:6081]) by AM0PR04MB5218.eurprd04.prod.outlook.com
 ([fe80::7424:ea7f:a81f:6081%2]) with mapi id 15.20.1709.015; Wed, 20 Mar 2019
 17:11:58 +0000
From: Stephen Boylan <sboylan@ircona.com>
To: "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>
Subject: A few questions regarding porting to a new board
Thread-Topic: A few questions regarding porting to a new board
Thread-Index: AdTfOxztqoK8oVi6RauB3XttgWLlqA==
Date: Wed, 20 Mar 2019 17:11:57 +0000
Message-ID: <AM0PR04MB5218E40914AEB17922205F60C9410@AM0PR04MB5218.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sboylan@ircona.com; 
x-originating-ip: [87.198.164.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54c2e512-3f28-4096-1c9c-08d6ad5728f3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:AM0PR04MB4227; 
x-ms-traffictypediagnostic: AM0PR04MB4227:
x-microsoft-antispam-prvs: <AM0PR04MB4227E4D65EE5313B1DA2C3E9C9410@AM0PR04MB4227.eurprd04.prod.outlook.com>
x-forefront-prvs: 098291215C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(346002)(366004)(39830400003)(136003)(189003)(199004)(53754006)(86362001)(6306002)(54896002)(81156014)(97736004)(81166006)(53936002)(508600001)(8676002)(316002)(9686003)(5660300002)(14454004)(6436002)(486006)(7736002)(71190400001)(55016002)(71200400001)(476003)(6916009)(8936002)(68736007)(66066001)(102836004)(2906002)(105586002)(106356001)(6506007)(25786009)(6116002)(256004)(33656002)(3846002)(790700001)(7696005)(52536014)(74316002)(186003)(26005)(99286004)(14444005)(491001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR04MB4227;
 H:AM0PR04MB5218.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: ircona.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vguPnTsV819+A3OfQySLkFRKCO266cJgUFqBJYN+Ou9R1VAnBSuoiGEJEw7TuKR/3tiFZd3VFJcjRqUNpyAzXCwmS4RfApTh4X6/NIuvh3sxxJ9nFo/dy8M+QOK6NwAo62viJv0NkZ8hgM1UwCI9chVamLiaAUcZ7gHWeV28yPlLMq6+ncobXFzPj3q7osWrMkB8yp5oIrIr8gTpId+/O7bgh82A0jDOyxYNEQ65zeSJec64Hz0c0y3kcwNjyjldOz0nLKG1vObwTeew/+HhNR2JwPl9NOqmVm+YzXRfzlyJWrG0JkyhcaWygo0kzPjcMf/TjUJjdCIfumnnauBDZEWpIycmVuB67/+PLwi+oG1caUZUujeC3IcujQOaNQSdJSCh0S3Q8mjdnf4JXSB6aFND6FOZ5X+Tye8jZwoRWQg=
Content-Type: multipart/alternative;
 boundary="_000_AM0PR04MB5218E40914AEB17922205F60C9410AM0PR04MB5218eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ircona.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c2e512-3f28-4096-1c9c-08d6ad5728f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2019 17:11:57.8583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b5c9eba5-d9aa-4fea-9ead-d4e7d7f623f9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4227
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
X-List-Received-Date: Wed, 20 Mar 2019 17:12:09 -0000

--_000_AM0PR04MB5218E40914AEB17922205F60C9410AM0PR04MB5218eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

I've been looking at OpenBMC for the last week or so and I'm in the process=
 of porting it to a new board based on an AST2500. I've been onto a few peo=
ple with some questions on the IRC, but I figured for these few that this w=
ould be a better location.

I've been using the meta-evb/meta-ast2500/ as a basis as the board uses tha=
t BMC.

So far I've been able to figure out

  *   Include the phosphor-webui package
  *   Configure the identify LED to toggle on and off through the web-ui an=
d also a button on the board

Here are some issues I've run into and I'm wondering if anyone has any answ=
ers or tips they could help out with.


I've been trying to set up some GPIOs and I was able to add LED and GPIO Ke=
ys, but I'm having trouble with power related pins. I added a gpio_defs.jso=
n file and tried a rebuild but noticed that it wasn't ending up in the targ=
et rootfs. I noticed then that by including conf/machine/include/openpower.=
inc in my machine.conf file that it would.

  *   Is the workbook still a requirement? Do I need to make a .py file as =
my workbook? Is there one location where all GPIOs should be defined or are=
 they separated out into different services now?
  *   Should conf/machine/include/openpower.inc be the first thing to add t=
o a machine.conf file or is it better to select the features manually?
     *   Are there any default configurations that are needed in new machin=
es? From looking at a few different ones (ast2500/Romulus/etc) there doesn'=
t seem to me to be a standard structure.

From what I can tell I have phosphor-state-manager included in my build, bu=
t obmcutil is not present. Is there a way to verify that I'm using the corr=
ect phosphor-state-manager and to include obmcutil?

  *   As mentioned I don't currently have a workbook. I've noticed that not=
hing seems to be happening when I try power on the system. Is that because =
of the lack of a workbook?

I'd really appreciate any guidelines or assistance and I appreciate what he=
lp I have gotten so far on IRC.

Regards,
Stephen Boylan

--_000_AM0PR04MB5218E40914AEB17922205F60C9410AM0PR04MB5218eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
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
	{mso-list-id:271330415;
	mso-list-type:hybrid;
	mso-list-template-ids:-1763656080 403243009 403243011 403243013 403243009 =
403243011 403243013 403243009 403243011 403243013;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:714814154;
	mso-list-type:hybrid;
	mso-list-template-ids:1052672110 403243009 403243011 403243013 403243009 4=
03243011 403243013 403243009 403243011 403243013;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l2
	{mso-list-id:1244293920;
	mso-list-type:hybrid;
	mso-list-template-ids:-93008054 403243009 403243011 403243013 403243009 40=
3243011 403243013 403243009 403243011 403243013;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l3
	{mso-list-id:1250966617;
	mso-list-type:hybrid;
	mso-list-template-ids:-1231911700 403243009 403243011 403243013 403243009 =
403243011 403243013 403243009 403243011 403243013;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l3:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l3:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l3:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l3:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l3:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l3:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l3:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l3:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l4
	{mso-list-id:1365591584;
	mso-list-type:hybrid;
	mso-list-template-ids:461400256 403243009 403243011 403243013 403243009 40=
3243011 403243013 403243009 403243011 403243013;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l4:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l4:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l4:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l4:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l4:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l4:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l4:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l4:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l5
	{mso-list-id:1476022825;
	mso-list-type:hybrid;
	mso-list-template-ids:1168388688 403243009 403243011 403243013 403243009 4=
03243011 403243013 403243009 403243011 403243013;}
@list l5:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l5:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l5:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l5:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l5:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l5:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l5:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l5:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l5:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l6
	{mso-list-id:2140687458;
	mso-list-type:hybrid;
	mso-list-template-ids:905591728 403243009 403243011 403243013 403243009 40=
3243011 403243013 403243009 403243011 403243013;}
@list l6:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l6:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l6:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l6:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l6:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l6:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l6:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l6:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l6:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
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
<body lang=3D"EN-IE" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello all, <br>
<br>
I&#8217;ve been looking at OpenBMC for the last week or so and I&#8217;m in=
 the process of porting it to a new board based on an AST2500. I&#8217;ve b=
een onto a few people with some questions on the IRC, but I figured for the=
se few that this would be a better location.
<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
I&#8217;ve been using the meta-evb/meta-ast2500/ as a basis as the board us=
es that BMC.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So far I&#8217;ve been able to figure out<o:p></o:p>=
</p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l1 level1 =
lfo1">Include the phosphor-webui package
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso=
-list:l1 level1 lfo1">Configure the identify LED to toggle on and off throu=
gh the web-ui and also a button on the board<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here are some issues I&#8217;ve run into and I&#8217=
;m wondering if anyone has any answers or tips they could help out with.
<o:p></o:p></p>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;ve been trying to set up some GPIOs and I wa=
s able to add LED and GPIO Keys, but I&#8217;m having trouble with power re=
lated pins. I added a gpio_defs.json file and tried a rebuild but noticed t=
hat it wasn&#8217;t ending up in the target rootfs.
 I noticed then that by including conf/machine/include/openpower.inc in my =
machine.conf file that it would.
<o:p></o:p></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo6">Is the workbook still a requirement? Do I need to make a .py file as =
my workbook? Is there one location where all GPIOs should be defined or are=
 they separated out into different services
 now?<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0c=
m;mso-list:l0 level1 lfo6">Should conf/machine/include/openpower.inc be the=
 first thing to add to a machine.conf file or is it better to select the fe=
atures manually?<o:p></o:p></li><ul style=3D"margin-top:0cm" type=3D"circle=
">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level2 =
lfo6">Are there any default configurations that are needed in new machines?=
 From looking at a few different ones (ast2500/Romulus/etc) there doesn&#82=
17;t seem to me to be a standard structure.<o:p></o:p></li></ul>
</ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">From what I can tell I have phosphor-state-manager i=
ncluded in my build, but obmcutil is not present. Is there a way to verify =
that I&#8217;m using the correct phosphor-state-manager and to include obmc=
util?
<o:p></o:p></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l6 level1 =
lfo7">As mentioned I don&#8217;t currently have a workbook. I&#8217;ve noti=
ced that nothing seems to be happening when I try power on the system. Is t=
hat because of the lack of a workbook?<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;d really appreciate any guidelines or assist=
ance and I appreciate what help I have gotten so far on IRC.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<br>
Stephen Boylan<o:p></o:p></p>
</div>
</body>
</html>

--_000_AM0PR04MB5218E40914AEB17922205F60C9410AM0PR04MB5218eurp_--
