Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6vzX0dg4zDqBQ
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 05:17:59 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3IJDSTY031916
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 15:17:46 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29wqpuk3c8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 15:17:45 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 18 Apr 2017 15:17:44 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 18 Apr 2017 15:17:42 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3IJHg3Z43384922
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 19:17:42 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BD89112060
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 15:17:41 -0400 (EDT)
Received: from d50lp01.ny.us.ibm.com (unknown [146.89.104.207])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS id 90E0611205F
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 15:17:41 -0400 (EDT)
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 18 Apr 2017 15:17:41 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Tue, 18 Apr 2017 15:17:39 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 18 Apr 2017 19:17:38 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 18 Apr 2017 19:17:36 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2017041819173546-551441 ;
 Tue, 18 Apr 2017 19:17:35 +0000 
MIME-Version: 1.0
In-Reply-To: <214891492421512@webcorp03h.yandex-team.ru>
Subject: Re: Plans for BMC i2c to host bridge via IPMI
To: "Anton D. Kachalov" <mouse@yandex-team.ru>
Cc: tomjose <tomjose@linux.vnet.ibm.com>, Peter Hanson <peterh@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Tue, 18 Apr 2017 14:17:31 -0500
References: <CAPozSNp_S_-N8YV=ruAzYVxWy4FgcJvyK27HFb0YL-mNYP22xA@mail.gmail.com>
 <58EE852E.8010005@linux.vnet.ibm.com>
 <214891492421512@webcorp03h.yandex-team.ru>
X-KeepSent: 8A3EF940:D392E785-86258106:0069CC22;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 10471
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0B95DFFA4AB28f9e8a93df938690918c09BB0B95DFFA4AB2"
Content-Disposition: inline
x-cbid: 17041819-0052-0000-0000-000001DC2232
X-IBM-SpamModules-Scores: BY=0.281209; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.449102; ST=0; TS=0; UL=0; ISC=; MB=0.135662
X-IBM-SpamModules-Versions: BY=3.00006936; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00849258; UDB=6.00419331; IPR=6.00627899; 
 BA=6.00005298; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015088; XFM=3.00000013;
 UTC=2017-04-18 19:17:38
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-04-18 11:23:12 - 6.00006618
x-cbparentid: 17041819-9952-0000-0000-000030A861E0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006936; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00849258; UDB=6.00419331; IPR=6.00627899; 
 BA=6.00005298; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015088; XFM=3.00000013;
 UTC=2017-04-18 19:17:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF8A3EF940.D392E785-ON86258106.0069CC22-86258106.0069F96F@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-18_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=17
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1704180152
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
X-List-Received-Date: Tue, 18 Apr 2017 19:18:00 -0000


--0__=09BB0B95DFFA4AB28f9e8a93df938690918c09BB0B95DFFA4AB2
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1


Anton,
you have it licensed as GPL.  Tom will not be able to use your code as the
base code for OpenBMC is Apache licensed.

Chris Austen
POWER Systems Enablement Manager


"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrote on
04/17/2017 04:31:52 AM:

