Return-Path: <shliyi@cn.ibm.com>
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E91D61A00E9
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2016 19:30:14 +1100 (AEDT)
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Tue, 5 Jan 2016 18:30:13 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 5 Jan 2016 18:30:11 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shliyi@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 5D7A82BB0057
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2016 19:30:11 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u058U36934734200
 for <openbmc@lists.ozlabs.org>; Tue, 5 Jan 2016 19:30:11 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u058Tcc0025256
 for <openbmc@lists.ozlabs.org>; Tue, 5 Jan 2016 19:29:38 +1100
Received: from d50lp02.ny.us.ibm.com ([146.89.104.208])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u058TamO024023
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 5 Jan 2016 19:29:38 +1100
Message-Id: <201601050829.u058TamO024023@d23av01.au.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Tue, 5 Jan 2016 03:28:42 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 5 Jan 2016 03:28:40 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shliyi@cn.ibm.com>;
 Tue, 5 Jan 2016 08:28:37 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 5 Jan 2016 08:28:34 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016010508290327-74054 ;
 Tue, 5 Jan 2016 08:29:03 +0000 
In-Reply-To: <CACPK8XcUA=4m7QH1QL0eRaupRPevQtm9VeMCwoR1GdVam6JJfQ@mail.gmail.com>
Subject: Re: [PATCH occ hwmon v3] Add OCC hwmon driver to Kernel
To: Joel Stanley <joel@jms.id.au>
Cc: Yi Li <adamliyi@msn.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jeremy Kerr <jk@ozlabs.org>
From: "Yi TZ Li" <shliyi@cn.ibm.com>
Date: Tue, 5 Jan 2016 16:28:26 +0800
References: <BLU436-SMTP1997C66B56E367DA0D3E402D9080@phx.gbl>
 <CACPK8XcUA=4m7QH1QL0eRaupRPevQtm9VeMCwoR1GdVam6JJfQ@mail.gmail.com>
X-KeepSent: EEF9689A:0F7422FF-00257F2E:00333F58;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 2203
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBBF5BDDFA0B9C88f9e8a93df938690918c8FBBF5BDDFA0B9C8"
Content-Disposition: inline
x-cbid: 16010508-0013-0000-0000-0000027A078D
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0.293258; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004757; HX=3.00000237; KW=3.00000007;
 PH=3.00000004; SC=3.00000130; SDB=6.00640766; UDB=6.00288357; UTC=2016-01-05
 08:28:35
x-cbparentid: 16010508-0598-0000-0000-000005D81F74
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
X-List-Received-Date: Tue, 05 Jan 2016 08:30:15 -0000


--0__=8FBBF5BDDFA0B9C88f9e8a93df938690918c8FBBF5BDDFA0B9C8
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Hi Joel,

Thanks many for your time to review the driver.

I re-submitted to patch, fixed most of the issues you pointed out, except a
few showed bellow.
Please see my reply bellow for details:

joel.stan@gmail.com wrote on 12/10/2015 12:02:19 PM:

> From: Joel Stanley <joel@jms.id.au>
> To: Yi Li <adamliyi@msn.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr
> <jk@ozlabs.org>, Yi TZ Li/China/IBM@IBMCN
> Date: 12/10/2015 12:03 PM
> Subject: Re: [PATCH occ hwmon v3] Add OCC hwmon driver to Kernel
> Sent by: joel.stan@gmail.com
>
> Hello Adam,
>
> On Tue, Dec 8, 2015 at 6:59 PM, Yi Li <adamliyi@msn.com> wrote:
> > The default patch triggered by git pull request is hard to read.
> > I resend a clean patch to the list. Please review.
>
> Thanks! This is the preferred method for reviewing code. Even better
> would be if you used git format-patch to create the email, that way we
> can review your commit message as well.
>
> Before you submit next, please run your patch through
> scripts/checkpatch.pl in the kernel tree and fix all of the errors and
> warnings. It will warn you about common style and syntax mistakes.
>
> ./scripts/checkpatch.pl -f drivers/hwmon/occ=5Fi2c.c
>
> [...]
>
> total: 24 errors, 21 warnings, 1315 lines checked

I run the checkpatch.pl against the new patch, here are the result:

scripts/checkpatch.pl occ=5Fv4.patch
WARNING: DT compatible string "ibm,occ-i2c" appears un-documented --
check ./Documentation/devicetree/bindings/
#11: FILE: arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts:30:
+                                               compatible =3D "ibm,occ-i2c=
";

