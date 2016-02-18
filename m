Return-Path: <miltonm@us.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BB7A91A0617
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2016 09:50:33 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 18 Feb 2016 15:50:31 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 18 Feb 2016 15:50:29 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 7CC231FF001F
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 15:38:38 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1IMoSo522216852
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 15:50:28 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1IMoSEs007632
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 15:50:28 -0700
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1IMoSEY007619
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 15:50:28 -0700
Message-Id: <201602182250.u1IMoSEY007619@d03av03.boulder.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 18 Feb 2016 15:50:28 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 18 Feb 2016 15:50:27 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 18 Feb 2016 22:50:25 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 18 Feb 2016 22:50:23 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016021822515792-505926 ;
 Thu, 18 Feb 2016 22:51:57 +0000 
In-Reply-To: <1455245970.24478.26.camel@aj.id.au>
Subject: Re: [PATCH linux] mtd: spi-nor: aspeed-smc: Use io string accessors
 to fifo
From: "Milton Miller II" <miltonm@us.ibm.com>
To: andrew@aj.id.au
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 18 Feb 2016 22:50:21 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1455245970.24478.26.camel@aj.id.au>,
 <1455162625-11142-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455162625-11142-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_02082016 February 08, 2016
X-LLNOutbound: False
X-Disclaimed: 1715
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 16021822-0009-0000-0000-000012835766
X-IBM-ISS-SpamDetectors: Score=0.40962; BY=0.064191; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.40962; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004937; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000145; SDB=6.00661696; UDB=6.00301021; UTC=2016-02-18
 22:50:25
x-cbparentid: 16021822-0598-0000-0000-0000067D186A
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
X-List-Received-Date: Thu, 18 Feb 2016 22:50:35 -0000


Around 02/11/2016 08:59PM in some timezone,  Andrew Jeffery wrote:
> Hi Milton,
>=20
> Excuse the unnecessary quote markers that might appear through the
> patch, my mail client (Evolution) seems to have a mind of its own
> sometimes. Starting to shave that yak. Anyway.

It can't be worse than me manually quoting in smart cloud notes client.

>=20
> As an aside I've tested an earlier version of the code and confirmed
> the approach works (i.e. no JFFS2 corruption on re-mount).

Yea.


> On Wed, 2016-02-10 at 21:50 -0600, OpenBMC Patches wrote:
>> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>>=20
>> Make and use new routines to access the fifo when in user mode.
>> Instead of using memcpy=5Ffromio, base the new routines on the io
>>  port string accessors.
>>
...
> typo: unsigned
fixed


