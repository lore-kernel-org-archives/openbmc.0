Return-Path: <prvs=9997835735=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=9997835735=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="aiJugwnV"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="F82pnCI9"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZspQ2W69zDqCw
 for <openbmc@lists.ozlabs.org>; Fri,  5 Apr 2019 06:05:13 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x34J36mq023818; Thu, 4 Apr 2019 12:04:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=CftoqKS4AUNWD7hp8WyKNqN2ssNG0JDAyDS9elvfZjs=;
 b=aiJugwnVHy+bBQenDDmfP6JR/rMYw3Zv5IZR35ytuOwAs1+uucqSDbVbdP0f5sahPUQq
 qsGgB3GtrC5HrbgIjLMWzZEhR8KXEC8YQ4rfyEYecD/ZnEUxf8NBmZ+K3Np7Y+bwicfz
 bZISIf4g2NKVF8sIPuKQZIeWkT45XuAHF7k= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rnq6784ru-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 04 Apr 2019 12:04:09 -0700
Received: from frc-hub04.TheFacebook.com (2620:10d:c021:18::174) by
 frc-hub06.TheFacebook.com (2620:10d:c021:18::176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 4 Apr 2019 12:03:49 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.74) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 4 Apr 2019 12:03:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CftoqKS4AUNWD7hp8WyKNqN2ssNG0JDAyDS9elvfZjs=;
 b=F82pnCI98JaMmOCMPAlizxvK2yKmrL0ikFfj+ey7vexcxq/TQsQWqzfA2yTFGJizD9JyodjESK8Eb5rSl5lFnrDugatBqQaVS3thc/jlSiIAmGEhPXLz1NgkzzC5JzGHsyTSwSPd/pc0uI9M8/7VFO1M3QeKNXDhtRGj58BSc7I=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1206.namprd15.prod.outlook.com (10.172.182.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.20; Thu, 4 Apr 2019 19:03:48 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1750.017; Thu, 4 Apr 2019
 19:03:48 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: James Feist <james.feist@linux.intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: persistent storage
Thread-Topic: persistent storage
Thread-Index: AQHU6nVFORxGSnW7j0C0dlMlVs4xQ6YrFsoAgAFGLwo=
Date: Thu, 4 Apr 2019 19:03:48 +0000
Message-ID: <CY4PR15MB12697696CB8B09CD7AB468BBDD500@CY4PR15MB1269.namprd15.prod.outlook.com>
References: <7D170914-3A20-47F5-A66D-774B51CFF076@fb.com>,
 <a0f97d7f-5b12-ae60-efde-1294dfaeef30@linux.intel.com>
In-Reply-To: <a0f97d7f-5b12-ae60-efde-1294dfaeef30@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:23ea]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 552484cd-ac3b-43b7-5410-08d6b930451c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR15MB1206; 
x-ms-traffictypediagnostic: CY4PR15MB1206:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR15MB1206970B127C870EB25C1599DD500@CY4PR15MB1206.namprd15.prod.outlook.com>
x-forefront-prvs: 0997523C40
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(39860400002)(366004)(376002)(136003)(189003)(199004)(186003)(81156014)(74316002)(81166006)(4744005)(7736002)(256004)(25786009)(8676002)(54896002)(6506007)(86362001)(5660300002)(33656002)(9686003)(6306002)(8936002)(105586002)(236005)(53546011)(3480700005)(106356001)(102836004)(71190400001)(46003)(316002)(486006)(11346002)(221733001)(446003)(229853002)(52536014)(606006)(53936002)(110136005)(2906002)(19627405001)(105004)(6116002)(14454004)(68736007)(6246003)(966005)(55016002)(71200400001)(7696005)(7116003)(76176011)(476003)(478600001)(97736004)(99286004)(6436002)(111123002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1206;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cLhvmutkZadAwblC9h8WR0T2kWksyZ760ROaUTNsvtd6pKxL5IgqM3Bb6mDtS/yaZqRDID/xSdvz+Li3YsFCaE9m8yt+Lc8vcy5D0kvKRM8F1ASVnaS95QIoHeKNAz5fx5i/8BfNSOIANBqYXDfzoY+Bvwy3IRIrwZPVxa0Q19ktTB19D5zvo8nbuiXvk5zWy7jGclUygf/B3qJJGOsXC1fb/zqdJaqiqpPbRg5WM1rZVzy45Hd6ida819KTxHiyWsHH1yzrHojTrx6n4Kqs0n+Y1UakLh6KhPYudWi3nIfM+yXiUEOQkYn8HR53Y4Y6aEm/j7erXRkKSbPlPGZwEyx+s9uP8N8Jx+KwJw1oyQB6VAWc5ClwLy9cIrPKOKCER4HdqM335Bn9IV9Jt2zfY2M7pcjTWaqGRDGYxkb7q+w=
Content-Type: multipart/alternative;
 boundary="_000_CY4PR15MB12697696CB8B09CD7AB468BBDD500CY4PR15MB1269namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 552484cd-ac3b-43b7-5410-08d6b930451c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2019 19:03:48.7966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1206
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-04_10:, , signatures=0
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
X-List-Received-Date: Thu, 04 Apr 2019 19:05:19 -0000

--_000_CY4PR15MB12697696CB8B09CD7AB468BBDD500CY4PR15MB1269namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

 James,
Are you using it? or can you please point me to its usage.

Regards
-Vijay
On 4/3/19 4:30 PM, Vijay Khemka wrote:
> Hi,
>
> How are we storing persistent data in openbmc. Any data like Bios
> version or something we need to save across reboot.
>

A mix of settingsd https://github.com/openbmc/phosphor-settingsd and
application specific persistence.

-James


> Regards
>
> -Vijay
>

--_000_CY4PR15MB12697696CB8B09CD7AB468BBDD500CY4PR15MB1269namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;James,<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Are you using it? or can you please point me to its usage.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
-Vijay</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On 4/3/19 4:30 PM, Vijay Khemka wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; How are we storing persistent data in openbmc. Any data like Bios <br>
&gt; version or something we need to save across reboot.<br>
&gt; <br>
<br>
A mix of settingsd <a href=3D"https://github.com/openbmc/phosphor-settingsd=
">https://github.com/openbmc/phosphor-settingsd</a> and
<br>
application specific persistence.</div>
<div class=3D"PlainText"><br>
-James<br>
<br>
<br>
&gt; Regards<br>
&gt; <br>
&gt; -Vijay<br>
&gt; <br>
</div>
</span></font></div>
</body>
</html>

--_000_CY4PR15MB12697696CB8B09CD7AB468BBDD500CY4PR15MB1269namp_--