WARNING: DT compatible string "ibm,occ-i2c" appears un-documented --
check ./Documentation/devicetree/bindings/
#15: FILE: arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts:34:
+                                               compatible =3D "ibm,occ-i2c=
";

WARNING: DT compatible string "ibm,occ-i2c" appears un-documented --
check ./Documentation/devicetree/bindings/
#33: FILE: arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts:35:
+                                               compatible =3D "ibm,occ-i2c=
";

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#74:
new file mode 100644

WARNING: line over 80 characters
#127: FILE: drivers/hwmon/occ=5Fi2c.c:49:
+ *
https://github.com/open-power/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=5FInt=
erfaces.pdf

WARNING: line over 80 characters
#420: FILE: drivers/hwmon/occ=5Fi2c.c:342:
+ *
https://github.com/open-power/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=5FInt=
erfaces.pdf

WARNING: DT compatible string "ibm,occ-i2c" appears un-documented --
check ./Documentation/devicetree/bindings/
#1389: FILE: drivers/hwmon/occ=5Fi2c.c:1311:
+       {.compatible =3D "ibm,occ-i2c"},

ERROR: Missing Signed-off-by: line(s)

total: 1 errors, 7 warnings, 1391 lines checked

occ=5Fv4.patch has style problems, please review.

1) For  "DT compatible" warnings, I am not sure whether it is necessary,
since I run "scripts/checkpatch.pl -f
arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts",
it will report many warnings. I can add a description if necessary.

2) for "line over 80" warnings, it would break the link if wrap at 80
characters.

> > +
> > +/* To generate attn to OCC */
> > +#define ATTN=5FDATA      0x0006B035
> > +/* For BMC to read/write SRAM */
> > +#define OCB=5FADDRESS            0x0006B070
> > +#define OCB=5FDATA               0x0006B075
> > +#define OCB=5FSTATUS=5FCONTROL=5FAND 0x0006B072
> > +#define OCB=5FSTATUS=5FCONTROL=5FOR  0x0006B073
> > +#define OCC=5FCOMMAND=5FADDR       0xFFFF6000
> > +#define OCC=5FRESPONSE=5FADDR      0xFFFF7000
>
> Are these addresses going to change with different versions of the
> OCC firmware?
>

Actually I did not find the document for most of the addresses. I copied
them from Alvin's OCC code.
If anyone know the source (possibly from OCC firmware developers), please
help.
The only OCC document I can find is:
https://github.com/open-power/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=5FInt=
erfaces.pdf
It defines OCC=5FCOMMAND=5FADDR and OCC=5FRESPONSE=5FADDR only.

>
> > +
> > +       if (!p)
> > +               return;
>
> It's common in kernel code to omit checking for null arguments.
>
> If you think there is a likely hood of this happening, then perhaps
> WARN=5FON(!b) would be better; this way we get a backtrace in the kernel
> log.
>

The deinit=5Focc=5Fresp=5Fbuf() function is supposed to be called in multip=
le
situation.
E.g, error handling code in a function. In those case, pointer might be
NULL.
So WARN=5FON() is not expected in that case.


> > +
> > +       if (!p->blocks)
> > +               return;
> > +
> > +       for (b =3D 0; b < p->header.sensor=5Fblock=5Fnum; b++) {
> > +               if (p->blocks[b].sensor)
> > +                       kfree(p->blocks[b].sensor);
> > +               if (p->blocks[b].power)
> > +                       kfree(p->blocks[b].power);
> > +               if (p->blocks[b].caps)
> > +                       kfree(p->blocks[b].caps);
> > +       }
>
> I think Jeremy suggested in his review that you statically allocate
> these instead of kmalloc and kfreeing at runtime.
>

The OCC sensor type and sensor number will change depending on whether OCC
is master or slave.
Also there is possible of bad cores and the number of sensors may change.
So using dynamically allocated sensor block is nature I think.
It is possible that the driver allocates a block of memory and manage
itself.
But looks there is no great benefit.