> From: "Anton D. Kachalov" <mouse@yandex-team.ru>
> To: tomjose <tomjose@linux.vnet.ibm.com>, Peter Hanson
> <peterh@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 04/17/2017 04:41 AM
> Subject: Re: Plans for BMC i2c to host bridge via IPMI
> Sent by: "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>
>
> Hello,
>
> I'm already works on this approach:
>
> https://github.com/ya-mouse/meta-openbmc-yandex/blob/master/meta-
>
yandex/meta-openrack/meta-shaosi/recipes-kernel/linux/linux-obmc/ipmi=5Fi2c=
.c
>
> This creates a OpenIPMI-compatible device for the requested i2c
> slave addr + master (you may use ipmitool/freeipmi after all). DTS
example:
>
> https://github.com/ya-mouse/meta-openbmc-yandex/blob/master/meta-
> yandex/meta-openrack/meta-shaosi/recipes-kernel/linux/linux-obmc/
> overlays/shaosi-CB.dts#L121-L125
>
> In order to operate in multi-master env, you also need additional
> patche such as:
> https://github.com/ya-mouse/meta-openbmc-yandex/blob/master/meta-
> yandex/meta-openrack/meta-shaosi/recipes-kernel/linux/linux-obmc/
> 086-ipmi-hacks.patch
>
> This driver still has some issues + not supported incoming requests
> (it only operates like a "client").
>
> 12.04.2017, 22:51, "tomjose" <tomjose@linux.vnet.ibm.com>:
> Hello Peter,
>
> As i understand you would be leveraging the BT(Block Transfer) interface
> to route commands from host to BMC.
>
> =A0From the IPMI specification it looks like this can be a generic one
> implementation instead of implementing
> OEM commands.
>
> Implementing the IPMB interface (Section 7) in the IPMI specification
> would probably suit your requirement.
> The following commands should help us achieve the goal: Master
> Write-Read command, Get Message command
> and Send message command.
>
> I am thinking that IPMB interface could be a dbus service which parses
> host IPMI commands and maps to an I2C read/write.
>
> Let me know your thoughts.
>
> Regards,
> Tom
>
>
> On Thursday 06 April 2017 07:10 AM, Peter Hanson wrote:
> =A0Ave!
>
> =A0This email captures proposed actions from an exchange earlier today on
> =A0the #openbmc IRC channel.
>
> =A0Basic goal is to reach devices on a BMC I2C bus from IPMI
> commandline at host.
>
> =A0I2C commands and responses to be carried as OEM extension messages,
> =A0i.e., Network Function Codes 2Eh / 2Fh in the Intel specification.
> =A0Those message forms require a three byte IANA Enterprise Number, and
> =A0our original plan used Google's code.
>
> =A0We would like to carry the feature in OpenBmc, so I wanted to confirm
> =A0if this is acceptable, and/or what modifications would be needed.
>
> =A0Decisions:
>
> =A01. Ok to use OEM extensions. Patrick noted that OpenBmc already uses
> =A0some, albeit under the IBM IANA Enterprise Number.
>
> =A02. Switch to OpenBmc IANA Enterprise Number when available.
>
> =A03. Patrick proposed to create a new phosphor-ipmi-oemproviders repo to
> =A0hold the code, message documentation, etc.
>
> =A04. All uses of the OpenBmc IANA shall be enumerated in place - almost
> =A0certainly an include file in the new repo - so we don't end up with
> =A0conflicting uses.
>
> =A0Actions:
>
> =A0A1. peterh: send this email to the mailing list.
> =A0A2. stwcx: request IANA Enterprise Number.
> =A0A3. stwcx: create new phosphor-ipmi-oemproviders repo.
> =A0A4. peterh+brendanhiggins: propose detailed message designs.
> =A0A5. peterh: {net-ipmid,host-ipmi} +=3D support for these commands.
>
> =A0A key point of this email is to reap your collective wisdom, so please
> =A0if you have something to contribute, please do. In particular,
> =A0Patrick, please correct anything I misunderstood or incorrectly
> =A0extrapolated from the chat.
>
> =A0=A0=A0=A0-- peterh
>
>
>
>
> --
> Anton D. Kachalov
>
> ITO, Systems Architect
> Tel: 7 (495) 739-70-00 ext.7613
>

--0__=09BB0B95DFFA4AB28f9e8a93df938690918c09BB0B95DFFA4AB2
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><font size=3D"2">Anton,</font><br><font size=3D"2">you have =
it licensed as GPL.  Tom will not be able to use your code as the base code=
 for OpenBMC is Apache licensed.  </font><br><font size=3D"2"><br>Chris Aus=
ten<br>POWER Systems Enablement Manager <br></font><br><br><tt><font size=
=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+austenc=3Dus.ibm.com@lists.o=
zlabs.org&gt; wrote on 04/17/2017 04:31:52 AM:<br><br>&gt; From: &quot;Anto=
n D. Kachalov&quot; &lt;mouse@yandex-team.ru&gt;</font></tt><br><tt><font s=
ize=3D"2">&gt; To: tomjose &lt;tomjose@linux.vnet.ibm.com&gt;, Peter Hanson=
 <br>&gt; &lt;peterh@google.com&gt;, OpenBMC Maillist &lt;openbmc@lists.ozl=
