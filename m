Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp04.in.ibm.com (e28smtp04.in.ibm.com [125.16.236.4])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qk5034WCyzDq9q
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 19:50:11 +1000 (AEST)
Received: from localhost
 by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Mon, 11 Apr 2016 15:20:08 +0530
Received: from d28relay03.in.ibm.com (9.184.220.60)
 by e28smtp04.in.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 11 Apr 2016 15:20:06 +0530
X-IBM-Helo: d28relay03.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3B9o3gJ62783524
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 15:20:04 +0530
Message-Id: <201604110950.u3B9o3gJ62783524@d28relay03.in.ibm.com>
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Mon, 11 Apr 2016 05:50:03 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 11 Apr 2016 05:50:01 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Mon, 11 Apr 2016 09:49:59 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 11 Apr 2016 09:49:58 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016041109495654-108955 ;
 Mon, 11 Apr 2016 09:49:56 +0000 
MIME-Version: 1.0
In-Reply-To: <1460365853-18421-1-git-send-email-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH skeleton] skeleton: Add new API
 SystemManager::getFRUObject()
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC_Members@d28relay03.in.ibm.com, "Yi TZ Li" <shliyi@cn.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Mon, 11 Apr 2016 15:19:54 +0530
References: <1460365853-18421-1-git-send-email-openbmc-patches@stwcx.xyz>
X-KeepSent: BC8D1ADC:A14A7AE9-65257F92:0033DE95;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 11451
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABBF501DFA058058f9e8a93df938690918cEABBF501DFA05805"
Content-Disposition: inline
x-cbid: 16041109-0013-0000-0000-00000BA1ABEA
X-IBM-ISS-SpamDetectors: Score=0.431554; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.431554; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005145; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000157; SDB=6.00686450; UDB=6.00315775; UTC=2016-04-11
 09:49:59
x-cbparentid: 16041109-4778-0000-0000-000002E526E1
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
X-List-Received-Date: Mon, 11 Apr 2016 09:50:12 -0000


--0__=EABBF501DFA058058f9e8a93df938690918cEABBF501DFA05805
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Hello Yi,

Thanks for the patch. Here are my comments.

"openbmc" <openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org> wrote =
on
11/04/2016 02:40:52 pm:

> From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> To: openbmc@lists.ozlabs.org
> Date: 11/04/2016 02:41 pm
> Subject: [PATCH skeleton] skeleton: Add new API
SystemManager::getFRUObject()
> Sent by: "openbmc" <openbmc-bounces
+vishwanath=3Din.ibm.com@lists.ozlabs.org>
>
> ipmi-fru-parser uses getObjectFromId('FRU=5FSTR', fru=5Farea=5Fname) to
> ask for the dbus object path of the 'fru=5Farea=5Fname'. The returned
> value is also used to check the 'present' status of FRU. Sometimes
> the 'fru=5Farea=5Fname' does not defined in Skeleton's ID=5FLOOKUP table.
> system=5Fmanager will report a "ERROR: lookup not found" error message.
>


> This patch added an API similiar with getObjectFromId().
> It does not report error when the 'fru=5Farea=5Fname' is not defined.
> It can be used by ipmi-fru-parser to replace getObjectFromId().
>

If something is not there, it is still an error. So masking the error may
not be a right approach.


> Also the orignal "ERROR" message is changed to "WARNING".
>

IMO, we may not be solving the root cause here.. "WARNING", -or- "ERROR"
would still bother whoever looking into it.
So, I still feel that we need to make the actual change.

When I initially proposed a solution to Norm to remove those ERRORs, he had
an opinion that "something not there is not there, so its an error".

Here is how I look into it ( one of the implementations .. )

1: writefru data will make a call into a new API passing the fru id.
2: Skeleton code will return the available sections for that fru id.
( example: chassis, board / board, product etc )
3: writefru will use that and then make getObjectFromByteId for a
particular fruid=5F<area>


