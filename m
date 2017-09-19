Return-Path: <austenc@us.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=austenc@us.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxWNp3SBJzDq8f
 for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2017 04:19:21 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8JI5R9V123423
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 14:19:18 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2d35nf1y68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 14:19:18 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 19 Sep 2017 18:19:17 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 19 Sep 2017 18:19:14 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2017091918191367-900028 ;
 Tue, 19 Sep 2017 18:19:13 +0000 
MIME-Version: 1.0
In-Reply-To: <OF056E09BF.B373E650-ON8625818E.00432DAB-8625818E.005759D2@LocalDomain>
Subject: Re: RFC Adding Interfaces to OpenBMC 
To: openbmc@lists.ozlabs.org
From: "Chris Austen" <austenc@us.ibm.com>
Date: Tue, 19 Sep 2017 13:19:12 -0500
References: <OF056E09BF.B373E650-ON8625818E.00432DAB-8625818E.005759D2@LocalDomain>
X-KeepSent: 9FAE2656:F19C25EB-862581A0:005E317D;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 53087
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0B33DFCDB7ED8f9e8a93df938690918c09BB0B33DFCDB7ED"
Content-Disposition: inline
x-cbid: 17091918-1799-0000-0000-000002DEF31E
X-IBM-SpamModules-Scores: BY=0.231508; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.254485
X-IBM-SpamModules-Versions: BY=3.00007763; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000230; SDB=6.00919380; UDB=6.00461895; IPR=6.00699607; 
 BA=6.00005598; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017213; XFM=3.00000015;
 UTC=2017-09-19 18:19:15
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-09-19 10:54:19 - 6.00007353
x-cbparentid: 17091918-1800-0000-0000-0000D591FD9F
Message-Id: <OF9FAE2656.F19C25EB-ON862581A0.005E317D-862581A0.0064A2AE@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-19_08:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Sep 2017 18:19:23 -0000


--0__=09BB0B33DFCDB7ED8f9e8a93df938690918c09BB0B33DFCDB7ED
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



After some discussion that did not make it to the mailing list I am
revising the RFC to integrate with Nginx technology.  The theme is the
same; create interfaces in a way that anyone can add/remove/replace per
their business needs through with a prescriptive process


