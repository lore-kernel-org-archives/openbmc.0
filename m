Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xkP1f2hqwzDqy3
 for <openbmc@lists.ozlabs.org>; Sat,  2 Sep 2017 01:54:14 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v81FmmwJ020896
 for <openbmc@lists.ozlabs.org>; Fri, 1 Sep 2017 11:54:11 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cq9x0auvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 01 Sep 2017 11:54:11 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 1 Sep 2017 15:54:10 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 1 Sep 2017 15:54:07 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2017090115540697-585675 ;
 Fri, 1 Sep 2017 15:54:06 +0000 
MIME-Version: 1.0
Subject: RFC Adding Interfaces to OpenBMC 
To: openbmc@lists.ozlabs.org
From: "Chris Austen" <austenc@us.ibm.com>
Date: Fri, 1 Sep 2017 10:54:06 -0500
X-KeepSent: 056E09BF:B373E650-8625818E:00432DAB;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 62971
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0B1DDFD0AB3B8f9e8a93df938690918c09BB0B1DDFD0AB3B"
Content-Disposition: inline
x-cbid: 17090115-3107-0000-0000-000002F77200
X-IBM-SpamModules-Scores: BY=0.039566; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.43978; ST=0; TS=0; UL=0; ISC=; MB=0.157704
X-IBM-SpamModules-Versions: BY=3.00007647; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00910747; UDB=6.00456898; IPR=6.00691027; 
 BA=6.00005563; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016962; XFM=3.00000015;
 UTC=2017-09-01 15:54:08
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-09-01 12:27:48 - 6.00007265
x-cbparentid: 17090115-3108-0000-0000-000043E4CB67
Message-Id: <OF056E09BF.B373E650-ON8625818E.00432DAB-8625818E.005759D2@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-01_04:, , signatures=0
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
X-List-Received-Date: Fri, 01 Sep 2017 15:54:14 -0000


--0__=09BB0B1DDFD0AB3B8f9e8a93df938690918c09BB0B1DDFD0AB3B
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



I'd like to get some feed back on draft...

It should not be any surprise that we are trying to implement a web user
interface and Redfish.  I think requiring every implementation of OpenBMC
to now support a webui and Redfish goes against the basic principals of the
project.  A better approach would be to allow the machine configuration to
determine what features/apps to support.  The OpenBMC core would provide
the infrastructure to reverse(?) proxy incoming requests to the various
applications based on the application defining which routes it can handle.
With those thoughts in mind, the current design needs to be tweaked
slightly.

FROM:
| server | app (dbus) |
TO:
| server | reverse | app (dbus)    |
|        |  proxy  | app (web)     |
|        |         | app (redfish) |
|        |         | app (...)     |
Route handler added at service startup to create the proxy environment
(figure 1: In todays design the single app defines all routes at compile
time.  Adding routes to that single app forces all OpenBMC machines to pick
up the new routes which is undesirable)

Note: due to legacy decisions the '/' and '/xyz' route are owned by the
dbus app.  (Could the dbus route be helpful here?  All browsers use
'text/html' and our rest uses 'application/json', perhaps a nudge/redirect
the user to the correct uri)


Security:
~~~~~~~~
None at the proxy level


Registering Routes:
~~~~~~~~~~~~~~~
Route registration will happen at service start up.  An application
configuration file placed in to a predetermined location will be parsed by
the proxy code


Application Requirements:
~~~~~~~~~~~~~~~~~~~~~~
1) The cfg file will be based on a common xxx format
- likely need a decision as to proxy or reverse proxy before declaring
config format type

2) Create a bb file in the appropriate layer.  Keep in mind the openbmc/
meta-phosphor/common/recipes-phosphor/interfaces/ is for core functionality
only.
i.e.    PROVIDES =3D 'phosphor-webui'
         <example of how to copy the apps config file to the correct route
registration location>

3) Declare in the appropriate machine conf file the bb file which contains
your application
i.e.    OBMC=5FMACHINE=5FFEATURES +=3D 'phosphor-webui'




Chris Austen
POWER Systems Enablement Manager
(512) 286-5184 (T/L: 363-5184)

