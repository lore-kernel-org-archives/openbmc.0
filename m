Return-Path: <anoo@us.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r5rr44mL9zDq7s
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 23:51:48 +1000 (AEST)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 13 May 2016 07:51:45 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 13 May 2016 07:51:43 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 0F22319D8051
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 07:51:25 -0600 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4DDpgjW38404282
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 13:51:42 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4DDpgkx004766
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 09:51:42 -0400
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4DDpf9u004682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 09:51:42 -0400
Message-Id: <201605131351.u4DDpf9u004682@d01av01.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 13 May 2016 07:51:41 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.93)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 13 May 2016 07:51:38 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: anoo@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <anoo@us.ibm.com>;
 Fri, 13 May 2016 13:51:37 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 13 May 2016 13:51:35 -0000
Received: from us1a3-mail52.a3.dal06.isc4sb.com ([10.146.77.168])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016051313513551-863467 ;
 Fri, 13 May 2016 13:51:35 +0000 
In-Reply-To: <1463080219-26647-2-git-send-email-openbmc-patches@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH ipmi-fru-parser] Increase size of buffer length variable
From: "Adriana Kobylak" <anoo@us.ibm.com>
Date: Fri, 13 May 2016 08:51:31 -0500
References: <1463080219-26647-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463080219-26647-2-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
X-KeepSent: 33F5EB3A:EA5A18B1-86257FB2:004BBD87;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT September 15, 2015
X-LLNOutbound: False
X-Disclaimed: 30107
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 004C1E7886257FB2_="
x-cbid: 16051313-8236-0000-0000-000030CE6ECC
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0.256412; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005276; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000166; SDB=6.00701580; UDB=6.00324848; UTC=2016-05-13
 13:51:36
x-cbparentid: 16051313-3202-0000-0000-000000442D77
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 May 2016 13:51:49 -0000


--=_alternative 004C1E7886257FB2_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"

The size of size=5Ft is different in 32 and 64-bit architectures. There has=
=20
been issues in the past in op-build where we had to change size=5Ft to=20
uint32=5Ft to support compiling in 64-bit. So thought I'd make the change=20
consistent and change the length to uint32=5Ft.


From:   Daniel Axtens <notifications@github.com>
To:     openbmc/ipmi-fru-parser <ipmi-fru-parser@noreply.github.com>
Cc:     Adriana Kobylak/Austin/IBM@IBMUS, Author=20
<author@noreply.github.com>
Date:   05/12/2016 06:16 PM
Subject:        Re: [openbmc/ipmi-fru-parser] Increase size of buffer=20
length variable (#15)



In frup.c:
> @@ -948,7 +948,7 @@ parse=5Ffru (const void* msgbuf, sd=5Fbus=5Fmessage* =

vpdtbl)
>    return (rv);
>  }
>=20
> -int parse=5Ffru=5Farea (const uint8=5Ft area, const void* msgbuf, const =

uint8=5Ft len, sd=5Fbus=5Fmessage* vpdtbl)
> +int parse=5Ffru=5Farea (const uint8=5Ft area, const void* msgbuf, const =

uint32=5Ft len, sd=5Fbus=5Fmessage* vpdtbl)

Is there any reason we couldn't standardise on size=5Ft here?



OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote on 05/12/2016 02:10:19=20
PM:

> From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
> To: openbmc@lists.ozlabs.org
> Cc: Adriana Kobylak/Austin/IBM@IBMUS
> Date: 05/12/2016 02:10 PM
> Subject: [PATCH ipmi-fru-parser] Increase size of buffer length variable
>=20
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> The latest Barreleye vpd contains additional custom fields in one
> of the board sections, pushing the size of the buffer over 0x100.
>=20
> The current variable that stores the buffer size is set to be
> uint8=5Ft which doesn't fit the extended size. Changing it to uint32=5Ft.
>=20
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>  fru-area.H | 4 ++--
>  frup.c     | 2 +-
>  frup.h     | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/fru-area.H b/fru-area.H
> index 82206bb..058e438 100644
> --- a/fru-area.H
> +++ b/fru-area.H
> @@ -26,7 +26,7 @@ class ipmi=5Ffru
>          std::string iv=5Fname;
>=20
>          // Length of a specific fru area.
> -        size=5Ft  iv=5Flen;
> +        uint32=5Ft  iv=5Flen;
>=20
>          // Special bit for BMC readable eeprom only.
>          bool iv=5Fbmc=5Ffru;
> @@ -94,7 +94,7 @@ class ipmi=5Ffru
>          }
>=20
>          // Returns the length.
> -        size=5Ft get=5Flen() const
> +        uint32=5Ft get=5Flen() const
>          {
>              return iv=5Flen;
>          }
> diff --git a/frup.c b/frup.c
> index 7bdf35f..4df7266 100644
> --- a/frup.c
> +++ b/frup.c
> @@ -948,7 +948,7 @@ parse=5Ffru (const void* msgbuf, sd=5Fbus=5Fmessage* =

vpdtbl)
>    return (rv);
>  }
>=20
> -int parse=5Ffru=5Farea (const uint8=5Ft area, const void* msgbuf, const =

> uint8=5Ft len, sd=5Fbus=5Fmessage* vpdtbl)
> +int parse=5Ffru=5Farea (const uint8=5Ft area, const void* msgbuf, const =

> uint32=5Ft len, sd=5Fbus=5Fmessage* vpdtbl)
>  {
>    int ret =3D 0;
>    int rv =3D -1;
> diff --git a/frup.h b/frup.h
> index 8400951..094d223 100644
> --- a/frup.h
> +++ b/frup.h
> @@ -10,7 +10,7 @@ extern "C"
>=20
>  /* Parse an IPMI write fru data message into a dictionary=20
> containing name value pair of VPD entries.*/
>  int parse=5Ffru (const void* msgbuf, sd=5Fbus=5Fmessage* vpdtbl);
> -int parse=5Ffru=5Farea (const uint8=5Ft area, const void* msgbuf, const =

> uint8=5Ft len, sd=5Fbus=5Fmessage* vpdtbl);
> +int parse=5Ffru=5Farea (const uint8=5Ft area, const void* msgbuf, const =

> uint32=5Ft len, sd=5Fbus=5Fmessage* vpdtbl);
>=20
>  #ifdef =5F=5Fcplusplus
>  }
> --=20
> 2.8.1
>=20
>=20