>> +static void *ins=5Falign(unsigned long io, void *buf, size=5Ft len)
>> +{
>> +> 	> BUILD=5FBUG=5FON(0 & len & ~3);
>=20
> Should just be BUG=5FON()? Given that you disabled it with '0 &', do we
> want it at all?

It should definitively not be a driver BUG that crashes the whole system.  =
If=20
you need I can search for Linus' quote about the use of BUG in drivers.

It can be killed.

>> + */
>> +
>> +static void aspeed=5Fsmc=5Ffrom=5Ffifo(void *buf, const void =5F=5Fiome=
m *iop, size=5Ft len)
>> +{
>> +> 	> unsigned long io =3D (=5F=5Fforce unsigned long)iop;
>> +
...
>> +> 	> 	> buf =3D ins=5Falign(io, buf, len & 1);
>> +> 	> } else {
>> +> 	> 	> size=5Ft l =3D (4 - (unsigned long)buf) & 3;
>> +
>> +> 	> 	> l =3D min(l, len);
>> +> 	> 	> buf =3D ins=5Falign(io, buf, l);
>> +> 	> 	> len -=3D l;
>> +
>> +> 	> 	> if (len >=3D 4) {
>> +> 	> 	> 	> insl(io, buf, len >> 2);
>> +> 	> 	> 	> buf +=3D len & ~3;
>> +> 	> 	> }
>> +> 	> 	> buf =3D ins=5Falign(io, buf, len & 3);
>> +> 	> }
>=20
> So I've tried deduplicating this function - the code in the latter two
> cases is largely the same bar the magic numbers and insw vs insl. I've
> come up with the code below (note that I haven't actually probed the
> modifications), but I'm not convinced it's much of a win in terms of
> clarity:
>=20
> /* Is this available somewhere else? Rusty doesn't think so.
> =C2=A0* Probably needs a better name (first set value) */
> #define FS=5FVAL(x) ((x) & ~((x) - 1))

That is a horrible name!  What is this magic file system value about?

>=20
> static void aspeed=5Fsmc=5Ffrom=5Ffifo(void *buf, const void =5F=5Fiomem =
*iop, size=5Ft len)
> {
> 	unsigned long io =3D (=5F=5Fforce unsigned long)iop;
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 align =3D FS=5FVAL((io & 7) | 4); /* =
align is one of 1, 2 or 4 */

I see masking & 7 and comment about being 1, 2, or 4 and think:

That's not true, the port bit doesn't always have bit 4 on when
the others are off.

Only after a long pause coming back do I see the | 4, and then I have
to go back to a macro above to figure out is it before or after the
fancy math.


> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 mask =3D align - 1;
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0size=5Ft to=5Falign =3D align - ((unsign=
ed long)buf) & mask);
>=20
> 	if (align =3D=3D 1) {
> 		insb(io, buf, len);
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
> 	}
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0to=5Falign =3D min(to=5Falign, len);
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D ins=5Falign(io, buf, to=5Falign);
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0len -=3D to=5Falign;
> 	if (len >=3D align) {
> 		size=5Ft nr=5Fblocks =3D len / align;
> 		if (align =3D=3D 2) {
> 			insw(io, buf, nr=5Fblocks);
> 		} else {
> 			insl(io, buf, nr=5Fblocks);
> 		}
> 		buf +=3D (nr=5Fblocks * align);
> 	}
> =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D ins=5Falign(io, buf, len & mask);
>=20
> Is it worth it? A similar approach can be taken for
> aspeed=5Fsmc=5Fto=5Ffifo() if so.

So I think this approach hides what is supposed to happen
in the case we are actually using.

I decided on a different approach to the remove the duplication:

Don't add code that will not be used.

We always pass a 4 byte aligned port.  Rather than bug,=20
just call insb if the io port is not aligned. =20

Then remove the ins=5Falign and outs=5Falign function and=20
bring them inline, but expand top and bottom call sites=20
to order the byte vs (half)word transfers to remove
the get/put=5Funaligned pessimisation since we are testing=20
the alignemnt and can choose the order by context.

I then removed the updates to buf and len that were dead
in the tail code.

With 2 one-line comments and no white space it fits in=20
80x25 which means you can see all the code after the=20
preliminary 0 length and unaligned checks on one screen.


>=20
> As for whether there's a better approach short of fixing mmiocpy(), I
> don't know, so no further suggestions really (i.e. I guess we just live
> with the IO=5FSPACE=5FLIMIT jiggery-pokery).
>=20

When I started to go back and comment the assembly I figured out the
memcpy has 2 places it can stutter:

It first aligns source to a word boundary with byte copies.  After that=20
it works on aligning the destination.  It will do an extra load at this
point if the destination is not aligned to the source.  Then it sometimes=20
aligns to cache lines (depends on core if it helps), then transfers
blocks, back to words, then if there are upto 3 bytes it backs up and
switches back to bytes (reading bytes a second time here).

So there are two places to fix, one stutters output and one input.

I thought about switching read/write to engine mode.  I probably still
will sometime.  The stutters will cause it to stop and resend the=20
address slowing down the access.  Hmm, that might cause double write=20
attempt at the stutter...

Anyways, see what you think of the current code.

Thanks,
milton
