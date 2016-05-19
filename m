Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9Kps4WVBzDqHH
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 15:47:49 +1000 (AEST)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Thu, 19 May 2016 15:47:47 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 19 May 2016 15:47:46 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 84A002BB005B
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 15:47:25 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4J5lCkM10027492
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 15:47:20 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4J5kKtH017664
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 15:46:20 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4J5kJ9Q016207; Thu, 19 May 2016 15:46:20 +1000
Received: from camb691 (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 80872A038F;
 Thu, 19 May 2016 15:45:01 +1000 (AEST)
Date: Thu, 19 May 2016 15:44:50 +1000
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH btbridge v4 1/6] Initialise variable to avoid using it
 uninitialised
Message-ID: <20160519154450.3a1c5c0a@camb691>
In-Reply-To: <1463627449.2703.140.camel@aj.id.au>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462324208-11150-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1463627449.2703.140.camel@aj.id.au>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051905-0021-0000-0000-000009B034CB
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
X-List-Received-Date: Thu, 19 May 2016 05:47:49 -0000

On Thu, 19 May 2016 12:40:49 +0930
Andrew Jeffery <andrew@aj.id.au> wrote:

> Hi Cyril,
>=20
> On Tue, 2016-05-03 at 20:10 -0500, OpenBMC Patches wrote:
> > From: Cyril Bur <cyril.bur@au1.ibm.com>
> >=20
> > Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
> > ---
> > =C2=A0btbridged.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/btbridged.c b/btbridged.c
> > index fe692bb..3e261a9 100644
> > --- a/btbridged.c
> > +++ b/btbridged.c
> > @@ -489,7 +489,7 @@ static int dispatch_sd_bus(struct btbridged_context=
 *context)
> > =C2=A0static int dispatch_bt(struct btbridged_context *context)
> > =C2=A0{
> > =C2=A0	int err =3D 0;
> > -	int r;
> > +	int r =3D 0;
> > =C2=A0
> > =C2=A0	assert(context);
> > =C2=A0 =20
>=20
> Building with this patch and native GCC* gives errors:
>=20
>     $ KERNEL_HEADERS=3D../../linux/ast2400/include/uapi/ make
>     cc=C2=A0=C2=A0-Wall -O2 -g -I../../linux/ast2400/include/uapi/=C2=A0=
=C2=A0=C2=A0=C2=A0btbridged.c=C2=A0=C2=A0-lsystemd -o btbridged
>     btbridged.c: In function =E2=80=98main=E2=80=99:
>     btbridged.c:590:6: warning: =E2=80=98r=E2=80=99 may be used uninitial=
ized in this function [-Wmaybe-uninitialized]
>     =C2=A0=C2=A0=C2=A0if (r < 0)
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
>     btbridged.c:342:6: note: =E2=80=98r=E2=80=99 was declared here
>     =C2=A0 int r, len;
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
>=20
> That's weird, because the note isn't relevant to the function of line
> that generated the warning. However, the 'r' defined in=C2=A0bt_host_writ=
e()
> suffers the same initialisation issue. Initialising it gives me a build
> with no warnings so maybe it's worth doing that here also?
>=20

Yeah, GCC seems to be getting a bit confused. I'm usually not in favour of
putting in stuff to shut the warnings up but these are just so odd that I'm=
 at
a loss.

Your suggestion works, lets just do that and forget about it.

Thanks

> Otherwise,
>=20
> Acked-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> Cheers,
>=20
> Andrew
>=20
> * $ gcc --version
> gcc (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413