--=_alternative 004C1E7886257FB2_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="US-ASCII"

<font size=3D2 face=3D"sans-serif">The size of size=5Ft is different in 32 =
and
64-bit architectures. There has been issues in the past in op-build where
we had to change size=5Ft to uint32=5Ft to support compiling in 64-bit. So
thought I'd make the change consistent and change the length to uint32=5Ft.=
</font><br><br><br><font size=3D2 face=3D"sans-serif">From: &nbsp; &nbsp; &=
nbsp; &nbsp;Daniel
Axtens &lt;notifications@github.com&gt;</font><br><font size=3D2 face=3D"sa=
ns-serif">To: &nbsp; &nbsp; &nbsp; &nbsp;openbmc/ipmi-fru-parser
&lt;ipmi-fru-parser@noreply.github.com&gt;</font><br><font size=3D2 face=3D=
"sans-serif">Cc: &nbsp; &nbsp; &nbsp; &nbsp;Adriana
Kobylak/Austin/IBM@IBMUS, Author &lt;author@noreply.github.com&gt;</font><b=
r><font size=3D2 face=3D"sans-serif">Date: &nbsp; &nbsp; &nbsp; &nbsp;05/12=
/2016
06:16 PM</font><br><font size=3D2 face=3D"sans-serif">Subject: &nbsp; &nbsp=
; &nbsp; &nbsp;Re:
[openbmc/ipmi-fru-parser] Increase size of buffer length variable (#15)</fo=
nt><br><br><br><br><font size=3D2 face=3D"sans-serif">In frup.c:</font><br>=
<font size=3D2 face=3D"sans-serif">&gt; @@ -948,7 +948,7 @@ parse=5Ffru (co=
nst
void* msgbuf, sd=5Fbus=5Fmessage* vpdtbl)</font><br><font size=3D2 face=3D"=
sans-serif">&gt; &nbsp; &nbsp;return (rv);</font><br><font size=3D2 face=3D=
"sans-serif">&gt; &nbsp;}</font><br><font size=3D2 face=3D"sans-serif">&gt;=
 &nbsp;</font><br><font size=3D2 face=3D"sans-serif">&gt; -int parse=5Ffru=
