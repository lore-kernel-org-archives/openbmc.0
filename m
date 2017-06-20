Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsYmC6rGKzDqhk
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 02:52:11 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5KGmjpg075528
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 12:52:08 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b6mk48h0y-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 12:52:08 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 20 Jun 2017 10:52:07 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 20 Jun 2017 10:52:05 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5KGq4m68782316
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 09:52:04 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A10116A042
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 10:52:04 -0600 (MDT)
Received: from d50lp01.ny.us.ibm.com (unknown [146.89.104.207])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS id 5D20B6A041
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 10:52:04 -0600 (MDT)
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 20 Jun 2017 12:52:03 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Tue, 20 Jun 2017 12:52:01 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 20 Jun 2017 16:51:59 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 20 Jun 2017 16:51:58 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2017062016515759-782145 ;
 Tue, 20 Jun 2017 16:51:57 +0000 
MIME-Version: 1.0
Subject: OpenBMC and Redfish - intro
To: openbmc@lists.ozlabs.org
From: "Chris Austen" <austenc@us.ibm.com>
Date: Tue, 20 Jun 2017 11:51:56 -0500
X-KeepSent: FA529A42:5FDE064B-86258145:00576CCE;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 30951
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0BD6DFC4EA5E8f9e8a93df938690918c09BB0BD6DFC4EA5E"
Content-Disposition: inline
x-cbid: 17062016-0016-0000-0000-000007011D09
X-IBM-SpamModules-Scores: BY=0.021414; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.435941; ST=0; TS=0; UL=0; ISC=; MB=0.144868
X-IBM-SpamModules-Versions: BY=3.00007262; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877521; UDB=6.00437148; IPR=6.00657660; 
 BA=6.00005432; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015900; XFM=3.00000015;
 UTC=2017-06-20 16:51:59
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-06-20 06:06:00 - 6.00006914
x-cbparentid: 17062016-7094-0000-0000-00000DA3C774
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007262; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877521; UDB=6.00437148; IPR=6.00657660; 
 BA=6.00005432; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015900; XFM=3.00000015;
 UTC=2017-06-20 16:52:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFFA529A42.5FDE064B-ON86258145.00576CCE-86258145.005CA593@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-20_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706200289
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
X-List-Received-Date: Tue, 20 Jun 2017 16:52:12 -0000


--0__=09BB0BD6DFC4EA5E8f9e8a93df938690918c09BB0BD6DFC4EA5E
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



Well that is a loaded subject line!

We have talked for a while about wanting to support the DMTF Redfish REST
interface.  Support would allow operators to adhere to a growing industry
standard and allow communities such as OCP (Open Compute Project) a
platform to put in to practice their profiles.  I think Operators and API
developers would also appreciate the interface.

At the Developer Congress in May 2017 we started working with
https://github.com/DMTF/Redfish-Profile-Simulator/tree/upgrade-0.9.5.  It
looks like it could be a great fit for implementation in the OpenBMC
Project.  The profile simulator code base seems to contain a front and back
end.  The front handling errors, REST, Parameter validation, Paths, etc
while the back end captures the data from the physical hardware.  The back
end; at discovery time, also informs the front end what is supported.
Seems like a great division of labor and very testable since validation
tools could be coded against both sides.

There are a few architectural discussion that need to occur around Redfish
and the mailing list is currently the best forum for that.  Let's start
with a really basic design point...  Translating to Odata: Compile vs
Runtime.