> Signed-off-by: Yi Li <adamliyi@msn.com>
>
> <!-- Reviewable:start -->
> ---
> This change is [<img src=3D"https://reviewable.io/review=5Fbutton.svg"
> height=3D"35" align=3D"absmiddle" alt=3D"Reviewable"/>](https://
> reviewable.io/reviews/openbmc/skeleton/60)
> <!-- Reviewable:end -->
>
>
> https://github.com/openbmc/skeleton/pull/60
>
> Yi Li (1):
>   skeleton: Add new API SystemManager::getFRUObject()
>
>  bin/system=5Fmanager.py | 40 +++++++++++++++++++++++++++-------------
>  1 file changed, 27 insertions(+), 13 deletions(-)
>
> --
> 2.7.1
>
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--0__=EABBF501DFA058058f9e8a93df938690918cEABBF501DFA05805
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Hello Yi,<br><br>Thanks for the patch. Here are my comments.=
<br><br><tt>&quot;openbmc&quot; &lt;openbmc-bounces+vishwanath=3Din.ibm.com=
@lists.ozlabs.org&gt; wrote on 11/04/2016 02:40:52 pm:<br><br>&gt; From: Op=
enBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</tt><br><tt>&gt; To: openbm=
c@lists.ozlabs.org</tt><br><tt>&gt; Date: 11/04/2016 02:41 pm</tt><br><tt>&=
gt; Subject: [PATCH skeleton] skeleton: Add new API SystemManager::getFRUOb=
ject()</tt><br><tt>&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+vi=
shwanath=3Din.ibm.com@lists.ozlabs.org&gt;</tt><br><tt>&gt; <br>&gt; ipmi-f=
ru-parser uses getObjectFromId('FRU=5FSTR', fru=5Farea=5Fname) to<br>&gt; a=
sk for the dbus object path of the 'fru=5Farea=5Fname'. The returned<br>&gt=
; value is also used to check the 'present' status of FRU. Sometimes<br>&gt=
; the 'fru=5Farea=5Fname' does not defined in Skeleton's ID=5FLOOKUP table.=
<br>&gt; system=5Fmanager will report a &quot;ERROR: lookup not found&quot;=
 error message.<br>&gt; </tt><br><br><tt><br>&gt; This patch added an API s=
imiliar with getObjectFromId().<br>&gt; It does not report error when the '=
fru=5Farea=5Fname' is not defined.<br>&gt; It can be used by ipmi-fru-parse=
r to replace getObjectFromId().<br>&gt; </tt><br><br><tt>If something is no=
t there, it is still an error. So masking the error may not be a right appr=
oach.</tt><br><br><tt><br>&gt; Also the orignal &quot;ERROR&quot; message i=
s changed to &quot;WARNING&quot;.<br>&gt; </tt><br><br><tt>IMO, we may not =
be solving the root cause here.. &quot;WARNING&quot;, -or- &quot;ERROR&quot=
; would still bother whoever looking into it. </tt><br><tt>So, I still feel=
 that we need to make the actual change.</tt><br><br><tt>When I initially p=
roposed a solution to Norm to remove those ERRORs, he had an opinion that &=
quot;something not there is not there, so its an error&quot;.</tt><br><br><=
tt>Here is how I look into it ( one of the implementations .. )</tt><br><br=
><tt>1: writefru data will make a call into a new API passing the fru id.</=
tt><br><tt>2: Skeleton code will return the available sections for that fru=
 id. ( example: chassis, board / board, product etc )</tt><br><tt>3: writef=
ru will use that and then make getObjectFromByteId for a particular fruid=
=5F&lt;area&gt;</tt><br><tt><br></tt><br><tt>&gt; Signed-off-by: Yi Li &lt;=
adamliyi@msn.com&gt;<br>&gt; <br>&gt; &lt;!-- Reviewable:start --&gt;<br>&g=
t; ---<br>&gt; This change is <img src=3D"https://reviewable.io/review=5Fbu=
tton.svg"=20
> height=3D"35" align=3D"absmiddle" alt=3D"Reviewable"/>(https://<br>&gt; r=
eviewable.io/reviews/openbmc/skeleton/60)<br>&gt; &lt;!-- Reviewable:end --=
&gt;<br>&gt; <br>&gt; <br>&gt; <a href=3D"https://github.com/openbmc/skelet=
on/pull/60">https://github.com/openbmc/skeleton/pull/60</a><br>&gt; <br>&gt=
; Yi Li (1):<br>&gt; &nbsp; skeleton: Add new API SystemManager::getFRUObje=
ct()<br>&gt; <br>&gt; &nbsp;bin/system=5Fmanager.py | 40 ++++++++++++++++++=
+++++++++-------------<br>&gt; &nbsp;1 file changed, 27 insertions(+), 13 d=
eletions(-)<br>&gt; <br>&gt; -- <br>&gt; 2.7.1<br>&gt; <br>&gt; <br>&gt; =
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; =
openbmc mailing list<br>&gt; openbmc@lists.ozlabs.org<br>&gt; <a href=3D"ht=
tps://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/=
openbmc</a><br></tt><BR>
</body></html>

--0__=EABBF501DFA058058f9e8a93df938690918cEABBF501DFA05805--
