Return-Path: <miltonm@us.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPqJJ4nFKzDq6V
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 09:37:52 +1100 (AEDT)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 15 Mar 2016 16:37:50 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 15 Mar 2016 16:37:46 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 1641819D8045
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 16:25:40 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2FMbj2b37617716
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 15:37:45 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2FMbjaA000911
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 16:37:45 -0600
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u2FMbiQF000903
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 16:37:45 -0600
Message-Id: <201603152237.u2FMbiQF000903@d03av04.boulder.ibm.com>
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 15 Mar 2016 16:37:45 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 15 Mar 2016 16:37:43 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 15 Mar 2016 22:37:42 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 15 Mar 2016 22:37:41 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016031522374142-482203 ;
 Tue, 15 Mar 2016 22:37:41 +0000 
In-Reply-To: <20160315111140.38b7562a@camb691>
Subject: Re: [PATCH u-boot 5/5] net: aspeednic: Do not fill in a random MAC
 address
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 15 Mar 2016 22:37:41 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20160315111140.38b7562a@camb691>,
 <1457721644-29871-1-git-send-email-openbmc-patches@stwcx.xyz><1457721644-29871-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02292016_FP2 March 07, 2016
X-LLNOutbound: False
X-Disclaimed: 42255
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16031522-0029-0000-0000-000011BEB4C8
X-IBM-ISS-SpamDetectors: Score=0.371236; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.371236; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005041; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00673867; UDB=6.00308307; UTC=2016-03-15
 22:37:42
x-cbparentid: 16031522-5090-0000-0000-0000079E8A8B
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
X-List-Received-Date: Tue, 15 Mar 2016 22:37:53 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br><br><font color=3D"#990099">-----Cyril Bur &lt;<a target=3D"=5Fb=
lank" href=3D"mailto:cyrilbur@gmail.com">cyrilbur@gmail.com</a>&gt; wrote: =
-----</font><br><br>&gt;OpenBMC Patches &lt;<a target=3D"=5Fblank" href=3D"=
mailto:openbmc-patches@stwcx.xyz">openbmc-patches@stwcx.xyz</a>&gt; wrote:<=
br>&gt;<br>&gt;&gt; From: "Milton D. Miller II" &lt;<a target=3D"=5Fblank" =
href=3D"mailto:miltonm@us.ibm.com">miltonm@us.ibm.com</a>&gt;<br>&gt;&gt; <=
br>&gt;<br>&gt;Hi Milton,<br>&gt;<br>&gt;Series looks nice.<br>&gt;<br>&gt;=
One question about this patch, should you also have removed the call<br>&gt=
;to<br>&gt;aspeednick=5Fwrite=5Fhwaddr() from aspeednic=5Finitialize() sinc=
e the eth<br>&gt;layer will<br>&gt;do it for you? Not a bit deal at all, th=
e eth layer will also detect<br>&gt;that it's<br>&gt;been done and just ski=
p it?<br>&gt;<br><br>Perhaps it could, but it seems like more analysis may =
be required.<br><br>The generic code doesn't call write=5Fhwaddr if the mac=
 is invalid (a<br>broadcast address) and therefore removing the code might =
result<br>in different behavior.<br><br>The check for the ethernet address =
being set in the environment<br>seems to occur after the init function is c=
alled.&nbsp; Since its only<br>two mmios with no delays I'd rather leave th=
e code inplace at<br>least at this time.<br><br>thanks,<br>milton<br></font=
><BR>
