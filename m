Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qmVjV14tXzDq64
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 18:15:58 +1000 (AEST)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Fri, 15 Apr 2016 18:15:56 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 15 Apr 2016 18:15:54 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 7FABB2BB0054
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 18:15:53 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3F8FjJ461997140
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 18:15:53 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3F8FKtK015022
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 18:15:20 +1000
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3F8FIbh014693
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 18:15:19 +1000
Message-Id: <201604150815.u3F8FIbh014693@d23av03.au.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Fri, 15 Apr 2016 02:15:10 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 15 Apr 2016 02:15:07 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Fri, 15 Apr 2016 08:15:04 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 15 Apr 2016 08:14:04 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016041508140196-100810 ;
 Fri, 15 Apr 2016 08:14:01 +0000 
MIME-Version: 1.0
In-Reply-To: <OFBC8D1ADC.A14A7AE9-ON65257F92.0033DE95-65257F92.003601D1@LocalDomain>
Subject: Re: [PATCH skeleton] skeleton: Add new API
 SystemManager::getFRUObject()
To: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, "OpenBMC Members"
 <OpenBMC_Members@d23av03.au.ibm.com>, openbmc@lists.ozlabs.org
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Fri, 15 Apr 2016 16:13:53 +0800
References: <1460365853-18421-1-git-send-email-openbmc-patches@stwcx.xyz>
 <OFBC8D1ADC.A14A7AE9-ON65257F92.0033DE95-65257F92.003601D1@LocalDomain>
X-KeepSent: 9A0C99EA:37E5D00B-00257F96:002D08CE;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 61171
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBBF505DFBE8E5E8f9e8a93df938690918c8FBBF505DFBE8E5E"
Content-Disposition: inline
x-cbid: 16041508-0009-0000-0000-000006DCA74A
X-IBM-ISS-SpamDetectors: Score=0.433748; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.433748; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005158; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000157; SDB=6.00688318; UDB=6.00316884; UTC=2016-04-15
 08:14:06
x-cbparentid: 16041508-5920-0000-0000-00000730E2A9
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
X-List-Received-Date: Fri, 15 Apr 2016 08:15:58 -0000


--0__=8FBBF505DFBE8E5E8f9e8a93df938690918c8FBBF505DFBE8E5E
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Hi Vishwa,

Thanks for the comments. I've create a new dbus API based on your
suggestions.
Please have a look:
https://github.com/openbmc/skeleton/pull/62
https://github.com/openbmc/ipmi-fru-parser/pull/14/files

Thanks,
-Yi

Vishwanatha Subbanna/India/IBM wrote on 04/11/2016 05:49:54 PM:

> From: Vishwanatha Subbanna/India/IBM
> To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Members, Yi
> TZ Li/China/IBM@IBMCN
> Cc: openbmc@lists.ozlabs.org
> Date: 04/11/2016 05:49 PM
> Subject: Re: [PATCH skeleton] skeleton: Add new API
> SystemManager::getFRUObject()
>
> Hello Yi,
>
> Thanks for the patch. Here are my comments.
>
> "openbmc" <openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org>
> wrote on 11/04/2016 02:40:52 pm:
>
> > From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> > To: openbmc@lists.ozlabs.org
> > Date: 11/04/2016 02:41 pm
> > Subject: [PATCH skeleton] skeleton: Add new API
> SystemManager::getFRUObject()
> > Sent by: "openbmc" <openbmc-bounces
+vishwanath=3Din.ibm.com@lists.ozlabs.org>
> >
> > ipmi-fru-parser uses getObjectFromId('FRU=5FSTR', fru=5Farea=5Fname) to
> > ask for the dbus object path of the 'fru=5Farea=5Fname'. The returned
> > value is also used to check the 'present' status of FRU. Sometimes
> > the 'fru=5Farea=5Fname' does not defined in Skeleton's ID=5FLOOKUP tabl=
e.
> > system=5Fmanager will report a "ERROR: lookup not found" error message.
> >
>
>
> > This patch added an API similiar with getObjectFromId().
> > It does not report error when the 'fru=5Farea=5Fname' is not defined.
> > It can be used by ipmi-fru-parser to replace getObjectFromId().
> >
>
> If something is not there, it is still an error. So masking the
> error may not be a right approach.
>
>
> > Also the orignal "ERROR" message is changed to "WARNING".
> >
>
> IMO, we may not be solving the root cause here.. "WARNING", -or-
> "ERROR" would still bother whoever looking into it.
> So, I still feel that we need to make the actual change.
>
> When I initially proposed a solution to Norm to remove those ERRORs,
> he had an opinion that "something not there is not there, so its an
error".
>
> Here is how I look into it ( one of the implementations .. )
>
> 1: writefru data will make a call into a new API passing the fru id.
> 2: Skeleton code will return the available sections for that fru id.
> ( example: chassis, board / board, product etc )
> 3: writefru will use that and then make getObjectFromByteId for a
> particular fruid=5F<area>
>

