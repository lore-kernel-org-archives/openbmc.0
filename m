Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 861D91A0615
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 03:27:19 +1100 (AEDT)
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Sat, 5 Mar 2016 02:27:17 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sat, 5 Mar 2016 02:27:14 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 51A262CE8054
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 03:27:11 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u24GR34G65929448
 for <openbmc@lists.ozlabs.org>; Sat, 5 Mar 2016 03:27:11 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u24GQdl9012131
 for <openbmc@lists.ozlabs.org>; Sat, 5 Mar 2016 03:26:39 +1100
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u24GQaXE011888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sat, 5 Mar 2016 03:26:38 +1100
Message-Id: <201603041626.u24GQaXE011888@d23av03.au.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Fri, 4 Mar 2016 09:26:28 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 4 Mar 2016 09:26:26 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Fri, 4 Mar 2016 16:26:18 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 4 Mar 2016 16:19:33 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016030416191983-292204 ;
 Fri, 4 Mar 2016 16:19:19 +0000 
In-Reply-To: <20160301144451.094f4da3@camb691>
Subject: Re: [PATCH linux] hwmon: fix occ hwmon driver compile warning message
From: "Yi TZ Li" <shliyi@cn.ibm.com>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, <adamliyi@msn.com>,
 openbmc@lists.ozlabs.org
Date: Fri, 4 Mar 2016 16:19:19 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20160301144451.094f4da3@camb691>,
 <1456743642-23362-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456743642-23362-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02222016_FP4 March 02, 2016
X-LLNOutbound: False
X-Disclaimed: 16067
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16030416-0017-0000-0000-000002F83169
X-IBM-ISS-SpamDetectors: Score=0.371236; BY=0.293953; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.371236; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004994; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00668559; UDB=6.00305156; UTC=2016-03-04
 16:20:39
x-cbparentid: 16030416-5090-0000-0000-0000076FAA78
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
X-List-Received-Date: Fri, 04 Mar 2016 16:27:20 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">Hi Cyril,<br><br>Thanks for review. Please see bellow:<br><br><font =
color=3D"#990099">-----"openbmc" &lt;<a target=3D"=5Fblank" href=3D"mailto:=
openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org">openbmc-bounces+shliy=
i=3Dcn.ibm.com@lists.ozlabs.org</a>&gt; wrote: -----</font><br><br>&gt;To: =
OpenBMC Patches &lt;<a target=3D"=5Fblank" href=3D"mailto:openbmc-patches@s=
twcx.xyz">openbmc-patches@stwcx.xyz</a>&gt;, &lt;<a target=3D"=5Fblank" hre=
f=3D"mailto:adamliyi@msn.com">adamliyi@msn.com</a>&gt;<br>&gt;From: Cyril B=
ur <br>&gt;Sent by: "openbmc" <br>&gt;Date: 03/03/2016 04:55AM<br>&gt;Cc: <=
a target=3D"=5Fblank" href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@list=
s.ozlabs.org</a><br>&gt;Subject: Re: [PATCH linux] hwmon: fix occ hwmon dri=
ver compile<br>&gt;warning message<br>&gt;<br>&gt;On Mon, 29 Feb 2016 05:00=
:42 -0600<br>&gt;OpenBMC Patches &lt;<a target=3D"=5Fblank" href=3D"mailto:=
openbmc-patches@stwcx.xyz">openbmc-patches@stwcx.xyz</a>&gt; wrote:<br>&gt;=
<br>&gt;&gt; From: Yi Li &lt;<a target=3D"=5Fblank" href=3D"mailto:adamliyi=
@msn.com">adamliyi@msn.com</a>&gt;<br>&gt;&gt; <br>&gt;&gt; Fixed warning m=
essage when compiling occ hwmon driver.<br>&gt;&gt; The issue is tracked by=
: <a target=3D"=5Fblank" href=3D"https://github.com/openbmc/linux/issues/44=
">https://github.com/openbmc/linux/issues/44</a><br>&gt;&gt; <br>&gt;<br>&g=
t;Hi Adam,<br>&gt;<br>&gt;I'm not sure what the accepted way of doing it is=
 here, just thought<br>&gt;I would<br>&gt;double check that =5F=5Fbe16 is t=
he accepted type here?<br>&gt;<br>&gt;I wonder if you declared data as a vo=
id * and then had 8 16 and 32<br>&gt;accessors<br>&gt;for it? That might be=
 nicer...<br>&gt;<br><br>From: <a target=3D"=5Fblank" href=3D"http://lxr.fr=