> > +{
> > +       int b;
> > +       int s;
> > +       int ret;
> > +       int dnum =3D SENSOR=5FBLOCK=5FOFFSET;
> > +       struct occ=5Fsensor *f=5Fsensor;
> > +       struct occ=5Fsensor *t=5Fsensor;
> > +       struct power=5Fsensor *p=5Fsensor;
> > +       struct caps=5Fsensor *c=5Fsensor;
> > +       uint8=5Ft sensor=5Fblock=5Fnum;
> > +       uint8=5Ft sensor=5Ftype[4];
> > +       uint8=5Ft sensor=5Fformat;
> > +       uint8=5Ft sensor=5Flength;
> > +       uint8=5Ft num=5Fof=5Fsensors;
> > +
> > +       /* check if the data is valid */
> > +       if (strncmp(&d[SENSOR=5FSTR=5FOFFSET], "SENSOR", 6) !=3D 0) {
>
> If you have a literal string you don't need to use strncmp.
>

"d[SENSOR=5FSTR=5FOFFSET]" does not have '\0' to terminate a string. So hav=
e to
use strncmp.


>
> > +                               p=5Fsensor->accumulator =3D
> > +                                       (d[dnum+6] << 24) | (d
> [dnum+7] << 16) |
> > +                                       (d[dnum+8] << 8) | d[dnum+9];
> > +                               p=5Fsensor->value =3D
> > +                                       (d[dnum+10] << 8) | d[dnum+11];
> > +
> > +                               dev=5Fdbg(&client->dev,
> > +                                       "sensor[%d]-[%d]: id: %u,
> value: %u\n",
> > +                                       b, s, p=5Fsensor->sensor=5Fid,
> > +                                       p=5Fsensor->value);
> > +
> > +                               dnum =3D dnum + sensor=5Flength;
> > +                       }
> > +               } else if (strncmp(sensor=5Ftype, "CAPS", 4) =3D=3D 0) {
>
> If you have a literal string you don't need to use strncmp.

"sensor=5Ftype" has no '\0' to terminate it. strncmp() is necessary.


> > +               val =3D -1;
> > +       else
> > +               /* in millidegree Celsius */
> > +               val =3D sensor[n].value * 1000;
> > +
> > +       return sprintf(buf, "%d\n", val);
>
> How do you know "%d\n" will fit into buf?

Do you mean using snprintf()? After reading the man page:
"Because  sprintf()  and vsprintf() assume an arbitrarily long string,
callers must be careful not to overflow the actual space; this
       is often impossible to assure.  Note that the length of the strings
produced is locale-dependent  and  difficult  to  predict.   Use
       snprintf() and vsnprintf() instead (or asprintf(3) and vasprintf
(3))."

snprintf() seems more safe, but we can find a lot of "sprintf()" in sysfs
show* functions in drivers/hwmon/. Looks to me not a big issue.
Anyway, I will change to snprintf() to be safer:
I use the same code as driver/hwmon/lm95241.c

"        return snprintf(buf, PAGE=5FSIZE - 1,
                        data->config & to=5Fsensor=5Fdev=5Fattr(attr)->inde=
x ?
                        "127000\n" : "255000\n");
"

Thanks,
-adam



--0__=8FBBF5BDDFA0B9C88f9e8a93df938690918c8FBBF5BDDFA0B9C8
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Hi Joel,</tt><br><br><tt>Thanks many for your time to re=
view the driver.</tt><br><br><tt>I re-submitted to patch, fixed most of the=
 issues you pointed out, except a few showed bellow.</tt><br><tt>Please see=
 my reply bellow for details:</tt><br><br><tt>joel.stan@gmail.com wrote on =
12/10/2015 12:02:19 PM:<br><br>&gt; From: Joel Stanley &lt;joel@jms.id.au&g=
t;</tt><br><tt>&gt; To: Yi Li &lt;adamliyi@msn.com&gt;</tt><br><tt>&gt; Cc:=
 OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;, Jeremy Kerr <br>&gt; &l=
t;jk@ozlabs.org&gt;, Yi TZ Li/China/IBM@IBMCN</tt><br><tt>&gt; Date: 12/10/=
2015 12:03 PM</tt><br><tt>&gt; Subject: Re: [PATCH occ hwmon v3] Add OCC hw=
mon driver to Kernel</tt><br><tt>&gt; Sent by: joel.stan@gmail.com</tt><br>=
<tt>&gt; <br>&gt; Hello Adam,<br>&gt; <br>&gt; On Tue, Dec 8, 2015 at 6:59 =
PM, Yi Li &lt;adamliyi@msn.com&gt; wrote:<br>&gt; &gt; The default patch tr=
iggered by git pull request is hard to read.<br>&gt; &gt; I resend a clean =
patch to the list. Please review.<br>&gt; <br>&gt; Thanks! This is the pref=
erred method for reviewing code. Even better<br>&gt; would be if you used g=
it format-patch to create the email, that way we<br>&gt; can review your co=
mmit message as well.<br>&gt; <br>&gt; Before you submit next, please run y=
our patch through<br>&gt; scripts/checkpatch.pl in the kernel tree and fix =
all of the errors and<br>&gt; warnings. It will warn you about common style=
 and syntax mistakes.<br>&gt; <br>&gt; ./scripts/checkpatch.pl -f drivers/h=
