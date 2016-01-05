Return-Path: <njames@us.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8F6C11A1147
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2016 01:28:05 +1100 (AEDT)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Tue, 5 Jan 2016 07:28:02 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 5 Jan 2016 07:28:00 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 2B1F53E40044
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2016 07:28:00 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u05ES0Ov26148866
 for <openbmc@lists.ozlabs.org>; Tue, 5 Jan 2016 07:28:00 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u05ERxni015986
 for <openbmc@lists.ozlabs.org>; Tue, 5 Jan 2016 07:27:59 -0700
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u05ERvU9015890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 5 Jan 2016 07:27:58 -0700
Message-Id: <201601051427.u05ERvU9015890@d03av02.boulder.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Tue, 5 Jan 2016 07:27:57 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 5 Jan 2016 07:27:56 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Tue, 5 Jan 2016 14:27:54 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 5 Jan 2016 14:27:52 -0000
Received: from us1a3-mail64.a3.dal09.isc4sb.com ([10.142.3.135])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016010514283159-237159 ;
 Tue, 5 Jan 2016 14:28:31 +0000 
In-Reply-To: <201601050829.u058TamO024023@d23av01.au.ibm.com>
Subject: Re: [PATCH occ hwmon v3] Add OCC hwmon driver to Kernel
To: "Yi TZ Li" <shliyi@cn.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: "Norman James" <njames@us.ibm.com>
Date: Tue, 5 Jan 2016 06:59:54 -0600
References: <BLU436-SMTP1997C66B56E367DA0D3E402D9080@phx.gbl>
 <CACPK8XcUA=4m7QH1QL0eRaupRPevQtm9VeMCwoR1GdVam6JJfQ@mail.gmail.com>
 <201601050829.u058TamO024023@d23av01.au.ibm.com>
X-KeepSent: A2ED26E4:C9645634-86257F31:00474597;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 41555
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF5A2DFD4C3078f9e8a93df938690918c09BBF5A2DFD4C307"
x-cbid: 16010514-0021-0000-0000-000015CA9B47
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.290183; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004758; HX=3.00000237; KW=3.00000007;
 PH=3.00000004; SC=3.00000130; SDB=6.00640886; UDB=6.00288429; UTC=2016-01-05
 14:27:54
x-cbparentid: 16010514-9900-0000-0000-0000058D3CB6
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
X-List-Received-Date: Tue, 05 Jan 2016 14:28:06 -0000

--0__=09BBF5A2DFD4C3078f9e8a93df938690918c09BBF5A2DFD4C307
Content-type: multipart/alternative; 
	Boundary="1__=09BBF5A2DFD4C3078f9e8a93df938690918c09BBF5A2DFD4C307"


--1__=09BBF5A2DFD4C3078f9e8a93df938690918c09BBF5A2DFD4C307
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


The OCC register definitions are set by the hardware and can be found in
the P8 SCOM register documentation.   They won't ever change for P8 and P8
+.


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

Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	"Yi TZ Li" <shliyi@cn.ibm.com>
To:	Joel Stanley <joel@jms.id.au>
Cc:	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:	01/05/2016 02:30 AM
Subject:	Re: [PATCH occ hwmon v3] Add OCC hwmon driver to Kernel
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



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


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=09BBF5A2DFD4C3078f9e8a93df938690918c09BBF5A2DFD4C307
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>The OCC register definitions are set by the hardware and can=
 be found in the P8 SCOM register documentation.   They won't ever change f=
or P8 and P8+.<br><br><br><tt><font size=3D"4">&gt; &gt; +<br>&gt; &gt; +/*=
 To generate attn to OCC */<br>&gt; &gt; +#define ATTN=5FDATA &nbsp; &nbsp;=
 &nbsp;0x0006B035<br>&gt; &gt; +/* For BMC to read/write SRAM */<br>&gt; &g=
t; +#define OCB=5FADDRESS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0x0006B0=
70<br>&gt; &gt; +#define OCB=5FDATA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; 0x0006B075<br>&gt; &gt; +#define OCB=5FSTATUS=5FCONTROL=5FAND 0x0=
006B072<br>&gt; &gt; +#define OCB=5FSTATUS=5FCONTROL=5FOR &nbsp;0x0006B073<=
br>&gt; &gt; +#define OCC=5FCOMMAND=5FADDR &nbsp; &nbsp; &nbsp; 0xFFFF6000<=
br>&gt; &gt; +#define OCC=5FRESPONSE=5FADDR &nbsp; &nbsp; &nbsp;0xFFFF7000<=
/font></tt><br><br>Regards,<br>Norman James<br>IBM - POWER Systems Architec=
t<br>Phone: 1-512-286-6807 (T/L: 363-6807)<br>Internet: njames@us.ibm.com<b=
r><br><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D09BBF5A2DFD4=
C3078f9e8a93df938690918c09B@" border=3D"0" alt=3D"Inactive hide details for=
 &quot;Yi TZ Li&quot; ---01/05/2016 02:30:26 AM---Hi Joel, Thanks many for =
