Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp09.in.ibm.com (e28smtp09.in.ibm.com [125.16.236.9])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D5C121A0007
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 17:09:59 +1100 (AEDT)
Received: from localhost
 by e28smtp09.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 9 Mar 2016 11:39:57 +0530
Received: from d28relay05.in.ibm.com (9.184.220.62)
 by e28smtp09.in.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 9 Mar 2016 11:39:56 +0530
X-IBM-Helo: d28relay05.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2969XFJ20775402
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 11:39:36 +0530
Message-Id: <201603090609.u2969XFJ20775402@d28relay05.in.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 8 Mar 2016 23:09:46 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 8 Mar 2016 23:09:44 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Wed, 9 Mar 2016 06:09:43 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 9 Mar 2016 06:09:42 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016030906094185-29005 ;
 Wed, 9 Mar 2016 06:09:41 +0000 
In-Reply-To: <20160309163435.220afa51@camb691>
Subject: Re: [PATCH openpower-host-ipmi-oem] Add IPMI interface to allow FW
 updates from Host
To: "Adriana Kobylak" <anoo@us.ibm.com>
Cc: openbmc@lists.ozlabs.org, OpenBMC Patches <openbmc-patches@stwcx.xyz>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Wed, 9 Mar 2016 11:39:41 +0530
References: <1457115626-18686-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457115626-18686-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160309163435.220afa51@camb691>
X-KeepSent: 6A45301B:41682124-65257F71:0020E373;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 2855
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=EABBF5E2DFB365E38f9e8a93df938690918cEABBF5E2DFB365E3"
Content-Disposition: inline
x-cbid: 16030906-0041-0000-0000-000000D21408
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005014; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00670709; UDB=6.00306440; UTC=2016-03-09
 06:09:43
x-cbparentid: 16030906-5938-0000-0000-0000026AFBFC
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
X-List-Received-Date: Wed, 09 Mar 2016 06:10:00 -0000


--0__=EABBF5E2DFB365E38f9e8a93df938690918cEABBF5E2DFB365E3
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

"openbmc" <openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org> wrote =
on
09/03/2016 11:04:35 am:

