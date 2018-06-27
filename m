Return-Path: <ngorugan@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ngorugan@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41G4ws0H30zDrbK
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jun 2018 00:26:50 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w5REQTCG121049
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 10:26:48 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2jvcbdr0bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 10:26:48 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ngorugan@in.ibm.com>;
 Wed, 27 Jun 2018 14:26:47 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 27 Jun 2018 14:26:44 -0000
Received: from us1a3-mail129.a3.dal06.isc4sb.com ([10.146.45.217])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2018062714264402-608286 ;
 Wed, 27 Jun 2018 14:26:44 +0000 
To: openbmc@lists.ozlabs.org
Subject: How to mock journal related methods
From: "Nagaraju Goruganti" <ngorugan@in.ibm.com>
Date: Wed, 27 Jun 2018 19:56:36 +0530
X-KeepSent: EE0820A1:272DC24E-002582B9:004EC9E2;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1 October 14, 2013
X-LLNOutbound: False
X-Disclaimed: 25279
X-TNEFEvaluated: 1
x-cbid: 18062714-1799-0000-0000-0000072EB158
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.421684; ST=0; TS=0; UL=0; ISC=; MB=0.000089
X-IBM-SpamModules-Versions: BY=3.00009264; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01053094; UDB=6.00539924; IPR=6.00831018; 
 BA=6.00006024; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00021878; XFM=3.00000015;
 UTC=2018-06-27 14:26:47
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-06-27 13:01:42 - 6.00008628
x-cbparentid: 18062714-1800-0000-0000-000055FAC37D
Message-Id: <OFEE0820A1.272DC24E-ON002582B9.004EC9E2-652582B9.004F578B@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 004F5599652582B9_="
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-06-27_03:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Wed, 27 Jun 2018 14:26:53 -0000


--=_alternative 004F5599652582B9_=
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: Quoted-printable

Hi Team,

I am writing unit test-cases to phospher-logging server.

As it gets information form the journal log for event and logging=20
creation,it needs to make calls to
below given journal related methods:

sd_journal_open(sd_journal**,int)(
https://github.com/openbmc/phosphor-logging/blob/master/log_manager.cpp#L86
)
sd_journal_get_data(sd_journal*,const char *,const void **,size_t) (
https://github.com/openbmc/phosphor-logging/blob/master/log_manager.cpp#L115
)
sd_journal_close(sd_journal *) (
https://github.com/openbmc/phosphor-logging/blob/master/log_manager.cpp#L175
)

I am able make calls to these methods, without any issue, on host=20
machine(inside x86 sandbox) where we don't have journal service is=20
running.

Is it the correct way(don't we need to mock these methods) ?=20

If not, Please someone let me know how to mock these methods?



Thanks and Regards,
Nagaraju G


--=_alternative 004F5599652582B9_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">Hi Team,</font><br><br><font size=3D2 fa=
ce=3D"sans-serif">I am writing unit test-cases to phospher-logging
server.</font><br><br><font size=3D2 face=3D"sans-serif">As it gets informa=
tion form the journal
log for event and logging creation,it needs to make calls to</font><br><fon=
t size=3D2 face=3D"sans-serif">below given journal related methods:</font><=
br><br><font size=3D2 face=3D"sans-serif">sd=5Fjournal=5Fopen(sd=5Fjournal*=
*,int)(</font><a href=3D"https://github.com/openbmc/phosphor-logging/blob/m=
aster/log=5Fmanager.cpp#L86"><font size=3D2 color=3Dblue face=3D"sans-serif=
">https://github.com/openbmc/phosphor-logging/blob/master/log=5Fmanager.cpp=
#L86</font></a><font size=3D2 face=3D"sans-serif">)</font><br><font size=3D=
2 face=3D"sans-serif">sd=5Fjournal=5Fget=5Fdata(sd=5Fjournal*,const
char *,const void **,size=5Ft) (</font><a href=3D"https://github.com/openbm=
c/phosphor-logging/blob/master/log=5Fmanager.cpp#L115"><font size=3D2 color=
=3Dblue face=3D"sans-serif">https://github.com/openbmc/phosphor-logging/blo=
b/master/log=5Fmanager.cpp#L115</font></a><font size=3D2 face=3D"sans-serif=
">)</font><br><font size=3D2 face=3D"sans-serif">sd=5Fjournal=5Fclose(sd=5F=
journal *) (</font><a href=3D"https://github.com/openbmc/phosphor-logging/b=
lob/master/log=5Fmanager.cpp#L175"><font size=3D2 color=3Dblue face=3D"sans=
-serif">https://github.com/openbmc/phosphor-logging/blob/master/log=5Fmanag=
er.cpp#L175</font></a><font size=3D2 face=3D"sans-serif">)</font><br><br><f=
ont size=3D2 face=3D"sans-serif">I am able make calls to these methods,
without any issue, on host machine(inside x86 sandbox) where we don't have
journal service is running.</font><br><br><font size=3D2 face=3D"sans-serif=
">Is it the correct way(don't we need
to mock these methods) ? </font><br><br><font size=3D2 face=3D"sans-serif">=
If not, Please someone let me know how
to mock these methods?</font><br><br><br><br><font size=3D2 face=3D"sans-se=
rif">Thanks and Regards,</font><br><font size=3D2 face=3D"sans-serif">Nagar=
aju G</font><BR>
--=_alternative 004F5599652582B9_=--
