Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjdcs1s6LzDqMp
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 05:18:20 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v57JECrv037551
 for <openbmc@lists.ozlabs.org>; Wed, 7 Jun 2017 15:18:18 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2axptq1tdw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Jun 2017 15:18:18 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 7 Jun 2017 15:18:16 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 7 Jun 2017 15:18:16 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v57JIHGw45416526
 for <openbmc@lists.ozlabs.org>; Wed, 7 Jun 2017 19:18:17 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB015B204E
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 15:15:50 -0400 (EDT)
Received: from d50lp32.co.us.ibm.com (unknown [9.17.249.36])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS id B9B79B2054
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 15:15:50 -0400 (EDT)
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 7 Jun 2017 13:18:14 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Wed, 7 Jun 2017 13:18:13 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 7 Jun 2017 19:18:11 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 7 Jun 2017 19:18:09 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2017060719180818-893571 ;
 Wed, 7 Jun 2017 19:18:08 +0000 
MIME-Version: 1.0
In-Reply-To: <CAO=notyH_wpUBZELWGf5dBeCApB4+Zo-VrTa4vYJyHYjpxHvjQ@mail.gmail.com>
Subject: Re: New Platform Guide
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Wed, 7 Jun 2017 14:18:07 -0500
References: <CAO=notyH_wpUBZELWGf5dBeCApB4+Zo-VrTa4vYJyHYjpxHvjQ@mail.gmail.com>
X-KeepSent: EBDAB228:37EA5B4E-86258138:00692732;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 64439
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BB0BABDFFAA1A28f9e8a93df938690918c09BB0BABDFFAA1A2"
x-cbid: 17060719-0044-0000-0000-000003488A84
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.38988; ST=0; TS=0; UL=0; ISC=; MB=0.250365
X-IBM-SpamModules-Versions: BY=3.00007190; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00871549; UDB=6.00433493; IPR=6.00651541; 
 BA=6.00005405; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015736; XFM=3.00000015;
 UTC=2017-06-07 19:18:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-06-07 11:20:55 - 6.00006861
x-cbparentid: 17060719-3108-0000-0000-000042C4B1E8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007190; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00871549; UDB=6.00433493; IPR=6.00651541; 
 BA=6.00005405; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015736; XFM=3.00000015;
 UTC=2017-06-07 19:18:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFEBDAB228.37EA5B4E-ON86258138.00692732-86258138.006A0794@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-07_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706070345
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Jun 2017 19:18:21 -0000

--0__=09BB0BABDFFAA1A28f9e8a93df938690918c09BB0BABDFFAA1A2
Content-type: multipart/alternative; 
	Boundary="1__=09BB0BABDFFAA1A28f9e8a93df938690918c09BB0BABDFFAA1A2"


--1__=09BB0BABDFFAA1A28f9e8a93df938690918c09BB0BABDFFAA1A2
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1


What is in the docs repo is all.  There isn't a platform guide.  I'll help
you write one if you would like.  I think the community would appreciate
one.


Chris Austen
POWER Systems Enablement Manager



From:	Patrick Venture <venture@google.com>
To:	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:	06/07/2017 01:19 PM
Subject:	New Platform Guide
Sent by:	"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>



Where is the new platform guide?

In trying to get the quanta board running with everything; I've often run
into stumbling blocks when trying to define what packages are required and
what need to be replaced with custom versions -- for things like sensors.

Often I've been more or less reduced to checking the journal logs to see if
something is saying why it's not running (settings.py was crashing which
meant ipmid wouldn't start as an example).=A0 It took some source searching
to figure out that x really depended on some object existing.=A0 Often those
were in the service file, but not every time.=A0 And especially as OpenBMC =
is
a moving target, this has been somewhat discouraging.=A0 Especially when the
"supported" platforms all stem from the skeleton which still has its
fingers in many places.

That said, there are a lot of dependencies between packages, and things
that you receive that maybe you don't want or need or aren't configured
properly.=A0 For example, I don't know why or what the led-manager is doing
but it's on my system running.=A0 I don't believe I configured it.