> From: Cyril Bur <cyrilbur@gmail.com>
> To: anoo@us.ibm.com
> Cc: openbmc@lists.ozlabs.org, OpenBMC Patches <openbmc-patches@stwcx.xyz>
> Date: 09/03/2016 11:05 am
> Subject: Re: [PATCH openpower-host-ipmi-oem] Add IPMI interface to
> allow FW updates from Host
> Sent by: "openbmc" <openbmc-bounces
+vishwanath=3Din.ibm.com@lists.ozlabs.org>
>
> On Fri,  4 Mar 2016 12:20:26 -0600
> OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
>
> > From: Adriana Kobylak <anoo@us.ibm.com>
> >
> > New OEM IPMI command to execute commands that would allow the Host
> to have access to the BMC to perform a FW update.
> > ---
> >  Makefile     |  2 +-
> >  oemhandler.C | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  oemhandler.h |  1 +
> >  3 files changed, 54 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index eaa7324..bacdef9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -10,7 +10,7 @@ CXXFLAGS +=3D -fPIC -Wall
> >  all:  $(LIB=5FOEM)
> >
> >  %.o: %.C
> > -   $(CXX) -c $< $(CXXFLAGS) -o $@
> > +   $(CXX) -std=3Dc++14 -c $< $(CXXFLAGS) -o $@
> >
>
> This isn't a CXXFLAGS thing?
>
> >  $(LIB=5FOEM): $(LIB=5FOEM=5FOBJ)
> >     $(CXX) $^ -shared $(LDFLAGS) -o $@
> > diff --git a/oemhandler.C b/oemhandler.C
> > index f577d67..22452d6 100644
> > --- a/oemhandler.C
> > +++ b/oemhandler.C
> > @@ -1,7 +1,9 @@
> >  #include "oemhandler.h"
> >  #include <host-ipmid/ipmid-api.h>
> > +#include <fstream>
> >  #include <stdio.h>
> >  #include <string.h>
> > +#include <systemd/sd-bus.h>
> >
> >  void register=5Fnetfn=5Foem=5Fpartial=5Fesel() =5F=5Fattribute=5F=5F((=
constructor));
> >
> > @@ -70,10 +72,60 @@ ipmi=5Fret=5Ft
> ipmi=5Fibm=5Foem=5Fpartial=5Fesel(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft =
cmd,
> >     return rc;
> >  }
> >
> > +// Prepare for FW Update.
> > +// Execute needed commands to prepare the system for a fw update
> from the host.
> > +ipmi=5Fret=5Ft ipmi=5Fibm=5Foem=5Fprep=5Ffw=5Fupdate(ipmi=5Fnetfn=5Ft =
netfn, ipmi=5Fcmd=5Ft
cmd,
> > +                                     ipmi=5Frequest=5Ft request,
> ipmi=5Fresponse=5Ft response,
> > +                                     ipmi=5Fdata=5Flen=5Ft data=5Flen,
> ipmi=5Fcontext=5Ft context)
> > +{
> > +    ipmi=5Fret=5Ft ipmi=5Frc =3D IPMI=5FCC=5FOK;
> > +    *data=5Flen =3D 0;
> > +
> > +    int rc =3D 0;
> > +    std::ofstream rwfs=5Ffile;
> > +    const char  *busname =3D "org.openbmc.control.Bmc";
> > +    const char  *objname =3D "/org/openbmc/control/bmc0";
> > +    const char  *iface =3D "org.openbmc.control.Bmc";
> > +    sd=5Fbus *bus =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();
> > +    sd=5Fbus=5Fmessage *reply =3D NULL;
> > +    sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;
> > +    int r =3D 0;
> > +
> > +    // Set one time flag
> > +    rc =3D system("fw=5Fsetenv openbmconce copy-files-to-ram
copy-base-filesystem-to-ram");
> > +    rc =3D WEXITSTATUS(rc);
> > +    if (rc !=3D 0) {
> > +        fprintf(stderr, "fw=5Fsetenv openbmconce failed with rc=3D%d\n=
",
rc);
> > +        return IPMI=5FCC=5FUNSPECIFIED=5FERROR;
> > +    }
> > +
> > +    // Touch the image-rwfs file to perform an empty update to
> force the save
> > +    // in case we're already in ram and the flash is the same
> causing the ram files
> > +    // to not be copied back to flash
> > +    rwfs=5Ffile.open("/run/initramfs/image-rwfs", std::ofstream::out |
std::ofstream::app);

Need to handle the file open and access errors. Also, any reason why
std::ofstream used instead of fopen(3).
fopen may have been lighter IMO.

> > +    rwfs=5Ffile.close();

Handle errors on closing. ?

> > +
> > +    // Reboot the BMC for settings to take effect
> > +    r =3D sd=5Fbus=5Fcall=5Fmethod(bus, busname, objname, iface,
> > +                           "warmReset", &error, &reply, NULL);
> > +    if (r < 0) {
> > +        fprintf(stderr, "Failed to reset BMC: %s\n", strerror(-r));
> > +        return -1;
> > +    }

Return needs to be one of the IPMI specified rc than a "-1". May be
IPMI=5FCC=5FINVALID is better suited here. ?
Also this has memory leak on error. Need to free the 'error' and 'reply'.

Also, if this call results in BMC being rebooted, does this call ever
return and the reboot is done Async ?.

> > +    printf("Warning: BMC is going down for reboot!\n");
> > +    sd=5Fbus=5Ferror=5Ffree(&error);
> > +    reply =3D sd=5Fbus=5Fmessage=5Funref(reply);
> > +
> > +    return ipmi=5Frc;
> > +}
> >
> >  void register=5Fnetfn=5Foem=5Fpartial=5Fesel()
> >  {
> >     printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FOEM,
> IPMI=5FCMD=5FPESEL);
> >     ipmi=5Fregister=5Fcallback(NETFUN=5FOEM, IPMI=5FCMD=5FPESEL, NULL,
> ipmi=5Fibm=5Foem=5Fpartial=5Fesel);
> > +
> > +    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FOEM,
> IPMI=5FCMD=5FPREP=5FFW=5FUPDATE);
> > +    ipmi=5Fregister=5Fcallback(NETFUN=5FOEM, IPMI=5FCMD=5FPREP=5FFW=5F=
UPDATE,
> NULL, ipmi=5Fibm=5Foem=5Fprep=5Ffw=5Fupdate);
> > +
> >     return;
> >  }
> > diff --git a/oemhandler.h b/oemhandler.h
> > index 9cc397f..71ae01c 100644
> > --- a/oemhandler.h
> > +++ b/oemhandler.h
> > @@ -8,6 +8,7 @@
> >  // IPMI commands for net functions.
> >  enum ipmi=5Fnetfn=5Foem=5Fcmds
> >  {
> > +    IPMI=5FCMD=5FPREP=5FFW=5FUPDATE =3D 0x10,
> >      IPMI=5FCMD=5FPESEL =3D 0xF0,
> >  };
> >
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--0__=EABBF5E2DFB365E38f9e8a93df938690918cEABBF5E2DFB365E3
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>&quot;openbmc&quot; &lt;openbmc-bounces+vishwanath=3Din.=
ibm.com@lists.ozlabs.org&gt; wrote on 09/03/2016 11:04:35 am:<br><br>&gt; F=
rom: Cyril Bur &lt;cyrilbur@gmail.com&gt;</tt><br><tt>&gt; To: anoo@us.ibm.=
com</tt><br><tt>&gt; Cc: openbmc@lists.ozlabs.org, OpenBMC Patches &lt;open=
bmc-patches@stwcx.xyz&gt;</tt><br><tt>&gt; Date: 09/03/2016 11:05 am</tt><b=
r><tt>&gt; Subject: Re: [PATCH openpower-host-ipmi-oem] Add IPMI interface =
to <br>&gt; allow FW updates from Host</tt><br><tt>&gt; Sent by: &quot;open=
bmc&quot; &lt;openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org&gt;<=
/tt><br><tt>&gt; <br>&gt; On Fri, &nbsp;4 Mar 2016 12:20:26 -0600<br>&gt; O=
penBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; wrote:<br>&gt; <br>&gt; &g=
t; From: Adriana Kobylak &lt;anoo@us.ibm.com&gt;<br>&gt; &gt; <br>&gt; &gt;=
 New OEM IPMI command to execute commands that would allow the Host<br>&gt;=
 to have access to the BMC to perform a FW update.<br>&gt; &gt; ---<br>&gt;=
 &gt; &nbsp;Makefile &nbsp; &nbsp; | &nbsp;2 +-<br>&gt; &gt; &nbsp;oemhandl=