your time to review the driver."><font color=3D"#424282">&quot;Yi TZ Li&quo=
t; ---01/05/2016 02:30:26 AM---Hi Joel, Thanks many for your time to review=
 the driver.</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:        =
</font><font size=3D"2">&quot;Yi TZ Li&quot; &lt;shliyi@cn.ibm.com&gt;</fon=
t><br><font size=3D"2" color=3D"#5F5F5F">To:        </font><font size=3D"2"=
>Joel Stanley &lt;joel@jms.id.au&gt;</font><br><font size=3D"2" color=3D"#5=
F5F5F">Cc:        </font><font size=3D"2">OpenBMC Maillist &lt;openbmc@list=
s.ozlabs.org&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Date:        =
</font><font size=3D"2">01/05/2016 02:30 AM</font><br><font size=3D"2" colo=
r=3D"#5F5F5F">Subject:        </font><font size=3D"2">Re: [PATCH occ hwmon =
v3] Add OCC hwmon driver to Kernel</font><br><font size=3D"2" color=3D"#5F5=
F5F">Sent by:        </font><font size=3D"2">&quot;openbmc&quot; &lt;openbm=
c-bounces+njames=3Dus.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"1=
00%" size=3D"2" align=3D"left" noshade style=3D"color:#8091A5; "><br><br><b=
r><tt><font size=3D"4">Hi Joel,</font></tt><font size=3D"4"><br></font><tt>=
<font size=3D"4"><br>Thanks many for your time to review the driver.</font>=
</tt><font size=3D"4"><br></font><tt><font size=3D"4"><br>I re-submitted to=
 patch, fixed most of the issues you pointed out, except a few showed bello=
w.<br>Please see my reply bellow for details:</font></tt><font size=3D"4"><=
br></font><tt><font size=3D"4"><br>joel.stan@gmail.com wrote on 12/10/2015 =
12:02:19 PM:<br><br>&gt; From: Joel Stanley &lt;joel@jms.id.au&gt;<br>&gt; =
To: Yi Li &lt;adamliyi@msn.com&gt;<br>&gt; Cc: OpenBMC Maillist &lt;openbmc=
@lists.ozlabs.org&gt;, Jeremy Kerr <br>&gt; &lt;jk@ozlabs.org&gt;, Yi TZ Li=
/China/IBM@IBMCN<br>&gt; Date: 12/10/2015 12:03 PM<br>&gt; Subject: Re: [PA=
TCH occ hwmon v3] Add OCC hwmon driver to Kernel<br>&gt; Sent by: joel.stan=
@gmail.com<br>&gt; <br>&gt; Hello Adam,<br>&gt; <br>&gt; On Tue, Dec 8, 201=
5 at 6:59 PM, Yi Li &lt;adamliyi@msn.com&gt; wrote:<br>&gt; &gt; The defaul=
t patch triggered by git pull request is hard to read.<br>&gt; &gt; I resen=
d a clean patch to the list. Please review.<br>&gt; <br>&gt; Thanks! This i=
s the preferred method for reviewing code. Even better<br>&gt; would be if =
you used git format-patch to create the email, that way we<br>&gt; can revi=
ew your commit message as well.<br>&gt; <br>&gt; Before you submit next, pl=
ease run your patch through<br>&gt; scripts/checkpatch.pl in the kernel tre=
e and fix all of the errors and<br>&gt; warnings. It will warn you about co=
mmon style and syntax mistakes.<br>&gt; <br>&gt; ./scripts/checkpatch.pl -f=
 drivers/hwmon/occ=5Fi2c.c<br>&gt; <br>&gt; [...]<br>&gt; <br>&gt; total: 2=
4 errors, 21 warnings, 1315 lines checked</font></tt><font size=3D"4"><br><=
/font><tt><font size=3D"4"><br>I run the checkpatch.pl against the new patc=
h, here are the result:</font></tt><font size=3D"4"><br></font><tt><font si=
ze=3D"4"><br>scripts/checkpatch.pl occ=5Fv4.patch<br>WARNING: DT compatible=
 string &quot;ibm,occ-i2c&quot; appears un-documented -- check ./Documentat=
