Return-Path: <vishwanath@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rf1773w9GzDqnQ
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 19:42:26 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5S9dJPe088330
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 05:42:24 -0400
Received: from e28smtp03.in.ibm.com (e28smtp03.in.ibm.com [125.16.236.3])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23sm3uteb1-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 05:42:24 -0400
Received: from localhost
 by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 28 Jun 2016 15:12:20 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp03.in.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 28 Jun 2016 15:12:15 +0530
X-IBM-Helo: d28dlp03.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id 93442125805C
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 15:14:55 +0530 (IST)
Received: from d50lp32.co.us.ibm.com (d50lp32.boulder.ibm.com [9.17.249.36])
 by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5S9gDjJ4456858
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 15:12:14 +0530
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 28 Jun 2016 03:42:13 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Tue, 28 Jun 2016 03:42:10 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 28 Jun 2016 09:42:09 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 28 Jun 2016 09:42:06 -0000
X-IBM-Helo: us1a3-smtp04.a3.dal06.isc4sb.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: joel@jms.id.au;patrick@stwcx.xyz;openbmc@lists.ozlabs.org
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016062809420614-153282 ;
 Tue, 28 Jun 2016 09:42:06 +0000 
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd45WjdpyCPCibXwZj3tn1ud+HjP1s--aMdrNkD=38wmw@mail.gmail.com>
Subject: Re: Gerrit server migration
To: Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Tue, 28 Jun 2016 15:11:54 +0530
References: <20160627221501.GN20922@asimov.austin.ibm.com>
 <CACPK8Xd45WjdpyCPCibXwZj3tn1ud+HjP1s--aMdrNkD=38wmw@mail.gmail.com>
X-KeepSent: 6F6036FA:97FA38BD-65257FE0:003530AB;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1 October 14, 2013
X-LLNOutbound: False
X-Disclaimed: 53755
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABBF573DFA6B63B8f9e8a93df938690918cEABBF573DFA6B63B"
Content-Disposition: inline
x-cbid: 16062809-0008-0000-0000-000002CE75ED
X-IBM-ISS-SpamDetectors: Score=0.408524; BY=0.092672; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.408524; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005437; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000171; SDB=6.00722690; UDB=6.00337589; UTC=2016-06-28
 09:42:08
x-cbparentid: 16062809-5102-0000-0000-0000002172FA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF6F6036FA.97FA38BD-ON65257FE0.003530AB-65257FE0.00354648@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-28_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606280090
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2016 09:42:28 -0000


--0__=EABBF573DFA6B63B8f9e8a93df938690918cEABBF573DFA6B63B
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

I would vote for maintainer of the repository to give a +1 before the code
gets merged.

"openbmc" <openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org> wrote =
on
06/28/2016 09:22:57 AM:

> From: Joel Stanley <joel@jms.id.au>
> To: Patrick Williams <patrick@stwcx.xyz>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 06/28/2016 09:23 AM
> Subject: Re: Gerrit server migration
> Sent by: "openbmc" <openbmc-bounces
+vishwanath=3Din.ibm.com@lists.ozlabs.org>
>
> Hi Patrick,
>
> A few questions on how we should use gerrit.
>
> On Tue, Jun 28, 2016 at 7:45 AM, Patrick Williams <patrick@stwcx.xyz>
wrote:
> > All,
> >
> > The Gerrit server is now ready for use.  All of the repositories except
> > for the ones listed below are migrated to it.  We therefore no longer
> > accept pull requests on Github, but instead need commits to go through
> > Gerrit.
>
> How do we get notifications when a patch is proposed for review?
>
> Do we have owners of each component that must review before a patch
> can be merged?
>
> Cheers,
>
> Joel
>
> >
> > For a reminder, the Gerrit server is at
https://gerrit.openbmc-project.xyz
> > and documentation can be found in this outstanding pull request
> > https://github.com/openbmc/docs/pull/30 .
> >
> > The Gerrit server automatically replicates all merged commits back to
> > Github, so Github is still considered the canonical location for our
source.
> >
> > Not [yet] migrated repositories:
> >     * Waiting on a few pull requests to be closed.
> >         * openbmc / openbmc
> >         * openbmc / skeleton
> >         * openbmc / phosphor-host-ipmid
> >         * openbmc / ipmi-fru-parser
> >         * openbmc / openpower-host-ipmi-oem
> >         * openbmc / phosphor-rest-server
> >         * openbmc / openbmc-test-automation
> >     * To be migrated later this week.
> >         * openbmc / docs
> >         * openbmc / openbmc-build-scripts
> >     * Never to be migrated (use mailing list for commits).
> >         * openbmc / linux
> >         * openbmc / ipmitool
> >         * openbmc / u-boot
> >         * openbmc / qemu
> > --
> > Patrick Williams
> >
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
> >
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--0__=EABBF573DFA6B63B8f9e8a93df938690918cEABBF573DFA6B63B
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>I would vote for maintainer of the repository to give a +1 b=
efore the code gets merged.<br><br><tt>&quot;openbmc&quot; &lt;openbmc-boun=
ces+vishwanath=3Din.ibm.com@lists.ozlabs.org&gt; wrote on 06/28/2016 09:22:=
57 AM:<br><br>&gt; From: Joel Stanley &lt;joel@jms.id.au&gt;</tt><br><tt>&g=
t; To: Patrick Williams &lt;patrick@stwcx.xyz&gt;</tt><br><tt>&gt; Cc: Open=
BMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</tt><br><tt>&gt; Date: 06/28/=
2016 09:23 AM</tt><br><tt>&gt; Subject: Re: Gerrit server migration</tt><br=
><tt>&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+vishwanath=3Din.=
ibm.com@lists.ozlabs.org&gt;</tt><br><tt>&gt; <br>&gt; Hi Patrick,<br>&gt; =
<br>&gt; A few questions on how we should use gerrit.<br>&gt; <br>&gt; On T=
ue, Jun 28, 2016 at 7:45 AM, Patrick Williams &lt;patrick@stwcx.xyz&gt; wro=
te:<br>&gt; &gt; All,<br>&gt; &gt;<br>&gt; &gt; The Gerrit server is now re=
ady for use. &nbsp;All of the repositories except<br>&gt; &gt; for the ones=
 listed below are migrated to it. &nbsp;We therefore no longer<br>&gt; &gt;=
 accept pull requests on Github, but instead need commits to go through<br>=