er.C | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++<br>&gt; &gt;=
 &nbsp;oemhandler.h | &nbsp;1 +<br>&gt; &gt; &nbsp;3 files changed, 54 inse=
rtions(+), 1 deletion(-)<br>&gt; &gt; <br>&gt; &gt; diff --git a/Makefile b=
/Makefile<br>&gt; &gt; index eaa7324..bacdef9 100644<br>&gt; &gt; --- a/Mak=
efile<br>&gt; &gt; +++ b/Makefile<br>&gt; &gt; @@ -10,7 +10,7 @@ CXXFLAGS +=
=3D -fPIC -Wall<br>&gt; &gt; &nbsp;all: &nbsp;$(LIB=5FOEM)<br>&gt; &gt; &nb=
sp;<br>&gt; &gt; &nbsp;%.o: %.C<br>&gt; &gt; - &nbsp; $(CXX) -c $&lt; $(CXX=
FLAGS) -o $@<br>&gt; &gt; + &nbsp; $(CXX) -std=3Dc++14 -c $&lt; $(CXXFLAGS)=
 -o $@<br>&gt; &gt; &nbsp;<br>&gt; <br>&gt; This isn't a CXXFLAGS thing?<br=
>&gt; <br>&gt; &gt; &nbsp;$(LIB=5FOEM): $(LIB=5FOEM=5FOBJ)<br>&gt; &gt; &nb=
sp; &nbsp; $(CXX) $^ -shared $(LDFLAGS) -o $@<br>&gt; &gt; diff --git a/oem=
handler.C b/oemhandler.C<br>&gt; &gt; index f577d67..22452d6 100644<br>&gt;=
 &gt; --- a/oemhandler.C<br>&gt; &gt; +++ b/oemhandler.C<br>&gt; &gt; @@ -1=