wmon/occ=5Fi2c.c<br>&gt; <br>&gt; [...]<br>&gt; <br>&gt; total: 24 errors, =
21 warnings, 1315 lines checked<br></tt><br><tt>I run the checkpatch.pl aga=
inst the new patch, here are the result:</tt><br><br><tt>scripts/checkpatch=
.pl occ=5Fv4.patch</tt><br><tt>WARNING: DT compatible string &quot;ibm,occ-=
i2c&quot; appears un-documented -- check ./Documentation/devicetree/binding=
s/</tt><br><tt>#11: FILE: arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts:30=
:</tt><br><tt>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; compatible =3D &quot;ibm,occ-i2c&quot;;</tt><br>=
<br><tt>WARNING: DT compatible string &quot;ibm,occ-i2c&quot; appears un-do=
cumented -- check ./Documentation/devicetree/bindings/</tt><br><tt>#15: FIL=
E: arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts:34:</tt><br><tt>+ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; compatible =3D &quot;ibm,occ-i2c&quot;;</tt><br><br><tt>WARNING: DT com=
patible string &quot;ibm,occ-i2c&quot; appears un-documented -- check ./Doc=
umentation/devicetree/bindings/</tt><br><tt>#33: FILE: arch/arm/boot/dts/as=
peed-bmc-opp-palmetto.dts:35:</tt><br><tt>+ &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compatible =3D &quot=
;ibm,occ-i2c&quot;;</tt><br><br><tt>WARNING: added, moved or deleted file(s=
), does MAINTAINERS need updating?</tt><br><tt>#74:</tt><br><tt>new file mo=
de 100644</tt><br><br><tt>WARNING: line over 80 characters</tt><br><tt>#127=
: FILE: drivers/hwmon/occ=5Fi2c.c:49:</tt><br><tt>+ * </tt><a href=3D"https=
://github.com/open-power/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=5FInterfac=
es.pdf"><tt>https://github.com/open-power/docs/blob/master/occ/OCC=5FOpenPw=
r=5FFW=5FInterfaces.pdf</tt></a><br><br><tt>WARNING: line over 80 character=
s</tt><br><tt>#420: FILE: drivers/hwmon/occ=5Fi2c.c:342:</tt><br><tt>+ * </=
tt><a href=3D"https://github.com/open-power/docs/blob/master/occ/OCC=5FOpen=
Pwr=5FFW=5FInterfaces.pdf"><tt>https://github.com/open-power/docs/blob/mast=
er/occ/OCC=5FOpenPwr=5FFW=5FInterfaces.pdf</tt></a><br><br><tt>WARNING: DT =
compatible string &quot;ibm,occ-i2c&quot; appears un-documented -- check ./=
Documentation/devicetree/bindings/</tt><br><tt>#1389: FILE: drivers/hwmon/o=
cc=5Fi2c.c:1311:</tt><br><tt>+ &nbsp; &nbsp; &nbsp; {.compatible =3D &quot;=
ibm,occ-i2c&quot;},</tt><br><br><tt>ERROR: Missing Signed-off-by: line(s)</=
tt><br><br><tt>total: 1 errors, 7 warnings, 1391 lines checked</tt><br><br>=
<tt>occ=5Fv4.patch has style problems, please review. <br></tt><br><tt>1) F=
or &nbsp;&quot;DT compatible&quot; warnings, I am not sure whether it is ne=
cessary, since I run &quot;</tt><tt>scripts/checkpatch.pl -f arch/arm/boot/=
dts/aspeed-bmc-opp-barreleye.dts</tt><tt>&quot;,</tt><br><tt>it will report=
 many warnings. I can add a description if necessary.</tt><br><br><tt>2) fo=