&gt; &gt; Gerrit.<br>&gt; <br>&gt; How do we get notifications when a patch=
 is proposed for review?<br>&gt; <br>&gt; Do we have owners of each compone=
nt that must review before a patch<br>&gt; can be merged?<br>&gt; <br>&gt; =
Cheers,<br>&gt; <br>&gt; Joel<br>&gt; <br>&gt; &gt;<br>&gt; &gt; For a remi=
nder, the Gerrit server is at <a href=3D"https://gerrit.openbmc-project.xyz=
">https://gerrit.openbmc-project.xyz</a><br>&gt; &gt; and documentation can=
 be found in this outstanding pull request<br>&gt; &gt; <a href=3D"https://=
github.com/openbmc/docs/pull/30">https://github.com/openbmc/docs/pull/30</a=
> .<br>&gt; &gt;<br>&gt; &gt; The Gerrit server automatically replicates al=
l merged commits back to<br>&gt; &gt; Github, so Github is still considered=
 the canonical location for our source.<br>&gt; &gt;<br>&gt; &gt; Not [yet]=
 migrated repositories:<br>&gt; &gt; &nbsp; &nbsp; * Waiting on a few pull =
requests to be closed.<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc /=
 openbmc<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / skeleton<br>&=
gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / phosphor-host-ipmid<br>&gt=
; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / ipmi-fru-parser<br>&gt; &gt;=
 &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / openpower-host-ipmi-oem<br>&gt; &g=
t; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / phosphor-rest-server<br>&gt; &gt=
; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / openbmc-test-automation<br>&gt; &=
gt; &nbsp; &nbsp; * To be migrated later this week.<br>&gt; &gt; &nbsp; &nb=
sp; &nbsp; &nbsp; * openbmc / docs<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp;=
 * openbmc / openbmc-build-scripts<br>&gt; &gt; &nbsp; &nbsp; * Never to be=
 migrated (use mailing list for commits).<br>&gt; &gt; &nbsp; &nbsp; &nbsp;=
 &nbsp; * openbmc / linux<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbm=
c / ipmitool<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / u-boot<br=
>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / qemu<br>&gt; &gt; --<br>=
&gt; &gt; Patrick Williams<br>&gt; &gt;<br>&gt; &gt; =5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; &gt; openbmc mailing =
list<br>&gt; &gt; openbmc@lists.ozlabs.org<br>&gt; &gt; <a href=3D"https://=
lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbm=
c</a><br>&gt; &gt;<br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; openbmc@lists.ozlab=
s.org<br>&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https:/=
/lists.ozlabs.org/listinfo/openbmc</a><br></tt><BR>
</body></html>

--0__=EABBF573DFA6B63B8f9e8a93df938690918cEABBF573DFA6B63B--
