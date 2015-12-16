Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 744301A0B9B
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 17:28:06 +1100 (AEDT)
Received: from localhost
 by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Wed, 16 Dec 2015 16:28:05 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 16 Dec 2015 16:28:03 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 86D22357804F
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 17:28:03 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBG6RtmE30408712
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 17:28:03 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBG6RVcR006843
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 17:27:31 +1100
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBG6RT0v006341
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 17:27:30 +1100
Message-Id: <201512160627.tBG6RT0v006341@d23av06.au.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Tue, 15 Dec 2015 23:27:05 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 15 Dec 2015 23:27:04 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Wed, 16 Dec 2015 06:27:03 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 16 Dec 2015 06:27:00 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015121606270105-43370 ;
 Wed, 16 Dec 2015 06:27:01 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v2 1/5] Add get/set ipmid command
 support with correct DBUS property handling.
In-Reply-To: <87vb7y7w1s.fsf@birb.au.ibm.com>
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
To: stewart@linux.vnet.ibm.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Wed, 16 Dec 2015 06:26:59 +0000
Sensitivity: 
MIME-Version: 1.0
References: <87vb7y7w1s.fsf@birb.au.ibm.com>,
 <1450218057-12167-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450218057-12167-2-git-send-email-openbmc-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_11302015_FP3 December 04, 2015
X-LLNOutbound: False
X-Disclaimed: 8495
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 15121606-0009-0000-0000-0000028B290F
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004670; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000125; SDB=6.00631285; UDB=6.00282634; UTC=2015-12-16
 06:27:01
x-cbparentid: 15121606-5920-0000-0000-000005594936
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-Mailman-Approved-At: Thu, 17 Dec 2015 02:53:08 +1100
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
X-List-Received-Date: Wed, 16 Dec 2015 06:28:06 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Sorry. I don't know where are those mess=
ages come from. I have pull request that is pending but hasn't been reviewe=
d and merged.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fon=
t-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" >GOU, Peng Fei (=E8=8B=
=9F=E9=B9=8F=E9=A3=9E), Ph.D.</div>
<div dir=3D"ltr" >OpenPower Team.</div>
<div dir=3D"ltr" >+86-21-609-28631</div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Stewart Smith &lt;=
stewart@linux.vnet.ibm.com&gt;<br>To: OpenBMC Patches &lt;openbmc-patches@s=
twcx.xyz&gt;, openbmc@lists.ozlabs.org<br>Cc: Peng Fei BG Gou/China/IBM@IBM=
CN<br>Subject: Re: [PATCH phosphor-host-ipmid v2 1/5] Add get/set ipmid com=
mand support with correct DBUS property handling.<br>Date: Wed, Dec 16, 201=
5 2:23 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; writes:<br>&gt; From=
: shgoupf &lt;shgoupf@cn.ibm.com&gt;<br><br>Commit message?</font></div></b=
lockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
