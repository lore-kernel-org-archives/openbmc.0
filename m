Return-Path: <austenc@us.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=austenc@us.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y5hr85FtXzDqhh
 for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2017 12:52:53 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v931qG3C123044
 for <openbmc@lists.ozlabs.org>; Mon, 2 Oct 2017 21:52:51 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dbyjfc2ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 02 Oct 2017 21:52:50 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 3 Oct 2017 01:52:50 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 3 Oct 2017 01:52:48 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2017100301524864-1097666 ;
 Tue, 3 Oct 2017 01:52:48 +0000 
MIME-Version: 1.0
Subject: Call for maintainers
To: <openbmc@lists.ozlabs.org>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Mon, 2 Oct 2017 20:52:46 -0500
X-KeepSent: 78B95C25:5F20D5DE-862581AE:000890BF;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 1871
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0B3DDF9B162F8f9e8a93df938690918c09BB0B3DDF9B162F"
Content-Disposition: inline
x-cbid: 17100301-9717-0000-0000-0000041FAC2A
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.363924
X-IBM-SpamModules-Versions: BY=3.00007832; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000233; SDB=6.00925675; UDB=6.00465577; IPR=6.00705874; 
 BA=6.00005616; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017371; XFM=3.00000015;
 UTC=2017-10-03 01:52:50
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-10-02 21:01:31 - 6.00007408
x-cbparentid: 17100301-9718-0000-0000-0000953CA01F
Message-Id: <OF78B95C25.5F20D5DE-ON862581AE.000890BF-862581AE.000A5301@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-03_01:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Tue, 03 Oct 2017 01:52:57 -0000


--0__=09BB0B3DDF9B162F8f9e8a93df938690918c09BB0B3DDF9B162F
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



The OpenBMC Project is looking for future maintainers.  The amount of code
now and expected in the near future will be more then any one person can
continually handle.  If you are a subject matter expert in a repo under
https://github.com/openbmc or cross functional areas then taking on a role
of maintainer might be appealing.  This isn't a paid thing, this is
completely voluntary opportunity (think Scouts without the camping or
School volunteer without glue).

So how might you go about getting this type of role on your resume?  Start
by signing up for code reviews
https://gerrit.openbmc-project.xyz/#/q/status:open.  Over the next few
weeks we will be looking over the reviews for 1) understanding of the
components architecture 2) Comments focusing on architecture that satisfies
the needs of all 3) bugs 4) and more.  Try to Focus on a single project.

Feel free to ask any questions.

Chris Austen
POWER Systems Enablement Manager
(512) 286-5184 (T/L: 363-5184)

--0__=09BB0B3DDF9B162F8f9e8a93df938690918c09BB0B3DDF9B162F
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">The OpenBMC Project is looking for future m=
aintainers.  The amount of code now and expected in the near future will be=
 more then any one person can continually handle.  If you are a subject mat=
ter expert in a repo under </font><a href=3D"https://github.com/openbmc"><f=
ont size=3D"2">https://github.com/openbmc</font></a><font size=3D"2"> or cr=
oss functional areas then taking on a role of maintainer might be appealing=
.  This isn't a paid thing, this is completely voluntary opportunity (think=
 Scouts without the camping or School volunteer without glue).  </font><br>=
<br><font size=3D"2">So how might you go about getting this type of role on=
 your resume?  Start by signing up for code reviews  </font><a href=3D"http=
s://gerrit.openbmc-project.xyz/#/q/status:open"><font size=3D"2">https://ge=
rrit.openbmc-project.xyz/#/q/status:open</font></a><font size=3D"2">.  Over=
 the next few weeks we will be looking over the reviews for 1) understandin=
g of the components architecture 2) Comments focusing on architecture that =
satisfies the needs of all 3) bugs 4) and more.  Try to Focus on a single p=
roject.  </font><br><br><font size=3D"2">Feel free to ask any questions.  <=
/font><br><font size=3D"2"><br>Chris Austen<br>POWER Systems Enablement Man=
ager <br>(512) 286-5184 (T/L: 363-5184)</font><BR>
</body></html>

--0__=09BB0B3DDF9B162F8f9e8a93df938690918c09BB0B3DDF9B162F--