ee-electrons.com/source/include/uapi/linux/byteorder/big=5Fendian.h#L87">ht=
tp://lxr.free-electrons.com/source/include/uapi/linux/byteorder/big=5Fendia=
n.h#L87</a><br>"<br><pre style=3D"font-family: Monaco,&quot;Courier New&quo=
t;,Courier,monospace; font-size: 0.95em; padding: 1em; overflow: auto; font=
-style: normal; font-variant: normal; font-weight: bold; letter-spacing: no=
rmal; line-height: normal; text-align: start; text-indent: 0px; text-transf=
orm: none; widows: 1; word-spacing: 0px; background-color: rgb(255, 255, 25=
5);"><font color=3D"#787878"> <a name=3D"L87" href=3D"http://lxr.free-elect=
rons.com/source/include/uapi/linux/byteorder/big=5Fendian.h#L87" style=3D"t=
ext-decoration: none; border-bottom-width: 1px; border-bottom-style: dotted=
; border-bottom-color: rgb(153, 153, 153); color: black; background-color: =
white;">87</a> static inline <a href=3D"http://lxr.free-electrons.com/ident=
?i=3D=5F=5Fu16" style=3D"text-decoration: none; border-bottom-width: 1px; b=
order-bottom-style: dotted; border-bottom-color: rgb(153, 153, 153); color:=
 black; background-color: white;">=5F=5Fu16</a> <a href=3D"http://lxr.free-=
electrons.com/ident?i=3D=5F=5Fbe16=5Fto=5Fcpup" style=3D"text-decoration: n=
one; border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-c=
olor: rgb(153, 153, 153); color: black; background-color: white;">=5F=5Fbe1=
6=5Fto=5Fcpup</a>(const <a href=3D"http://lxr.free-electrons.com/ident?i=3D=
=5F=5Fbe16" style=3D"text-decoration: none; border-bottom-width: 1px; borde=
r-bottom-style: dotted; border-bottom-color: rgb(153, 153, 153); color: bla=
ck; background-color: white;">=5F=5Fbe16</a> *<a href=3D"http://lxr.free-el=
ectrons.com/ident?i=3Dp" style=3D"text-decoration: none; border-bottom-widt=
h: 1px; border-bottom-style: dotted; border-bottom-color: rgb(153, 153, 153=
); color: black; background-color: white;">p</a>)
 <a name=3D"L88" href=3D"http://lxr.free-electrons.com/source/include/uapi/=
linux/byteorder/big=5Fendian.h#L88" style=3D"text-decoration: none; border-=
bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(15=
3, 153, 153); color: black; background-color: white;">88</a> {
 <a name=3D"L89" href=3D"http://lxr.free-electrons.com/source/include/uapi/=
linux/byteorder/big=5Fendian.h#L89" style=3D"text-decoration: none; border-=
bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(15=
3, 153, 153); color: black; background-color: white;">89</a>         return=
 (<a href=3D"http://lxr.free-electrons.com/ident?i=3D=5F=5Fforce" style=3D"=
text-decoration: none; border-bottom-width: 1px; border-bottom-style: dotte=
d; border-bottom-color: rgb(153, 153, 153); color: black; background-color:=
 white;">=5F=5Fforce</a> <a href=3D"http://lxr.free-electrons.com/ident?i=
=3D=5F=5Fu16" style=3D"text-decoration: none; border-bottom-width: 1px; bor=
der-bottom-style: dotted; border-bottom-color: rgb(153, 153, 153); color: b=
lack; background-color: white;">=5F=5Fu16</a>)*<a href=3D"http://lxr.free-e=
lectrons.com/ident?i=3Dp" style=3D"text-decoration: none; border-bottom-wid=
th: 1px; border-bottom-style: dotted; border-bottom-color: rgb(153, 153, 15=
3); color: black; background-color: white;">p</a>;
 <a name=3D"L90" href=3D"http://lxr.free-electrons.com/source/include/uapi/=
linux/byteorder/big=5Fendian.h#L90" style=3D"text-decoration: none; border-=
bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(15=
3, 153, 153); color: black; background-color: white;">90</a> }</font></pre>=
"<br>So I convert (uint16=5Ft *) to (const =5F=5Fbe16 *) to remove compile =
warning.<br>And I am not quite understand "declared data as a void * and th=
en had 8 16 and 32 accessors".<br>Can you give an example?<br><br>Thanks,<b=
r>-Yi<br></font><BR>