,7 +1,9 @@<br>&gt; &gt; &nbsp;#include &quot;oemhandler.h&quot;<br>&gt; &gt=
; &nbsp;#include &lt;host-ipmid/ipmid-api.h&gt;<br>&gt; &gt; +#include &lt;=
fstream&gt;<br>&gt; &gt; &nbsp;#include &lt;stdio.h&gt;<br>&gt; &gt; &nbsp;=
#include &lt;string.h&gt;<br>&gt; &gt; +#include &lt;systemd/sd-bus.h&gt;<b=
r>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;void register=5Fnetfn=5Foem=5Fpartial=
=5Fesel() =5F=5Fattribute=5F=5F((constructor));<br>&gt; &gt; &nbsp;<br>&gt;=
 &gt; @@ -70,10 +72,60 @@ ipmi=5Fret=5Ft <br>&gt; ipmi=5Fibm=5Foem=5Fpartia=
l=5Fesel(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp; &n=
bsp; return rc;<br>&gt; &gt; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; +// P=
repare for FW Update.<br>&gt; &gt; +// Execute needed commands to prepare t=
he system for a fw update <br>&gt; from the host.<br>&gt; &gt; +ipmi=5Fret=
=5Ft ipmi=5Fibm=5Foem=5Fprep=5Ffw=5Fupdate(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fc=
md=5Ft cmd,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; ipmi=5Frequest=5Ft request, <br>&gt; ipmi=5Fresponse=5Ft response,<br>&g=
t; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=5Fdata=5F=
len=5Ft data=5Flen, <br>&gt; ipmi=5Fcontext=5Ft context)<br>&gt; &gt; +{<br=
>&gt; &gt; + &nbsp; &nbsp;ipmi=5Fret=5Ft ipmi=5Frc =3D IPMI=5FCC=5FOK;<br>&=
gt; &gt; + &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; &gt; +<br>&gt; &gt; + &n=
bsp; &nbsp;int rc =3D 0;<br>&gt; &gt; + &nbsp; &nbsp;std::ofstream rwfs=5Ff=
ile;<br>&gt; &gt; + &nbsp; &nbsp;const char &nbsp;*busname =3D &quot;org.op=
enbmc.control.Bmc&quot;;<br>&gt; &gt; + &nbsp; &nbsp;const char &nbsp;*objn=
ame =3D &quot;/org/openbmc/control/bmc0&quot;;<br>&gt; &gt; + &nbsp; &nbsp;=
const char &nbsp;*iface =3D &quot;org.openbmc.control.Bmc&quot;;<br>&gt; &g=
t; + &nbsp; &nbsp;sd=5Fbus *bus =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();<=
br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage *reply =3D NULL;<br>&gt; &gt=
; + &nbsp; &nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt=
; &gt; + &nbsp; &nbsp;int r =3D 0;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nb=
sp;// Set one time flag<br>&gt; &gt; + &nbsp; &nbsp;rc =3D system(&quot;fw=
=5Fsetenv openbmconce copy-files-to-ram copy-base-filesystem-to-ram&quot;);=
<br>&gt; &gt; + &nbsp; &nbsp;rc =3D WEXITSTATUS(rc);<br>&gt; &gt; + &nbsp; =
&nbsp;if (rc !=3D 0) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(st=
derr, &quot;fw=5Fsetenv openbmconce failed with rc=3D%d\n&quot;, rc);<br>&g=
t; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FUNSPECIFIED=5FERROR=
; <br>&gt; &gt; + &nbsp; &nbsp;}<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp=
;// Touch the image-rwfs file to perform an empty update to <br>&gt; force =
the save<br>&gt; &gt; + &nbsp; &nbsp;// in case we're already in ram and th=
e flash is the same <br>&gt; causing the ram files<br>&gt; &gt; + &nbsp; &n=
bsp;// to not be copied back to flash<br>&gt; &gt; + &nbsp; &nbsp;rwfs=5Ffi=
le.open(&quot;/run/initramfs/image-rwfs&quot;, std::ofstream::out | std::of=
stream::app);</tt><br><br><tt>Need to handle the file open and access error=
s. Also, any reason why std::ofstream used instead of fopen(3).</tt><br><tt=
>fopen may have been lighter IMO.</tt><br><tt><br>&gt; &gt; + &nbsp; &nbsp;=
rwfs=5Ffile.close();</tt><br><br><tt>Handle errors on closing. ?</tt><br><t=
t><br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;// Reboot the BMC for setting=
s to take effect<br>&gt; &gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmethod=
(bus, busname, objname, iface,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;warmRes=
et&quot;, &amp;error, &amp;reply, NULL);<br>&gt; &gt; + &nbsp; &nbsp;if (r =
&lt; 0) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, &quot;F=
ailed to reset BMC: %s\n&quot;, strerror(-r));<br>&gt; &gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;return -1;<br>&gt; &gt; + &nbsp; &nbsp;}</tt><br><br><tt>Retu=
rn needs to be one of the IPMI specified rc than a &quot;-1&quot;. May be I=
PMI=5FCC=5FINVALID is better suited here. ?</tt><br><tt>Also this has memor=
y leak on error. Need to free the 'error' and 'reply'.</tt><br><br><tt>Also=
, if this call results in BMC being rebooted, does this call ever return an=
d the reboot is done Async ?.</tt><br><tt><br>&gt; &gt; + &nbsp; &nbsp;prin=
tf(&quot;Warning: BMC is going down for reboot!\n&quot;);<br>&gt; &gt; + &n=
bsp; &nbsp;sd=5Fbus=5Ferror=5Ffree(&amp;error);<br>&gt; &gt; + &nbsp; &nbsp=
;reply =3D sd=5Fbus=5Fmessage=5Funref(reply);<br>&gt; &gt; +<br>&gt; &gt; +=
 &nbsp; &nbsp;return ipmi=5Frc;<br>&gt; &gt; +}<br>&gt; &gt; &nbsp;<br>&gt;=
 &gt; &nbsp;void register=5Fnetfn=5Foem=5Fpartial=5Fesel()<br>&gt; &gt; &nb=