abs.org&gt;</font></tt><br><tt><font size=3D"2">&gt; Date: 04/17/2017 04:41=
 AM</font></tt><br><tt><font size=3D"2">&gt; Subject: Re: Plans for BMC i2c=
 to host bridge via IPMI</font></tt><br><tt><font size=3D"2">&gt; Sent by: =
&quot;openbmc&quot; &lt;openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.o=
rg&gt;</font></tt><br><tt><font size=3D"2">&gt; <br>&gt; Hello,</font></tt>=
<br><tt><font size=3D"2">&gt; =A0</font></tt><br><tt><font size=3D"2">&gt; =
I'm already works on this approach:</font></tt><br><tt><font size=3D"2">&gt=
; =A0</font></tt><br><tt><font size=3D"2">&gt; <a href=3D"https://github.co=
m/ya-mouse/meta-openbmc-yandex/blob/master/meta-">https://github.com/ya-mou=
se/meta-openbmc-yandex/blob/master/meta-</a><br>&gt; yandex/meta-openrack/m=
eta-shaosi/recipes-kernel/linux/linux-obmc/ipmi=5Fi2c.c</font></tt><br><tt>=
<font size=3D"2">&gt; =A0</font></tt><br><tt><font size=3D"2">&gt; This cre=
ates a OpenIPMI-compatible device for the requested i2c <br>&gt; slave addr=
 + master (you may use ipmitool/freeipmi after all). DTS example:</font></t=
t><br><tt><font size=3D"2">&gt; =A0</font></tt><br><tt><font size=3D"2">&gt=
; <a href=3D"https://github.com/ya-mouse/meta-openbmc-yandex/blob/master/me=
ta-">https://github.com/ya-mouse/meta-openbmc-yandex/blob/master/meta-</a><=
br>&gt; yandex/meta-openrack/meta-shaosi/recipes-kernel/linux/linux-obmc/<b=
r>&gt; overlays/shaosi-CB.dts#L121-L125</font></tt><br><tt><font size=3D"2"=
>&gt; =A0</font></tt><br><tt><font size=3D"2">&gt; In order to operate in m=
ulti-master env, you also need additional <br>&gt; patche such as:</font></=
tt><br><tt><font size=3D"2">&gt; <a href=3D"https://github.com/ya-mouse/met=
a-openbmc-yandex/blob/master/meta-">https://github.com/ya-mouse/meta-openbm=
c-yandex/blob/master/meta-</a><br>&gt; yandex/meta-openrack/meta-shaosi/rec=
ipes-kernel/linux/linux-obmc/<br>&gt; 086-ipmi-hacks.patch</font></tt><br><=
tt><font size=3D"2">&gt; =A0</font></tt><br><tt><font size=3D"2">&gt; This =
driver still has some issues + not supported incoming requests <br>&gt; (it=
 only operates like a &quot;client&quot;).</font></tt><br><tt><font size=3D=
"2">&gt; =A0</font></tt><br><tt><font size=3D"2">&gt; 12.04.2017, 22:51, &q=
uot;tomjose&quot; &lt;tomjose@linux.vnet.ibm.com&gt;:</font></tt><br><tt><f=
ont size=3D"2">&gt; Hello Peter,<br>&gt; <br>&gt; As i understand you would=
 be leveraging the BT(Block Transfer) interface<br>&gt; to route commands f=
rom host to BMC.<br>&gt; <br>&gt; =A0From the IPMI specification it looks l=
ike this can be a generic one<br>&gt; implementation instead of implementin=
g<br>&gt; OEM commands.<br>&gt; <br>&gt; Implementing the IPMB interface (S=
ection 7) in the IPMI specification<br>&gt; would probably suit your requir=
ement.<br>&gt; The following commands should help us achieve the goal: Mast=
er<br>&gt; Write-Read command, Get Message command<br>&gt; and Send message=
 command.<br>&gt; <br>&gt; I am thinking that IPMB interface could be a dbu=
