Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xTSxh4gxpzDr2p
 for <openbmc@lists.ozlabs.org>; Sat, 12 Aug 2017 01:06:00 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7BExcOq116624
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 11:05:57 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c9echhsv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 11:05:57 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 11 Aug 2017 15:05:56 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 11 Aug 2017 15:05:54 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2017081115055344-585260 ;
 Fri, 11 Aug 2017 15:05:53 +0000 
MIME-Version: 1.0
In-Reply-To: <21f8060c-c5a3-ac04-4542-35b3b894c383@elsoft.ch>
Subject: Re: Crashing Phosphor Settings Manager
To: =?ISO-8859-1?Q?David_M=FCller?= (ELSOFT AG) <d.mueller@elsoft.ch>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
From: "Chris Austen" <austenc@us.ibm.com>
Date: Fri, 11 Aug 2017 10:05:55 -0500
References: <f332da14-43c6-ccf9-b602-ca5358dd124e@elsoft.ch>
 <ee3d713b-b320-4d4d-a758-0684de0799d9@elsoft.ch>
 <1502374854.1431709.1069264592.5D5C9137@webmail.messagingengine.com>
 <OF17629436.FAAE5DE7-ON86258178.00512E66-86258178.007947E6@notes.na.collabserv.com>
 <21f8060c-c5a3-ac04-4542-35b3b894c383@elsoft.ch>
X-KeepSent: 115C8856:B7EAD254-86258179:0052D2EB;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 49983
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0BEADFC1547B8f9e8a93df938690918c09BB0BEADFC1547B"
Content-Disposition: inline
x-cbid: 17081115-9717-0000-0000-000003BF2E65
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.448588
X-IBM-SpamModules-Versions: BY=3.00007525; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000220; SDB=6.00900801; UDB=6.00451016; IPR=6.00681005; 
 BA=6.00005523; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016647; XFM=3.00000015;
 UTC=2017-08-11 15:05:56
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-08-11 14:01:31 - 6.00007163
x-cbparentid: 17081115-9718-0000-0000-0000947F50C5
Message-Id: <OF115C8856.B7EAD254-ON86258179.0052D2EB-86258179.0052F06E@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-11_07:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Aug 2017 15:06:01 -0000


--0__=09BB0BEADFC1547B8f9e8a93df938690918c09BB0BEADFC1547B
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1



David M=FCller (ELSOFT AG) <d.mueller@elsoft.ch> wrote on 08/11/2017 09:47:=
42
AM:

> From: David M=FCller (ELSOFT AG) <d.mueller@elsoft.ch>
> To: Chris Austen <austenc@us.ibm.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
> Date: 08/11/2017 09:47 AM
> Subject: Re: Crashing Phosphor Settings Manager
>
> Hello
>
> Thanks for the hint.
>
> Chris Austen wrote:
>
> > I don't think there is any one process that is responsible for
> > /org/openbmc/control. It is a parent of other processes though.
> >
> > org.openbmc.control.Bmc       /org/openbmc/control/bmc0
> > org.openbmc.control.Power     /org/openbmc/control/power0
> > org.openbmc.control.Chassis   /org/openbmc/control/chassis0
> > org.openbmc.control.BmcFlash  /org/openbmc/control/flash
> >
> > So it appears not 1 of the 4 processes is starting up on the
> > evb-ast2500 build. That is not a bad thing though.  The
> > org.openbmc.control (any org.openbmc really) is in violation of the
> > dbus spec and as such we have moved most services over to
> > xyz.openbmc=5Fproject.  Seems like the evb-ast2500 is ready to have
> > the settings=5Fmanager.py from phosphor/settingd repository fixed up.
> >
> > So you can ignore that message and focus on the /xyz/openbmc/control
> > interfaces
>
> This should be "/xyz/openbmc=5Fproject/control", isn't it?

oops yes... openbmc=5Fproject

Chris

>
>
> Dave
>

--0__=09BB0BEADFC1547B8f9e8a93df938690918c09BB0BEADFC1547B
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">David M=FCller (ELSOFT AG) &lt;d.muelle=
r@elsoft.ch&gt; wrote on 08/11/2017 09:47:42 AM:<br><br>&gt; From: David M=
=FCller (ELSOFT AG) &lt;d.mueller@elsoft.ch&gt;</font></tt><br><tt><font si=
ze=3D"2">&gt; To: Chris Austen &lt;austenc@us.ibm.com&gt;</font></tt><br><t=
t><font size=3D"2">&gt; Cc: Andrew Jeffery &lt;andrew@aj.id.au&gt;, openbmc=
@lists.ozlabs.org</font></tt><br><tt><font size=3D"2">&gt; Date: 08/11/2017=
 09:47 AM</font></tt><br><tt><font size=3D"2">&gt; Subject: Re: Crashing Ph=
osphor Settings Manager</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; H=
ello<br>&gt; <br>&gt; Thanks for the hint.<br>&gt; <br>&gt; Chris Austen wr=
ote:<br>&gt; <br>&gt; &gt; I don't think there is any one process that is r=
esponsible for <br>&gt; &gt; /org/openbmc/control. It is a parent of other =
processes though.<br>&gt; &gt; <br>&gt; &gt; org.openbmc.control.Bmc &nbsp;=
 &nbsp; &nbsp; /org/openbmc/control/bmc0 <br>&gt; &gt; org.openbmc.control.=
Power &nbsp; &nbsp; /org/openbmc/control/power0 <br>&gt; &gt; org.openbmc.c=
ontrol.Chassis &nbsp; /org/openbmc/control/chassis0 <br>&gt; &gt; org.openb=
mc.control.BmcFlash &nbsp;/org/openbmc/control/flash<br>&gt; &gt; <br>&gt; =
&gt; So it appears not 1 of the 4 processes is starting up on the<br>&gt; &=
gt; evb-ast2500 build. That is not a bad thing though. &nbsp;The<br>&gt; &g=
t; org.openbmc.control (any org.openbmc really) is in violation of the<br>&=
gt; &gt; dbus spec and as such we have moved most services over to <br>&gt;=
 &gt; xyz.openbmc=5Fproject. &nbsp;Seems like the evb-ast2500 is ready to h=
ave<br>&gt; &gt; the settings=5Fmanager.py from phosphor/settingd repositor=
y fixed up.<br>&gt; &gt; <br>&gt; &gt; So you can ignore that message and f=
ocus on the /xyz/openbmc/control <br>&gt; &gt; interfaces<br>&gt; <br>&gt; =
This should be &quot;/xyz/openbmc=5Fproject/control&quot;, isn't it?<br></f=
ont></tt><br><tt><font size=3D"2">oops yes... openbmc=5Fproject &nbsp;</fon=
t></tt><br><br><tt><font size=3D"2">Chris </font></tt><br><br><tt><font siz=
e=3D"2">&gt; <br>&gt; <br>&gt; Dave<br>&gt; <br></font></tt><BR>
</body></html>

--0__=09BB0BEADFC1547B8f9e8a93df938690918c09BB0BEADFC1547B--
