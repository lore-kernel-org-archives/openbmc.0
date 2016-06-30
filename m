Return-Path: <shliyi@cn.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgBK03Y5yzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:40:03 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5U7dBAi025857
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 03:40:01 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23v6ye7kpa-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 03:40:01 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Thu, 30 Jun 2016 17:39:58 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 30 Jun 2016 17:39:57 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 7E7BE2BB0057
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:39:56 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5U7du9e7602604
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:39:56 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u5U7du0f001711
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:39:56 +1000
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u5U7dsUX001651
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:39:55 +1000
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Thu, 30 Jun 2016 01:39:53 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 30 Jun 2016 01:39:51 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Thu, 30 Jun 2016 07:39:50 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 30 Jun 2016 07:39:48 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016063007394801-87345 ;
 Thu, 30 Jun 2016 07:39:48 +0000 
MIME-Version: 1.0
In-Reply-To: <20160629182150.GP20922@asimov.austin.ibm.com>
Subject: Re: Gerrit server migration
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Thu, 30 Jun 2016 15:30:29 +0800
References: <20160627221501.GN20922@asimov.austin.ibm.com>
 <20160629182150.GP20922@asimov.austin.ibm.com>
X-KeepSent: 078F9B9A:3E0E3D3C-48257FE2:0028571B;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 36551
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=C7BBF571DFBBD18B8f9e8a93df938690918cC7BBF571DFBBD18B"
Content-Disposition: inline
x-cbid: 16063007-0012-0000-0000-000001A561E3
X-IBM-ISS-SpamDetectors: Score=0.410717; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005443; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000172; SDB=6.00723604; UDB=6.00338135; UTC=2016-06-30
 07:39:49
x-cbparentid: 16063007-4778-0000-0000-0000071AA0FF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF078F9B9A.3E0E3D3C-ON48257FE2.0028571B-48257FE2.00293E97@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606300069
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
X-List-Received-Date: Thu, 30 Jun 2016 07:40:04 -0000


--0__=C7BBF571DFBBD18B8f9e8a93df938690918cC7BBF571DFBBD18B
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Hi,

I have a patch to fix issue: https://github.com/openbmc/skeleton/issues/64
This patch will change skeleton (in github), and openbmc/pyphosphor (in
gerrit).

So I think I should wait for skeleton being migrated to Gerrit to submit
the patch. Do we have an expected time
when all the migration be finished?

Thanks,
-Yi

"openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org> wrote on
06/30/2016 02:21:50 AM:

