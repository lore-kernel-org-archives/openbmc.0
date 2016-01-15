Return-Path: <anoo@us.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AEC7E1A003F
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2016 09:52:01 +1100 (AEDT)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 15 Jan 2016 15:51:59 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 15 Jan 2016 15:51:58 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 1CED81FF0045
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 15:40:08 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
 ESMTP id u0FMpvvH23396450
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 15:51:57 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0FMpvqJ031084
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 15:51:57 -0700
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0FMpuUC031048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 15:51:57 -0700
Message-Id: <201601152251.u0FMpuUC031048@d03av05.boulder.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 15 Jan 2016 17:51:56 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 15 Jan 2016 17:51:55 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 15 Jan 2016 22:51:53 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 15 Jan 2016 22:51:52 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.106.154.203])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016011522525129-445712 ;
 Fri, 15 Jan 2016 22:52:51 +0000 
In-Reply-To: <87mvs8c1cx.fsf@linux.vnet.ibm.com>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton 10/15] add new flash ids
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Fri, 15 Jan 2016 16:51:52 -0600
References: <1450482035-4530-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450482035-4530-11-git-send-email-openbmc-patches@stwcx.xyz>
 <87mvs8c1cx.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
X-KeepSent: D521FAF2:80F2E444-86257F3B:007D791F;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 61579
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 007D998F86257F3B_="
x-cbid: 16011522-0029-0000-0000-00000FAA76A7
X-IBM-ISS-SpamDetectors: Score=0.449102; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004793; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000133; SDB=6.00645797; UDB=6.00291374; UTC=2016-01-15
 22:51:53
x-cbparentid: 16011522-9900-0000-0000-000005B1D31C
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jan 2016 22:52:02 -0000


--=_alternative 007D998F86257F3B_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

I sent a patch for upstream pflash to skiboot@lists.ozlabs.org for review.





From:   Stewart Smith <stewart@linux.vnet.ibm.com>
To:     OpenBMC Patches <openbmc-patches@stwcx.xyz>,=20
openbmc@lists.ozlabs.org
Date:   01/13/2016 09:14 PM
Subject:        Re: [PATCH skeleton 10/15] add new flash ids
Sent by:        "openbmc"=20
<openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org>



OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Norman James <njames@us.ibm.com>
>
> ---
>  objects/pflash/libflash/libflash.c | 6 ++++++
>  1 file changed, 6 insertions(+)

has this gone upstream to pflash?

--=20
Stewart Smith
OPAL Architect, IBM.

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc





--=_alternative 007D998F86257F3B_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">I sent a patch for upstream pflash to sk=
iboot@lists.ozlabs.org
for review.</font><br><br><br><br><br><br><font size=3D1 color=3D#5f5f5f fa=
ce=3D"sans-serif">From: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">Stewart Smith &lt;stewart@l=
inux.vnet.ibm.com&gt;</font><br><font size=3D1 color=3D#5f5f5f face=3D"sans=
-serif">To: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">OpenBMC Patches &lt;openbmc=
-patches@stwcx.xyz&gt;,
openbmc@lists.ozlabs.org</font><br><font size=3D1 color=3D#5f5f5f face=3D"s=
ans-serif">Date: &nbsp; &nbsp; &nbsp;
&nbsp;</font><font size=3D1 face=3D"sans-serif">01/13/2016 09:14 PM</font><=
br><font size=3D1 color=3D#5f5f5f face=3D"sans-serif">Subject: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">Re: [PATCH skeleton
10/15] add new flash ids</font><br><font size=3D1 color=3D#5f5f5f face=3D"s=
ans-serif">Sent by: &nbsp; &nbsp;
&nbsp; &nbsp;</font><font size=3D1 face=3D"sans-serif">&quot;openbmc&quot;
&lt;openbmc-bounces+anoo=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr no=
shade><br><br><br><tt><font size=3D2>OpenBMC Patches &lt;openbmc-patches@st=
wcx.xyz&gt;
writes:<br>&gt; From: Norman James &lt;njames@us.ibm.com&gt;<br>&gt;<br>&gt=
; ---<br>&gt; &nbsp;objects/pflash/libflash/libflash.c | 6 ++++++<br>&gt; &=
nbsp;1 file changed, 6 insertions(+)<br><br>has this gone upstream to pflas=
h?<br><br>-- <br>Stewart Smith<br>OPAL Architect, IBM.<br><br>=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing l=
ist<br>openbmc@lists.ozlabs.org<br></font></tt><a href=3Dhttps://lists.ozla=
bs.org/listinfo/openbmc><tt><font size=3D2>https://lists.ozlabs.org/listinf=
o/openbmc</font></tt></a><tt><font size=3D2><br></font></tt><br><br><BR>
--=_alternative 007D998F86257F3B_=--
