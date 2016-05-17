Return-Path: <andrew@aj.id.au>
Received: from homiemail-a75.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7yLV2dpxzDq66
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 10:06:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=cW9nY2rP; 
 dkim-atps=neutral
Received: from homiemail-a75.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTP id ABCCB5EC07C;
 Mon, 16 May 2016 17:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=VjN8bUFG3D16kw+DdnIlX
 Mxi/8U=; b=cW9nY2rPHWJfaxRNMENqPqddzoxrZRkNzMhnjpkTOJRgNkNnS7FCE
 iqkX5C8A4za2C7OdLeY6VUBv90anmANEXiPt4qT3lFEDXuekbXVXi5M+NWe73xs6
 Cy2+d2SsBK5ouydNoZb5HEGbqWBPGQT8eQSSMwEy4a0vB/T9xCjGnI=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTPSA id 555195EC072;
 Mon, 16 May 2016 17:06:54 -0700 (PDT)
Message-ID: <1463443604.2703.74.camel@aj.id.au>
Subject: Re: [PATCH phosphor-host-ipmid v2] Handle errors finding
 openbmc_path #75
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Nan KX Li <bjlinan@cn.ibm.com>
Cc: openbmc@lists.ozlabs.org, OpenBMC Patches <openbmc-patches@stwcx.xyz>
Date: Tue, 17 May 2016 09:36:44 +0930
In-Reply-To: <OFC9B509DC.8C0346F0-ON48257FB5.002F5961-48257FB5.004DE485@notes.na.collabserv.com>
References: <1463140845-1854-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463140845-1854-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1463365542.2703.68.camel@aj.id.au>
 <OFC9B509DC.8C0346F0-ON48257FB5.002F5961-48257FB5.004DE485@notes.na.collabserv.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-IVoR0ETj9VCUpBIAQkhR"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 17 May 2016 00:06:59 -0000


--=-IVoR0ETj9VCUpBIAQkhR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 2016-05-16 at 22:10 +0800, Nan KX Li wrote:
> Thanks Andrew.=C2=A0
> I think you are right. I'll improve my code accordingly. Also I give some=
 comments below.
>=20
>=20
> Regards,
>=20
> William Li ( Li Nan, =E6=9D=8E=E6=A5=A0 )=C2=A0
> =C2=A0 =C2=A0
>=20
> Firmware Engineering Professional
> OpenPower AE Team | IBM System & Technology Lab
> Mobile: +86-186-1081 6605
>=20
> Beijing, China
>=20
>=20
>=20
> From: =C2=A0 =C2=A0 =C2=A0 =C2=A0Andrew Jeffery <andrew@aj.id.au>
> To: =C2=A0 =C2=A0 =C2=A0 =C2=A0OpenBMC Patches <openbmc-patches@stwcx.xyz=
>, openbmc@lists.ozlabs.org
> Cc: =C2=A0 =C2=A0 =C2=A0 =C2=A0Nan KX Li/China/IBM@IBMCN
> Date: =C2=A0 =C2=A0 =C2=A0 =C2=A005/16/2016 10:27
> Subject: =C2=A0 =C2=A0 =C2=A0 =C2=A0Re: [PATCH phosphor-host-ipmid v2] Ha=
ndle errors finding openbmc_path #75
>=20
>=20
>=20
> > Hi Nan Li,
> >=C2=A0
> > Thanks for the patch. I've had a look at the files you're modifying and
> > it seems like the error handling is ripe for improvement beyond the
> > issues you've fixed. However, resolving those problems is probably
> > beyond the scope of your patch, so never mind that.
> >=C2=A0
> > On Fri, 2016-05-13 at 07:00 -0500, OpenBMC Patches wrote:
> > > From: Nan Li <bjlinan@cn.ibm.com>
> > >=C2=A0
> > > 1.Check return value properly.
> > >=C2=A0
> > > Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
> > > ---
> > > =C2=A0ipmid.C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =
10 ++++++++++
> > > =C2=A0sensorhandler.C |=C2=A0=C2=A09 ++++++++-
> > > =C2=A02 files changed, 18 insertions(+), 1 deletion(-)
> > >=C2=A0
> > > diff --git a/ipmid.C b/ipmid.C
> > > index 728ba0b..413c2b7 100644
> > > --- a/ipmid.C
> > > +++ b/ipmid.C
> > > @@ -565,6 +565,11 @@ int set_sensor_dbus_state_s(uint8_t number,=C2=
=A0
> > const char *method, const char *valu
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r =3D find_openbmc_path("SENSOR", numbe=
r, &a);
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0if (r < 0) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fprintf(stderr, "Fai=
led to find Sensor 0x%02x\n", number);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto final;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> >=C2=A0
> > We jump to the final label which is consistent with the existing error
> > handling, but we don't appear to need any of the clean-up that's done
> > there. Maybe we should just return instead?
> >=C2=A0
> > If we return, we need to return a value. Looking at the existing code
> > it seems that 0 is returned regardless of whether an error has
> > occurred. This doesn't seem useful (i.e. should this just be a void
> > function?), but also means that you don't need to choose an error
> > value...
> >=C2=A0
>=20
> I think that changing it to a void function will lead to more code change=
, like struct lookup_t[].=C2=A0
> I'm not sure if those change are acceptable. so I prefer to keep things a=
s they are.

Yeah, I agree. This is the kind of thing I was referring to as in my
opening paragraph - it'd be nice to clean it up but I wouldn't bother
with that here. I think returning 0 should be enough.

Cheers,

Andrew
--=-IVoR0ETj9VCUpBIAQkhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXOmCUAAoJEJ0dnzgO5LT5cMUP/0MBaxugEf7UekxdSuVthkU7
yJGtvv7NYqKq/l23B2uehMxt86D6x5MmRvKZ4Rl6d0nFD0Wr2QApD6QmZ9ECcieq
njDYOyCIzmdqvmqDl8B8w3l9bK0T3UKaVdCHGQHOMwBCSkkvuUeBlGnmx5L2W9EG
BsBAgP6PU+fShpEbWfDghYAeyR7efVV9RQ9NgpSNPdzZ5/ZmHh3ep9A82R+YErpl
L1tF4nKTECfZ4L5k5nBkJtBAKe0pQKTzmpF9o7uXSwNYXnDMTmYNhY1M1NXb/bX7
7r9ULcHvBoHQvHDKTIHdPTtBOTE7Pdgbt5H3I43h8ImDjfsqunB2dErXKyxu70KJ
gZHLlFWqvehf+VL370p5tJzGZN71+BXtB77rny7cNhsMWfHKxRrbFOfehx0H5MHx
QqL/ADMRN+yu+RAp0suqWCs6OcqmlsNdmIgpsRYLl0gX/hNmrNdSMrVQICdS78LJ
5jf/TCUCFuRJzfyV2/aBGV4UtFjkkYqjhsoTG2TeNbEiGprdbkG49W1jSUKiUtQA
KXAuY85AnPtphZe33Cd8Dpzt44C8BGeVXou5j0mnLVGLoZgEhWKSB5OxPjhP5lYY
yoxaTtGaw53U0j9rvNfaj4Sj4Rt86ff4g8pjXGTLD/8Rp0oOrTnmpVdEq/DGvQ2Y
/y6wWbg5dHD2ZKk3DOTi
=eutn
-----END PGP SIGNATURE-----

--=-IVoR0ETj9VCUpBIAQkhR--