> From: Patrick Williams <patrick@stwcx.xyz>
> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 06/30/2016 02:22 AM
> Subject: Re: Gerrit server migration
> Sent by: "openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org>
>
> These repos are now also migrated:
>          * openbmc / phosphor-rest-server
>          * openbmc / openbmc-test-automation
>
> On Mon, Jun 27, 2016 at 05:15:01PM -0500, Patrick Williams wrote:
> > All,
> >
> > The Gerrit server is now ready for use.  All of the repositories except
> > for the ones listed below are migrated to it.  We therefore no longer
> > accept pull requests on Github, but instead need commits to go through
> > Gerrit.
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
>
>
>
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>
>
> --
> Patrick Williams
> [attachment "signature.asc" deleted by Yi TZ Li/China/IBM]
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--0__=C7BBF571DFBBD18B8f9e8a93df938690918cC7BBF571DFBBD18B
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Hi,<br><br>I have a patch to fix issue: <a href=3D"https://g=
ithub.com/openbmc/skeleton/issues/64">https://github.com/openbmc/skeleton/i=
ssues/64</a><br>This patch will change skeleton (in github), and openbmc/py=
phosphor (in gerrit).<br><br>So I think I should wait for skeleton being mi=
grated to Gerrit to submit the patch. Do we have an expected time<br>when a=
ll the migration be finished?<br><br>Thanks,<br>-Yi<br><br><tt>&quot;openbm=
c&quot; &lt;openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org&gt; wrote =
on 06/30/2016 02:21:50 AM:<br><br>&gt; From: Patrick Williams &lt;patrick@s=
twcx.xyz&gt;</tt><br><tt>&gt; To: OpenBMC Maillist &lt;openbmc@lists.ozlabs=
.org&gt;</tt><br><tt>&gt; Date: 06/30/2016 02:22 AM</tt><br><tt>&gt; Subjec=
t: Re: Gerrit server migration</tt><br><tt>&gt; Sent by: &quot;openbmc&quot=
; &lt;openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org&gt;</tt><br><tt>=
&gt; <br>&gt; These repos are now also migrated:<br>&gt; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;* openbmc / phosphor-rest-server<br>&gt; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;* openbmc / openbmc-test-automation<br>&gt; <br>&gt; On Mon=
, Jun 27, 2016 at 05:15:01PM -0500, Patrick Williams wrote:<br>&gt; &gt; Al=
l,<br>&gt; &gt; <br>&gt; &gt; The Gerrit server is now ready for use. &nbsp=
;All of the repositories except<br>&gt; &gt; for the ones listed below are =
migrated to it. &nbsp;We therefore no longer<br>&gt; &gt; accept pull reque=
sts on Github, but instead need commits to go through<br>&gt; &gt; Gerrit.<=
br>&gt; &gt; <br>&gt; &gt; For a reminder, the Gerrit server is at <a href=
=3D"https://gerrit.openbmc-project.xyz">https://gerrit.openbmc-project.xyz<=
/a><br>&gt; &gt; and documentation can be found in this outstanding pull re=
quest<br>&gt; &gt; <a href=3D"https://github.com/openbmc/docs/pull/30">http=
s://github.com/openbmc/docs/pull/30</a> .<br>&gt; &gt; <br>&gt; &gt; The Ge=
rrit server automatically replicates all merged commits back to<br>&gt; &gt=
; Github, so Github is still considered the canonical location for our sour=
ce.<br>&gt; &gt; <br>&gt; &gt; Not [yet] migrated repositories:<br>&gt; &gt=
; &nbsp; &nbsp; * Waiting on a few pull requests to be closed.<br>&gt; &gt;=
 &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / openbmc<br>&gt; &gt; &nbsp; &nbsp;=
 &nbsp; &nbsp; * openbmc / skeleton<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp=
; * openbmc / phosphor-host-ipmid<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; =
* openbmc / ipmi-fru-parser<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * open=
bmc / openpower-host-ipmi-oem<br>&gt; &gt; &nbsp; &nbsp; * To be migrated l=
ater this week.<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / docs<b=
r>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / openbmc-build-scripts<b=
r>&gt; &gt; &nbsp; &nbsp; * Never to be migrated (use mailing list for comm=
its).<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / linux<br>&gt; &g=
t; &nbsp; &nbsp; &nbsp; &nbsp; * openbmc / ipmitool<br>&gt; &gt; &nbsp; &nb=
sp; &nbsp; &nbsp; * openbmc / u-boot<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbs=
p; * openbmc / qemu<br>&gt; &gt; --<br>&gt; &gt; Patrick Williams<br>&gt; <=
br>&gt; <br>&gt; <br>&gt; &gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; &gt; openbmc mailing list<br>&gt; &gt; ope=
nbmc@lists.ozlabs.org<br>&gt; &gt; <a href=3D"https://lists.ozlabs.org/list=
info/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br>&gt; <br>&gt=
; <br>&gt; -- <br>&gt; Patrick Williams<br>&gt; [attachment &quot;signature=
.asc&quot; deleted by Yi TZ Li/China/IBM] <br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>=
&gt; openbmc@lists.ozlabs.org<br>&gt; <a href=3D"https://lists.ozlabs.org/l=
istinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br></tt><BR>
</body></html>

--0__=C7BBF571DFBBD18B8f9e8a93df938690918cC7BBF571DFBBD18B--
