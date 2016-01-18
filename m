Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4D51A003F
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 21:43:49 +1100 (AEDT)
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 18 Jan 2016 20:43:47 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 18 Jan 2016 20:43:45 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 359742CE8055
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 21:43:45 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0IAhaKS30670942
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 21:43:45 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0IAhCXR028745
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 21:43:12 +1100
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0IAhAFp028570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 21:43:12 +1100
Message-Id: <201601181043.u0IAhAFp028570@d23av06.au.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 18 Jan 2016 02:25:40 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 18 Jan 2016 02:25:37 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Mon, 18 Jan 2016 09:25:35 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 18 Jan 2016 09:25:30 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016011809263918-94738 ;
 Mon, 18 Jan 2016 09:26:39 +0000 
In-Reply-To: <569C372C.7020605@ozlabs.org>
Subject: Re: [PATCH docs] Add dbus method cold_reset() for bmc dbus object
From: "Yi TZ Li" <shliyi@cn.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc@lists.ozlabs.org, adamliyi@msn.com
Date: Mon, 18 Jan 2016 09:25:30 +0000
Sensitivity: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
References: <569C372C.7020605@ozlabs.org>,
 <1452868210-23453-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452868210-23453-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_01042016_FP2 January 15, 2016
X-LLNOutbound: False
X-Disclaimed: 8187
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16011810-0013-0000-0000-0000028D9A29
X-IBM-ISS-SpamDetectors: Score=0.371236; BY=0.034375; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.371236; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004806; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000133; SDB=6.00646963; UDB=6.00292071; UTC=2016-01-18
 09:25:33
x-cbparentid: 16011809-0598-0000-0000-0000060257EF
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
X-List-Received-Date: Mon, 18 Jan 2016 10:43:49 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Thanks for the detailed guideline. I've re-submit the git pull reque=
st.<br><br>-Yi<br><br><font color=3D"#990099">-----"openbmc" &lt;<a target=
=3D"=5Fblank" href=3D"mailto:openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozla=
bs.org">openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org</a>&gt; wrote:=
 -----</font><br><br>&gt;To: <a target=3D"=5Fblank" href=3D"mailto:openbmc@=
lists.ozlabs.org">openbmc@lists.ozlabs.org</a>, <a target=3D"=5Fblank" href=
=3D"mailto:adamliyi@msn.com">adamliyi@msn.com</a><br>&gt;From: Jeremy Kerr =
<br>&gt;Sent by: "openbmc" <br>&gt;Date: 01/18/2016 08:53AM<br>&gt;Subject:=
 Re: [PATCH docs] Add dbus method cold=5Freset() for bmc dbus<br>&gt;object=
<br>&gt;<br>&gt;Hi,<br>&gt;<br>&gt;Thanks for your update to the docs repos=
itory, this is great to have.<br>&gt;<br>&gt;A couple of points for general=
 OpenBMC contributions though:<br>&gt;<br>&gt; - Can you use your real name=
 as the author of this patch? If you<br>&gt;   set your git user.name confi=
g variable, your commits will<br>&gt;   have the correct info set:<br>&gt;<=
br>&gt;      git config --global user.name "Your Name"<br>&gt;<br>&gt;   Th=
en, you can update this commit with:<br>&gt;<br>&gt;      git commit --amen=
d --author=3D'Your Name &lt;<a target=3D"=5Fblank" href=3D"mailto:adamliyi@=
msn.com">adamliyi@msn.com</a>&gt;'<br>&gt;<br>&gt;<br>&gt; - We'll need a '=
Signed-off-by:' line to indicate that your<br>&gt;   contributions are okay=
 to include in the open-source projects<br>&gt;   used in OpenBMC. This wil=
l be something like:<br>&gt;<br>&gt;     Signed-off-by: Your Name &lt;<a ta=
rget=3D"=5Fblank" href=3D"mailto:adamliyi@msn.com">adamliyi@msn.com</a>&gt;=
<br>&gt;<br>&gt;   Same as above: you can add this to your existing commit<=
br>&gt;   using `git commit --amend`.<br>&gt;<br>&gt;These are in the (new)=
 contribution guidelines, up at:<br>&gt;<br>&gt;  <a target=3D"=5Fblank" hr=
ef=3D"https://github.com/openbmc/docs/blob/master/contributing.md">https://=
github.com/openbmc/docs/blob/master/contributing.md</a><br>&gt;<br>&gt;Chee=
rs,<br>&gt;<br>&gt;<br>&gt;Jeremy<br>&gt;<br>&gt;<br>&gt;On 15/01/16 22:30,=
 OpenBMC Patches wrote:<br>&gt;&gt; From: adamliyi &lt;<a target=3D"=5Fblan=
k" href=3D"mailto:adamliyi@msn.com">adamliyi@msn.com</a>&gt;<br>&gt;&gt; <b=
r>&gt;&gt; ---<br>&gt;&gt;  dbus-interfaces.md | 7 +++++++<br>&gt;&gt;  1 f=
ile changed, 7 insertions(+)<br>&gt;&gt; <br>&gt;&gt; diff --git a/dbus-int=
erfaces.md b/dbus-interfaces.md<br>&gt;&gt; index 28fe410..7dee30f 100644<b=
r>&gt;&gt; --- a/dbus-interfaces.md<br>&gt;&gt; +++ b/dbus-interfaces.md<br=
>&gt;&gt; @@ -151,4 +151,11 @@ properties:<br>&gt;&gt;  <br>&gt;&gt;    *  =
`state`<br>&gt;&gt;  <br>&gt;&gt; +# BMC<br>&gt;&gt; +<br>&gt;&gt; +## `/or=
g/openbmc/control/bmc/bmc0`<br>&gt;&gt; +<br>&gt;&gt; +methods:<br>&gt;&gt;=
 +<br>&gt;&gt; +  *  `cold=5Freset()`<br>&gt;&gt;  <br>&gt;&gt; <br>&gt;=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt;open=
bmc mailing list<br>&gt;<a target=3D"=5Fblank" href=3D"mailto:openbmc@lists=
.ozlabs.org">openbmc@lists.ozlabs.org</a><br>&gt;<a target=3D"=5Fblank" hre=
f=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/li=
stinfo/openbmc</a><br>&gt;</font><BR>
