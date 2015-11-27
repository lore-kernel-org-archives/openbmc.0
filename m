Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 646211A03C9
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2015 18:14:57 +1100 (AEDT)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Fri, 27 Nov 2015 17:14:53 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 27 Nov 2015 17:14:51 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id B3ECB2BB0054
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2015 18:14:50 +1100 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tAR7EPHv32047208
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2015 18:14:33 +1100
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAR7EI8U005922
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2015 18:14:18 +1100
Received: from d50lp01.ny.us.ibm.com ([146.89.104.207])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tAR7EGg0004801
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 27 Nov 2015 18:14:17 +1100
Message-Id: <201511270714.tAR7EGg0004801@d23av04.au.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Fri, 27 Nov 2015 02:13:15 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 27 Nov 2015 02:13:13 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Fri, 27 Nov 2015 07:13:12 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 27 Nov 2015 07:13:09 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015112707141285-50920 ;
 Fri, 27 Nov 2015 07:14:12 +0000 
In-Reply-To: <CACPK8XekT4dCvLkfx4fxeE=DUAf=h_=9KX41zMkcCDYVPStcVg@mail.gmail.com>
Subject: Re: [PATCH openbmc] add occ hwmon driver as kernel patch
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, adamliyi <adamliyi@msn.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Fri, 27 Nov 2015 15:12:57 +0800
References: <1448383220-17822-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448383220-17822-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XekT4dCvLkfx4fxeE=DUAf=h_=9KX41zMkcCDYVPStcVg@mail.gmail.com>
X-KeepSent: 9A0C6D27:C008A97A-00257F0A:00233F82;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 44351
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBBF599DFB0B9128f9e8a93df938690918c8FBBF599DFB0B912"
Content-Disposition: inline
x-cbid: 15112707-0021-0000-0000-0000023DCFC2
X-IBM-ISS-SpamDetectors: Score=0.433748; BY=0.293718; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.433748; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004613; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000122; SDB=6.00623194; UDB=6.00277235; UTC=2015-11-27
 07:13:10
x-cbparentid: 15112707-0598-0000-0000-000005630B13
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
X-List-Received-Date: Fri, 27 Nov 2015 07:14:57 -0000


--0__=8FBBF599DFB0B9128f9e8a93df938690918c8FBBF599DFB0B912
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Hi Joel,

Thank you for the detailed comments. I made changes according to your
comments, with a few questions please see bellow.
I just sent out a pull request to openbmc/linux dev-4.3 branch:

https://github.com/openbmc/linux/pull/22/files

Please have a review.

Thanks,
-adam

"openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org> wrote on
11/25/2015 07:34:35 AM:

> From: Joel Stanley <joel@jms.id.au>
> To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> Cc: adamliyi <adamliyi@msn.com>, OpenBMC Maillist
<openbmc@lists.ozlabs.org>
> Date: 11/25/2015 07:35 AM
> Subject: Re: [PATCH openbmc] add occ hwmon driver as kernel patch
> Sent by: "openbmc" <openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org>
>
> Hello Adam,
>
> Thanks for posting your code.
>
> I've had a quick look and pointed out some style related changes that
> you can make. This is important in getting upstream to accept your
> patch, but also to make the code clear.
>
> Once you've made the fixes I suggest, try running your patch through
> scripts/checkpatch.pl in the Linux source tree. This will point out
> lines that do not confirm to the coding standards the kernel uses. Try
> to fix all of these warnings, and send an updated version of the
> patch.
>
> Next time you send the patch, send it as a PR to the kernel tree at
> https://github.com/openbmc/linux. This is easier than reading a
> patch-against-patch, and it's good practice for submitting the patch
> upstream.
>
> Please jump on the IRC channel at #openbmc on irc.freenode.net if you
> want do discuss any changes, or have any questions.
>
> Once you've fixed up the style issues, we will see what changes need
> to be made to the structure of the driver.
>
> Cheers,
>
> Joel
>
>
> > ++
> > ++typedef struct {
> > ++      char sensor=5Ftype[5];
>
> uint8=5Ft instead of a char?

Kernel code prefers uint8=5Ft than char? Any concerns with char?

>
> > ++
> > ++typedef struct {
> > ++      uint8=5Ft status;
> > ++      uint8=5Ft ext=5Fstatus;
> > ++      uint8=5Ft occs=5Fpresent;
> > ++      uint8=5Ft config;
> > ++      uint8=5Ft occ=5Fstate;
> > ++      uint8=5Ft reserved0;
> > ++      uint8=5Ft reserved1;
> > ++      uint8=5Ft error=5Flog=5Fid;
> > ++      uint32=5Ft error=5Flog=5Faddr=5Fstart;
> > ++      uint16=5Ft error=5Flog=5Flength;
> > ++      uint8=5Ft reserved2;
> > ++      uint8=5Ft reserved3;
> > ++      char occ=5Fcode=5Flevel[17];
>
> Code level is an IBM term. Perhaps call this version=5Fstring?
>

I changed it to version=5Fstring. But I checked the OCC document, the
document uses code=5Flevel.
I may need to change it back.

>
> > ++      address =3D address << 1;
> > ++
> > ++      ret =3D occ=5Fi2c=5Fwrite(client, address=5Fbuf, sizeof(address=
));
> > ++      /* FIXME: ast i2c driver does not read corret value */
> > ++      //if (ret !=3D sizeof(address))
> > ++      //      return -I2C=5FWRITE=5FERROR;
> > ++
> > ++      ret =3D occ=5Fi2c=5Fread(client, buf, sizeof(buf));
> > ++      //if (ret !=3D sizeof(buf))
> > ++      //      return -I2C=5FREAD=5FERROR;
>
> You've commented out the error handling here. Did you get to the
> bottom of why you're not getting the return value you're expecting
>

The aspeed i2c driver does not return the correct bytes number
sent/received when I was testing on Barreleye.
So I does not check the return value. I will fix it when the apseed-i2c
driver works ok.

>
>  strncpy(o->data.occ=5Fcode=5Flevel, d[21], 16)
>
> > ++      strncpy(&o->data.sensor=5Feye=5Fcatcher[0], (const char*)&d[37],
6);
> > ++      o->data.sensor=5Feye=5Fcatcher[6]=3D'\0';
>
> use strscpy which provdies the null termination for you.
>

strscpy is a new kernel API? I'd prefer strncpy just to be compatible with
older kernel.

> > ++      o->data.num=5Fof=5Fsensor=5Fblocks=3Dd[43];
> > ++      o->data.sensor=5Fdata=5Fversion =3D d[44];
> > ++
> > ++      if (strcmp(o->data.sensor=5Feye=5Fcatcher, "SENSOR") !=3D 0) {
> > ++              printk("ERROR: SENSOR not found at byte 37 (%s)
> \n",o->data.sensor=5Feye=5Fcatcher);
> > ++              return -1;
> > ++      }
> > ++
> > ++      if (o->data.num=5Fof=5Fsensor=5Fblocks =3D=3D 0) {
> > ++              printk("ERROR: SENSOR block num is 0\n");
> > ++              return -1;
> > ++      }
>
> Should these checks be before you parse the data?
>

What do you mean here?


--0__=8FBBF599DFB0B9128f9e8a93df938690918c8FBBF599DFB0B912
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Hi Joel,<br><br>Thank you for the detailed comments. I made =
changes according to your comments, with a few questions please see bellow.=
<br>I just sent out a pull request to openbmc/linux dev-4.3 branch:<br><br>=
<a href=3D"https://github.com/openbmc/linux/pull/22/files">https://github.c=
om/openbmc/linux/pull/22/files</a><br><br>Please have a review.<br><br>Than=
ks,<br>-adam<br><br><tt>&quot;openbmc&quot; &lt;openbmc-bounces+shliyi=3Dcn=
.ibm.com@lists.ozlabs.org&gt; wrote on 11/25/2015 07:34:35 AM:<br><br>&gt; =
From: Joel Stanley &lt;joel@jms.id.au&gt;</tt><br><tt>&gt; To: OpenBMC Patc=
hes &lt;openbmc-patches@stwcx.xyz&gt;</tt><br><tt>&gt; Cc: adamliyi &lt;ada=
mliyi@msn.com&gt;, OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</tt><b=
r><tt>&gt; Date: 11/25/2015 07:35 AM</tt><br><tt>&gt; Subject: Re: [PATCH o=
penbmc] add occ hwmon driver as kernel patch</tt><br><tt>&gt; Sent by: &quo=
t;openbmc&quot; &lt;openbmc-bounces+shliyi=3Dcn.ibm.com@lists.ozlabs.org&gt=
;</tt><br><tt>&gt; <br>&gt; Hello Adam,<br>&gt; <br>&gt; Thanks for posting=
 your code.<br>&gt; <br>&gt; I've had a quick look and pointed out some sty=
le related changes that<br>&gt; you can make. This is important in getting =
upstream to accept your<br>&gt; patch, but also to make the code clear.<br>=
&gt; <br>&gt; Once you've made the fixes I suggest, try running your patch =
through<br>&gt; scripts/checkpatch.pl in the Linux source tree. This will p=
oint out<br>&gt; lines that do not confirm to the coding standards the kern=
el uses. Try<br>&gt; to fix all of these warnings, and send an updated vers=
ion of the<br>&gt; patch.<br>&gt; <br>&gt; Next time you send the patch, se=
nd it as a PR to the kernel tree at<br>&gt; <a href=3D"https://github.com/o=
penbmc/linux">https://github.com/openbmc/linux</a>. This is easier than rea=
ding a<br>&gt; patch-against-patch, and it's good practice for submitting t=
he patch<br>&gt; upstream.<br>&gt; <br>&gt; Please jump on the IRC channel =
at #openbmc on irc.freenode.net if you<br>&gt; want do discuss any changes,=
 or have any questions.<br>&gt; <br>&gt; Once you've fixed up the style iss=
ues, we will see what changes need<br>&gt; to be made to the structure of t=
he driver.<br>&gt; <br>&gt; Cheers,<br>&gt; <br>&gt; Joel<br>&gt; <br>&gt; =
<br>&gt; &gt; ++<br>&gt; &gt; ++typedef struct {<br>&gt; &gt; ++ &nbsp; &nb=
sp; &nbsp;char sensor=5Ftype[5];<br>&gt; <br>&gt; uint8=5Ft instead of a ch=
ar?</tt><br><br><tt>Kernel code prefers uint8=5Ft than char? Any concerns w=
ith char?</tt><br><tt><br>&gt; <br>&gt; &gt; ++<br>&gt; &gt; ++typedef stru=
ct {<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft status;<br>&gt; &gt; ++ =
&nbsp; &nbsp; &nbsp;uint8=5Ft ext=5Fstatus;<br>&gt; &gt; ++ &nbsp; &nbsp; &=
nbsp;uint8=5Ft occs=5Fpresent;<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;uint8=5F=
t config;<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft occ=5Fstate;<br>&gt=
; &gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft reserved0;<br>&gt; &gt; ++ &nbsp; &=
nbsp; &nbsp;uint8=5Ft reserved1;<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;uint8=
=5Ft error=5Flog=5Fid;<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;uint32=5Ft error=
=5Flog=5Faddr=5Fstart;<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;uint16=5Ft error=
=5Flog=5Flength;<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft reserved2;<b=
r>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;uint8=5Ft reserved3;<br>&gt; &gt; ++ &nb=
sp; &nbsp; &nbsp;char occ=5Fcode=5Flevel[17];<br>&gt; <br>&gt; Code level i=
s an IBM term. Perhaps call this version=5Fstring?<br>&gt;</tt><br><br><tt>=
I changed it to version=5Fstring. But I checked the OCC document, the docum=
ent uses code=5Flevel.</tt><br><tt>I may need to change it back.</tt><br><t=
t>&nbsp;<br>&gt; <br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;address =3D address &=
lt;&lt; 1;<br>&gt; &gt; ++<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;ret =3D occ=
=5Fi2c=5Fwrite(client, address=5Fbuf, sizeof(address));<br>&gt; &gt; ++ &nb=
sp; &nbsp; &nbsp;/* FIXME: ast i2c driver does not read corret value */<br>=
&gt; &gt; ++ &nbsp; &nbsp; &nbsp;//if (ret !=3D sizeof(address))<br>&gt; &g=
t; ++ &nbsp; &nbsp; &nbsp;// &nbsp; &nbsp; &nbsp;return -I2C=5FWRITE=5FERRO=
R;<br>&gt; &gt; ++<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;ret =3D occ=5Fi2c=5F=
read(client, buf, sizeof(buf));<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;//if (r=
et !=3D sizeof(buf))<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;// &nbsp; &nbsp; &=
nbsp;return -I2C=5FREAD=5FERROR;<br>&gt; <br>&gt; You've commented out the =
error handling here. Did you get to the<br>&gt; bottom of why you're not ge=
tting the return value you're expecting<br>&gt;</tt><br><br><tt>The aspeed =
i2c driver does not return the correct bytes number sent/received when I wa=
s testing on Barreleye.</tt><br><tt>So I does not check the return value. I=
 will fix it when the apseed-i2c driver works ok.</tt><br><tt>&nbsp;<br>&gt=
; <br>&gt; &nbsp;strncpy(o-&gt;data.occ=5Fcode=5Flevel, d[21], 16)<br>&gt; =
<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;strncpy(&amp;o-&gt;data.sensor=5Feye=
=5Fcatcher[0], (const char*)&amp;d[37], 6);<br>&gt; &gt; ++ &nbsp; &nbsp; &=
nbsp;o-&gt;data.sensor=5Feye=5Fcatcher[6]=3D'\0';<br>&gt; <br>&gt; use strs=
cpy which provdies the null termination for you.<br>&gt; </tt><br><br><tt>s=
trscpy is a new kernel API? I'd prefer strncpy just to be compatible with o=
lder kernel.</tt><br><tt><br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;o-&gt;data.nu=
m=5Fof=5Fsensor=5Fblocks=3Dd[43];<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;o-&gt=
;data.sensor=5Fdata=5Fversion =3D d[44];<br>&gt; &gt; ++<br>&gt; &gt; ++ &n=
bsp; &nbsp; &nbsp;if (strcmp(o-&gt;data.sensor=5Feye=5Fcatcher, &quot;SENSO=
R&quot;) !=3D 0) {<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;printk(&quot;ERROR: SENSOR not found at byte 37 (%s)<br>&gt; \n&quo=
t;,o-&gt;data.sensor=5Feye=5Fcatcher);<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;return -1;<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;=
}<br>&gt; &gt; ++<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;if (o-&gt;data.num=5F=
of=5Fsensor=5Fblocks =3D=3D 0) {<br>&gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;printk(&quot;ERROR: SENSOR block num is 0\n&quot;);<b=
r>&gt; &gt; ++ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return -1;<b=
r>&gt; &gt; ++ &nbsp; &nbsp; &nbsp;}<br>&gt; <br>&gt; Should these checks b=
e before you parse the data?<br>&gt;</tt><br><br><tt>What do you mean here?=
</tt><br><tt>&nbsp;<br></tt><BR>
</body></html>

--0__=8FBBF599DFB0B9128f9e8a93df938690918c8FBBF599DFB0B912--