If there is a guide, then I didn't see it and I apologize.

If there isn't a guide -- I can start one; however, I won't really have to
do it properly until some time in July.=A0 My approach would be, create a n=
ew
platform that mimics Zaius but under a different name and see what it takes
to output a similar image and what is really required -- although difficult
for me to test.=A0 So maybe a new Quanta image from scratch and see what's
running, and why and what things need to be configured.

Thanks,
Patrick


--1__=09BB0BABDFFAA1A28f9e8a93df938690918c09BB0BABDFFAA1A2
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><font size=3D"2">What is in the docs repo is all.  There isn=
't a platform guide.  I'll help you write one if you would like.  I think t=
he community would appreciate one.  </font><br><br><font size=3D"2"><br>Chr=
is Austen<br>POWER Systems Enablement Manager <br></font><br><img width=3D"=
16" height=3D"16" src=3D"cid:1=5F=5F=3D09BB0BABDFFAA1A28f9e8a93df938690918c=
09B@" border=3D"0" alt=3D"Inactive hide details for Patrick Venture ---06/0=
7/2017 01:19:19 PM---Where is the new platform guide? In trying to get the =
qua"><font size=3D"2" color=3D"#424282">Patrick Venture ---06/07/2017 01:19=
:19 PM---Where is the new platform guide? In trying to get the quanta board=
 running with everything; I've oft</font><br><br><font size=3D"2" color=3D"=
#5F5F5F">From:        </font><font size=3D"2">Patrick Venture &lt;venture@g=
oogle.com&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">To:        </fon=
t><font size=3D"2">OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</font>=
<br><font size=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2"=
>06/07/2017 01:19 PM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject: =
       </font><font size=3D"2">New Platform Guide</font><br><font size=3D"2=
" color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;openbmc&q=
uot; &lt;openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org&gt;</font><b=
r><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color:#8091=
A5; "><br><br><br><font size=3D"2">Where is the new platform guide?</font><=
br><br><font size=3D"2">In trying to get the quanta board running with ever=
ything; I've often run into stumbling blocks when trying to define what pac=
kages are required and what need to be replaced with custom versions -- for=
 things like sensors.</font><br><br><font size=3D"2">Often I've been more o=
r less reduced to checking the journal logs to see if something is saying w=
hy it's not running (settings.py was crashing which meant ipmid wouldn't st=
art as an example).=A0 It took some source searching to figure out that x r=
eally depended on some object existing.=A0 Often those were in the service =
file, but not every time.=A0 And especially as OpenBMC is a moving target, =
this has been somewhat discouraging.=A0 Especially when the &quot;supported=
&quot; platforms all stem from the skeleton which still has its fingers in =
many places.</font><br><br><font size=3D"2">That said, there are a lot of d=
ependencies between packages, and things that you receive that maybe you do=
n't want or need or aren't configured properly.=A0 For example, I don't kno=
w why or what the led-manager is doing but it's on my system running.=A0 I =
don't believe I configured it.</font><br><br><font size=3D"2">If there is a=
 guide, then I didn't see it and I apologize.</font><br><br><font size=3D"2=
">If there isn't a guide -- I can start one; however, I won't really have t=
o do it properly until some time in July.=A0 My approach would be, create a=
 new platform that mimics Zaius but under a different name and see what it =
takes to output a similar image and what is really required -- although dif=
ficult for me to test.=A0 So maybe a new Quanta image from scratch and see =
what's running, and why and what things need to be configured.</font><br><b=
r><font size=3D"2">Thanks,</font><br><font size=3D"2">Patrick</font><br><br=
><BR>
</body></html>

--1__=09BB0BABDFFAA1A28f9e8a93df938690918c09BB0BABDFFAA1A2--


--0__=09BB0BABDFFAA1A28f9e8a93df938690918c09BB0BABDFFAA1A2
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BB0BABDFFAA1A28f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BB0BABDFFAA1A28f9e8a93df938690918c09BB0BABDFFAA1A2--
