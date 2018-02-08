Return-Path: <hramasub@in.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hramasub@in.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcS4s2NwgzF142
 for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2018 16:51:56 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w185n5A5144374
 for <openbmc@lists.ozlabs.org>; Thu, 8 Feb 2018 00:51:54 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2g0fpy1xgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 00:51:53 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Thu, 8 Feb 2018 05:51:52 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 8 Feb 2018 05:51:49 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2018020805514886-75737 ;
 Thu, 8 Feb 2018 05:51:48 +0000 
MIME-Version: 1.0
In-Reply-To: <3df976c0-67f9-3444-4191-6e56598e4713@brudeseth.name>
Subject: Re: Redfish on OpenBMC
To: Rolf Brudeseth <code@brudeseth.name>
Cc: openbmc@lists.ozlabs.org
From: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Date: Thu, 8 Feb 2018 11:21:50 +0530
References: <9FBE92B9-4D49-41CD-9AF7-A5A9E48B25F3@fuzziesquirrel.com>
 <c62f69455ae74650a086a167c7434d37@ausx13mps334.AMER.DELL.COM>
 <OFF0C73A52.E22304BC-ON65258227.0026CCEB-65258227.0032425A@notes.na.collabserv.com>
 <7E9441B1E5EFFD4681F54958E82169932F662C08@ORSMSX114.amr.corp.intel.com>
 <OF31121584.33F1DD5E-ON6525822B.0055E9F8-6525822B.005D34B2@notes.na.collabserv.com>
 <7E9441B1E5EFFD4681F54958E82169932F66373A@ORSMSX114.amr.corp.intel.com>
 <3df976c0-67f9-3444-4191-6e56598e4713@brudeseth.name>
X-KeepSent: FEC95981:9C8EC008-6525822E:001E809D;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP7 August 18, 2016
X-LLNOutbound: False
X-Disclaimed: 54807
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABB08BDDF8D060D8f9e8a93df938690918cEABB08BDDF8D060D"
Content-Disposition: inline
x-cbid: 18020805-7581-0000-0000-000005E30836
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.100992
X-IBM-SpamModules-Versions: BY=3.00008495; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000249; SDB=6.00986578; UDB=6.00500696; IPR=6.00765937; 
 BA=6.00005819; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019436; XFM=3.00000015;
 UTC=2018-02-08 05:51:51
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-02-08 05:28:48 - 6.00008025
x-cbparentid: 18020805-7582-0000-0000-0000EDE31DEC
Message-Id: <OFFEC95981.9C8EC008-ON6525822E.001E809D-6525822E.00203659@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-08_02:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Feb 2018 05:51:58 -0000


--0__=EABB08BDDF8D060D8f9e8a93df938690918cEABB08BDDF8D060D
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



"openbmc" <openbmc-bounces+hramasub=3Din.ibm.com@lists.ozlabs.org> wrote on
02/08/2018 09:55:18 AM:

> From: Rolf Brudeseth <code@brudeseth.name>
> To: openbmc@lists.ozlabs.org
> Date: 02/08/2018 10:23 AM
> Subject: Re: Redfish on OpenBMC
> Sent by: "openbmc" <openbmc-bounces+hramasub=3Din.ibm.com@lists.ozlabs.or=
g>
>
> 5) Leverage existing open source projects:
> - Does the implementation compose existing services and frameworks ?
> Such as a webserver(say, nginx) and a rest framework (flask).
> In my testing, flask was a non-starter for performance on low end
> systems, and while reasonably performant when measured externally
> with response times, it consumed quite a
> bit of system CPU cycles for most tasks. Also, the startup time for
> python was suspect, and difficult to improve on without lots of
gymnastics.
> Hari>> I haven't evaluated flask and it's good to know the
> performance limitations with flask and python.
>
> regards,
> Hari !

> Are other language options besides Python an alternative, such as
> Golang? It has webserver and template functionality built-in so an
> additional framework may not be required.
>
> It is compiled so it should have better performance than Python.
> Cross-compiling to ARM is trivial.
>
> Rolf
There certainly is no precedence for golang based code in OpenBMC yet.
But that shouldn't stop us from exploring that. I believe Michael's
implementation is golang based as well.
Hari !

--0__=EABB08BDDF8D060D8f9e8a93df938690918cEABB08BDDF8D060D
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces=
+hramasub=3Din.ibm.com@lists.ozlabs.org&gt; wrote on 02/08/2018 09:55:18 AM=
:<br><br>&gt; From: Rolf Brudeseth &lt;code@brudeseth.name&gt;</font></tt><=
br><tt><font size=3D"2">&gt; To: openbmc@lists.ozlabs.org</font></tt><br><t=
t><font size=3D"2">&gt; Date: 02/08/2018 10:23 AM</font></tt><br><tt><font =
size=3D"2">&gt; Subject: Re: Redfish on OpenBMC</font></tt><br><tt><font si=
ze=3D"2">&gt; Sent by: &quot;openbmc&quot; &lt;openbmc-bounces+hramasub=3Di=
n.ibm.com@lists.ozlabs.org&gt;</font></tt><br><tt><font size=3D"2">&gt; <br=
>&gt; 5) Leverage existing open source projects:<br>&gt; - Does the impleme=
ntation compose existing services and frameworks ?<br>&gt; Such as a webser=
ver(say, nginx) and a rest framework (flask).</font></tt><br><tt><font size=
=3D"2">&gt; In my testing, flask was a non-starter for performance on low e=
nd <br>&gt; systems, and while reasonably performant when measured external=
ly <br>&gt; with response times, it consumed quite a</font></tt><br><tt><fo=
nt size=3D"2">&gt; bit of system CPU cycles for most tasks. Also, the start=
up time for <br>&gt; python was suspect, and difficult to improve on withou=
t lots of gymnastics.</font></tt><br><tt><font size=3D"2">&gt; Hari&gt;&gt;=
 I haven't evaluated flask and it's good to know the <br>&gt; performance l=
imitations with flask and python. <br>&gt; <br>&gt; regards,<br>&gt; Hari !=
<br></font></tt><br><tt><font size=3D"2">&gt; Are other language options be=
sides Python an alternative, such as <br>&gt; Golang? It has webserver and =
template functionality built-in so an <br>&gt; additional framework may not=
 be required.<br>&gt; <br>&gt; It is compiled so it should have better perf=
ormance than Python. <br>&gt; Cross-compiling to ARM is trivial.<br>&gt; <b=
r>&gt; Rolf<br>There certainly is no precedence for golang based code in Op=
enBMC yet.<br>But that shouldn't stop us from exploring that. I believe Mic=
hael's <br>implementation is golang based as well.</font></tt><br><tt><font=
 size=3D"2">Hari !</font></tt><BR>
</body></html>

--0__=EABB08BDDF8D060D8f9e8a93df938690918cEABB08BDDF8D060D--
