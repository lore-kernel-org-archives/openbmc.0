Return-Path: <SRS0=f1Ef=DF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9543C2D0A8
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 14:09:34 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEFCD21924
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2020 14:09:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Qg0JPkZ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEFCD21924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0PXV5QG9zDqPC
	for <openbmc@archiver.kernel.org>; Tue, 29 Sep 2020 00:09:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Qg0JPkZ2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0PTY2ddJzDqNt
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 00:06:56 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08SE4Hsq014844
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 10:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : mime-version : references : content-transfer-encoding :
 content-type : message-id; s=pp1;
 bh=UfjasqOhPOjaW5pVaKmh3X8RlcVN7MrqKST6cIQDwqA=;
 b=Qg0JPkZ2va2mwXipPWGE6/ixWlQWYDlueAOPPpPSJQq/ML+S+1wGKShEHlxqGwF8Om/C
 YYzKyhxTGUefmgujep/N5NvGqkzIsgwUS9K6Wa4rd/wKM/3UP1Gywj7+1TbKu/mtd6LV
 l9G7RctSPjeGwS5pfbuC/EfrHb5g1+OEY2FN2z8HWuq5gnqIs0rsP8jNMFDhClfUOTHE
 SocuWQ1yQyrXbS2A16BOVjmSIgrVIXX0SsYWEIMGjq2nCk40QzbfOIhC5Z28/hSrn4/7
 R3wWkCY4TYQtqwZWBGW5sVE4FwLTmbFi6HM7WyWqzA8fWWOiQCF/iovQ2Er78ufszcGQ sQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33udet0bd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 10:06:54 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Mon, 28 Sep 2020 14:06:53 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 28 Sep 2020 14:06:50 -0000
Received: from us1a3-mail157.a3.dal06.isc4sb.com ([10.146.71.179])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2020092814064969-399085 ;
 Mon, 28 Sep 2020 14:06:49 +0000 
In-Reply-To: 
Subject: GUI Design Work Group - Wednesday, 9/30
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Mon, 28 Sep 2020 14:06:50 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 2975
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20092814-3649-0000-0000-0000041B371E
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.000008
X-IBM-SpamModules-Versions: BY=3.00013910; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01441402; UDB=6.00774548; IPR=6.01224092; 
 MB=3.00034287; MTD=3.00000008; XFM=3.00000015; UTC=2020-09-28 14:06:51
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-09-28 13:02:26 - 6.00011893
x-cbparentid: 20092814-3650-0000-0000-0000C0F6382E
Message-Id: <OF79D1C142.B81E873F-ON002585F1.004CE438-002585F1.004D87B5@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_14:2020-09-28,
 2020-09-28 signatures=0
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

=20
Hello, =20
  =20
The IBM Design team is out this week for a Design Summit. I am planning to =
cancel this week's =20
work group and would like to know if regular attendees would prefer to keep=
 the schedule in place =20
with our next meeting  in two weeks on Wednesday, October 14th or shift the=
 =20
schedule and meet next Wednesday, October 7th? =20

=20
Thank you! =20
  =20
Derick Montague
IBM Cognitive Systems User Experience                       =20

