Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.90; helo=esa1.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="kgjS2xOa"; 
 dkim-atps=neutral
Received: from esa1.dell-outbound.iphmx.com (esa1.dell-outbound.iphmx.com
 [68.232.153.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zH5pk2ffNzF0VN
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 11:09:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1515629301; x=1547165301;
 h=from:to:subject:date:message-id:mime-version;
 bh=o2EwZjdP47PH4qpL3L+FjFKace68C1zjfrWxn3+Gsww=;
 b=kgjS2xOaGqkDI1Sgds5R9bBqeyGCjf9MH1MOhdGr0WJaU7W8ay6gOUWg
 kJC7LlNd0bPfW+AX0UxUfwbtkdBrqlXHHDYKv56Z4rTeh5j5o5f/UqZM4
 VvNFXJVLF3zQho35PW7yc3O6MREE8Et388/Ke38k4D9GYFAfZ6EskG84w g=;
IronPort-PHdr: =?us-ascii?q?9a23=3AJQlRbRQe3urSYZ1K+MojWsTxl9psv+yvbD5Q0YIu?=
 =?us-ascii?q?jvd0So/mwa6yZR2N2/xhgRfzUJnB7Loc0qyK6/mmATRIyK3CmUhKSIZLWR4BhJ?=
 =?us-ascii?q?detC0bK+nBN3fGKuX3ZTcxBsVIWQwt1Xi6NU9IBJS2PAWK8TW94jEIBxrwKxd+?=
 =?us-ascii?q?KPjrFY7OlcS30P2594HObwlSizexfa5+IA+qoQnNq8IbnZZsJqEtxxXTv3BGYf?=
 =?us-ascii?q?5WxWRmJVKSmxbz+MK994N9/ipTpvws6ddOXb31cKokQ7NYCi8mM30u683wqRbD?=
 =?us-ascii?q?VwqP6WACXWgQjxFFHhLK7BD+Xpf2ryv6qu9w0zSUMMHqUbw5Xymp4qF2QxHqlS?=
 =?us-ascii?q?gHLSY0/mHJhMJtkKJVrhGvpx1jzIHbe4yaLuZyc7nHcN8GWWZNQ8BcXDFBDIOm?=
 =?us-ascii?q?aIsPCvIMMOFfoYn8u1QOrQGxCheoBO/1xTFEnGL73bc90+UvFwHLxxEvEMwKsH?=
 =?us-ascii?q?TQttn6KKASUeWswaTO0D7NYfRW2TLn54jJdBAsueyDUqx0ccrV00UgCwTFjlCW?=
 =?us-ascii?q?pIf4PD2VzvwAvmmY4uZ6S+6ihXArpxtsrjWvyMogkJfFip4Ixlzc6Cl13Jw5Kc?=
 =?us-ascii?q?C6RUN5e9KpFIdcuzuYOodqWs8uXm5ltSggxrEbuJO2fTIGxIkoyhPccfCLbZSE?=
 =?us-ascii?q?7xPlWe2MOzl3nmhld6i6hxuq9EigzfDzWdes3VZRqypFjsHMtncQ1xzP8sSHSu?=
 =?us-ascii?q?Vy/kOm2TuXyQ/T8ftLLV0umaXGNZEhxrowmoMUsUTeAi/5g0L2jLKQdko55OSk?=
 =?us-ascii?q?8eXnYq3mpp+ZOI54kB3xMqMrmsCnAOQ4NBYBX3SD9Om917Dv51P1TbtUgvEsj6?=
 =?us-ascii?q?XUsJ7XKd4FqqKlHgNZyoMj5Ay+Dzei3tQYh34HLFdddRyAjojmJ1HOL+rmAve7?=
 =?us-ascii?q?mViiny1nyu3cPr3mDJTNKGPOn6r/crZ5705Q0hY8zdda555MELEOPOrzWlPttN?=
 =?us-ascii?q?zfFhI5NBS0zPjhCNpm04MRRXmCAquYMKPJrV+I/fgjI+6NZY8RojnyMOMl6+Tp?=
 =?us-ascii?q?jX8jll9ONZWuiM8QcH2+FPFtC0GYemb3xNATFW4ApUw5VuO823OYVjsGM1OzVK?=
 =?us-ascii?q?I16zV9JcSMF4DcQKihjbiFmiy8G8sFNSh9FlmQHCKwJM2/UPAWZXfKLw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2H4AwCzqlZah8mZ6EReHAEBAQQBAQoBA?=
 =?us-ascii?q?YJKgU0QdCcHhlmWEx+FFIE/AQKDDodkh04HgWhDCiOJYEIVAQEBAQEBAQEBAQI?=
 =?us-ascii?q?QAQEBCA0JCCgvQg4BgWciDQRLJwMvAQEBAQEBAQEBAQEBAQEBAQEBAQEVAg1DA?=
 =?us-ascii?q?YErAQwBHDRKBIliZBCuLxGDTYpwhCCBaiuLemKFMAWPYIMUkHAKiAGNOoJ/kQ+?=
 =?us-ascii?q?NO4lmgTwPJoFCMm+CbAEQCIF7AQEBAQEFAQEBAQEBAQFOgXN5AQGEIIYmgRcBA?=
 =?us-ascii?q?QE?=
X-IPAS-Result: =?us-ascii?q?A2H4AwCzqlZah8mZ6EReHAEBAQQBAQoBAYJKgU0QdCcHhlm?=
 =?us-ascii?q?WEx+FFIE/AQKDDodkh04HgWhDCiOJYEIVAQEBAQEBAQEBAQIQAQEBCA0JCCgvQ?=
 =?us-ascii?q?g4BgWciDQRLJwMvAQEBAQEBAQEBAQEBAQEBAQEBAQEVAg1DAYErAQwBHDRKBIl?=
 =?us-ascii?q?iZBCuLxGDTYpwhCCBaiuLemKFMAWPYIMUkHAKiAGNOoJ/kQ+NO4lmgTwPJoFCM?=
 =?us-ascii?q?m+CbAEQCIF7AQEBAQEFAQEBAQEBAQFOgXN5AQGEIIYmgRcBAQE?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa1.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2018 18:08:18 -0600
From: <Michael.E.Brown@dell.com>
Received: from ausc60ps301.us.dell.com ([143.166.148.206])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2018 06:08:15 +0600
X-LoopCount0: from 10.166.136.215
X-IronPort-AV: E=Sophos;i="5.46,342,1511848800"; 
 d="scan'208,217";a="1081421246"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: Dell VNC server
Thread-Topic: Dell VNC server
Thread-Index: AQHTinBeRBV4t/ct0kGhFKBj4lDomw==
Date: Thu, 11 Jan 2018 00:09:26 +0000
Message-ID: <1515629435132.86348@Dell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.177.90.70]
Content-Type: multipart/alternative; boundary="_000_151562943513286348Dellcom_"
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jan 2018 00:09:35 -0000

--_000_151562943513286348Dellcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

http://opensource.dell.com/releases/idrac9/3.11.11.11/


Download this (3.1GB) tarball. Our open source components for vnc are under

iDRAC_3.11.11.11_OpenSource/externalsrc/fb-vserver.


The prerequisites are libvncserver and ssl.

--

Michael


--_000_151562943513286348Dellcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; } p.p1 { margin: 0px; font-style: normal; font-variant: =
normal; font-weight: normal; font-stretch: normal; font-size: 11px; line-he=
ight: normal; font-family: Menlo; color: rgb(0, 0, 0); background-color: rg=
b(255, 255, 255); } span.s1 { font-variant-ligatures: no-common-ligatures; =
}--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p><a href=3D"http://opensource.dell.com/releases/idrac9/3.11.11.11/">http:=
//opensource.dell.com/releases/idrac9/3.11.11.11/</a><br>
</p>
<p><br>
</p>
<p>Download this (3.1GB) tarball. Our open source components for vnc are un=
der&nbsp;</p>
<style type=3D"text/css">=0A=
p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 11.0px Menlo; color: #000000; =
background-color: #ffffff}=0A=
span.s1 {font-variant-ligatures: no-common-ligatures}=0A=
</style>
<p class=3D"p1"><span class=3D"s1">iDRAC_3.11.11.11_OpenSource/externalsrc/=
fb-vserver.</span></p>
<p class=3D"p1"><span class=3D"s1"><br>
</span></p>
<p class=3D"p1"><span class=3D"s1">The prerequisites are libvncserver and s=
sl.</span></p>
<p class=3D"p1"><span class=3D"s1">--</span></p>
<p class=3D"p1"><span style=3D"font-variant-ligatures: no-common-ligatures;=
">Michael</span></p>
<p><br>
</p>
</body>
</html>

--_000_151562943513286348Dellcom_--
