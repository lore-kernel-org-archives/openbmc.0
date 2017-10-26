Return-Path: <ivan@de.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=de.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ivan@de.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yN5mB6KP9zDqkH
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 23:23:29 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9QCMAo4056837
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 08:23:25 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ducqv94d2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 08:23:25 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ivan@de.ibm.com>;
 Thu, 26 Oct 2017 12:23:24 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 26 Oct 2017 12:23:23 -0000
Received: from us1a3-mail161.a3.dal06.isc4sb.com ([10.146.71.28])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2017102612232324-489953 ;
 Thu, 26 Oct 2017 12:23:23 +0000 
In-Reply-To: 
Subject: fsp2 patches from upstream to openbmc/linux
From: "Ivan Mikhaylov1" <ivan@de.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: "Karlo Petri" <XXPETRI@de.ibm.com>,
 "Bradley W Bishop" <bradleyb@us.ibm.com>
Date: Thu, 26 Oct 2017 12:23:23 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 998) | IBM Domino Build
 SCN17263_20170920T0022_FP4 October 11, 2017 at 08:48
X-LLNOutbound: False
X-Disclaimed: 59591
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17102612-7581-0000-0000-0000045D40FD
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00007954; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00936719; UDB=6.00472056; IPR=6.00716981; 
 BA=6.00005660; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017724; XFM=3.00000015;
 UTC=2017-10-26 12:23:24
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-10-26 01:22:09 - 6.00007517
x-cbparentid: 17102612-7582-0000-0000-0000BE2550C7
Message-Id: <OF02E339DA.55131D65-ON002581C5.004272DC-002581C5.00440F23@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-26_03:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Mon, 30 Oct 2017 15:18:14 +1100
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
X-List-Received-Date: Thu, 26 Oct 2017 12:24:35 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">hello all,<br>these patches are already in v4.13 tag in upstream ker=
nel which are needed for base support : <br>c4b56b023daa91953e9ebe91143e6ca=
156f0bcb7<br>9eec6cb142bddd35268c7c59b6c81be6c091aaf9<br>20975a0ae1ccc59a21=
a149e2fd2964ce88edb0a9<br>6e2f03e292ef46eed2b31b0a344a91d514f9cd81<br><br>t=
hese two related to mmc setup and not in v4.13 tag, I've cherry-picked them=
 into v4.13 - no errors,<br>no problems with compilation.<br>754f030908c361=
5781e9e3559d8ba1500cf82215<br>2feada5bb0441c918d12778bf9449d5ff805aa7c<br><=
br>so we need them into openbmc/linux if possible. thanks!<br>if you need a=
nything else, you can ask us about it.<br></font><BR>
