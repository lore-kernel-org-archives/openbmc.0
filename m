Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 160D11A09FE
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 21:20:42 +1100 (AEDT)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 2 Mar 2016 20:20:37 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 2 Mar 2016 20:20:36 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 5DDCB2BB0054
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2016 21:20:35 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u22AKRDk327940
 for <openbmc@lists.ozlabs.org>; Wed, 2 Mar 2016 21:20:35 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u22AK2uS006554
 for <openbmc@lists.ozlabs.org>; Wed, 2 Mar 2016 21:20:03 +1100
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u22AK1nb006239
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 2 Mar 2016 21:20:02 +1100
Message-Id: <201603021020.u22AK1nb006239@d23av03.au.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 2 Mar 2016 03:19:52 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 2 Mar 2016 03:19:50 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 2 Mar 2016 10:19:49 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 2 Mar 2016 10:19:48 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016030210194685-119089 ;
 Wed, 2 Mar 2016 10:19:46 +0000 
In-Reply-To: <201603012254.u21MskBS011851@d03av04.boulder.ibm.com>
Subject: Re: [PATCH openbmc] Add temporary adm1278 hwmon pmbus driver patch
From: "Yi TZ Li" <shliyi@cn.ibm.com>
To: "Adriana Kobylak" <anoo@us.ibm.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, OpenBMC Patches <openbmc-patches@stwcx.xyz>
Date: Wed, 2 Mar 2016 10:19:47 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <201603012254.u21MskBS011851@d03av04.boulder.ibm.com>,
 <1455705024-15045-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455705024-15045-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XcOB-RzarE67ddZZHj2CuiRAupL07Fe1dPUHHC=W4CweQ@mail.gmail.com>
 <201603012115.u21LFFHj020687@d01av03.pok.ibm.com>
 <20160301224703.GE6601@asimov.pw-on-the.net>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02152016_FP2 February 18, 2016
X-LLNOutbound: False
X-Disclaimed: 44055
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16030210-0009-0000-0000-000003161F2A
X-IBM-ISS-SpamDetectors: Score=0.369042; BY=0.280745; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.369042; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004986; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000149; SDB=6.00667501; UDB=6.00304526; UTC=2016-03-02
 10:19:49
x-cbparentid: 16030210-5938-0000-0000-00000249A11D
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
X-List-Received-Date: Wed, 02 Mar 2016 10:20:43 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br><br><font color=3D"#990099">-----"openbmc" &lt;<a target=3D"=5Fb=
lank" href=3D"mailto:openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org">=
openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org</a>&gt; wrote: -----</=
font><br><br>&gt;To: Patrick Williams &lt;<a target=3D"=5Fblank" href=3D"ma=
ilto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt;<br>&gt;From: "Adriana Kob=
ylak" <br>&gt;Sent by: "openbmc" <br>&gt;Date: 03/02/2016 06:56AM<br>&gt;Cc=
: OpenBMC Maillist &lt;<a target=3D"=5Fblank" href=3D"mailto:openbmc@lists.=
ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;, OpenBMC Patches<br>&gt;&lt;<a=
 target=3D"=5Fblank" href=3D"mailto:openbmc-patches@stwcx.xyz">openbmc-patc=
hes@stwcx.xyz</a>&gt;<br>&gt;Subject: Re: [PATCH openbmc] Add temporary adm=
1278 hwmon pmbus driver<br>&gt;patch<br>&gt;<br>&gt; <br>&gt;Patrick Willia=
ms &lt;<a target=3D"=5Fblank" href=3D"mailto:patrick@stwcx.xyz">patrick@stw=
cx.xyz</a>&gt; wrote on 03/01/2016 04:47:03 PM:<br>&gt;<br>&gt;&gt; From: P=
atrick Williams &lt;<a target=3D"=5Fblank" href=3D"mailto:patrick@stwcx.xyz=
">patrick@stwcx.xyz</a>&gt;<br>&gt;&gt; To: Adriana Kobylak/Austin/IBM@IBMU=
S<br>&gt;&gt; Cc: Joel Stanley &lt;<a target=3D"=5Fblank" href=3D"mailto:jo=
el@jms.id.au">joel@jms.id.au</a>&gt;, OpenBMC Patches &lt;openbmc-<br>&gt;&=
gt; <a target=3D"=5Fblank" href=3D"mailto:patches@stwcx.xyz">patches@stwcx.=
xyz</a>&gt;, OpenBMC Maillist &lt;<a target=3D"=5Fblank" href=3D"mailto:ope=
nbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&gt;<br>&gt;&gt; Date: 0=
3/01/2016 04:47 PM<br>&gt;&gt; Subject: Re: [PATCH openbmc] Add temporary a=
dm1278 hwmon pmbus<br>&gt;driver patch<br>&gt;&gt; <br>&gt;&gt; On Tue, Mar=
 01, 2016 at 03:15:12PM -0600, Adriana Kobylak wrote:<br>&gt;&gt; &gt; What=
 makes this pull request different from other openbmc changes<br>&gt;to <br=
>&gt;&gt; &gt; require to be sent via git-send-email before it can be revie=
wed?<br>&gt;&gt; <br>&gt;&gt; I suspect Joel is just asking for it to also =
be submitted to the<br>&gt;Linux<br>&gt;&gt; tree so that its content can b=
e reviewed there. &nbsp;I agree we should<br>&gt;not<br>&gt;&gt; merge patc=
hes into the openbmc tree unless it fixes a critical<br>&gt;problem<br>&gt;=
&gt; and has also been submitted to the upstream tree.<br>&gt;&gt; <br>&gt;=
Yi, please submit the patch to the kernel repository as well.<br>&gt;<br>&g=
t;There's a requirement to deliver this driver on Friday, could we get<br>&=
gt;this reviewed/merged this week in openbmc? I believe we did this<br>&gt;=
before for OCC then removed the temporary patch once it was<br>&gt;upstream=
ed.<br><br>OK. I will fix the kernel-coding style issue then submit path ag=
ainst linux kernel tree.<br><br>&gt;&gt; &gt; <br>&gt;&gt; &gt; <br>&gt;&gt=
; &gt; <br>&gt;&gt; &gt; <br>&gt;&gt; &gt; <br><br></font><BR>