Request - https ---> Nginx (Reverse-Proxy)
                  |
                  |http
                  |
                 /|\
                 | | `-> rest=5Fdbus   127.0.0.1:8081
                 |  `--> webui       127.0.0.1:8082
                  `----> redfish     127.0.0.1:8083

With Nginx accepting https would there be a need for localhost applications
incur the cost of secure https too?


Chris Austen/Austin/IBM wrote on 09/01/2017 10:54:06 AM:

> From: Chris Austen/Austin/IBM
> To: openbmc@lists.ozlabs.org
> Date: 09/01/2017 10:54 AM
> Subject: RFC Adding Interfaces to OpenBMC
>
> I'd like to get some feed back on draft...
>
> It should not be any surprise that we are trying to implement a web
> user interface and Redfish.  I think requiring every implementation
> of OpenBMC to now support a webui and Redfish goes against the basic
> principals of the project.  A better approach would be to allow the
> machine configuration to determine what features/apps to support.
> The OpenBMC core would provide the infrastructure to reverse(?)
> proxy incoming requests to the various applications based on the
> application defining which routes it can handle.  With those
> thoughts in mind, the current design needs to be tweaked slightly.
>
> FROM:
> | server | app (dbus) |
> TO:
> | server | reverse | app (dbus)    |
> |        |  proxy  | app (web)     |
> |        |         | app (redfish) |
> |        |         | app (...)     |
> Route handler added at service startup to create the proxy environment
> (figure 1: In todays design the single app defines all routes at
> compile time.  Adding routes to that single app forces all OpenBMC
> machines to pick up the new routes which is undesirable)
>
> Note: due to legacy decisions the '/' and '/xyz' route are owned by
> the dbus app.  (Could the dbus route be helpful here?  All browsers
> use 'text/html' and our rest uses 'application/json', perhaps a
> nudge/redirect the user to the correct uri)
>
> Security:
> ~~~~~~~~
> None at the proxy level
>
> Registering Routes:
> ~~~~~~~~~~~~~~~
> Route registration will happen at service start up.  An application
> configuration file placed in to a predetermined location will be
> parsed by the proxy code
>
> Application Requirements:
> ~~~~~~~~~~~~~~~~~~~~~~
> 1) The cfg file will be based on a common xxx format
> - likely need a decision as to proxy or reverse proxy before
> declaring config format type
>
> 2) Create a bb file in the appropriate layer.  Keep in mind the openbmc/
> meta-phosphor/common/recipes-phosphor/interfaces/ is for core
> functionality only.
> i.e.    PROVIDES =3D 'phosphor-webui'
>          <example of how to copy the apps config file to the correct
> route registration location>
>
> 3) Declare in the appropriate machine conf file the bb file which
> contains your application
> i.e.    OBMC=5FMACHINE=5FFEATURES +=3D 'phosphor-webui'
>
>
> Chris Austen
> POWER Systems Enablement Manager
> (512) 286-5184 (T/L: 363-5184)

--0__=09BB0B33DFCDB7ED8f9e8a93df938690918c09BB0B33DFCDB7ED
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>After some discussion that did not make it to the mailin=
g list I am revising the RFC to integrate with Nginx technology. &nbsp;The =
theme is the same; create interfaces in a way that anyone can add/remove/re=
place per their business needs through with a prescriptive process</tt><br>=
<br><br><tt>Request - https ---&gt; Nginx (Reverse-Proxy)<br> &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</tt><br><tt>&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |http</tt><br><tt>&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |<br> &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /|\ &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br> &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | | `-&gt; rest=5Fdbus &n=
bsp; 127.0.0.1:8081<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; | &nbsp;`--&gt; webui &nbsp; &nbsp; &nbsp; 127.0.0.1:8082<br> &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;`----&gt; redfish &nb=
sp; &nbsp; 127.0.0.1:8083</tt><br><br><font size=3D"2">With Nginx accepting=
 https would there be a need for localhost applications incur the cost of s=
ecure https too?</font><br><br><br><tt><font size=3D"2">Chris Austen/Austin=
/IBM wrote on 09/01/2017 10:54:06 AM:<br><br>&gt; From: Chris Austen/Austin=
/IBM</font></tt><br><tt><font size=3D"2">&gt; To: openbmc@lists.ozlabs.org<=
/font></tt><br><tt><font size=3D"2">&gt; Date: 09/01/2017 10:54 AM</font></=
tt><br><tt><font size=3D"2">&gt; Subject: RFC Adding Interfaces to OpenBMC =
</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; I'd like to get some fee=
d back on draft...</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; It sho=
uld not be any surprise that we are trying to implement a web <br>&gt; user=
 interface and Redfish. &nbsp;I think requiring every implementation <br>&g=
t; of OpenBMC to now support a webui and Redfish goes against the basic<br>=
&gt; principals of the project. &nbsp;A better approach would be to allow t=
he <br>&gt; machine configuration to determine what features/apps to suppor=
t. &nbsp;<br>&gt; The OpenBMC core would provide the infrastructure to reve=
rse(?) <br>&gt; proxy incoming requests to the various applications based o=
n the <br>&gt; application defining which routes it can handle. &nbsp;With =
those <br>&gt; thoughts in mind, the current design needs to be tweaked sli=
ghtly.</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; FROM:</font></tt><=
br><tt><font size=3D"2">&gt; | server | app (dbus) |</font></tt><br><tt><fo=
nt size=3D"2">&gt; TO:</font></tt><br><tt><font size=3D"2">&gt; | server | =
reverse | app (dbus) &nbsp; &nbsp;|</font></tt><br><tt><font size=3D"2">&gt=
; | &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;proxy &nbsp;| app (web) &nbsp; &nbsp=
; |</font></tt><br><tt><font size=3D"2">&gt; | &nbsp; &nbsp; &nbsp; &nbsp;|=
 &nbsp; &nbsp; &nbsp; &nbsp; | app (redfish) |</font></tt><br><tt><font siz=
