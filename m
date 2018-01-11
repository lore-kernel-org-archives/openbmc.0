Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.94; helo=esa3.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="PBDawBm3"; 
 dkim-atps=neutral
Received: from esa3.dell-outbound.iphmx.com (esa3.dell-outbound.iphmx.com
 [68.232.153.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zHHxn68HczF0Tt
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jan 2018 18:46:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1515656416; x=1547192416;
 h=from:to:subject:date:message-id:mime-version;
 bh=8DapNg6RtpUir7nD1gtpEF3rxiUCqTB2IkcN79jGkXQ=;
 b=PBDawBm39j9FvvkpesGWBs1vE9KtT9T6y632jjKWJEkWm4ebqYb6FFRC
 4oHmLt/idPEcq48RcTAtc/laey2Yoia+4kb9CgNoidqjPV4KRC8jJDY3B
 03QTYFCxreEBSzIaVBfeik+oLb0GMcLM+1FlJpfl8V9Sz3PUVrW6Lk+Xf Y=;
IronPort-PHdr: =?us-ascii?q?9a23=3AqpA9PxaNHbsSbc6lDyCVMXD/LSx+4OfEezUN459i?=
 =?us-ascii?q?sYplN5qZr8i5bnLW6fgltlLVR4KTs6sC17KP9fi4EUU7or+5+EgYd5JNUxJXwe?=
 =?us-ascii?q?43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQviPgRp?=
 =?us-ascii?q?OOv1BpTSj8Oq3Oyu5pHfeQpFiCagbb9oMBm6sRjau9ULj4dlNqs/0AbCrGFSe+?=
 =?us-ascii?q?RRy2NoJFaTkAj568yt4pNt8Dletuw4+cJYXqr0Y6o3TbpDDDQ7KG81/9HktQPC?=
 =?us-ascii?q?TQSU+HQRVHgdnwdSDAjE6BH6WYrxsjf/u+Fg1iSWIdH6QLYpUjmk8qxlSgLniD?=
 =?us-ascii?q?0fOjA57m/Zl9BwgqxYrhKguxNwzJXZb5uJOPdkZK7RYc8WSXdHU81MVyJBGIS8?=
 =?us-ascii?q?b44XAucGOuhYrpXyp1sUohSgAQmgHuzhxiVVi3/s2q073eIhHBrb0wM+G9IOtG?=
 =?us-ascii?q?7Yo8nyNKcXSO24yrTDwzvEb/NTwzj96Y7Ifwghof6WW7JwatTeyU83FwzflFWQ?=
 =?us-ascii?q?tYrlMC2P1uQWs2ib7vJgWfizhG4grgF8pCWkyMQ0ioTRh48YyUrI+Tt3zYorP9?=
 =?us-ascii?q?G0VU52bNC+HJdOqy2WKpN6Tt4+T21ypSo3yL8LtYS/cSQW0pgqxh3SZ+Saf4WH?=
 =?us-ascii?q?7B/vTvudLDZ5iX5/e7+yhwy+/VWgx+D9UMS/zUxEoTBfktbWs3AAzxnT6s+aRf?=
 =?us-ascii?q?Rj5kqhwjOP1xzL6uFDPEA0ibLXK54/zb40kZoeqVrMHjTsl0nrlqOZa1sr+uys?=
 =?us-ascii?q?6+j+ZbXmu4OcOJRzigHjNKQhh9KzDf45MggWX2ib/Ou92Kf/8k3+RbVGlvw2kq?=
 =?us-ascii?q?/Hv5DGPckWp620DxVL3ost9RqzFSqq3dQWkHUdMl5JZA+Lg5DsO17UIfD4Cfm/?=
 =?us-ascii?q?g06rkDdu3/3IObzhDYnNLnfZjrjheaxx5UFGxAcu19Bf4JxVCrcaLf3uREDxsN?=
 =?us-ascii?q?jYAgUlPAyzxubrEM992Z8GWWKTHq+ZN7vfsViQ5u0xJemDf4oVtyrmJvgh5v7u?=
 =?us-ascii?q?lmM5mUQHcamu3JoXbGq3Ee99I0mDZnrsmNgBQi82uV9qS/TnjleHWhZXZm2uRO?=
 =?us-ascii?q?Q79DUyApngCp3MENODmruEiXOeH5ZWb21CTH3KO23vaIOsV/oIbGSZJco3wW9M?=
 =?us-ascii?q?bqSoV4J0jULmjwT90bcyduc=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EyAgDSFVdah8mZ6EReHAEBAQQBAQoBA?=
 =?us-ascii?q?YJKgU0QdC6GWZYzhlIBAopzh2qCFgoliV9BFgEBAQEBAQEBAQECEAEBAQgNCQg?=
 =?us-ascii?q?oL4I4IoE0LAhIAYErAQwBHDRKBIliZBCyToprBYQrghWMXIIODIMWBY9ggxSQc?=
 =?us-ascii?q?AqIAY08lA6NPYVvg3iBPCYJgWYMCG+CfYIDAQEIAQEBAVKBc4tBgRcBAQE?=
X-IPAS-Result: =?us-ascii?q?A2EyAgDSFVdah8mZ6EReHAEBAQQBAQoBAYJKgU0QdC6GWZY?=
 =?us-ascii?q?zhlIBAopzh2qCFgoliV9BFgEBAQEBAQEBAQECEAEBAQgNCQgoL4I4IoE0LAhIA?=
 =?us-ascii?q?YErAQwBHDRKBIliZBCyToprBYQrghWMXIIODIMWBY9ggxSQcAqIAY08lA6NPYV?=
 =?us-ascii?q?vg3iBPCYJgWYMCG+CfYIDAQEIAQEBAVKBc4tBgRcBAQE?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa3.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2018 01:40:11 -0600
From: <Michael.E.Brown@dell.com>
Received: from ausxippc106.us.dell.com ([143.166.85.156])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2018 13:40:08 +0600
X-LoopCount0: from 10.166.136.210
X-IronPort-AV: E=Sophos;i="5.46,343,1511848800"; 
 d="scan'208,217";a="198440601"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: CLA discussion - James Bottomley's blog post today
Thread-Topic: CLA discussion - James Bottomley's blog post today
Thread-Index: AQHTiq+lhqquR4jr/Uy5Qdn9iWMPNQ==
Date: Thu, 11 Jan 2018 07:46:15 +0000
Message-ID: <1515656775418.74165@Dell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.177.90.68]
Content-Type: multipart/alternative; boundary="_000_151565677541874165Dellcom_"
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
X-List-Received-Date: Thu, 11 Jan 2018 07:46:23 -0000

--_000_151565677541874165Dellcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

https://blog.hansenpartnership.com/gpl-as-the-best-licence-governance-and-p=
hilosophy/


A very timely article from James Bottomley!? He addresses CLAs and provides=
 a very compelling argument against them, rooted in equity.

"Further, the IP rights tend to be a focus for corporations, so simply join=
ing the controlling entity (or taking a licence from it) instead of actuall=
y contributing to the project can become an end goal, thus weakening the te=
chnical contributions to the project and breaking the link with end users."


Is there a danger of this happening on this project?

--

Michael

--_000_151565677541874165Dellcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!-- p { margin-top: 0px; m=
argin-bottom: 0px; }--></style>
</head>
<body dir=3D"ltr" style=3D"font-size:12pt;color:#000000;background-color:#F=
FFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p><a href=3D"https://blog.hansenpartnership.com/gpl-as-the-best-licence-go=
vernance-and-philosophy/">https://blog.hansenpartnership.com/gpl-as-the-bes=
t-licence-governance-and-philosophy/</a><br>
</p>
<p><br>
</p>
<p>A very timely article from James Bottomley!&#8203; He addresses CLAs and=
 provides a very compelling&nbsp;argument against them, rooted&nbsp;in equi=
ty.<br>
<br>
&quot;<span style=3D"color: rgb(68, 68, 68); font-family: &quot;Open Sans&q=
uot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(=
255, 255, 255);">Further, the IP rights tend to be a focus for corporations=
, so simply joining the controlling entity (or taking
 a licence from it) instead of actually contributing to the project can bec=
ome an end goal, thus weakening the technical contributions to the project =
and breaking the link with end users.</span>&quot;<br>
</p>
<p><br>
</p>
<p>Is there a danger of this happening on this project?<br>
</p>
<p>--<br>
</p>
<p>Michael<br>
</p>
</body>
</html>

--_000_151565677541874165Dellcom_--
