Return-Path: <ivan@de.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=de.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ivan@de.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yYJX61JB1zDrKG
 for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2017 23:00:53 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vAAC0jQ8098783
 for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2017 07:00:50 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.104])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2e5a224rcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2017 07:00:49 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ivan@de.ibm.com>;
 Fri, 10 Nov 2017 12:00:49 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.44) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 10 Nov 2017 12:00:46 -0000
Received: from us1b3-mail161.a3dr.sjc03.isc4sb.com ([10.160.174.246])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2017111012004595-352272 ;
 Fri, 10 Nov 2017 12:00:45 +0000 
In-Reply-To: 
Subject: fsp2 patches from upstream to openbmc/linux
From: "Ivan Mikhaylov1" <ivan@de.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: "Karlo Petri" <XXPETRI@de.ibm.com>,
 "Bradley W Bishop" <bradleyb@us.ibm.com>
Date: Fri, 10 Nov 2017 12:00:45 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 998) | IBM Domino Build
 SCN17283_20171010T0749_FP5.2 October 26, 2017 at 17:06
X-KeepSent: 02E339DA:55131D65-002581C5:004272DC;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 62131
X-TNEFEvaluated: 1
X-LLNXfer: False
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17111012-7301-0000-0000-0000020A6F7F
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.405233;
 ST=0; TS=0; UL=0; ISC=; MB=0.454427
X-IBM-SpamModules-Versions: BY=3.00008043; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00943836; UDB=6.00476239; IPR=6.00724119; 
 BA=6.00005684; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017950; XFM=3.00000015;
 UTC=2017-11-10 12:00:47
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-11-10 07:20:14 - 6.00007592
x-cbparentid: 17111012-7302-0000-0000-00002F7485D8
Message-Id: <OF02E339DA.55131D65-ON002581C5.004272DC-002581D4.0041FCDE@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-10_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Sun, 12 Nov 2017 11:44:55 +1100
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
X-List-Received-Date: Fri, 10 Nov 2017 12:00:54 -0000

hello all,
sorry for first note not in plain format.

these patches are already in v4.13 tag in upstream kernel which are needed =
for base support :=20
c4b56b023daa91953e9ebe91143e6ca156f0bcb7
9eec6cb142bddd35268c7c59b6c81be6c091aaf9
20975a0ae1ccc59a21a149e2fd2964ce88edb0a9
6e2f03e292ef46eed2b31b0a344a91d514f9cd81

these two related to mmc setup and not in v4.13 tag, I've cherry-picked the=
m into v4.13 - no errors,
no problems with compilation.
754f030908c3615781e9e3559d8ba1500cf82215
2feada5bb0441c918d12778bf9449d5ff805aa7c

so we need them into openbmc/linux if possible. thanks!
if you need anything else, you can ask us about it.
