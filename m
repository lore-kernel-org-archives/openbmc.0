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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DtYG3j8QzF0Pd
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 01:35:42 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w5PFYWU4018600
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 11:35:40 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ju0vuqk5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 25 Jun 2018 11:35:40 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Mon, 25 Jun 2018 15:35:39 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 25 Jun 2018 15:35:32 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2018062515353190-752940 ;
 Mon, 25 Jun 2018 15:35:31 +0000 
In-Reply-To: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
To: krtaylor <kurt.r.taylor@gmail.com>
Cc: alirhas@microsoft.com, bradleyb@fuzziesquirrel.com, james.mihm@intel.com, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "openbmc"<openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>
Subject: Re: OpenBMC Release Planning Working Group
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Mon, 25 Jun 2018 21:05:31 +0530
References: <f86c688b-b237-bdd5-12a0-385f96902581@gmail.com>
MIME-Version: 1.0
X-KeepSent: 271EFC9C:4E484BDD-002582B7:0055123F;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP10 SHF68 March 06, 2018
X-LLNOutbound: False
X-Disclaimed: 4599
X-TNEFEvaluated: 1
x-cbid: 18062515-6357-0000-0000-0000064207CD
X-IBM-SpamModules-Scores: BY=0.261336; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.018098
X-IBM-SpamModules-Versions: BY=3.00009253; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01052157; UDB=6.00539362; IPR=6.00830083; 
 BA=6.00006019; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00021850; XFM=3.00000015;
 UTC=2018-06-25 15:35:36
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-06-25 10:01:45 - 6.00008619
x-cbparentid: 18062515-6358-0000-0000-0000EED82149
Message-Id: <OF271EFC9C.4E484BDD-ON002582B7.0055123F-652582B7.0055A643@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="=_alternative 0055A073652582B7_="
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-06-25_07:, , signatures=0
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
X-List-Received-Date: Mon, 25 Jun 2018 15:35:47 -0000


--=_alternative 0055A073652582B7_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

Hi Kurt,=20

        I prefer the option 2) Thursdays, 8:00am Central US (1300 UTC)=20
time. Please sign me up.  Thanks

George Keishing
=20



From:   krtaylor <kurt.r.taylor@gmail.com>
To:     "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Cc:     alirhas@microsoft.com, bradleyb@fuzziesquirrel.com,=20
james.mihm@intel.com
Date:   06/22/2018 12:38 AM
Subject:        OpenBMC Release Planning Working Group
Sent by:        "openbmc"=20
<openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org>



Hi all,

The long anticipated OpenBMC Release Planning working group is now=20
forming and will have its first meeting next week. I would like to keep=20
the meeting small at first so that we can move quickly, but I do need=20
complete representation. Please let me know if you'd like to participate=20
and what day a meeting would work best for you. Those on copy should=20
plan on attending or at least make sure someone is covering for your=20
organization.

Let me know if you have any questions.

Regards, Kurt Taylor (krtaylor)


Proposed times:

1) Tuesdays, 2:00pm Central US (1900 UTC)

2) Thursdays, 8:00am Central US (1300 UTC)

3) Thursdays, 3:00pm Central US (2000 UTC)


Initial Agenda:

1) Agree on the release process and set an initial release date in=20
November (see email from May 21)

2) Set design and freeze milestones

3) "Must" deliver items for November release

4) How to open the design and development for a needed feature






--=_alternative 0055A073652582B7_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<span style=3D" font-size:10pt;font-family:sans-serif">Hi Kurt, &nbsp;</spa=
n><br><br><span style=3D" font-size:10pt;font-family:sans-serif">&nbsp; &nb=
sp;
&nbsp; &nbsp; I prefer the option 2) Thursdays, 8:00am Central
US (1300 UTC) time. Please sign me up. &nbsp;Thanks</span><br><br><span sty=
le=3D" font-size:10pt;color:blue;font-family:sans-serif">George
Keishing</span><br><span style=3D" font-size:10pt;color:blue;font-family:sa=
ns-serif">&nbsp;
&nbsp;</span><br><br><br><br><span style=3D" font-size:9pt;color:#5f5f5f;fo=
nt-family:sans-serif">From:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">krtaylor
&lt;kurt.r.taylor@gmail.com&gt;</span><br><span style=3D" font-size:9pt;col=
or:#5f5f5f;font-family:sans-serif">To:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">&quot;openbmc@lists.ozlabs.org&quot;
&lt;openbmc@lists.ozlabs.org&gt;</span><br><span style=3D" font-size:9pt;co=
lor:#5f5f5f;font-family:sans-serif">Cc:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">alirhas@microsoft.com,
bradleyb@fuzziesquirrel.com, james.mihm@intel.com</span><br><span style=3D"=
 font-size:9pt;color:#5f5f5f;font-family:sans-serif">Date:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">06/22/2018
12:38 AM</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:=
sans-serif">Subject:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">OpenBMC
Release Planning Working Group</span><br><span style=3D" font-size:9pt;colo=
r:#5f5f5f;font-family:sans-serif">Sent
by: &nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-fa=
mily:sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org&gt;</span><br><h=
r noshade><br><br><br><tt><span style=3D" font-size:10pt">Hi all,<br><br>Th=
e long anticipated OpenBMC Release Planning working group is now <br>formin=
g and will have its first meeting next week. I would like to keep
<br>the meeting small at first so that we can move quickly, but I do need <=
br>complete representation. Please let me know if you'd like to participate
<br>and what day a meeting would work best for you. Those on copy should <b=
r>plan on attending or at least make sure someone is covering for your <br>=
organization.<br><br>Let me know if you have any questions.<br><br>Regards,=
 Kurt Taylor (krtaylor)<br><br><br>Proposed times:<br><br>1) Tuesdays, 2:00=
pm Central US (1900 UTC)<br><br>2) Thursdays, 8:00am Central US (1300 UTC)<=
br><br>3) Thursdays, 3:00pm Central US (2000 UTC)<br><br><br>Initial Agenda=
:<br><br>1) Agree on the release process and set an initial release date in=
 <br>November (see email from May 21)<br><br>2) Set design and freeze miles=
tones<br><br>3) &quot;Must&quot; deliver items for November release<br><br>=
4) How to open the design and development for a needed feature<br><br></spa=
n></tt><br><br><BR>
--=_alternative 0055A073652582B7_=--
