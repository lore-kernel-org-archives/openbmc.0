Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7FBF01A1171
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 21:03:44 +1100 (AEDT)
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Wed, 16 Dec 2015 20:03:43 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 16 Dec 2015 20:03:42 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 04BD73578047
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 21:03:41 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBGA3WPE56885370
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 21:03:41 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBGA38mE017947
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 21:03:08 +1100
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBGA36uq016854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 21:03:08 +1100
Message-Id: <201512161003.tBGA36uq016854@d23av01.au.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Wed, 16 Dec 2015 03:02:42 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 16 Dec 2015 03:02:41 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Wed, 16 Dec 2015 10:02:40 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.103)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 16 Dec 2015 10:02:37 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2015121610023839-119842 ;
 Wed, 16 Dec 2015 10:02:38 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v2 1/5] Add get/set ipmid command
 support with correct DBUS property handling.
In-Reply-To: <87mvta7uel.fsf@birb.au.ibm.com>
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
To: stewart@linux.vnet.ibm.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Wed, 16 Dec 2015 10:02:35 +0000
Sensitivity: 
MIME-Version: 1.0
References: <87mvta7uel.fsf@birb.au.ibm.com>, <87vb7y7w1s.fsf@birb.au.ibm.com>
 <1450218057-12167-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450218057-12167-2-git-send-email-openbmc-patches@stwcx.xyz>
 <201512160627.tBG6RTg8006339@d23av06.au.ibm.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_11302015_FP3 December 04, 2015
X-LLNOutbound: False
X-Disclaimed: 14191
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 15121610-1618-0000-0000-0000034EAA85
X-IBM-ISS-SpamDetectors: Score=0.417846; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004670; HX=3.00000237; KW=3.00000007;
 PH=3.00000004; SC=3.00000126; SDB=6.00631317; UDB=6.00282656; UTC=2015-12-16
 10:02:38
x-cbparentid: 15121610-7792-0000-0000-000001412D8A
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
X-List-Received-Date: Wed, 16 Dec 2015 10:03:44 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Hey Stewart,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I'm sorry that for my commits I only have "1 line" commen=
ts for them. I will try to fix them by changing the comments that already b=
een committed.&nbsp;But there are plenty of commits that is "1 line" commen=
ts as below. So would you mind telling me in what situation I am allowed to=
 have "1 line" comment and in what situation I need to have a multiple-line=
 comment?</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div>commit 169395e5d6133e4d5151e8f7cc14493da74f76be<br>A=
uthor: Chris Austen &lt;austenc@us.ibm.com&gt;<br>Date: &nbsp; Wed Dec 2 20=
:56:15 2015 -0600</div>
<div>&nbsp; &nbsp; Alignment failure fixes</div>
<div>&nbsp;</div>
<div><div>commit 800ba7122ce987f7d16e329f9c256f8d6b63f162<br>Author: Chris =
Austen &lt;austenc@us.ibm.com&gt;<br>Date: &nbsp; Thu Dec 3 15:31:00 2015 -=
0600</div>
<div>&nbsp; &nbsp; support for more sensors<br>&nbsp;</div></div></div>
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
stewart@linux.vnet.ibm.com&gt;<br>To: Peng Fei BG Gou/China/IBM@IBMCN<br>Cc=
: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org<br>Subject: Re: [PATC=
H phosphor-host-ipmid v2 1/5] Add get/set ipmid command support with correc=
t DBUS property handling.<br>Date: Wed, Dec 16, 2015 3:05 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Peng Fei BG Gou &lt;shgoupf@cn.ibm.com&gt; writes:<br>&gt; Sorry. I do=
n't know where are those messages come from. I have pull<br>&gt; request th=
at is pending but hasn't been reviewed and merged.<br><br>When you type "gi=
t commit" it opens up an editor.<br><br>First line ends up being the subjec=
t of the email, the rest is the body,<br>commonly referred to as "commit me=
ssage" - first line being a summary of<br>the change, while the message bei=
ng more informative.<br><br>Anything but the most trivial change should hav=
e more than just one line.</font></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