s service which parses<br>&gt; host IPMI commands and maps to an I2C read/w=
rite.<br>&gt; <br>&gt; Let me know your thoughts.<br>&gt; <br>&gt; Regards,=
<br>&gt; Tom<br>&gt; <br>&gt; <br>&gt; On Thursday 06 April 2017 07:10 AM, =
Peter Hanson wrote:</font></tt><br><tt><font size=3D"2">&gt; =A0Ave!<br>&gt=
; <br>&gt; =A0This email captures proposed actions from an exchange earlier=
 today on<br>&gt; =A0the #openbmc IRC channel.<br>&gt; <br>&gt; =A0Basic go=
al is to reach devices on a BMC I2C bus from IPMI <br>&gt; commandline at h=
ost.<br>&gt; <br>&gt; =A0I2C commands and responses to be carried as OEM ex=
tension messages,<br>&gt; =A0i.e., Network Function Codes 2Eh / 2Fh in the =
Intel specification.<br>&gt; =A0Those message forms require a three byte IA=
NA Enterprise Number, and<br>&gt; =A0our original plan used Google's code.<=
br>&gt; <br>&gt; =A0We would like to carry the feature in OpenBmc, so I wan=
ted to confirm<br>&gt; =A0if this is acceptable, and/or what modifications =
would be needed.<br>&gt; <br>&gt; =A0Decisions:<br>&gt; <br>&gt; =A01. Ok t=
o use OEM extensions. Patrick noted that OpenBmc already uses<br>&gt; =A0so=
me, albeit under the IBM IANA Enterprise Number.<br>&gt; <br>&gt; =A02. Swi=
tch to OpenBmc IANA Enterprise Number when available.<br>&gt; <br>&gt; =A03=
. Patrick proposed to create a new phosphor-ipmi-oemproviders repo to<br>&g=
t; =A0hold the code, message documentation, etc.<br>&gt; <br>&gt; =A04. All=
 uses of the OpenBmc IANA shall be enumerated in place - almost<br>&gt; =A0=
certainly an include file in the new repo - so we don't end up with<br>&gt;=
 =A0conflicting uses.<br>&gt; <br>&gt; =A0Actions:<br>&gt; <br>&gt; =A0A1. =
peterh: send this email to the mailing list.<br>&gt; =A0A2. stwcx: request =
IANA Enterprise Number.<br>&gt; =A0A3. stwcx: create new phosphor-ipmi-oemp=
roviders repo.<br>&gt; =A0A4. peterh+brendanhiggins: propose detailed messa=
ge designs.<br>&gt; =A0A5. peterh: {net-ipmid,host-ipmi} +=3D support for t=
hese commands.<br>&gt; <br>&gt; =A0A key point of this email is to reap you=
r collective wisdom, so please<br>&gt; =A0if you have something to contribu=
te, please do. In particular,<br>&gt; =A0Patrick, please correct anything I=
 misunderstood or incorrectly<br>&gt; =A0extrapolated from the chat.<br>&gt=
; <br>&gt; =A0=A0=A0=A0-- peterh<br>&gt; =A0</font></tt><br><tt><font size=
=3D"2">&gt; =A0</font></tt><br><tt><font size=3D"2">&gt; =A0</font></tt><br=
><tt><font size=3D"2">&gt; =A0</font></tt><br><tt><font size=3D"2">&gt; --=
=A0<br>&gt; Anton D. Kachalov<br>&gt; <br>&gt; ITO, Systems Architect<br>&g=
t; Tel: 7 (495) 739-70-00 ext.7613</font></tt><br><tt><font size=3D"2">&gt;=
 =A0</font></tt><BR>
</body></html>

--0__=09BB0B95DFFA4AB28f9e8a93df938690918c09BB0B95DFFA4AB2--
