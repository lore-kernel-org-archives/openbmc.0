Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 08EC01A17EB
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 14:40:11 +1100 (AEDT)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 20 Jan 2016 13:40:08 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 20 Jan 2016 13:40:05 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 4ED322BB0054
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 14:40:05 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0K3dvg419267604
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 14:40:05 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0K3dXoJ014152
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 14:39:33 +1100
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0K3dUnC013866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2016 14:39:32 +1100
Message-Id: <201601200339.u0K3dUnC013866@d23av02.au.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Tue, 19 Jan 2016 22:39:22 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 19 Jan 2016 22:39:19 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 20 Jan 2016 03:39:18 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 20 Jan 2016 03:39:16 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016012003402393-6354 ;
 Wed, 20 Jan 2016 03:40:23 +0000 
In-Reply-To: <20160120105639.74309c70@camb691>
Subject: Re: [PATCH skeleton] skeleton: Add BMC coldReset() method to
 org.openbmc.control.Bmc dbus interface
From: "Yi TZ Li" <shliyi@cn.ibm.com>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org,
 "Nan KX Li" <bjlinan@cn.ibm.com>
Date: Wed, 20 Jan 2016 03:39:16 +0000
Sensitivity: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
References: <20160120105639.74309c70@camb691>,
 <1453178436-26125-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453178436-26125-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_01042016_FP2 January 15, 2016
X-LLNOutbound: False
X-Disclaimed: 42371
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16012003-0009-0000-0000-000002CDFA19
X-IBM-ISS-SpamDetectors: Score=0.371236; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.371236; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004815; HX=3.00000239; KW=3.00000007;
 PH=3.00000004; SC=3.00000134; SDB=6.00647787; UDB=6.00292555; UTC=2016-01-20
 03:39:17
x-cbparentid: 16012003-4778-0000-0000-000001A22126
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
X-List-Received-Date: Wed, 20 Jan 2016 03:40:12 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Hi Cyril,<br><br>Thank you for the comments. Please see my reply bel=
low:<br><br><font color=3D"#990099">-----"openbmc" &lt;<a target=3D"=5Fblan=
k" href=3D"mailto:openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org">ope=
nbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org</a>&gt; wrote: -----</fon=
t><br><br>&gt;To: OpenBMC Patches &lt;<a target=3D"=5Fblank" href=3D"mailto=
:openbmc-patches@stwcx.xyz">openbmc-patches@stwcx.xyz</a>&gt;<br>&gt;From: =
Cyril Bur <br>&gt;Sent by: "openbmc" <br>&gt;Date: 01/20/2016 07:58AM<br>&g=
t;Cc: <a target=3D"=5Fblank" href=3D"mailto:openbmc@lists.ozlabs.org">openb=
mc@lists.ozlabs.org</a>, Nan KX Li/China/IBM@IBMCN<br>&gt;Subject: Re: [PAT=
CH skeleton] skeleton: Add BMC coldReset() method to<br>&gt;org.openbmc.con=
trol.Bmc dbus interface<br>&gt;<br>&gt;On Mon, 18 Jan 2016 22:40:36 -0600<b=
r>&gt;OpenBMC Patches &lt;<a target=3D"=5Fblank" href=3D"mailto:openbmc-pat=
ches@stwcx.xyz">openbmc-patches@stwcx.xyz</a>&gt; wrote:<br>&gt;<br>&gt;&gt=
; From: William &lt;<a target=3D"=5Fblank" href=3D"mailto:bjlinan@cn.ibm.co=
m">bjlinan@cn.ibm.com</a>&gt;<br>&gt;&gt; <br>&gt;<br>&gt;Hi William,<br>&g=
t;<br>&gt;Is there a reason you're using glib? I was under the impression t=
hat<br>&gt;the<br>&gt;preferred dbus library was sd=5Fbus. I suppose this i=
s in<br>&gt;openbmc/skeleton so it<br>&gt;is destined to be rewritten in wh=
ich case I don't have too much of<br>&gt;and issue<br>&gt;with glib for now=
.<br><br>Current skeleton dbus interface is writing using glib. I also hear=
d from Chris we will shift to sd=5Fbus.<br>If we got details, we can rewrit=
e it using sd=5Fbus.<br><br>&gt;<br>&gt;I do have one concern below.<br>&gt=
;<br><br>&gt;&gt; +static gboolean<br>&gt;&gt; +on=5Fcold=5Freset (ControlB=
mc        *bmc,<br>&gt;&gt; +         GDBusMethodInvocation        *invocat=
ion,<br>&gt;&gt; +         gpointer                user=5Fdata)<br>&gt;&gt;=
 +{<br>&gt;&gt; +        GError *err =3D NULL;<br>&gt;&gt; +        /* Wait=
 a while before reboot, so the caller can be responded.<br>&gt;&gt; +      =
   * Note that g=5Fspawn=5Fcommand=5Fline=5Fasync() cannot parse ';' as<br>=
&gt;&gt; +         * a command separator. Need to use 'sh -c' to let shell =
parse<br>&gt;it.<br>&gt;&gt; +         */<br>&gt;&gt; +        gchar *reboo=
t=5Fcommand =3D "/bin/sh -c 'sleep 3;reboot --force'";<br>&gt;<br>&gt;This =
doesn't seem like a good idea, I'm not exactly sure how<br>&gt;g=5Fspawn=5F=
command=5Fline=5Fasync() works but calling out to the shell to<br>&gt;reboo=
t(2)<br>&gt;doesn't seem like the best way of going about things.<br>&gt;<b=
r><br>The main idea is to reboot the system, while leave a few seconds for =
the coldReset() caller (e.g, REST client) get responded firstly.<br>The RES=
T server can have some time to send respond the caller.<br><br>We have been=
 thinking of using libc function "int reboot(cmd)". Since we need to wait b=
efore<br>reboot, using shell command is more straightforward.<br>Linux rebo=
ot man page says:<br>"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; When called with=
 --force or when in runlevel 0 or 6, this tool&nbsp; invokes<br>&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; the&nbsp; reboot(2)&nbsp; system call itself (wit=
h REBOOTCOMMAND argument passed)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; an=
d directly reboots the system."<br><br>Also "g=5Fspawn=5Fcommand=5Fline=5Fa=
sync()" execute the reboot command *in background*. The coldReset() method =
can return<br>firstly. Then after 3 seconds, BMC reboots. 3 second is just =
a magic, it can be other proper value.<br><br>&gt;Also, sleep 3; is probabl=
y fine all of the time but it doesn't<br>&gt;actually provide<br>&gt;any gu=
arantee that on=5Fcold=5Freset() will ever return, it looks like<br>&gt;the=
re's a<br>&gt;(however unlikely) race here.<br>&gt;<br><br>"g=5Fspawn=5Fcom=
mand=5Fline=5Fasync()" can help on that.<br><br>&gt;Again, I consider just =
ignoring these issues for now since I believe<br>&gt;this code<br>&gt;is go=
ing to be replaced, however, this is starting to differ greatly<br>&gt;from=
 what<br>&gt;the finished product will be.<br>&gt;<br>&gt;If this code is b=
eing put here to exercise these codepathes and not<br>&gt;just for the<br>&=
gt;bare requirement of bringing up a machine, it would be good if it<br>&gt=
;looked more<br>&gt;like the finished product.<br>&gt;<br><br>We will refin=
e the code based on feedback.<br><br>Thanks,<br>-Yi<br></font><BR>
