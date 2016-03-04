Return-Path: <miltonm@us.ibm.com>
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EE5ED1A045D
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2016 13:53:56 +1100 (AEDT)
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 3 Mar 2016 19:53:54 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 3 Mar 2016 19:53:53 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 8BD2019D8041
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 19:41:48 -0700 (MST)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u242rqoF32571598
 for <openbmc@lists.ozlabs.org>; Fri, 4 Mar 2016 02:53:52 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u242rpRT028884
 for <openbmc@lists.ozlabs.org>; Thu, 3 Mar 2016 21:53:51 -0500
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u242ropq028841
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 3 Mar 2016 21:53:51 -0500
Message-Id: <201603040253.u242ropq028841@d01av02.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 3 Mar 2016 19:53:50 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 3 Mar 2016 19:53:49 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 4 Mar 2016 02:53:48 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 4 Mar 2016 02:53:47 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016030402534694-551419 ;
 Fri, 4 Mar 2016 02:53:46 +0000 
In-Reply-To: <OF44C33E6F.FA39CB1C-ON00257F6B.0011051A-00257F6B.0011051F@LocalDomain>
Subject: Re: RFC: Pre pull request for openbmc initfs updates
From: "Milton Miller II" <miltonm@us.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 4 Mar 2016 02:53:47 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <OF44C33E6F.FA39CB1C-ON00257F6B.0011051A-00257F6B.0011051F@LocalDomain>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02222016_FP4 March 02, 2016
X-LLNOutbound: False
X-Disclaimed: 2247
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16030402-0025-0000-0000-000021F4D736
X-IBM-ISS-SpamDetectors: Score=0.4332; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.4332; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004993; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000149; SDB=6.00668295; UDB=6.00304997; UTC=2016-03-04
 02:53:48
x-cbparentid: 16030402-5090-0000-0000-0000076C10AA
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
X-List-Received-Date: Fri, 04 Mar 2016 02:53:57 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br><br><font color=3D"#990099">-----Milton Miller II/Austin/IBM wro=
te: -----</font><br><br>&gt;I have completed initial testing of my updates =
to initfs to allow <br>&gt;running from RAM.  Comments on the option names =
and functions are <br>&gt;welcome.  The branch is available at <br>&gt;<br>=
&gt;<a target=3D"=5Fblank" href=3D"https://github.com/mdmillerii/openbmc/tr=
ee/wip-from-ram">https://github.com/mdmillerii/openbmc/tree/wip-from-ram</a=
><br>&gt;<br><br>The lastest update to Andrew's github comments is totally<=
br>untested but available at:<br><a target=3D"=5Fblank" href=3D"https://git=
hub.com/mdmillerii/openbmc/tree/wip-from-ram-20160303">https://github.com/m=
dmillerii/openbmc/tree/wip-from-ram-20160303</a><br><br>I did not reorder t=
he series because I believe the series is still <br>bisectable, as the opti=
ons added at shutdown go from ignored to <br>parsed, and the options added =
for init go from default to explicit <br>to optimial.<br><br>The update scr=
ipt currently ignores arguments starting with the first <br>that does not i=
nclude a - to allow the image names to be passed in <br>the future.<br><br>=
Following&nbsp; is a 1 line summary of how patches were changed.<br>The ins=
tructions remain as yesterday's email.<br><br>milton<br><br><br>shutdown: C=
omplain if update images exist without update script<br><br>Expanded when /=
 why the update may be missing and purpose of emiting message<br><br>update=
: Add command line parsing to clean or preserve saved files<br><br>It is cu=
rrently called from init for jffs2 conversion, and will be called<br>from i=
nit and in the future at runtime with different constraints.<br><br>I clari=
fied that the need for alternate behaviors are in the future init<br>patche=
s in this series but that it already returns to shutdown (which was<br>in t=
he last series).<br><br><br><br>update: Add options to skip the save and re=
store phases<br><br>Change to dosave and dorestore.&nbsp; Originally I only=
 had no options<br>then decided to go to positive and negative options for =
future<br>proofing.&nbsp; As noted the logic was wrong in a prior revision =
of<br>the patch set.<br><br><br>update: Do not check if the whitelist is em=
pty<br><br>removed double negative in title, expanded on future support.<br=
><br><br>&nbsp;&nbsp;&nbsp; update: Read whitelist from the /run/initramfs =
directory<br>expanded on why: both consistency and allowing future environm=
ents<br><br><br>update: Save whitelist files from ram or mounted filesystem=
<br><br>*** parent wrong<br><br>Significantly reworded commit message for w=
hat an why, including background.<br><br>init: Add a hook to download files=
<br><br>Factored out get=5Ffw=5Fenv=5Fvar and commented with known issues<b=
r><br><br></font><BR>
