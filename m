Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4xbm6MF1zDqBg
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 12:23:00 +1000 (AEST)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Thu, 12 May 2016 12:22:59 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 12 May 2016 12:22:58 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 91E263578057
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 12:22:52 +1000 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4C2MdAH3277098
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 12:22:47 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4C2MFC2030791
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 12:22:15 +1000
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4C2MDwS030181
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 12:22:14 +1000
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 11 May 2016 20:21:51 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 11 May 2016 20:21:49 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Thu, 12 May 2016 02:21:48 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 12 May 2016 02:21:47 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016051202214693-4050 ;
 Thu, 12 May 2016 02:21:46 +0000 
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd+k1spKehvyotFjgyDobmnSDe+wfYa353urGXFkuGTYQ@mail.gmail.com>
Subject: Re: [PATCH openbmc] [openbmc]: Build adm1275 pmbus driver into
 Barreleye kernel
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Thu, 12 May 2016 10:12:53 +0800
References: <1462943431-29445-1-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8Xd+k1spKehvyotFjgyDobmnSDe+wfYa353urGXFkuGTYQ@mail.gmail.com>
X-KeepSent: E9697F6C:790CF213-48257FB1:000C0610;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 28823
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=C7BBF522DF9F80808f9e8a93df938690918cC7BBF522DF9F8080"
Content-Disposition: inline
x-cbid: 16051202-0009-0000-0000-0000072829F4
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005270; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000166; SDB=6.00700877; UDB=6.00324430; UTC=2016-05-12
 02:21:47
x-cbparentid: 16051202-9900-0000-0000-000007ADC6C2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFE9697F6C.790CF213-ON48257FB1.000C0610-48257FB1.000C2AC4@notes.na.collabserv.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Thu, 12 May 2016 02:23:01 -0000


--0__=C7BBF522DF9F80808f9e8a93df938690918cC7BBF522DF9F8080
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Will adm1278 be specific to Barreleye? That is why I did not patch the
defconfig.

Thanks,
-Yi
"openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org> wrote on
05/11/2016 01:21:26 PM:

> From: Joel Stanley <joel@jms.id.au>
> To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 05/11/2016 01:25 PM
> Subject: Re: [PATCH openbmc] [openbmc]: Build adm1275 pmbus driver
> into Barreleye kernel
> Sent by: "openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org>
>
> On Wed, May 11, 2016 at 2:40 PM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > Barreleye has adm1278 devices. Build the driver into kernel.
>
> Please do not apply this. We will enable it in the defconfig.
>
> Cheers,
>
> Joel
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--0__=C7BBF522DF9F80808f9e8a93df938690918cC7BBF522DF9F8080
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Will adm1278 be specific to Barreleye? That is why I did not=
 patch the defconfig.<br><br>Thanks,<br>-Yi <br><tt>&quot;openbmc&quot; &lt=
;openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org&gt; wrote on 05/11/20=
16 01:21:26 PM:<br><br>&gt; From: Joel Stanley &lt;joel@jms.id.au&gt;</tt><=
br><tt>&gt; To: OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</tt><br><=
tt>&gt; Cc: OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</tt><br><tt>&=
gt; Date: 05/11/2016 01:25 PM</tt><br><tt>&gt; Subject: Re: [PATCH openbmc]=
 [openbmc]: Build adm1275 pmbus driver <br>&gt; into Barreleye kernel</tt><=
br><tt>&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+shliyi=3Dcn.ib=
m.com@lists.ozlabs.org&gt;</tt><br><tt>&gt; <br>&gt; On Wed, May 11, 2016 a=
t 2:40 PM, OpenBMC Patches<br>&gt; &lt;openbmc-patches@stwcx.xyz&gt; wrote:=
<br>&gt; &gt; Barreleye has adm1278 devices. Build the driver into kernel.<=
br>&gt; <br>&gt; Please do not apply this. We will enable it in the defconf=
ig.<br>&gt; <br>&gt; Cheers,<br>&gt; <br>&gt; Joel<br>&gt; =5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing=
 list<br>&gt; openbmc@lists.ozlabs.org<br>&gt; <a href=3D"https://lists.ozl=
abs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br>=
</tt><BR>
</body></html>

--0__=C7BBF522DF9F80808f9e8a93df938690918cC7BBF522DF9F8080--