ion/devicetree/bindings/<br>#11: FILE: arch/arm/boot/dts/aspeed-bmc-opp-bar=
releye.dts:30:<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; compatible =3D &quot;ibm,occ-i2c&quot;;</fon=
t></tt><font size=3D"4"><br></font><tt><font size=3D"4"><br>WARNING: DT com=
patible string &quot;ibm,occ-i2c&quot; appears un-documented -- check ./Doc=
umentation/devicetree/bindings/<br>#15: FILE: arch/arm/boot/dts/aspeed-bmc-=
opp-barreleye.dts:34:<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compatible =3D &quot;ibm,occ-i2c&quot=
;;</font></tt><font size=3D"4"><br></font><tt><font size=3D"4"><br>WARNING:=
 DT compatible string &quot;ibm,occ-i2c&quot; appears un-documented -- chec=
k ./Documentation/devicetree/bindings/<br>#33: FILE: arch/arm/boot/dts/aspe=
ed-bmc-opp-palmetto.dts:35:<br>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compatible =3D &quot;ibm,occ-i2=
c&quot;;</font></tt><font size=3D"4"><br></font><tt><font size=3D"4"><br>WA=
RNING: added, moved or deleted file(s), does MAINTAINERS need updating?<br>=
#74:<br>new file mode 100644</font></tt><font size=3D"4"><br></font><tt><fo=
nt size=3D"4"><br>WARNING: line over 80 characters<br>#127: FILE: drivers/h=
wmon/occ=5Fi2c.c:49:<br>+ * </font></tt><a href=3D"https://github.com/open-=
power/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=5FInterfaces.pdf"><tt><u><fon=
t size=3D"4" color=3D"#0000FF">https://github.com/open-power/docs/blob/mast=
er/occ/OCC=5FOpenPwr=5FFW=5FInterfaces.pdf</font></u></tt></a><font size=3D=
"4"><br></font><tt><font size=3D"4"><br>WARNING: line over 80 characters<br=
>#420: FILE: drivers/hwmon/occ=5Fi2c.c:342:<br>+ * </font></tt><a href=3D"h=
ttps://github.com/open-power/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=5FInte=
rfaces.pdf"><tt><u><font size=3D"4" color=3D"#0000FF">https://github.com/op=
en-power/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=5FInterfaces.pdf</font></u=
></tt></a><font size=3D"4"><br></font><tt><font size=3D"4"><br>WARNING: DT =
compatible string &quot;ibm,occ-i2c&quot; appears un-documented -- check ./=
Documentation/devicetree/bindings/<br>#1389: FILE: drivers/hwmon/occ=5Fi2c.=
c:1311:<br>+ &nbsp; &nbsp; &nbsp; {.compatible =3D &quot;ibm,occ-i2c&quot;}=
,</font></tt><font size=3D"4"><br></font><tt><font size=3D"4"><br>ERROR: Mi=
ssing Signed-off-by: line(s)</font></tt><font size=3D"4"><br></font><tt><fo=
nt size=3D"4"><br>total: 1 errors, 7 warnings, 1391 lines checked</font></t=
t><font size=3D"4"><br></font><tt><font size=3D"4"><br>occ=5Fv4.patch has s=
tyle problems, please review. </font></tt><font size=3D"4"><br></font><tt><=
font size=3D"4"><br>1) For &nbsp;&quot;DT compatible&quot; warnings, I am n=
ot sure whether it is necessary, since I run &quot;scripts/checkpatch.pl -f=
 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts&quot;,<br>it will report ma=