> > Signed-off-by: Yi Li <adamliyi@msn.com>
> >
> > <!-- Reviewable:start -->
> > ---
> > This change is [<img src=3D"https://reviewable.io/review=5Fbutton.svg"
> > height=3D"35" align=3D"absmiddle" alt=3D"Reviewable"/>](https://
> > reviewable.io/reviews/openbmc/skeleton/60)
> > <!-- Reviewable:end -->
> >
> >
> > https://github.com/openbmc/skeleton/pull/60
> >
> > Yi Li (1):
> >   skeleton: Add new API SystemManager::getFRUObject()
> >
> >  bin/system=5Fmanager.py | 40 +++++++++++++++++++++++++++-------------
> >  1 file changed, 27 insertions(+), 13 deletions(-)
> >
> > --
> > 2.7.1
> >
> >
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc

--0__=8FBBF505DFBE8E5E8f9e8a93df938690918c8FBBF505DFBE8E5E
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Hi Vishwa,<br><br>Thanks for the comments. I've create a new=
 dbus API based on your suggestions.<br>Please have a look:<br><a href=3D"h=
ttps://github.com/openbmc/skeleton/pull/62">https://github.com/openbmc/skel=
eton/pull/62</a><br><a href=3D"https://github.com/openbmc/ipmi-fru-parser/p=
ull/14/files">https://github.com/openbmc/ipmi-fru-parser/pull/14/files</a><=
br><br>Thanks,<br>-Yi<br><br><tt>Vishwanatha Subbanna/India/IBM wrote on 04=
/11/2016 05:49:54 PM:<br><br>&gt; From: Vishwanatha Subbanna/India/IBM</tt>=
<br><tt>&gt; To: OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;, OpenBMC=
 Members, Yi<br>&gt; TZ Li/China/IBM@IBMCN</tt><br><tt>&gt; Cc: openbmc@lis=
