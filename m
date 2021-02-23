Return-Path: <SRS0=MPKj=HZ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDB5C433E0
	for <openbmc@archiver.kernel.org>; Tue, 23 Feb 2021 00:02:07 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A510464E41
	for <openbmc@archiver.kernel.org>; Tue, 23 Feb 2021 00:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A510464E41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=us.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkzkP1HjGz3cKs
	for <openbmc@archiver.kernel.org>; Tue, 23 Feb 2021 11:02:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mF6xtHbo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mF6xtHbo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dkzjv29jBz30Nd
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 11:01:38 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11MNYAQC040418
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 19:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : cc : to :
 mime-version : content-type : message-id : subject; s=pp1;
 bh=s5i7C3aURXwkPG6acAEQqvzD7gNMkFw/YeS6R2sE7mA=;
 b=mF6xtHboK1GE7JXkOTUpPhW1tNxXpbhGust6Nq4IOClwxZdN+ZaC40LNHnChAP6/Ypc8
 W8opm89XUNgZMz8zb1iBqTwcg54aoqi77n56TN/c2iQOGzBVpxqzbQ+WPRpvTOw97lyc
 bg+XbDAA9CmFXzabvQ7vEDeSdloaVvVmv/LBuLCasNYknISwXV7XJXIZCssqYj4UJQQk
 isrSWR4+iiu7NxlOVo32DlsVaO+ztfN9yHwV/qeiAgVSVj2p8I1FVX4Ik81WZqSfL/qB
 1ORHRQIk2ZVakcbJfYMo3LIdnKkNVnOsvLniWRvPkVyUYtdEIjwrS/9DTF1jUPdyDeQ3 oA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vkfnnfg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 19:01:36 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 23 Feb 2021 00:01:35 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 23 Feb 2021 00:01:32 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2021022300013177-821214 ;
 Tue, 23 Feb 2021 00:01:31 +0000 
Date: Tue, 23 Feb 2021 00:01:32 +0000
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Daniel Brennan" <danielbr@synnex.com>, openbmc@lists.ozlabs.org
MIME-Version: 1.0
X-Mailer: IBM Traveler 10.0.1.2 Build 202002141540_20 on behalf of device with
 id
 mdm...eb5, type 1300 (maas360android) and description MaaS360-MaaS360
 Mail-Android:MaaS360-MaaS360 Mail-Android/7.31 at 20210223000132488 by
 DS-7fdec4a7a700[SendMail]
X-KeepSent: A7B5D588:BB298518-00258685:000023DE;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 4651
X-TNEFEvaluated: 1
Content-Type: multipart/mixed;
 boundary="--_com.fiberlink.maas360.email_228943986759520"
x-cbid: 21022300-1335-0000-0000-000005F7BFC9
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.373977; ST=0; TS=0; UL=0; ISC=; MB=0.000050
X-IBM-SpamModules-Versions: BY=3.00014775; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01511714; UDB=6.00816436; IPR=6.01294239; 
 MB=3.00036221; MTD=3.00000008; XFM=3.00000015; UTC=2021-02-23 00:01:33
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-02-22 19:17:27 - 6.00012322
x-cbparentid: 21022300-1336-0000-0000-000041C2C6E7
Message-Id: <OFA7B5D588.BB298518-ON00258685.000023DE-1614038492428@notes.na.collabserv.com>
Subject: Re:  OpenBMC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_08:2021-02-22,
 2021-02-22 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: Janny Au <jannya@hyvedesignsolutions.com>,
 Eric Kuo <erickuo@hyvedesignsolutions.com>, Legal <Legal@synnex.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


----_com.fiberlink.maas360.email_228943986759520
Content-Type: multipart/alternative;
	 boundary="--_com.fiberlink.maas360.email_228943987500151"



----_com.fiberlink.maas360.email_228943987500151
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8

Reply inline with Milton>=0A=0ASpeaking only for myself,not IBM or Openbmc =
=0A=0A-------- Original Message --------=0AFrom: Daniel Brennan =0ADate: Mo=
n, February 22, 2021 5:32 PM -0600=0ATo: openbmc@lists.ozlabs.org=0ACC: Jan=
ny Au , Eric Kuo , Legal =0ASubject: [EXTERNAL] OpenBMC=0A=0A=0A=0A=0AAttac=
hed please find the signed corporate CLA for Hyve Design Solutions.=0A=0A=
=C2=A0Milton> I didn't see any names or email in schedule A, which has been=
 raised as an issue in the past.=0A=0A=0A=0ABest regards,=0A=0A=0ADaniel T.=
 Brennan=0A=0AVice President & Senior Counsel=0A

----_com.fiberlink.maas360.email_228943987500151
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

Reply inline with Milton><br><br>Speaking only for myself,not IBM or Openbm=
c <br><br>-------- Original Message --------<br>From: Daniel Brennan <danie=
lbr@synnex.com><br>Date: Mon, February 22, 2021 5:32 PM -0600<br>To: <a hre=
f=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>CC: J=
anny Au <jannya@hyvedesignsolutions.com>, Eric Kuo <erickuo@hyvedesignsolut=
ions.com>, Legal <Legal@synnex.com><br>Subject: [EXTERNAL] OpenBMC<br><br><=
br> <br><br>Attached please find the signed corporate CLA for Hyve Design S=
olutions.<br><br>=C2=A0Milton> I didn't see any names or email in schedule =
A, which has been raised as an issue in the past.<br><br><br><br>Best regar=
ds,<br><br><br>Daniel T. Brennan<br><br>Vice President & Senior Counsel<br>=
<BR>

----_com.fiberlink.maas360.email_228943987500151--

----_com.fiberlink.maas360.email_228943986759520--