=5Farea (const uint8=5Ft
area, const void* msgbuf, const uint8=5Ft len, sd=5Fbus=5Fmessage* vpdtbl)<=
/font><br><font size=3D2 face=3D"sans-serif">&gt; +int parse=5Ffru=5Farea (=
const uint8=5Ft
area, const void* msgbuf, const uint32=5Ft len, sd=5Fbus=5Fmessage* vpdtbl)=
</font><br><br><font size=3D2 face=3D"sans-serif">Is there any reason we co=
uldn't standardise
on size=5Ft here?</font><br><br><br><br><tt><font size=3D2>OpenBMC Patches =
&lt;openbmc-patches@stwcx.xyz&gt;
wrote on 05/12/2016 02:10:19 PM:<br><br>&gt; From: OpenBMC Patches &lt;open=
bmc-patches@stwcx.xyz&gt;</font></tt><br><tt><font size=3D2>&gt; To: openbm=
c@lists.ozlabs.org</font></tt><br><tt><font size=3D2>&gt; Cc: Adriana Kobyl=
ak/Austin/IBM@IBMUS</font></tt><br><tt><font size=3D2>&gt; Date: 05/12/2016=
 02:10 PM</font></tt><br><tt><font size=3D2>&gt; Subject: [PATCH ipmi-fru-p=
arser] Increase size
of buffer length variable</font></tt><br><tt><font size=3D2>&gt; <br>&gt; F=
rom: Adriana Kobylak &lt;anoo@us.ibm.com&gt;<br>&gt; <br>&gt; The latest Ba=
rreleye vpd contains additional custom fields in one<br>&gt; of the board s=
ections, pushing the size of the buffer over 0x100.<br>&gt; <br>&gt; The cu=
rrent variable that stores the buffer size is set to be<br>&gt; uint8=5Ft w=
hich doesn't fit the extended size. Changing it to uint32=5Ft.<br>&gt; <br>=
&gt; Signed-off-by: Adriana Kobylak &lt;anoo@us.ibm.com&gt;<br>&gt; ---<br>=
&gt; &nbsp;fru-area.H | 4 ++--<br>&gt; &nbsp;frup.c &nbsp; &nbsp; | 2 +-<br=
>&gt; &nbsp;frup.h &nbsp; &nbsp; | 2 +-<br>&gt; &nbsp;3 files changed, 4 in=
sertions(+), 4 deletions(-)<br>&gt; <br>&gt; diff --git a/fru-area.H b/fru-=
area.H<br>&gt; index 82206bb..058e438 100644<br>&gt; --- a/fru-area.H<br>&g=
t; +++ b/fru-area.H<br>&gt; @@ -26,7 +26,7 @@ class ipmi=5Ffru<br>&gt; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;std::string iv=5Fname;<br>&gt; &nbsp;<br>&gt;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Length of a specific fru area.<br>&gt=
; - &nbsp; &nbsp; &nbsp; &nbsp;size=5Ft &nbsp;iv=5Flen;<br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp;uint32=5Ft &nbsp;iv=5Flen;<br>&gt; &nbsp;<br>&gt; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;// Special bit for BMC readable
eeprom only.<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool iv=5Fbmc=5Ffru;=
<br>&gt; @@ -94,7 +94,7 @@ class ipmi=5Ffru<br>&gt; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Re=
turns the length.<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;size=5Ft get=5Flen()=
 const<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;uint32=5Ft get=5Flen() const<br=
>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;return iv=5Flen;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;}<br>&gt; diff --git a/frup.c b/frup.c<br>&gt; index 7bdf35f..4df726=
6 100644<br>&gt; --- a/frup.c<br>&gt; +++ b/frup.c<br>&gt; @@ -948,7 +948,7=
 @@ parse=5Ffru (const void* msgbuf, sd=5Fbus=5Fmessage*
vpdtbl)<br>&gt; &nbsp; &nbsp;return (rv);<br>&gt; &nbsp;}<br>&gt; &nbsp;<br=
>&gt; -int parse=5Ffru=5Farea (const uint8=5Ft area, const void* msgbuf, co=
nst
<br>&gt; uint8=5Ft len, sd=5Fbus=5Fmessage* vpdtbl)<br>&gt; +int parse=5Ffr=
u=5Farea (const uint8=5Ft area, const void* msgbuf, const
<br>&gt; uint32=5Ft len, sd=5Fbus=5Fmessage* vpdtbl)<br>&gt; &nbsp;{<br>&gt=
; &nbsp; &nbsp;int ret =3D 0;<br>&gt; &nbsp; &nbsp;int rv =3D -1;<br>&gt; d=
iff --git a/frup.h b/frup.h<br>&gt; index 8400951..094d223 100644<br>&gt; -=
-- a/frup.h<br>&gt; +++ b/frup.h<br>&gt; @@ -10,7 +10,7 @@ extern &quot;C&q=
uot;<br>&gt; &nbsp;<br>&gt; &nbsp;/* Parse an IPMI write fru data message i=
nto a dictionary <br>&gt; containing name value pair of VPD entries.*/<br>&=
gt; &nbsp;int parse=5Ffru (const void* msgbuf, sd=5Fbus=5Fmessage* vpdtbl);=
<br>&gt; -int parse=5Ffru=5Farea (const uint8=5Ft area, const void* msgbuf,=
 const
<br>&gt; uint8=5Ft len, sd=5Fbus=5Fmessage* vpdtbl);<br>&gt; +int parse=5Ff=
ru=5Farea (const uint8=5Ft area, const void* msgbuf, const
<br>&gt; uint32=5Ft len, sd=5Fbus=5Fmessage* vpdtbl);<br>&gt; &nbsp;<br>&gt=
; &nbsp;#ifdef =5F=5Fcplusplus<br>&gt; &nbsp;}<br>&gt; -- <br>&gt; 2.8.1<br=
>&gt; <br>&gt; <br></font></tt><BR>
--=_alternative 004C1E7886257FB2_=--