ts.ozlabs.org</tt><br><tt>&gt; Date: 04/11/2016 05:49 PM</tt><br><tt>&gt; S=
ubject: Re: [PATCH skeleton] skeleton: Add new API <br>&gt; SystemManager::=
getFRUObject()</tt><br><tt>&gt; <br>&gt; Hello Yi,</tt><br><tt>&gt; <br>&gt=
; Thanks for the patch. Here are my comments.</tt><br><tt>&gt; <br>&gt; &qu=
ot;openbmc&quot; &lt;openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.o=
rg&gt; <br>&gt; wrote on 11/04/2016 02:40:52 pm:<br>&gt; <br>&gt; &gt; From=
: OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</tt><br><tt>&gt; &gt; T=
o: openbmc@lists.ozlabs.org</tt><br><tt>&gt; &gt; Date: 11/04/2016 02:41 pm=
</tt><br><tt>&gt; &gt; Subject: [PATCH skeleton] skeleton: Add new API <br>=
&gt; SystemManager::getFRUObject()</tt><br><tt>&gt; &gt; Sent by: &quot;ope=
nbmc&quot; &lt;openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org&gt;=
</tt><br><tt>&gt; &gt; <br>&gt; &gt; ipmi-fru-parser uses getObjectFromId('=
FRU=5FSTR', fru=5Farea=5Fname) to<br>&gt; &gt; ask for the dbus object path=
 of the 'fru=5Farea=5Fname'. The returned<br>&gt; &gt; value is also used t=
o check the 'present' status of FRU. Sometimes<br>&gt; &gt; the 'fru=5Farea=
=5Fname' does not defined in Skeleton's ID=5FLOOKUP table.<br>&gt; &gt; sys=
tem=5Fmanager will report a &quot;ERROR: lookup not found&quot; error messa=
ge.<br>&gt; &gt; </tt><br><tt>&gt; <br>&gt; <br>&gt; &gt; This patch added =
an API similiar with getObjectFromId().<br>&gt; &gt; It does not report err=
or when the 'fru=5Farea=5Fname' is not defined.<br>&gt; &gt; It can be used=
 by ipmi-fru-parser to replace getObjectFromId().<br>&gt; &gt; </tt><br><tt=
>&gt; <br>&gt; If something is not there, it is still an error. So masking =
the <br>&gt; error may not be a right approach.</tt><br><tt>&gt; <br>&gt; <=
br>&gt; &gt; Also the orignal &quot;ERROR&quot; message is changed to &quot=
;WARNING&quot;.<br>&gt; &gt; </tt><br><tt>&gt; <br>&gt; IMO, we may not be =
solving the root cause here.. &quot;WARNING&quot;, -or- <br>&gt; &quot;ERRO=
R&quot; would still bother whoever looking into it. </tt><br><tt>&gt; So, I=
 still feel that we need to make the actual change.</tt><br><tt>&gt; <br>&g=
t; When I initially proposed a solution to Norm to remove those ERRORs,<br>=
&gt; he had an opinion that &quot;something not there is not there, so its =
an error&quot;.</tt><br><tt>&gt; <br>&gt; Here is how I look into it ( one =
of the implementations .. )</tt><br><tt>&gt; <br>&gt; 1: writefru data will=
 make a call into a new API passing the fru id.</tt><br><tt>&gt; 2: Skeleto=
n code will return the available sections for that fru id.<br>&gt; ( exampl=
e: chassis, board / board, product etc )</tt><br><tt>&gt; 3: writefru will =
use that and then make getObjectFromByteId for a <br>&gt; particular fruid=
=5F&lt;area&gt;</tt><br><tt>&gt; <br></tt><br><tt>&gt; &gt; Signed-off-by: =
Yi Li &lt;adamliyi@msn.com&gt;<br>&gt; &gt; <br>&gt; &gt; &lt;!-- Reviewabl=
e:start --&gt;<br>&gt; &gt; ---<br>&gt; &gt; This change is <img src=3D"htt=
ps://reviewable.io/review=5Fbutton.svg"=20
> > height=3D"35" align=3D"absmiddle" alt=3D"Reviewable"/>(https://<br>&gt;=
 &gt; reviewable.io/reviews/openbmc/skeleton/60)<br>&gt; &gt; &lt;!-- Revie=
wable:end --&gt;<br>&gt; &gt; <br>&gt; &gt; <br>&gt; &gt; <a href=3D"https:=
//github.com/openbmc/skeleton/pull/60">https://github.com/openbmc/skeleton/=
pull/60</a><br>&gt; &gt; <br>&gt; &gt; Yi Li (1):<br>&gt; &gt; &nbsp; skele=
ton: Add new API SystemManager::getFRUObject()<br>&gt; &gt; <br>&gt; &gt; &=
nbsp;bin/system=5Fmanager.py | 40 +++++++++++++++++++++++++++-------------<=
br>&gt; &gt; &nbsp;1 file changed, 27 insertions(+), 13 deletions(-)<br>&gt=
; &gt; <br>&gt; &gt; -- <br>&gt; &gt; 2.7.1<br>&gt; &gt; <br>&gt; &gt; <br>=
&gt; &gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F<br>&gt; &gt; openbmc mailing list<br>&gt; &gt; openbmc@lists.ozlabs.org=
<br>&gt; &gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https:/=
/lists.ozlabs.org/listinfo/openbmc</a><br></tt><BR>
</body></html>

--0__=8FBBF505DFBE8E5E8f9e8a93df938690918c8FBBF505DFBE8E5E--
