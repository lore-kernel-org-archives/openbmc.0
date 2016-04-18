Return-Path: <austenc@us.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpXJP0cNkzDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 01:34:44 +1000 (AEST)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 18 Apr 2016 09:34:40 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 18 Apr 2016 09:34:39 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 47F5D3E4005B
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 09:34:39 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3IFYdrd39387180
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 08:34:39 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3IFYdvi012550
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 09:34:39 -0600
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3IFYcXt012538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 09:34:38 -0600
Message-Id: <201604181534.u3IFYcXt012538@d03av04.boulder.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 18 Apr 2016 09:34:38 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 18 Apr 2016 09:34:36 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 18 Apr 2016 15:34:34 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 18 Apr 2016 15:34:31 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016041815343061-297685 ;
 Mon, 18 Apr 2016 15:34:30 +0000 
In-Reply-To: 
Subject: Out of the Box experience for a new system
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Mon, 18 Apr 2016 15:34:30 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_04042016_FP5 April 14, 2016
X-LLNOutbound: False
X-Disclaimed: 42879
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16041815-8236-0000-0000-0000262B4B63
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0.067671; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005172; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000159; SDB=6.00689885; UDB=6.00317817; UTC=2016-04-18
 15:34:32
x-cbparentid: 16041815-9900-0000-0000-0000073E1C49
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
X-List-Received-Date: Mon, 18 Apr 2016 15:34:46 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" ><h3 dir=3D"ltr" >It is not very often we=
 have a chance to see a system straight from manufacturing. I'd like to bui=
ld a list of things to do when a new system arrives.&nbsp; Box openings are=
 first impressions and I would like to make sure we delight our clients wit=
h this powerful server</h3></div>
<div dir=3D"ltr" ><h3 dir=3D"ltr" >Prep for a new opening</h3>
<p dir=3D"ltr" >What you need... debug serial cable</p>
<p dir=3D"ltr" >mac@ labels, where are they?&nbsp; Is there any labels/pape=
rs indicating how to connect to the server for the first time?</p>
<div dir=3D"ltr" >DHCP should be the default, if you program the DHCP serve=
r to recognize the MAC does it connect cleanly?</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><h3 dir=3D"ltr" >Document prior to first boot</h3>VPD, lo=
g VPD to files</div>
<p dir=3D"ltr" >&lt;insert commands here&gt;</p>
<p dir=3D"ltr" >Capture the journald output</p>
<p dir=3D"ltr" >&lt;insert commands here&gt;</p>
<p dir=3D"ltr" >Capture the build level</p>
<p dir=3D"ltr" >cat /etc/os-release &gt; &lt;file&gt;</p>
<p dir=3D"ltr" >Capture the rw filesystem</p>
<p dir=3D"ltr" >in tmp create a tarfile of <span class=3D"pl-s" >/var/lib/o=
bmc</span></p>
<p dir=3D"ltr" >&nbsp;</p>
<p dir=3D"ltr" >&nbsp;</p>
<h4 dir=3D"ltr" >Capturing the first boot</h4>
<div dir=3D"ltr" >Power on the system, once at petitboot (hmmm. I wonder if=
 first boot even will stop at Petitboot)</div>
<p dir=3D"ltr" >record petitboot default boot devices</p>
<p dir=3D"ltr" >recapture the journald output</p>
<p dir=3D"ltr" >recapture the rw filesystem</p>
<p dir=3D"ltr" >&nbsp;</p>&nbsp;

<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)</div></div></div><BR>
