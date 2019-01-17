Return-Path: <gkeishin@in.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gkeishin@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43gVBQ6FkSzDqw8
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 03:38:19 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 x0HGZxPN074202
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 11:38:17 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q2txk7k76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 11:38:17 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Thu, 17 Jan 2019 16:38:16 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 17 Jan 2019 16:38:13 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2019011716381318-773197 ;
 Thu, 17 Jan 2019 16:38:13 +0000 
To: openbmc@lists.ozlabs.org
Subject: Openbmc test Release tagging for Community Release
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Thu, 17 Jan 2019 22:08:13 +0530
X-KeepSent: F42ED130:9BA22149-00258385:005A6773;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP10 SHF68 March 06, 2018
X-LLNOutbound: False
X-Disclaimed: 53619
X-TNEFEvaluated: 1
x-cbid: 19011716-6357-0000-0000-00000925DCC8
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.439231; ST=0; TS=0; UL=0; ISC=; MB=0.099131
X-IBM-SpamModules-Versions: BY=3.00010424; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000275; SDB=6.01147844; UDB=6.00597951; IPR=6.00928142; 
 BA=6.00006203; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00025174; XFM=3.00000015;
 UTC=2019-01-17 16:38:14
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-01-17 13:52:11 - 6.00009477
x-cbparentid: 19011716-6358-0000-0000-00005536FC0F
Message-Id: <OFF42ED130.9BA22149-ON00258385.005A6773-65258385.005B63D6@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 005AC60C65258385_="
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-17_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Thu, 17 Jan 2019 16:38:23 -0000


--=_alternative 005AC60C65258385_=
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: Quoted-printable

Hi All,

We are going to tag a openbmc test release soon for the community master=20
release testing. So, expect 2.3 tag version soon there in a week time from=
=20
now, once the test code and master are stable.

As part of the release tagging in test, we are freezing any new changes=20
for now in test except for CI/CT fixes required to support testing the=20
Master 2.6 .=20

Recent  release 2.2 stable.=20
https://github.com/openbmc/openbmc-test-automation/releases=20

Thanks and Regards,
   George Keishing
   IBM Systems &Technology Lab, Firmware Development,



--=_alternative 005AC60C65258385_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<span style=3D" font-size:10pt;font-family:sans-serif">Hi All,</span><br><b=
r><span style=3D" font-size:10pt;font-family:sans-serif">We are going to
tag a openbmc test release soon for the community master release testing.
So, expect 2.3 tag version soon there in a week time from now, once the
test code and master are stable.</span><br><br><span style=3D" font-size:10=
pt;font-family:sans-serif">As part of the
release tagging in test, we are freezing any new changes for now in test
except for CI/CT fixes required to support testing the Master 2.6 . </span>=
<br><br><span style=3D" font-size:10pt;font-family:sans-serif">Recent &nbsp=
;release
2.2 stable. </span><a href=3D"https://github.com/openbmc/openbmc-test-autom=
ation/releases"><span style=3D" font-size:10pt;color:blue;font-family:sans-=
serif">https://github.com/openbmc/openbmc-test-automation/releases</span></=
a><span style=3D" font-size:10pt;font-family:sans-serif"></span><br><br><sp=
an style=3D" font-size:10pt;color:blue;font-family:sans-serif"><b>Thanks
and Regards,</b></span><br><span style=3D" font-size:10pt;color:blue;font-f=
amily:sans-serif">&nbsp;
&nbsp;George Keishing</span><br><span style=3D" font-size:10pt;color:blue;f=
ont-family:sans-serif">&nbsp;
&nbsp;IBM Systems &amp;Technology Lab, Firmware Development,</span><br><BR>
--=_alternative 005AC60C65258385_=--