--0__=09BB0B1DDFD0AB3B8f9e8a93df938690918c09BB0B1DDFD0AB3B
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">I'd like to get some feed back on draft...<=
/font><br><br><font size=3D"2">It should not be any surprise that we are tr=
ying to implement a web user interface and Redfish.  I think requiring ever=
y implementation of OpenBMC to now support a webui and Redfish goes against=
 the basic principals of the project.  A better approach would be to allow =
the machine configuration to determine what features/apps to support.  The =
OpenBMC core would provide the infrastructure to reverse(?) proxy incoming =
requests to the various applications based on the application defining whic=
h routes it can handle.  With those thoughts in mind, the current design ne=
eds to be tweaked slightly.</font><br><br><font size=3D"2">FROM:</font><br>=
<font size=3D"2" face=3D"Courier New">| server | app (dbus) |</font><br><fo=
nt size=3D"2">TO:</font><br><font size=3D"2" face=3D"Courier New">| server =
| reverse | app (dbus)    |</font><br><font size=3D"2" face=3D"Courier New"=
>|        |  proxy  | app (web)     |</font><br><font size=3D"2" face=3D"Co=
urier New">|        |         | app (redfish) |</font><br><font size=3D"2" =
face=3D"Courier New">|        |         | app (...)     |</font><br><font s=
ize=3D"2" face=3D"Courier New">Route handler added at service startup to cr=
eate the proxy environment</font><br><font size=3D"2">(figure 1: In todays =
design the single app defines all routes at compile time.  Adding routes to=
 that single app forces all OpenBMC machines to pick up the new routes whic=
h is undesirable) </font><br><br><font size=3D"2">Note: due to legacy decis=
ions the '/' and '/xyz' route are owned by the dbus app.  (Could the dbus r=
oute be helpful here?  All browsers use 'text/html' and our rest uses 'appl=
ication/json', perhaps a nudge/redirect the user to the correct uri) </font=
><br><br><br><font size=3D"2">Security:</font><br><font size=3D"2">~~~~~~~~=
</font><br><font size=3D"2">None at the proxy level</font><br><br><br><font=
 size=3D"2">Registering Routes:</font><br><font size=3D"2">~~~~~~~~~~~~~~~<=
/font><br><font size=3D"2">Route registration will happen at service start =
up.  An application configuration file placed in to a predetermined locatio=
n will be parsed by the proxy code</font><br><br><br><font size=3D"2">Appli=
cation Requirements:</font><br><font size=3D"2">~~~~~~~~~~~~~~~~~~~~~~</fon=
t><br><font size=3D"2">1) The cfg file will be based on a common xxx format=
</font><br><font size=3D"2">- likely need a decision as to proxy or reverse=
 proxy before declaring config format type </font><br><br><font size=3D"2">=
2) Create a bb file in the appropriate layer.  Keep in mind the </font><a h=
ref=3D"https://github.com/openbmc/openbmc"><u><font color=3D"#0000FF">openb=
mc</font></u></a>/<a href=3D"https://github.com/openbmc/openbmc/tree/master=
/meta-phosphor"><u><font color=3D"#0000FF">meta-phosphor</font></u></a>/<a =
href=3D"https://github.com/openbmc/openbmc/tree/master/meta-phosphor/common=
"><u><font color=3D"#0000FF">common</font></u></a>/<a href=3D"https://githu=
b.com/openbmc/openbmc/tree/master/meta-phosphor/common/recipes-phosphor"><u=
><font color=3D"#0000FF">recipes-phosphor</font></u></a>/<b>interfaces</b>/=
<font size=3D"2"> is for core functionality only.  </font><br><font size=3D=
"2">i.e.    PROVIDES =3D 'phosphor-webui'</font><br><font size=3D"2">      =
   &lt;example of how to copy the apps config file to the correct route reg=
istration location&gt;</font><br><font size=3D"2"> </font><br><font size=3D=
"2">3) Declare in the appropriate machine conf file the bb file which conta=
ins your application </font><br><font size=3D"2">i.e.    </font>OBMC=5FMACH=
INE=5FFEATURES<font size=3D"2"> +=3D 'phosphor-webui'</font><br><br><br><br=
><font size=3D"2"><br>Chris Austen<br>POWER Systems Enablement Manager <br>=
(512) 286-5184 (T/L: 363-5184)</font><BR>
</body></html>

--0__=09BB0B1DDFD0AB3B8f9e8a93df938690918c09BB0B1DDFD0AB3B--
