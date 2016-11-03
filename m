Return-Path: <william.bjlinan@hotmail.com>
X-Greylist: delayed 311 seconds by postgrey-1.36 at bilbo;
 Fri, 04 Nov 2016 03:57:35 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b=ulMAUev8; 
 dkim-atps=neutral
Received: from SNT004-OMC3S28.hotmail.com (snt004-omc3s28.hotmail.com
 [65.55.90.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8rk75mLDzDvRR
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 03:57:35 +1100 (AEDT)
Received: from APC01-PU1-obe.outbound.protection.outlook.com ([65.55.90.135])
 by SNT004-OMC3S28.hotmail.com over TLS secured channel with Microsoft
 SMTPSVC(7.5.7601.23008); Thu, 3 Nov 2016 09:52:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=TiM6FoyQEjlJ6qs/GjrCRl5Y5XNpoYO9SXK/+CsSC5w=;
 b=ulMAUev86XjaKBB8PUjFSAmHQJAL1ueI7yCZX4X9pN5eSjhJZaNlIIcFLPDTwkTiW/oeUdZB0XYtf6EDIeuK7T74EyKtr8qq/5eiX4cTpUd87CscbTL0+cNJyEW4dZxJKQ1AJIc87+0wE62PnpCXb3OGHnuZjnM1iIvk8C5HegJUNlZb87xv4685fmc61e3w63hsHEzk12p8eJUoGE4ddB2yak/wIZ5kKkkLHDrIfEj+TQWh3/F6StmesjOK0GvxIk9Zj4sQmhFxHSRa9yEWkruT9zO2reqDxvSJsHG+L98q9uqzZNpxzYlHpHZ9vc8Q7d8b7q1nwDhrggjfxlidEA==
Received: from SG2APC01FT133.eop-APC01.prod.protection.outlook.com
 (10.152.250.54) by SG2APC01HT095.eop-APC01.prod.protection.outlook.com
 (10.152.251.165) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.679.5; Thu, 3 Nov
 2016 16:52:18 +0000
Received: from TY1PR06MB0863.apcprd06.prod.outlook.com (10.152.250.52) by
 SG2APC01FT133.mail.protection.outlook.com (10.152.250.191) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.679.5 via Frontend
 Transport; Thu, 3 Nov 2016 16:52:17 +0000
Received: from TY1PR06MB0863.apcprd06.prod.outlook.com ([10.164.99.139]) by
 TY1PR06MB0863.apcprd06.prod.outlook.com ([10.164.99.139]) with mapi id
 15.01.0693.016; Thu, 3 Nov 2016 16:52:18 +0000
From: Li Nan <william.bjlinan@hotmail.com>
To: tomjose <tomjose@linux.vnet.ibm.com>, Patrick Williams
 <patrick@stwcx.xyz>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Need some help on IPMI Get Self Test Result command
Thread-Topic: Need some help on IPMI Get Self Test Result command
Thread-Index: AQHSNfEM5gC289RFWkmMl8Z/Y5uViw==
Date: Thu, 3 Nov 2016 16:52:18 +0000
Message-ID: <TY1PR06MB0863CF6D1F000A28E716CFA4F6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
Accept-Language: en-US, en-GB, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none;linux.vnet.ibm.com; dmarc=none action=none
 header.from=hotmail.com;
x-incomingtopheadermarker: OriginalChecksum:; UpperCasedChecksum:;
 SizeAsReceived:7134; Count:35
x-tmn: [xMH5TeZT/OaJ5x98KHQ9sk1rm8nRSo5a]
x-incomingheadercount: 35
x-eopattributedmessage: 0
x-microsoft-exchange-diagnostics: 1; SG2APC01HT095;
 6:V7rNv8G17wfj/w9rEL/cjdoJ5MofuxlUUj+uTIKKBr3d6r+KDwHmqSqgWkegg6UR+bVLuT0wlDxHUuyAlrY7lIQ1BxUZ8vQLhKEpwxYc83aLmOV1af9cbGAziaFgmtapFoHEhPSOvmzkfFTzvx0c2EC/bsu4HyzQJAECVpK5xA+h01MQxqBAhbHOdRmEr1AHQJ9ehtV4F+AVhf0vyZhYj9nmCO9IBbuvQAOJrXkfA4eDHA+ojli7d4x6FLLcUoIi5bB6rvboW4cs0k8GCbkLjmyk86PSF+YN5mTh4HcwrtamZmaw8gEmf8YUVbmeGCca;
 5:NiR+cf0vQkUq7UBqBkvQb4p39F2/krGIcO40Pd590sTCtjl2mzm8+ynuyknQH50XMrGcjTnPTKXwTm7PlsK1Fo0YJ1U0jiSGnfL0gxDn+OvQUNN60XmeYAKV1UyqPfur748WrESjp6yakwXV4r4St8uviRXyEsK4hjCKpNm970g=;
 24:S1jNNtdpfsfR/0v5C3xCzoRjFHQCM892X4+kGK3UL+DRwpTFJDmAGP7TPo3ZfYPsf1vFowsMxCrjzGttDvVMFrvsIuq3YGDwbaqG8mLcY4w=;
 7:A3ZKv5hsJAoXkut8pfkFLgAMn9fU7W+S3llKSRue6FGo/UhTu/tPo5w/upMzHieRAi1Z+/NA8gTK236Xvh1wAdmavMe4VtQ7fDweJeU9m6BRp6dRkxfSJt5T1Hp+NK1s33LSk9TmNZQ2qjVjDVHoBbNJf1zy5m2en+r4X4ua/c493Js3SVUoyefOX5hrPNOGDOJE6ohNH6MjR/8Lks3fefoB7mF4V2TayN6uu3Wj2DaE/izDvMgI4mflxrwzvZSMQtIDjs3pHV6raEz9lp7EKRxXDj2zI3XsJWhBqxcoo3HCyTIwwJ2+Mu8w70MqQc9lfKc8mAQzPHqLgqP1hgw33jATHJL8ZBc/vuU0Qz1+FyY=
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(10019020)(98900003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SG2APC01HT095;
 H:TY1PR06MB0863.apcprd06.prod.outlook.com; FPR:; SPF:None; LANG:en; 
x-ms-office365-filtering-correlation-id: d6abe46d-0932-43cf-df6f-08d40409c581
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(1601124038)(1603103105)(1603101340)(1601125047); SRVR:SG2APC01HT095; 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(432015012)(82015046);
 SRVR:SG2APC01HT095; BCL:0; PCL:0; RULEID:; SRVR:SG2APC01HT095; 
x-forefront-prvs: 011579F31F
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_TY1PR06MB0863CF6D1F000A28E716CFA4F6A30TY1PR06MB0863apcp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2016 16:52:18.0211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT095
X-OriginalArrivalTime: 03 Nov 2016 16:52:21.0582 (UTC)
 FILETIME=[A51F5EE0:01D235F2]
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Nov 2016 16:57:38 -0000

--_000_TY1PR06MB0863CF6D1F000A28E716CFA4F6A30TY1PR06MB0863apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Tom,<https://github.com/openbmc/openbmc/issues/436>


<https://github.com/openbmc/openbmc/issues/436>

https://github.com/openbmc/openbmc/issues/436


In my implementation, I supposed each of the fault property on dbus inferfa=
ce should be the one need to find out. Maybe is a mistake.

Could you give some advice about what does the Self Test result stand for? =
 Have self test function be implemented in obmc/ipmid?


B.R.

Nan

--_000_TY1PR06MB0863CF6D1F000A28E716CFA4F6A30TY1PR06MB0863apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Arial,Helvetica,sans-serif;">
<p><a previewremoved=3D"true" id=3D"LPlnk982053" href=3D"https://github.com=
/openbmc/openbmc/issues/436" class=3D"OWAAutoLink"><b>Hi Tom,</b></a></p>
<p><a previewremoved=3D"true" id=3D"LPlnk982053" href=3D"https://github.com=
/openbmc/openbmc/issues/436" class=3D"OWAAutoLink"><br>
</a></p>
<p><a previewremoved=3D"true" id=3D"LPlnk982053" href=3D"https://github.com=
/openbmc/openbmc/issues/436" class=3D"OWAAutoLink">https://github.com/openb=
mc/openbmc/issues/436</a>&nbsp;
<br>
</p>
<p><br>
</p>
<p>In my implementation, I supposed each of the fault property on dbus infe=
rface should be the one need to find out. Maybe is a mistake.</p>
<p>Could you give some advice about what does the Self Test result stand fo=
r?&nbsp; Have self test function be implemented in obmc/ipmid?</p>
<p><br>
</p>
<p>B.R.</p>
<p>Nan<br>
</p>
</div>
</body>
</html>

--_000_TY1PR06MB0863CF6D1F000A28E716CFA4F6A30TY1PR06MB0863apcp_--
