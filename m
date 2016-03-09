Return-Path: <njames@us.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7D8601A010A
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2016 05:37:42 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 9 Mar 2016 11:37:40 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 9 Mar 2016 11:37:38 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id C56381FF0051
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 11:25:46 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
 ESMTP id u29IbbPX35979506
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 11:37:37 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u29IbamN019763
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 11:37:36 -0700
Received: from d50lp32.co.us.ibm.com (d50lp32.boulder.ibm.com [9.17.249.36])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u29IbY5I019664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 11:37:35 -0700
Message-Id: <201603091837.u29IbY5I019664@d03av05.boulder.ibm.com>
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 9 Mar 2016 11:37:35 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Wed, 9 Mar 2016 11:37:32 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 9 Mar 2016 18:37:24 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 9 Mar 2016 18:37:02 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016030918370050-404238 ;
 Wed, 9 Mar 2016 18:37:00 +0000 
To: "OpenBMC Patches" <openbmc-patches@stwcx.xyz>
In-Reply-To: <1457544655-29669-2-git-send-email-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH skeleton] Updated SCU88 register for Correct PCIe inventory
Cc: openbmc@lists.ozlabs.org, "Adi Gangidi" <adi.gangidi@rackspace.com>
From: "Norman James" <njames@us.ibm.com>
Date: Wed, 9 Mar 2016 18:37:01 +0000
X-Mailer: IBM Traveler 9.0.1.10 Build 201602251618_30 on behalf of device with
 id 6SMH5DIMQ152PEO781D47I1HGK,
 type 440 (ios) and description iPhone 5s:Apple-iPhone6C1/1304.15
 (OS 9)
X-KeepSent: E27F3252:CFA67AC1-00257F71:006643DD;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 19639
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBBF5E2DFF5C54D8f9e8a93df938690918c8FBBF5E2DFF5C54D"
Content-Disposition: inline
x-cbid: 16030918-0005-0000-0000-00001D50C1B3
X-IBM-ISS-SpamDetectors: Score=0.445263; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.445263; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005016; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00670943; UDB=6.00306569; UTC=2016-03-09
 18:37:08
x-cbparentid: 16030918-5090-0000-0000-000007845EFF
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
X-List-Received-Date: Wed, 09 Mar 2016 18:37:44 -0000


--0__=8FBBF5E2DFF5C54D8f9e8a93df938690918c8FBBF5E2DFF5C54D
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


That process is no longer ran.  All scu setup is done in kernel.   We
should probably remove that whole .c file from repository.


> On Mar 9, 2016, at 9:32 AM, OpenBMC Patches <openbmc-patches@stwcx.xyz>
wrote:
>
> From: Adi Gangidi <adi.gangidi@rackspace.com>
>
> Before This change:
> a) SCU 88 was double assigned, first to 0x01C000FF in line:97 and then to
0x01C0007F in line:100.
> b) Which meant (in both cases, some or all of) bits 7:0 were set to 1.
That is: We were reading : PWMx or VPIGx instead of GPIONx (GPIONx gives us
the PCIe inventory status, where x is bit number)
>
> After This Change:
> a) Got rid of the double assignment by commenting out the second SCU88
assignment
> b) Bits (7:0) of SCU 88 are set to 0 . (According to Page 111 of data
sheet these have to be set to 0 for us to to read GPION0 to GPIO N7 which
indicate if PCIe device is present )
>
> Description of pins 7:0 of SCU 88:
> 7 RW Enable PWM7 or VPIG7 function pin  (SCU90[5:4]=3D0x2 select Video pi=
n)
> 6 RW Enable PWM6 or VPIG6 function pin   (SCU90[5:4]=3D0x2 select Video
pin)
> 5 RW Enable PWM5 or VPIG5 function pin    (SCU90[5:4]!=3D0 select Video
pin)
> 4 RW Enable PWM4 or VPIG4 function pin     (SCU90[5:4]!=3D0 select Video
pin)
> 3 RW Enable PWM3 or VPIG3 function pin      (SCU90[5:4]!=3D0 select Video
pin)
> 2 RW Enable PWM2 or VPIG2 function pin        (SCU90[5:4]!=3D0 select Vid=
eo
pin)
> 1 RW Enable PWM1 or VPIG1 function pin        (SCU90[5:4]=3D0x3 select
Video pin)
> 0 RW Enable PWM0 or VPIG0 function pin         (SCU90[5:4]=3D0x3 select
Video pin)
> ---
> objects/control=5Fbmc=5Fbarreleye.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/objects/control=5Fbmc=5Fbarreleye.c
b/objects/control=5Fbmc=5Fbarreleye.c
> index ddfde88..0afc58d 100644
> --- a/objects/control=5Fbmc=5Fbarreleye.c
> +++ b/objects/control=5Fbmc=5Fbarreleye.c
> @@ -94,10 +94,10 @@ void reg=5Finit()
>    bmcreg =3D memmap(mem=5Ffd,GPIO=5FBASE);
>    devmem(bmcreg+0x84,0x00fff0c0); //Enable UART1
>    devmem(bmcreg+0x80,0xCB000000);
> -    devmem(bmcreg+0x88,0x01C000FF);
> +    devmem(bmcreg+0x88,0x01C00000);        //Changed Assigned value to
SCU 88 for PCie inventory to work
>    devmem(bmcreg+0x8c,0xC1C000FF);
>    devmem(bmcreg+0x90,0x003FA009);
> -    devmem(bmcreg+0x88,0x01C0007F);
> +    // devmem(bmcreg+0x88,0x01C0007F);    // Commented out to prevent
dual assignment of SCU88
>
>
>    bmcreg =3D memmap(mem=5Ffd,COM=5FBASE);
> --
> 2.7.1
>
>
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--0__=8FBBF5E2DFF5C54D8f9e8a93df938690918c8FBBF5E2DFF5C54D
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>That process is no longer ran.  All scu setup is done in ker=
nel.   We should probably remove that whole .c file from repository.<br><br=
><br>&gt; On Mar 9, 2016, at 9:32 AM, OpenBMC Patches &lt;openbmc-patches@s=
twcx.xyz&gt; wrote:<br>&gt; <br>&gt; From: Adi Gangidi &lt;adi.gangidi@rack=
space.com&gt;<br>&gt; <br>&gt; Before This change:<br>&gt; a) SCU 88 was do=
uble assigned, first to 0x01C000FF in line:97 and then to 0x01C0007F in lin=
e:100.<br>&gt; b) Which meant (in both cases, some or all of) bits 7:0 were=
 set to 1. That is: We were reading : PWMx or VPIGx instead of GPIONx (GPIO=
Nx gives us the PCIe inventory status, where x is bit number)<br>&gt; <br>&=
gt; After This Change:<br>&gt; a) Got rid of the double assignment by comme=
nting out the second SCU88 assignment<br>&gt; b) Bits (7:0) of SCU 88 are s=
et to 0 . (According to Page 111 of data sheet these have to be set to 0 fo=
r us to to read GPION0 to GPIO N7 which indicate if PCIe device is present =
)<br>&gt; <br>&gt; Description of pins 7:0 of SCU 88:<br>&gt; 7 RW Enable P=
WM7 or VPIG7 function pin  (SCU90[5:4]=3D0x2 select Video pin)<br>&gt; 6 RW=
 Enable PWM6 or VPIG6 function pin   (SCU90[5:4]=3D0x2 select Video pin)<br=