OpenBMC today at compile time knows what is supported (properties and
paths) via YAML files.  You could then in theory build the complete JSON
Schema for fixed values at compile time by probing in to different projects
such as https://github.com/openbmc/phosphor-dbus-interfaces (great for
static validation testing).  You could create static values inside the
meta-openbmc-machines layers (i.e. model#, Redfish version, etc) or support
various standard profiles in a layer such as meta-openbmc-redfish/meta-ocp.
Down side is you have to probe repositories and parse lots of YAML.

Runtime discovery puts some more effort on to the dbus objects but forces a
cleaner translation (who tells you that the host power only supports on/off
not reboot).  That may not actually be a benefit since we were pretty
active about not creating IPMI properties in our dbus objects.  Runtime
would run through all the dbus interfaces and translate them to Redfish.
In a single Redfish repository you could create the translation rules which
would simplify the code layout.  It would likely also mean that you avoid
YAML translations.  I don't think I am giving Runtime enough justice
really.  That or I've answered my own question.

I'm leaning towards compile time myself.  Thoughts?  Any volunteers that
would like to participate in helping to develop the architecture and coding
out a schema?


Chris Austen
The OpenBMC Project community evangelist

--0__=09BB0BD6DFC4EA5E8f9e8a93df938690918c09BB0BD6DFC4EA5E
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">Well that is a loaded subject line!</font><=
br><br><font size=3D"2">We have talked for a while about wanting to support=
 the DMTF Redfish REST interface.  Support would allow operators to adhere =
to a growing industry standard and allow communities such as OCP (Open Comp=
ute Project) a platform to put in to practice their profiles.  I think Oper=
ators and API developers would also appreciate the interface.  </font><br><=
br><font size=3D"2">At the Developer Congress in May 2017 we started workin=
g with </font><a href=3D"https://github.com/DMTF/Redfish-Profile-Simulator/=
tree/upgrade-0.9.5"><font size=3D"2">https://github.com/DMTF/Redfish-Profil=
e-Simulator/tree/upgrade-0.9.5</font></a><font size=3D"2">.  It looks like =
it could be a great fit for implementation in the OpenBMC Project.  The pro=
file simulator code base seems to contain a front and back end.  The front =
handling errors, REST, Parameter validation, Paths, etc while the back end =
captures the data from the physical hardware.  The back end; at discovery t=
ime, also informs the front end what is supported.  Seems like a great divi=
sion of labor and very testable since validation tools could be coded again=
st both sides.    </font><br><br><font size=3D"2">There are a few architect=
ural discussion that need to occur around Redfish and the mailing list is c=
urrently the best forum for that.  Let's start with a really basic design p=
oint...  Translating to Odata: Compile vs Runtime.  </font><br><br><font si=
ze=3D"2">OpenBMC today at compile time knows what is supported (properties =
and paths) via YAML files.  You could then in theory build the complete JSO=
N Schema for fixed values at compile time by probing in to different projec=
ts such as </font><a href=3D"https://github.com/openbmc/phosphor-dbus-inter=
faces"><font size=3D"2">https://github.com/openbmc/phosphor-dbus-interfaces=
</font></a><font size=3D"2"> (great for static validation testing).  You co=
uld create static values inside the meta-openbmc-machines layers (i.e. mode=
l#, Redfish version, etc) or support various standard profiles in a layer s=
uch as meta-openbmc-redfish/meta-ocp.  Down side is you have to probe repos=
itories and parse lots of YAML.  </font><br><br><font size=3D"2">Runtime di=
scovery puts some more effort on to the dbus objects but forces a cleaner t=
ranslation (who tells you that the host power only supports on/off not rebo=
ot).  That may not actually be a benefit since we were pretty active about =
not creating IPMI properties in our dbus objects.  Runtime would run throug=
h all the dbus interfaces and translate them to Redfish.  In a single Redfi=
sh repository you could create the translation rules which would simplify t=
he code layout.  It would likely also mean that you avoid YAML translations=
.  I don't think I am giving Runtime enough justice really.  That or I've a=
nswered my own question. </font><br><br><font size=3D"2">I'm leaning toward=
s compile time myself.  Thoughts?  Any volunteers that would like to partic=
ipate in helping to develop the architecture and coding out a schema?</font=
><br><br><font size=3D"2"><br>Chris Austen<br>The OpenBMC Project community=
 evangelist </font><BR>
</body></html>

--0__=09BB0BD6DFC4EA5E8f9e8a93df938690918c09BB0BD6DFC4EA5E--
