Return-Path: <eajames@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vRzR03Y5MzDqCr
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 09:52:11 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1KMmbYR079887
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 17:52:09 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28r2w8yshe-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 17:52:08 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@us.ibm.com>;
 Mon, 20 Feb 2017 15:52:08 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 20 Feb 2017 15:52:06 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 30C9E19D8040
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:51:18 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1KMq5KX15925654
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:52:05 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D21C26A03F
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:52:05 -0700 (MST)
Received: from d50lp02.ny.us.ibm.com (unknown [146.89.104.208])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS id 957296A042
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:52:05 -0700 (MST)
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@us.ibm.com>;
 Mon, 20 Feb 2017 17:52:04 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Mon, 20 Feb 2017 17:52:02 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <eajames@us.ibm.com>;
 Mon, 20 Feb 2017 22:52:01 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 20 Feb 2017 22:51:58 -0000
Received: from us1a3-mail68.a3.dal09.isc4sb.com ([10.142.3.220])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2017022022515820-559722 ;
 Mon, 20 Feb 2017 22:51:58 +0000 
MIME-Version: 1.0
In-Reply-To: <OF7EE21505.D63A2F41-ON002580CD.007BE8A7-002580CD.007BE8AB@LocalDomain>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: Copy all data out
To: "Milton Miller II" <miltonm@us.ibm.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>, joel@jms.id.au,
 openbmc@lists.ozlabs.org
From: "Edward James" <eajames@us.ibm.com>
Date: Mon, 20 Feb 2017 16:51:56 -0600
References: <1487624750-7425-1-git-send-email-eajames@linux.vnet.ibm.com>
 <OF7EE21505.D63A2F41-ON002580CD.007BE8A7-002580CD.007BE8AB@LocalDomain>
X-KeepSent: 6F01190E:4BFD9247-002580CD:007D76F7;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP7 Octobe4, 2013
X-LLNOutbound: False
X-Disclaimed: 36147
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBB0A5EDFEEF0678f9e8a93df938690918c8FBB0A5EDFEEF067"
Content-Disposition: inline
x-cbid: 17022022-0016-0000-0000-00000639F89F
X-IBM-SpamModules-Scores: BY=0.02716; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.429909; ST=0; TS=0; UL=0; ISC=; MB=0.000036
X-IBM-SpamModules-Versions: BY=3.00006653; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00824733; UDB=6.00403749; IPR=6.00602186; 
 BA=6.00005158; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014364; XFM=3.00000011;
 UTC=2017-02-20 22:52:00
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-02-20 16:49:08 - 6.00006330
x-cbparentid: 17022022-7582-0000-0000-0000042A1ABD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006653; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00824732; UDB=6.00403749; IPR=6.00602187; 
 BA=6.00005158; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014364; XFM=3.00000011;
 UTC=2017-02-20 22:52:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF6F01190E.4BFD9247-ON002580CD.007D76F7-862580CD.007D9AFF@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-20_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702200210
X-Mailman-Approved-At: Tue, 21 Feb 2017 10:16:52 +1100
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
X-List-Received-Date: Mon, 20 Feb 2017 22:52:13 -0000


--0__=8FBB0A5EDFEEF0678f9e8a93df938690918c8FBB0A5EDFEEF067
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII



Milton Miller II/Austin/IBM wrote on 02/20/2017 04:33:24 PM:

> From: Milton Miller II/Austin/IBM
> To: Eddie James <eajames@linux.vnet.ibm.com>
> Cc: openbmc@lists.ozlabs.org, joel@jms.id.au, Edward
James/Austin/IBM@IBMUS
> Date: 02/20/2017 04:33 PM
> Subject: Re: [PATCH linux dev-4.7] drivers: fsi: Copy all data out
>
>
>
> -----"openbmc" <openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org>
> wrote: -----
> >From: Eddie James
> >Date: 02/20/2017 03:06PM
> >
> >From: "Edward A. James" <eajames@us.ibm.com>
> >
> >Driver was only copying 32 bits out to the user-provided data
> >pointer.
> >
> >Signed-off-by: Edward A. James <eajames@us.ibm.com>
> >---
> > drivers/fsi/fsi-master-gpio.c | 5 +++--
> > 1 file changed, 3 insertions(+), 2 deletions(-)
> >
> >diff --git a/drivers/fsi/fsi-master-gpio.c
> >b/drivers/fsi/fsi-master-gpio.c
> >index 3ed82ea..3eb6ec2 100644
> >--- a/drivers/fsi/fsi-master-gpio.c
> >+++ b/drivers/fsi/fsi-master-gpio.c
> >@@ -203,7 +203,7 @@ static void fsi=5Fmaster=5Fgpio=5Ferror(struct
> >fsi=5Fmaster=5Fgpio *master, int error)
> > static int poll=5Ffor=5Fresponse(struct fsi=5Fmaster=5Fgpio *master, ui=
nt8=5Ft
> >expected,
> >          uint8=5Ft size, void *data)
> > {
> >-   int busy=5Fcount =3D 0, i;
> >+   int busy=5Fcount =3D 0, i, j;
> >    struct fsi=5Fgpio=5Fmsg response, cmd;
> >    int bits=5Fremaining =3D 0, bit=5Fcount, response=5Fid, id;
> >    uint64=5Ft resp =3D 0;
> >@@ -274,7 +274,8 @@ static int poll=5Ffor=5Fresponse(struct
> >fsi=5Fmaster=5Fgpio *master, uint8=5Ft expected,
> >          resp <<=3D bits=5Fremaining;
> >          resp |=3D response.msg;
> >          bits=5Freceived +=3D bits=5Fremaining;
> >-         *((uint32=5Ft *)data) =3D response.msg;
> >+         for (j =3D 0; j < size; ++j)
> >+            ((uint8=5Ft *)data)[j] =3D ((uint8=5Ft *)&response.msg)[j];
>
> A lot of casting for memcpy(data, &response.msg, size);

Ugh, thanks. I was experimenting switching the byte order and didn't
switch it back to something sensible... v2 on the way.

Eddie

>
> >       }
> >
> >       crc=5Fin =3D fsi=5Fcrc4(0, resp | (0x1ULL << bits=5Freceived),
> >--
> >1.8.3.1
>
> milton

--0__=8FBB0A5EDFEEF0678f9e8a93df938690918c8FBB0A5EDFEEF067
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Milton Miller II/Austin/IBM wrote on 02/20/2017 04:33:24=
 PM:<br><br>&gt; From: Milton Miller II/Austin/IBM</tt><br><tt>&gt; To: Edd=
ie James &lt;eajames@linux.vnet.ibm.com&gt;</tt><br><tt>&gt; Cc: openbmc@li=
sts.ozlabs.org, joel@jms.id.au, Edward James/Austin/IBM@IBMUS</tt><br><tt>&=
gt; Date: 02/20/2017 04:33 PM</tt><br><tt>&gt; Subject: Re: [PATCH linux de=
v-4.7] drivers: fsi: Copy all data out</tt><br><tt>&gt; <br>&gt; <br>&gt; <=
br>&gt; -----&quot;openbmc&quot; &lt;openbmc-bounces+miltonm=3Dus.ibm.com@l=
ists.ozlabs.org&gt;<br>&gt; wrote: -----<br>&gt; &gt;From: Eddie James <br>=
&gt; &gt;Date: 02/20/2017 03:06PM<br>&gt; &gt;<br>&gt; &gt;From: &quot;Edwa=
rd A. James&quot; &lt;eajames@us.ibm.com&gt;<br>&gt; &gt;<br>&gt; &gt;Drive=
r was only copying 32 bits out to the user-provided data<br>&gt; &gt;pointe=
r.<br>&gt; &gt;<br>&gt; &gt;Signed-off-by: Edward A. James &lt;eajames@us.i=
bm.com&gt;<br>&gt; &gt;---<br>&gt; &gt; drivers/fsi/fsi-master-gpio.c | 5 +=
++--<br>&gt; &gt; 1 file changed, 3 insertions(+), 2 deletions(-)<br>&gt; &=
gt;<br>&gt; &gt;diff --git a/drivers/fsi/fsi-master-gpio.c<br>&gt; &gt;b/dr=
ivers/fsi/fsi-master-gpio.c<br>&gt; &gt;index 3ed82ea..3eb6ec2 100644<br>&g=
t; &gt;--- a/drivers/fsi/fsi-master-gpio.c<br>&gt; &gt;+++ b/drivers/fsi/fs=
i-master-gpio.c<br>&gt; &gt;@@ -203,7 +203,7 @@ static void fsi=5Fmaster=5F=
gpio=5Ferror(struct<br>&gt; &gt;fsi=5Fmaster=5Fgpio *master, int error)<br>=
&gt; &gt; static int poll=5Ffor=5Fresponse(struct fsi=5Fmaster=5Fgpio *mast=
er, uint8=5Ft<br>&gt; &gt;expected,<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;uint8=5Ft size, void *data)<br>&gt; &gt; {<br>&gt; &gt;- &nbsp; int=
 busy=5Fcount =3D 0, i;<br>&gt; &gt;+ &nbsp; int busy=5Fcount =3D 0, i, j;<=
br>&gt; &gt; &nbsp; &nbsp;struct fsi=5Fgpio=5Fmsg response, cmd;<br>&gt; &g=
t; &nbsp; &nbsp;int bits=5Fremaining =3D 0, bit=5Fcount, response=5Fid, id;=
<br>&gt; &gt; &nbsp; &nbsp;uint64=5Ft resp =3D 0;<br>&gt; &gt;@@ -274,7 +27=
4,8 @@ static int poll=5Ffor=5Fresponse(struct<br>&gt; &gt;fsi=5Fmaster=5Fg=
pio *master, uint8=5Ft expected,<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;resp &lt;&lt;=3D bits=5Fremaining;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;resp |=3D response.msg;<br>&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;bits=5Freceived +=3D bits=5Fremaining;<br>&gt; &gt;- &nbsp; &nbsp; =
&nbsp; &nbsp; *((uint32=5Ft *)data) =3D response.msg;<br>&gt; &gt;+ &nbsp; =
&nbsp; &nbsp; &nbsp; for (j =3D 0; j &lt; size; ++j)<br>&gt; &gt;+ &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;((uint8=5Ft *)data)[j] =3D ((uint8=5Ft *)&=
amp;response.msg)[j];<br>&gt; <br>&gt; A lot of casting for memcpy(data, &a=
mp;response.msg, size);</tt><br><br><tt>Ugh, thanks. I was experimenting sw=
itching the byte order and didn't</tt><br><tt>switch it back to something s=
ensible... v2 on the way.</tt><br><br><tt>Eddie</tt><br><tt><br>&gt; <br>&g=
t; &gt; &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; <br>&gt; &gt; &nbsp; &nbsp; &nb=
sp; crc=5Fin =3D fsi=5Fcrc4(0, resp | (0x1ULL &lt;&lt; bits=5Freceived),<br=
>&gt; &gt;-- <br>&gt; &gt;1.8.3.1<br>&gt; <br>&gt; milton</tt><BR>
</body></html>

--0__=8FBB0A5EDFEEF0678f9e8a93df938690918c8FBB0A5EDFEEF067--