e=3D"2">&gt; | &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp; &nbsp; | a=
pp (...) &nbsp; &nbsp; |</font></tt><br><tt><font size=3D"2">&gt; Route han=
dler added at service startup to create the proxy environment</font></tt><b=
r><tt><font size=3D"2">&gt; (figure 1: In todays design the single app defi=
nes all routes at <br>&gt; compile time. &nbsp;Adding routes to that single=
 app forces all OpenBMC <br>&gt; machines to pick up the new routes which i=
s undesirable) </font></tt><br><tt><font size=3D"2">&gt; <br>&gt; Note: due=
 to legacy decisions the '/' and '/xyz' route are owned by <br>&gt; the dbu=
s app. &nbsp;(Could the dbus route be helpful here? &nbsp;All browsers <br>=
&gt; use 'text/html' and our rest uses 'application/json', perhaps a <br>&g=
t; nudge/redirect the user to the correct uri) </font></tt><br><tt><font si=
ze=3D"2">&gt; <br>&gt; Security:</font></tt><br><tt><font size=3D"2">&gt; ~=
~~~~~~~</font></tt><br><tt><font size=3D"2">&gt; None at the proxy level</f=
ont></tt><br><tt><font size=3D"2">&gt; <br>&gt; Registering Routes:</font><=
/tt><br><tt><font size=3D"2">&gt; ~~~~~~~~~~~~~~~</font></tt><br><tt><font =
size=3D"2">&gt; Route registration will happen at service start up. &nbsp;A=
n application <br>&gt; configuration file placed in to a predetermined loca=
tion will be <br>&gt; parsed by the proxy code</font></tt><br><tt><font siz=
e=3D"2">&gt; <br>&gt; Application Requirements:</font></tt><br><tt><font si=
ze=3D"2">&gt; ~~~~~~~~~~~~~~~~~~~~~~</font></tt><br><tt><font size=3D"2">&g=
t; 1) The cfg file will be based on a common xxx format</font></tt><br><tt>=
<font size=3D"2">&gt; - likely need a decision as to proxy or reverse proxy=
 before <br>&gt; declaring config format type </font></tt><br><tt><font siz=
e=3D"2">&gt; <br>&gt; 2) Create a bb file in the appropriate layer. &nbsp;K=
eep in mind the openbmc/<br>&gt; meta-phosphor/common/recipes-phosphor/inte=
rfaces/ is for core <br>&gt; functionality only. &nbsp;</font></tt><br><tt>=
<font size=3D"2">&gt; i.e. &nbsp; &nbsp;PROVIDES =3D 'phosphor-webui'</font=
></tt><br><tt><font size=3D"2">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;e=
xample of how to copy the apps config file to the correct<br>&gt; route reg=
istration location&gt;</font></tt><br><tt><font size=3D"2">&gt; &nbsp;</fon=
t></tt><br><tt><font size=3D"2">&gt; 3) Declare in the appropriate machine =
conf file the bb file which <br>&gt; contains your application </font></tt>=
<br><tt><font size=3D"2">&gt; i.e. &nbsp; &nbsp;OBMC=5FMACHINE=5FFEATURES +=
=3D 'phosphor-webui'</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; <br>=
&gt; Chris Austen<br>&gt; POWER Systems Enablement Manager <br>&gt; (512) 2=
86-5184 (T/L: 363-5184)</font></tt><BR>
</body></html>

--0__=09BB0B33DFCDB7ED8f9e8a93df938690918c09BB0B33DFCDB7ED--
