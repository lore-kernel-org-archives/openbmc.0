Return-Path: <austenc@us.ibm.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=austenc@us.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yxjWS2GxZzDrnK
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 03:56:03 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBDGs6N8041608
 for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2017 11:56:01 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2eu7kyhu02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2017 11:56:01 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 13 Dec 2017 16:56:00 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 13 Dec 2017 16:55:55 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2017121316555150-850314 ;
 Wed, 13 Dec 2017 16:55:51 +0000 
MIME-Version: 1.0
In-Reply-To: <80bcfede-6212-157b-e391-6e4bc526b339@ozlabs.org>
Subject: Re: IPMI LAN command story design - try 3rd send
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "openbmc"<openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>, Patrick
 Williams <patrick@stwcx.xyz>, tomjose <tomjose@linux.vnet.ibm.com>
From: "Chris Austen" <austenc@us.ibm.com>
Date: Wed, 13 Dec 2017 10:55:49 -0600
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
 <20161004145104.d5co7h25dakpcxyz@asimov>
 <TY1PR06MB0863CF900A7338954B8ED956F6D00@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com> <20161104141455.GE17105@heinlein.lan>
 <581CCA61.4010202@linux.vnet.ibm.com> <20161107035006.GB15757@heinlein.lan>
 <80bcfede-6212-157b-e391-6e4bc526b339@ozlabs.org>
X-KeepSent: 47B313F0:7CE6E67B-862581F5:005CC47E;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 17827
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0B66DFCF42EE8f9e8a93df938690918c09BB0B66DFCF42EE"
Content-Disposition: inline
x-cbid: 17121316-9717-0000-0000-0000051E4940
X-IBM-SpamModules-Scores: BY=0.11827; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.433748; ST=0; TS=0; UL=0; ISC=; MB=0.200672
X-IBM-SpamModules-Versions: BY=3.00008199; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00959691; UDB=6.00485376; IPR=6.00739712; 
 BA=6.00005740; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018523; XFM=3.00000015;
 UTC=2017-12-13 16:55:58
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-12-13 06:00:32 - 6.00007751
x-cbparentid: 17121316-9718-0000-0000-0000AA566374
Message-Id: <OF47B313F0.7CE6E67B-ON862581F5.005CC47E-862581F5.005D0095@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-13_08:, , signatures=0
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
X-List-Received-Date: Wed, 13 Dec 2017 16:56:04 -0000


--0__=09BB0B66DFCF42EE8f9e8a93df938690918c09BB0B66DFCF42EE
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

"openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org> wrote on
12/12/2017 09:08:01 PM:

> From: Jeremy Kerr <jk@ozlabs.org>
> To: Patrick Williams <patrick@stwcx.xyz>, tomjose
<tomjose@linux.vnet.ibm.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date: 12/12/2017 09:08 PM
> Subject: Re: IPMI LAN command story design - try 3rd send
> Sent by: "openbmc" <openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org>
>
> Hi all,
>
> Digging up an old thread here, but I think this is important:
>
> > Thanks for the explanation.  With this website you pointed to and some
> > other investigation I've done, I am comfortable with us using the 'Set
> > Channel Access' as the time to apply the settings.  The documentation
of
> > two competition products both seem to require an 'ipmitool mc reset
> > warm' for IP address changes to take effect, so we are at least better
> > than that.
>
> The two BMC implementations that I'm aware of do not require a mc reset
> for lan parameters to be applied. Both will apply settings without
> further commands. One will wait 10 seconds before applying settings, to
> allow multiple changes to be grouped into a single reconfiguration.
>
> Requiring non-standard command to be issued causes a disconnect between
> user expectations and our implementation. We'd have to document this
> difference in behaviour for every potential sysadmin interacting with
> OpenBMC.
>
> > Can you internally track down a contact on the xCAT team and verify
that
> > this will be ok with them?
>
> Not just xCAT, but every other provisioning software that will support
> OpenBMC. Including ones that are custom-developed. That's not feasible.
>
> For cases like this, we should really reconsider before coming up with
> our own special interface requirements.
>
> Regards,
>
>
> Jeremy
>