r &quot;line over 80&quot; warnings, it would break the link if wrap at 80 =
characters.</tt><br><tt>&nbsp;<br>&gt; &gt; +<br>&gt; &gt; +/* To generate =
attn to OCC */<br>&gt; &gt; +#define ATTN=5FDATA &nbsp; &nbsp; &nbsp;0x0006=
B035<br>&gt; &gt; +/* For BMC to read/write SRAM */<br>&gt; &gt; +#define O=
CB=5FADDRESS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x0006B070<br>&gt; &g=
t; +#define OCB=5FDATA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0x0=
006B075<br>&gt; &gt; +#define OCB=5FSTATUS=5FCONTROL=5FAND 0x0006B072<br>&g=
t; &gt; +#define OCB=5FSTATUS=5FCONTROL=5FOR &nbsp;0x0006B073<br>&gt; &gt; =
+#define OCC=5FCOMMAND=5FADDR &nbsp; &nbsp; &nbsp; 0xFFFF6000<br>&gt; &gt; =
+#define OCC=5FRESPONSE=5FADDR &nbsp; &nbsp; &nbsp;0xFFFF7000<br>&gt; <br>&=
gt; Are these addresses going to change with different versions of the <br>=
&gt; OCC firmware?<br>&gt;</tt><br><br><tt>Actually I did not find the docu=
ment for most of the addresses. I copied them from Alvin's OCC code.</tt><b=
r><tt>If anyone know the source (possibly from OCC firmware developers), pl=
ease help.</tt><br><tt>The only OCC document I can find is:</tt><br><a href=
=3D"https://github.com/open-power/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=
=5FInterfaces.pdf"><tt>https://github.com/open-power/docs/blob/master/occ/O=
CC=5FOpenPwr=5FFW=5FInterfaces.pdf</tt></a><br><tt>It defines OCC=5FCOMMAND=
=5FADDR and OCC=5FRESPONSE=5FADDR only.</tt><br><br><tt>&gt; <br>&gt; &gt; =
+<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; if (!p)<br>&gt; &gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br>&gt; <br>&gt; It's common in =
kernel code to omit checking for null arguments.<br>&gt; <br>&gt; If you th=
ink there is a likely hood of this happening, then perhaps<br>&gt; WARN=5FO=
N(!b) would be better; this way we get a backtrace in the kernel<br>&gt; lo=
g.<br>&gt; <br></tt><br><tt>The </tt><tt>deinit=5Focc=5Fresp=5Fbuf() functi=
on is supposed to be called in multiple situation.</tt><br><tt>E.g, error h=
andling code in a function. In those case, pointer might be NULL.</tt><br><=
tt>So WARN=5FON() is not expected in that case.</tt><br><br><br><tt>&gt; &g=
t; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; if (!p-&gt;blocks)<br>&gt; &gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br>&gt; &gt; +<br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp; for (b =3D 0; b &lt; p-&gt;header.sensor=
=5Fblock=5Fnum; b++) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; if (p-&gt;blocks[b].sensor)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kfree(p-&gt;blocks=
[b].sensor);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; if (p-&gt;blocks[b].power)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kfree(p-&gt;blocks[b].power);=
<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (p-&gt;=
blocks[b].caps)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; kfree(p-&gt;blocks[b].caps);<br>&gt; &gt; =
+ &nbsp; &nbsp; &nbsp; }<br>&gt; <br>&gt; I think Jeremy suggested in his r=
eview that you statically allocate<br>&gt; these instead of kmalloc and kfr=
eeing at runtime.<br>&gt; <br></tt><br><tt>The OCC sensor type and sensor n=
umber will change depending on whether OCC is master or slave.</tt><br><tt>=
Also there is possible of bad cores and the number of sensors may change.</=
tt><br><tt>So using dynamically allocated sensor block is nature I think.</=
tt><br><tt>It is possible that the driver allocates a block of memory and m=
anage itself.</tt><br><tt>But looks there is no great benefit.</tt><br><tt>=
<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; int b;<br>&gt; &gt; + =
&nbsp; &nbsp; &nbsp; int s;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; int ret;<br=
>&gt; &gt; + &nbsp; &nbsp; &nbsp; int dnum =3D SENSOR=5FBLOCK=5FOFFSET;<br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp; struct occ=5Fsensor *f=5Fsensor;<br>&gt; &=
gt; + &nbsp; &nbsp; &nbsp; struct occ=5Fsensor *t=5Fsensor;<br>&gt; &gt; + =
&nbsp; &nbsp; &nbsp; struct power=5Fsensor *p=5Fsensor;<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp; struct caps=5Fsensor *c=5Fsensor;<br>&gt; &gt; + &nbsp; &n=
bsp; &nbsp; uint8=5Ft sensor=5Fblock=5Fnum;<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp; uint8=5Ft sensor=5Ftype[4];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; uint8=
=5Ft sensor=5Fformat;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; uint8=5Ft sensor=
=5Flength;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; uint8=5Ft num=5Fof=5Fsensors=
;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; /* check if the data i=
s valid */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; if (strncmp(&amp;d[SENSOR=5F=
STR=5FOFFSET], &quot;SENSOR&quot;, 6) !=3D 0) {<br>&gt; <br>&gt; If you hav=
e a literal string you don't need to use strncmp.<br>&gt; <br></tt><br><tt>=
&quot;d[SENSOR=5FSTR=5FOFFSET]&quot; does not have '\0' to terminate a stri=
ng. So have to use strncmp.<br></tt><br><br><tt>&gt; <br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; p=5Fsensor-&gt;accumulator =3D<br>&gt; &gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (d[dnum+6] &lt;&lt; 24=
) | (d<br>&gt; [dnum+7] &lt;&lt; 16) |<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (d[dnum+8] &lt;&lt; 8) | d[dnum+9];<br=
>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; p=5Fsensor-&gt;value =3D<br>&gt;=
 &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (d[dnum+1=
0] &lt;&lt; 8) | d[dnum+11];<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; dev=5Fdbg(&amp;client-&gt;dev,<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;sensor[%d]-[%d]: id: %u, <=
br>&gt; value: %u\n&quot;,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; b, s, p=5Fsensor-&gt;sensor=5Fid,<br>&gt; &gt; + &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; p=5Fsensor-&gt;val=
ue);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dnum =3D d=
num + sensor=5Flength;</tt><br><tt>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>&gt; &gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } else if (strncmp(sensor=5Ftype, &=
quot;CAPS&quot;, 4) =3D=3D 0) {<br>&gt; <br>&gt; If you have a literal stri=
ng you don't need to use strncmp.</tt><br><br><tt>&quot;sensor=5Ftype&quot;=
 has no '\0' to terminate it. strncmp() is necessary. </tt><br><tt><br><br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; val =3D -1;<br=
>&gt; &gt; + &nbsp; &nbsp; &nbsp; else<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; /* in millidegree Celsius */<br>&gt; &gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; val =3D sensor[n].value * 100=
0;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; return sprintf(buf, &=
quot;%d\n&quot;, val);<br>&gt; <br>&gt; How do you know &quot;%d\n&quot; wi=
ll fit into buf?</tt><br><br><tt>Do you mean using snprintf()? After readin=
g the man page:</tt><br><tt>&quot;Because &nbsp;sprintf() &nbsp;and vsprint=
f() assume an arbitrarily long string, callers must be careful not to overf=
low the actual space; this</tt><br><tt>&nbsp; &nbsp; &nbsp; &nbsp;is often =
impossible to assure. &nbsp;Note that the length of the strings produced is=
 locale-dependent &nbsp;and &nbsp;difficult &nbsp;to &nbsp;predict. &nbsp; =
Use</tt><br><tt>&nbsp; &nbsp; &nbsp; &nbsp;snprintf() and vsnprintf() inste=
ad (or asprintf(3) and vasprintf(3)).&quot;</tt><br><br><tt>snprintf() seem=
s more safe, but we can find a lot of &quot;sprintf()&quot; in sysfs show* =
functions in drivers/hwmon/. Looks to me not a big issue.</tt><br><tt>Anywa=
y, I will change to snprintf() to be safer:</tt><br><tt>I use the same code=
 as driver/hwmon/</tt><tt>lm95241.c</tt><br><br><tt>&quot;</tt><tt>&nbsp; &=
nbsp; &nbsp; &nbsp; return snprintf(buf, PAGE=5FSIZE - 1,</tt><br><tt>&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; data-&gt;config &amp; to=5Fsensor=5Fdev=5Fattr(attr)-&gt;index ?</tt><b=
r><tt>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &quot;127000\n&quot; : &quot;255000\n&quot;);</tt><br><tt>&q=
uot;</tt><br><br><tt>Thanks,</tt><br><tt>-adam</tt><br><br><tt><br></tt><BR>
</body></html>

--0__=8FBBF5BDDFA0B9C88f9e8a93df938690918c8FBBF5BDDFA0B9C8--
