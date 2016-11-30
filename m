Return-Path: <shliyi@cn.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tT5zs4DY2zDqVC
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 14:50:48 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uAU3n30d120688
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 22:50:46 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 271k1589rg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2016 22:50:46 -0500
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 30 Nov 2016 13:50:44 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 30 Nov 2016 13:50:41 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 8753C2BB0055
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 14:50:40 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uAU3oeFE54526202
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 14:50:40 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uAU3oeIO025959
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 14:50:40 +1100
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uAU3ocXQ025820
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 14:50:39 +1100
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Tue, 29 Nov 2016 20:50:38 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Tue, 29 Nov 2016 20:50:35 -0700
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Wed, 30 Nov 2016 03:50:34 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 30 Nov 2016 03:50:32 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2016113003503100-364032 ;
 Wed, 30 Nov 2016 03:50:31 +0000 
MIME-Version: 1.0
In-Reply-To: <1480460588-28589-1-git-send-email-eajames.ibm@gmail.com>
Subject: Re: [RFC PATCH linux v6 2/9] hwmon: Add core On-Chip Controller
 support for POWER CPUs
To: eajames.ibm@gmail.com
Cc: openbmc@lists.ozlabs.org, andrew@aj.id.au, "Edward A. James"
 <eajames@us.ibm.com>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Wed, 30 Nov 2016 11:50:29 +0800
References: <1480460588-28589-1-git-send-email-eajames.ibm@gmail.com>
X-KeepSent: 325984B1:9939C9A2-4825807B:001350B8;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 31783
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=C7BB0AE8DF80D6288f9e8a93df938690918cC7BB0AE8DF80D628"
Content-Disposition: inline
x-cbid: 16113003-0044-0000-0000-0000020A8231
X-IBM-ISS-SpamDetectors: Score=0.4332; BY=0.291692; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.4332; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00006166; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000193; SDB=6.00787171; UDB=6.00380741; UTC=2016-11-30
 03:50:33
x-cbparentid: 16113003-9952-0000-0000-0000023A80F3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF325984B1.9939C9A2-ON4825807B.001350B8-4825807B.00151A1B@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-29_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611300061
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
X-List-Received-Date: Wed, 30 Nov 2016 03:50:50 -0000


--0__=C7BB0AE8DF80D6288f9e8a93df938690918cC7BB0AE8DF80D628
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Hi Edward,

I was concerned with bellow piece of code when writing P8 occ driver.
Referring to occ spec:
https://github.com/open-power/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=5FInt=
erfaces.pdf
Section: 1.6.2 OCC Command/Response Sequence and Appendix A: Return codes.

OCC responds a command with different return code. Currently, the occ
driver regards any return code
other than 0x0 (Succeed) as error. But we may need to handle occ return
code properly,
e.g: for 0xFF (command in progress), we might not regard it as an error.

> +
> +static u8 occ=5Fsend=5Fcmd(struct occ *driver, u8 seq, u8 type, u16 leng=
th,
> +             u8 *data, u8 *resp)
> +{
> +   u32 cmd1, cmd2;
> +   u16 checksum;
> +   int i;
> +
> +   length =3D cpu=5Fto=5Fle16(length);
> +   cmd1 =3D (seq << 24) | (type << 16) | length;
> +   memcpy(&cmd2, data, length);
> +   cmd2 <<=3D ((4 - length) * 8);
> +
> +   /* checksum: sum of every bytes of cmd1, cmd2 */
> +   checksum =3D 0;
> +   for (i =3D 0; i < 4; i++)
> +      checksum +=3D (cmd1 >> (i * 8)) & 0xFF;
> +   for (i =3D 0; i < 4; i++)
> +      checksum +=3D (cmd2 >> (i * 8)) & 0xFF;
> +   cmd2 |=3D checksum << ((2 - length) * 8);
> +
> +   /* Init OCB */
> +   driver->bus=5Fops.putscom(driver->bus, OCB=5FSTATUS=5FCONTROL=5FOR,
0x08000000,
> +            0x00000000);
> +   driver->bus=5Fops.putscom(driver->bus, OCB=5FSTATUS=5FCONTROL=5FAND,
> +            0xFBFFFFFF, 0xFFFFFFFF);
> +
> +   /* Send command */
> +   driver->bus=5Fops.putscom(driver->bus, OCB=5FADDRESS,
> +            driver->config.command=5Faddr, 0x00000000);
> +   driver->bus=5Fops.putscom(driver->bus, OCB=5FADDRESS,
> +            driver->config.command=5Faddr, 0x00000000);
> +   driver->bus=5Fops.putscom(driver->bus, OCB=5FDATA, cmd1, cmd2);
> +
> +   /* Trigger attention */
> +   driver->bus=5Fops.putscom(driver->bus, ATTN=5FDATA, 0x01010000,
> +            0x00000000);
> +
> +   /* Get response data */
> +   driver->bus=5Fops.putscom(driver->bus, OCB=5FADDRESS,
> +            driver->config.response=5Faddr, 0x00000000);
> +   driver->bus=5Fops.getscom(driver->bus, OCB=5FDATA, resp, 0);
> +
> +   /* return status */
> +   return resp[2];
> +}
> +