Would this make sense for this to become a topic for the OpenBMC
leadership?  I have to imagine all companies hit this issue.
Maybe even reach out to Mr Cory Minyard ?


--0__=09BB0B66DFCF42EE8f9e8a93df938690918c09BB0B66DFCF42EE
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces=
+austenc=3Dus.ibm.com@lists.ozlabs.org&gt; wrote on 12/12/2017 09:08:01 PM:=
<br><br>&gt; From: Jeremy Kerr &lt;jk@ozlabs.org&gt;</font></tt><br><tt><fo=
nt size=3D"2">&gt; To: Patrick Williams &lt;patrick@stwcx.xyz&gt;, tomjose =
&lt;tomjose@linux.vnet.ibm.com&gt;</font></tt><br><tt><font size=3D"2">&gt;=
 Cc: OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</font></tt><br><tt><=
font size=3D"2">&gt; Date: 12/12/2017 09:08 PM</font></tt><br><tt><font siz=
e=3D"2">&gt; Subject: Re: IPMI LAN command story design - try 3rd send</fon=
t></tt><br><tt><font size=3D"2">&gt; Sent by: &quot;openbmc&quot; &lt;openb=
mc-bounces+austenc=3Dus.ibm.com@lists.ozlabs.org&gt;</font></tt><br><tt><fo=
nt size=3D"2">&gt; <br>&gt; Hi all,<br>&gt; <br>&gt; Digging up an old thre=
ad here, but I think this is important:<br>&gt; <br>&gt; &gt; Thanks for th=
e explanation. &nbsp;With this website you pointed to and some<br>&gt; &gt;=
 other investigation I've done, I am comfortable with us using the 'Set<br>=
&gt; &gt; Channel Access' as the time to apply the settings. &nbsp;The docu=
mentation of<br>&gt; &gt; two competition products both seem to require an =
'ipmitool mc reset<br>&gt; &gt; warm' for IP address changes to take effect=
, so we are at least better<br>&gt; &gt; than that.<br>&gt; <br>&gt; The tw=
o BMC implementations that I'm aware of do not require a mc reset<br>&gt; f=
or lan parameters to be applied. Both will apply settings without<br>&gt; f=
urther commands. One will wait 10 seconds before applying settings, to<br>&=
gt; allow multiple changes to be grouped into a single reconfiguration.<br>=
&gt; <br>&gt; Requiring non-standard command to be issued causes a disconne=
ct between<br>&gt; user expectations and our implementation. We'd have to d=
ocument this<br>&gt; difference in behaviour for every potential sysadmin i=
nteracting with<br>&gt; OpenBMC.<br>&gt; <br>&gt; &gt; Can you internally t=
rack down a contact on the xCAT team and verify that<br>&gt; &gt; this will=
 be ok with them?<br>&gt; <br>&gt; Not just xCAT, but every other provision=
ing software that will support<br>&gt; OpenBMC. Including ones that are cus=
tom-developed. That's not feasible.<br>&gt; <br>&gt; For cases like this, w=
e should really reconsider before coming up with<br>&gt; our own special in=
terface requirements.<br>&gt; <br>&gt; Regards,<br>&gt; <br>&gt; <br>&gt; J=
eremy<br>&gt; <br></font></tt><br><font size=3D"2">Would this make sense fo=
r this to become a topic for the OpenBMC leadership?  I have to imagine all=
 companies hit this issue.  </font><br><tt><font size=3D"2">Maybe even reac=
h out to Mr Cory Minyard ?</font></tt><br><br><BR>
</body></html>

--0__=09BB0B66DFCF42EE8f9e8a93df938690918c09BB0B66DFCF42EE--