ny warnings. I can add a description if necessary.</font></tt><font size=3D=
"4"><br></font><tt><font size=3D"4"><br>2) for &quot;line over 80&quot; war=
nings, it would break the link if wrap at 80 characters.<br> <br>&gt; &gt; =
+<br>&gt; &gt; +/* To generate attn to OCC */<br>&gt; &gt; +#define ATTN=5F=
DATA &nbsp; &nbsp; &nbsp;0x0006B035<br>&gt; &gt; +/* For BMC to read/write =
SRAM */<br>&gt; &gt; +#define OCB=5FADDRESS &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;0x0006B070<br>&gt; &gt; +#define OCB=5FDATA &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; 0x0006B075<br>&gt; &gt; +#define OCB=5FSTATUS=
=5FCONTROL=5FAND 0x0006B072<br>&gt; &gt; +#define OCB=5FSTATUS=5FCONTROL=5F=
OR &nbsp;0x0006B073<br>&gt; &gt; +#define OCC=5FCOMMAND=5FADDR &nbsp; &nbsp=
; &nbsp; 0xFFFF6000<br>&gt; &gt; +#define OCC=5FRESPONSE=5FADDR &nbsp; &nbs=
p; &nbsp;0xFFFF7000<br>&gt; <br>&gt; Are these addresses going to change wi=
th different versions of the <br>&gt; OCC firmware?<br>&gt;</font></tt><fon=
t size=3D"4"><br></font><tt><font size=3D"4"><br>Actually I did not find th=
e document for most of the addresses. I copied them from Alvin's OCC code.<=
br>If anyone know the source (possibly from OCC firmware developers), pleas=
e help.<br>The only OCC document I can find is:</font></tt><u><font size=3D=
"4" color=3D"#0000FF"><br></font></u><a href=3D"https://github.com/open-pow=
er/docs/blob/master/occ/OCC=5FOpenPwr=5FFW=5FInterfaces.pdf"><tt><u><font s=
ize=3D"4" color=3D"#0000FF">https://github.com/open-power/docs/blob/master/=
occ/OCC=5FOpenPwr=5FFW=5FInterfaces.pdf</font></u></tt></a><tt><font size=
=3D"4"><br>It defines OCC=5FCOMMAND=5FADDR and OCC=5FRESPONSE=5FADDR only.<=
/font></tt><font size=3D"4"><br></font><tt><font size=3D"4"><br>&gt; <br>&g=
t; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; if (!p)<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br>&gt; <br>&gt; It's co=
mmon in kernel code to omit checking for null arguments.<br>&gt; <br>&gt; I=
f you think there is a likely hood of this happening, then perhaps<br>&gt; =
WARN=5FON(!b) would be better; this way we get a backtrace in the kernel<br=
>&gt; log.<br>&gt; </font></tt><font size=3D"4"><br></font><tt><font size=
=3D"4"><br>The deinit=5Focc=5Fresp=5Fbuf() function is supposed to be calle=
d in multiple situation.<br>E.g, error handling code in a function. In thos=
e case, pointer might be NULL.<br>So WARN=5FON() is not expected in that ca=
se.</font></tt><font size=3D"4"><br><br></font><tt><font size=3D"4"><br>&gt=
; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; if (!p-&gt;blocks)<br>&gt; &gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br>&gt; &gt; +=
<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; for (b =3D 0; b &lt; p-&gt;header.sens=
or=5Fblock=5Fnum; b++) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; if (p-&gt;blocks[b].sensor)<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kfree(p-&gt;bloc=
ks[b].sensor);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; if (p-&gt;blocks[b].power)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kfree(p-&gt;blocks[b].power=
);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (p-&g=
t;blocks[b].caps)<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kfree(p-&gt;blocks[b].caps);<br>&gt; &gt=
; + &nbsp; &nbsp; &nbsp; }<br>&gt; <br>&gt; I think Jeremy suggested in his=
 review that you statically allocate<br>&gt; these instead of kmalloc and k=
freeing at runtime.<br>&gt; </font></tt><font size=3D"4"><br></font><tt><fo=
nt size=3D"4"><br>The OCC sensor type and sensor number will change dependi=
ng on whether OCC is master or slave.<br>Also there is possible of bad core=
s and the number of sensors may change.<br>So using dynamically allocated s=
ensor block is nature I think.<br>It is possible that the driver allocates =
a block of memory and manage itself.<br>But looks there is no great benefit=
.<br><br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; int b;<br>&gt; &g=
t; + &nbsp; &nbsp; &nbsp; int s;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; int re=
t;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; int dnum =3D SENSOR=5FBLOCK=5FOFFSET=
;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; struct occ=5Fsensor *f=5Fsensor;<br>&=
gt; &gt; + &nbsp; &nbsp; &nbsp; struct occ=5Fsensor *t=5Fsensor;<br>&gt; &g=
t; + &nbsp; &nbsp; &nbsp; struct power=5Fsensor *p=5Fsensor;<br>&gt; &gt; +=
 &nbsp; &nbsp; &nbsp; struct caps=5Fsensor *c=5Fsensor;<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp; uint8=5Ft sensor=5Fblock=5Fnum;<br>&gt; &gt; + &nbsp; &nbs=