Thanks,
-Yi

--0__=C7BB0AE8DF80D6288f9e8a93df938690918cC7BB0AE8DF80D628
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Hi Edward,</tt><br><br><tt>I was concerned with bellow p=
iece of code when writing P8 occ driver.</tt><br><tt>Referring to occ spec:=
 </tt><a href=3D"https://github.com/open-power/docs/blob/master/occ/OCC=5FO=
penPwr=5FFW=5FInterfaces.pdf"><tt>https://github.com/open-power/docs/blob/m=
aster/occ/OCC=5FOpenPwr=5FFW=5FInterfaces.pdf</tt></a><br><tt>Section: </tt=
><tt>1.6.2 OCC Command/Response Sequence and Appendix A: Return codes.</tt>=
<br><br><tt>OCC responds a command with different return code. Currently, t=
he occ driver regards any return code</tt><br><tt>other than 0x0 (Succeed) =
as error. But we may need to handle occ return code properly,</tt><br><tt>e=
.g: for 0xFF (command in progress), we might not regard it as an error.</tt=
><br><tt><br>&gt; +<br>&gt; +static u8 occ=5Fsend=5Fcmd(struct occ *driver,=
 u8 seq, u8 type, u16 length,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; u8 *data, u8 *resp)<br>&gt; +{<br>&gt; + &nbsp; u32 cmd1, cmd2;<br>&=
gt; + &nbsp; u16 checksum;<br>&gt; + &nbsp; int i;<br>&gt; +<br>&gt; + &nbs=
p; length =3D cpu=5Fto=5Fle16(length);<br>&gt; + &nbsp; cmd1 =3D (seq &lt;&=
lt; 24) | (type &lt;&lt; 16) | length;<br>&gt; + &nbsp; memcpy(&amp;cmd2, d=
ata, length);<br>&gt; + &nbsp; cmd2 &lt;&lt;=3D ((4 - length) * 8);<br>&gt;=
 +<br>&gt; + &nbsp; /* checksum: sum of every bytes of cmd1, cmd2 */<br>&gt=
; + &nbsp; checksum =3D 0;<br>&gt; + &nbsp; for (i =3D 0; i &lt; 4; i++)<br=
>&gt; + &nbsp; &nbsp; &nbsp;checksum +=3D (cmd1 &gt;&gt; (i * 8)) &amp; 0xF=
F;<br>&gt; + &nbsp; for (i =3D 0; i &lt; 4; i++)<br>&gt; + &nbsp; &nbsp; &n=
bsp;checksum +=3D (cmd2 &gt;&gt; (i * 8)) &amp; 0xFF;<br>&gt; + &nbsp; cmd2=
 |=3D checksum &lt;&lt; ((2 - length) * 8);<br>&gt; +<br>&gt; + &nbsp; /* I=
nit OCB */<br>&gt; + &nbsp; driver-&gt;bus=5Fops.putscom(driver-&gt;bus, OC=
B=5FSTATUS=5FCONTROL=5FOR, 0x08000000,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;0x00000000);<br>&gt; + &nbsp; driver-&gt;bus=5Fops.putscom(d=
river-&gt;bus, OCB=5FSTATUS=5FCONTROL=5FAND,<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;0xFBFFFFFF, 0xFFFFFFFF);<br>&gt; +<br>&gt; + &nbsp; /*=
 Send command */<br>&gt; + &nbsp; driver-&gt;bus=5Fops.putscom(driver-&gt;b=
us, OCB=5FADDRESS,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;drive=
r-&gt;config.command=5Faddr, 0x00000000);<br>&gt; + &nbsp; driver-&gt;bus=
=5Fops.putscom(driver-&gt;bus, OCB=5FADDRESS,<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;driver-&gt;config.command=5Faddr, 0x00000000);<br>&gt=
; + &nbsp; driver-&gt;bus=5Fops.putscom(driver-&gt;bus, OCB=5FDATA, cmd1, c=
md2);<br>&gt; +<br>&gt; + &nbsp; /* Trigger attention */<br>&gt; + &nbsp; d=
river-&gt;bus=5Fops.putscom(driver-&gt;bus, ATTN=5FDATA, 0x01010000,<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x00000000);<br>&gt; +<br>&gt;=
 + &nbsp; /* Get response data */<br>&gt; + &nbsp; driver-&gt;bus=5Fops.put=
scom(driver-&gt;bus, OCB=5FADDRESS,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;driver-&gt;config.response=5Faddr, 0x00000000);<br>&gt; + &nbsp=
; driver-&gt;bus=5Fops.getscom(driver-&gt;bus, OCB=5FDATA, resp, 0);<br>&gt=
; +<br>&gt; + &nbsp; /* return status */<br>&gt; + &nbsp; return resp[2];<b=
r>&gt; +}<br>&gt; +<br></tt><br><tt>Thanks,</tt><br><tt>-Yi</tt><BR>
</body></html>

--0__=C7BB0AE8DF80D6288f9e8a93df938690918cC7BB0AE8DF80D628--