>&gt; 5 RW Enable PWM5 or VPIG5 function pin    (SCU90[5:4]!=3D0 select Vid=
eo pin)<br>&gt; 4 RW Enable PWM4 or VPIG4 function pin     (SCU90[5:4]!=3D0=
 select Video pin)<br>&gt; 3 RW Enable PWM3 or VPIG3 function pin      (SCU=
90[5:4]!=3D0 select Video pin)<br>&gt; 2 RW Enable PWM2 or VPIG2 function p=
in        (SCU90[5:4]!=3D0 select Video pin)<br>&gt; 1 RW Enable PWM1 or VP=
IG1 function pin        (SCU90[5:4]=3D0x3 select Video pin)<br>&gt; 0 RW En=
able PWM0 or VPIG0 function pin         (SCU90[5:4]=3D0x3 select Video pin)=
<br>&gt; ---<br>&gt; objects/control=5Fbmc=5Fbarreleye.c | 4 ++--<br>&gt; 1=
 file changed, 2 insertions(+), 2 deletions(-)<br>&gt; <br>&gt; diff --git =
a/objects/control=5Fbmc=5Fbarreleye.c b/objects/control=5Fbmc=5Fbarreleye.c=
<br>&gt; index ddfde88..0afc58d 100644<br>&gt; --- a/objects/control=5Fbmc=
=5Fbarreleye.c<br>&gt; +++ b/objects/control=5Fbmc=5Fbarreleye.c<br>&gt; @@=
 -94,10 +94,10 @@ void reg=5Finit()<br>&gt;    bmcreg =3D memmap(mem=5Ffd,G=
PIO=5FBASE);<br>&gt;    devmem(bmcreg+0x84,0x00fff0c0); //Enable UART1<br>&=
gt;    devmem(bmcreg+0x80,0xCB000000);<br>&gt; -    devmem(bmcreg+0x88,0x01=
C000FF);<br>&gt; +    devmem(bmcreg+0x88,0x01C00000);        //Changed Assi=
gned value to SCU 88 for PCie inventory to work<br>&gt;    devmem(bmcreg+0x=
8c,0xC1C000FF);<br>&gt;    devmem(bmcreg+0x90,0x003FA009);<br>&gt; -    dev=
mem(bmcreg+0x88,0x01C0007F);<br>&gt; +    // devmem(bmcreg+0x88,0x01C0007F)=
;    // Commented out to prevent dual assignment of SCU88<br>&gt; <br>&gt; =
<br>&gt;    bmcreg =3D memmap(mem=5Ffd,COM=5FBASE);<br>&gt; -- <br>&gt; 2.7=
.1<br>&gt; <br>&gt; <br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; openbmc@lists.oz=
labs.org<br>&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc">http=
s://lists.ozlabs.org/listinfo/openbmc</a><br><BR>
</body></html>

--0__=8FBBF5E2DFF5C54D8f9e8a93df938690918c8FBBF5E2DFF5C54D--
