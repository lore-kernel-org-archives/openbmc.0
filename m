Return-Path: <SRS0=CwJ0=HS=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E1CC433DB
	for <openbmc@archiver.kernel.org>; Tue, 16 Feb 2021 21:31:47 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE3864E08
	for <openbmc@archiver.kernel.org>; Tue, 16 Feb 2021 21:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE3864E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgDgh55Btz3cJv
	for <openbmc@archiver.kernel.org>; Wed, 17 Feb 2021 08:31:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jCSFBFyz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jCSFBFyz; dkim-atps=neutral
X-Greylist: delayed 1026 seconds by postgrey-1.36 at boromir;
 Wed, 17 Feb 2021 08:31:19 AEDT
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgDgC6zsqz30Jj
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 08:31:18 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11GL3d8S098162
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 16:14:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0fsB21CuVyKcxbHaZ3WsTTDi2OFuliNbJIYxSunD/gE=;
 b=jCSFBFyz9we2tiVn0Cx0rmRRsvXkKoTpxMJKUddUhSuZ8Lm1xEHSzjc17HPWdEX6aG0f
 ycXAl3TS3huS+WLCXwL3cnpnfAVPC/8vazbLUbNBf8BuN8Xdd39HybW+8EJ4WD+NIUDz
 A92J4ZENjBgk4QvneoxAFkDCspOauWvvaM0WlXcx7R0A122p9O9WlCf7BF7pdVWaH36o
 EIJk4MKWfnE47nvo9xht4PDak8tqwD0QozwcXBbjtTK2WokzLYfIeVbDQXwQFqiMU05u
 GpWwrQexpX6RiOzpPmnGS56u9ZJfpOCCCaqLrnR0tGi4Ui/c+MN0zYKSQAadLCa0qqqA mA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.113])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36rn6gh4dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 16:14:09 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 16 Feb 2021 21:14:09 -0000
Received: from us1b3-smtp03.a3dr.sjc01.isc4sb.com (10.122.7.173)
 by smtp.notes.na.collabserv.com (10.122.47.56) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 16 Feb 2021 21:14:08 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp03.a3dr.sjc01.isc4sb.com
 with ESMTP id 2021021621140755-758519 ;
 Tue, 16 Feb 2021 21:14:07 +0000 
In-Reply-To: 
Subject: GUI Design Work Group - Wednesday, 10/17/21 - Cancelled
From: "Derick Montague" <Derick.Montague@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 16 Feb 2021 21:14:07 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 49531
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 21021621-7691-0000-0000-00000E6D4E3F
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.394815; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00014753; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01508785; UDB=6.00814686; IPR=6.01291310; 
 MB=3.00036154; MTD=3.00000008; XFM=3.00000015; UTC=2021-02-16 21:14:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-02-16 16:15:34 - 6.00012307
x-cbparentid: 21021621-7692-0000-0000-00002F5E5AA3
Message-Id: <OF76D14EA6.D31C8D7B-ON0025867E.00747829-0025867E.0074A66A@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-16_12:2021-02-16,
 2021-02-16 signatures=0
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

Hello,

I won't be able to host the work group due to the winter storm in Texas.=20
If someone else would like to host, please reply with your info and update
the wiki. If not, the work group will be cancelled tomorrow.

https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

Thank you!
=20
Derick Montague
FED Lead | OpenBMC Design Team Lead
IBM Cognitive Systems User Experience