sp;{<br>&gt; &gt; &nbsp; &nbsp; printf(&quot;Registering NetFn:[0x%X], Cmd:=
[0x%X]\n&quot;,NETFUN=5FOEM, <br>&gt; IPMI=5FCMD=5FPESEL);<br>&gt; &gt; &nb=
sp; &nbsp; ipmi=5Fregister=5Fcallback(NETFUN=5FOEM, IPMI=5FCMD=5FPESEL, NUL=
L, <br>&gt; ipmi=5Fibm=5Foem=5Fpartial=5Fesel);<br>&gt; &gt; +<br>&gt; &gt;=
 + &nbsp; &nbsp;printf(&quot;Registering NetFn:[0x%X], Cmd:[0x%X]\n&quot;, =
NETFUN=5FOEM, <br>&gt; IPMI=5FCMD=5FPREP=5FFW=5FUPDATE);<br>&gt; &gt; + &nb=
sp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FOEM, IPMI=5FCMD=5FPREP=5FFW=
=5FUPDATE, <br>&gt; NULL, ipmi=5Fibm=5Foem=5Fprep=5Ffw=5Fupdate);<br>&gt; &=
gt; +<br>&gt; &gt; &nbsp; &nbsp; return;<br>&gt; &gt; &nbsp;}<br>&gt; &gt; =
diff --git a/oemhandler.h b/oemhandler.h<br>&gt; &gt; index 9cc397f..71ae01=
c 100644<br>&gt; &gt; --- a/oemhandler.h<br>&gt; &gt; +++ b/oemhandler.h<br=
>&gt; &gt; @@ -8,6 +8,7 @@<br>&gt; &gt; &nbsp;// IPMI commands for net func=
tions.<br>&gt; &gt; &nbsp;enum ipmi=5Fnetfn=5Foem=5Fcmds<br>&gt; &gt; &nbsp=
;{<br>&gt; &gt; + &nbsp; &nbsp;IPMI=5FCMD=5FPREP=5FFW=5FUPDATE =3D 0x10,<br=
>&gt; &gt; &nbsp; &nbsp; &nbsp;IPMI=5FCMD=5FPESEL =3D 0xF0,<br>&gt; &gt; &n=
bsp;};<br>&gt; &gt; &nbsp;<br>&gt; <br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; o=
penbmc@lists.ozlabs.org<br>&gt; <a href=3D"https://lists.ozlabs.org/listinf=
o/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a><br></tt><BR>
</body></html>

--0__=EABBF5E2DFB365E38f9e8a93df938690918cEABBF5E2DFB365E3--