p; &nbsp; uint8=5Ft sensor=5Ftype[4];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; u=
int8=5Ft sensor=5Fformat;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; uint8=5Ft sen=
sor=5Flength;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; uint8=5Ft num=5Fof=5Fsens=
ors;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; /* check if the dat=
a is valid */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; if (strncmp(&amp;d[SENSOR=
=5FSTR=5FOFFSET], &quot;SENSOR&quot;, 6) !=3D 0) {<br>&gt; <br>&gt; If you =
have a literal string you don't need to use strncmp.<br>&gt; </font></tt><f=
ont size=3D"4"><br></font><tt><font size=3D"4"><br>&quot;d[SENSOR=5FSTR=5FO=
FFSET]&quot; does not have '\0' to terminate a string. So have to use strnc=
mp.</font></tt><font size=3D"4"><br><br></font><tt><font size=3D"4"><br>&gt=
; <br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; p=5Fsensor-&gt;accumulator =
=3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; (d[dnum+6] &lt;&lt; 24) | (d<br>&gt; [dnum+7] &lt;&lt; 16) |<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (d[dnum+8] &lt=
;&lt; 8) | d[dnum+9];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; p=5Fsens=
or-&gt;value =3D<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; (d[dnum+10] &lt;&lt; 8) | d[dnum+11];<br>&gt; &gt; +<br>&gt;=
 &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dev=5Fdbg(&amp;client-&gt;dev,<br>&gt=
; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;se=
nsor[%d]-[%d]: id: %u, <br>&gt; value: %u\n&quot;,<br>&gt; &gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; b, s, p=5Fsensor-&gt;senso=
r=5Fid,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; p=5Fsensor-&gt;value);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; dnum =3D dnum + sensor=5Flength;<br>&gt; &gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>&gt; &=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } else if (strncmp(s=
ensor=5Ftype, &quot;CAPS&quot;, 4) =3D=3D 0) {<br>&gt; <br>&gt; If you have=
 a literal string you don't need to use strncmp.</font></tt><font size=3D"4=
"><br></font><tt><font size=3D"4"><br>&quot;sensor=5Ftype&quot; has no '\0'=
 to terminate it. strncmp() is necessary. <br><br><br>&gt; &gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; val =3D -1;<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp; else<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; /* in millidegree Celsius */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; val =3D sensor[n].value * 1000;<br>&gt; &gt; +<br>=
&gt; &gt; + &nbsp; &nbsp; &nbsp; return sprintf(buf, &quot;%d\n&quot;, val)=
;<br>&gt; <br>&gt; How do you know &quot;%d\n&quot; will fit into buf?</fon=
t></tt><font size=3D"4"><br></font><tt><font size=3D"4"><br>Do you mean usi=
ng snprintf()? After reading the man page:<br>&quot;Because &nbsp;sprintf()=
 &nbsp;and vsprintf() assume an arbitrarily long string, callers must be ca=
reful not to overflow the actual space; this<br> &nbsp; &nbsp; &nbsp; is of=
ten impossible to assure. &nbsp;Note that the length of the strings produce=
d is locale-dependent &nbsp;and &nbsp;difficult &nbsp;to &nbsp;predict. &nb=
sp; Use<br> &nbsp; &nbsp; &nbsp; snprintf() and vsnprintf() instead (or asp=
rintf(3) and vasprintf(3)).&quot;</font></tt><font size=3D"4"><br></font><t=
t><font size=3D"4"><br>snprintf() seems more safe, but we can find a lot of=
 &quot;sprintf()&quot; in sysfs show* functions in drivers/hwmon/. Looks to=
 me not a big issue.<br>Anyway, I will change to snprintf() to be safer:<br=
>I use the same code as driver/hwmon/lm95241.c</font></tt><font size=3D"4">=
<br></font><tt><font size=3D"4"><br>&quot; &nbsp; &nbsp; &nbsp; &nbsp;retur=
n snprintf(buf, PAGE=5FSIZE - 1,<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;data-&gt;config &amp; to=5Fsen=
sor=5Fdev=5Fattr(attr)-&gt;index ?<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;127000\n&quot; : &quot=
;255000\n&quot;);<br>&quot;</font></tt><font size=3D"4"><br></font><tt><fon=
t size=3D"4"><br>Thanks,<br>-adam</font></tt><font size=3D"4"><br></font><t=
t><font size=3D"4"><br></font></tt><font size=3D"4"><br></font><tt>=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mai=
ling list<br>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D"https://lists.=
ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><=
/tt><tt><br></tt><br><BR>
</body></html>

--1__=09BBF5A2DFD4C3078f9e8a93df938690918c09BBF5A2DFD4C307--


--0__=09BBF5A2DFD4C3078f9e8a93df938690918c09BBF5A2DFD4C307
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF5A2DFD4C3078f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF5A2DFD4C3078f9e8a93df938690918c09BBF5A2DFD4C307--
