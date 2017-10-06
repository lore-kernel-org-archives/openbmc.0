Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="W0xrfEo1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NklsQyb8"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7WMz53hGzDqlF
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 11:53:19 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A6D9C20BBA;
 Thu,  5 Oct 2017 20:53:17 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 20:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=rkvEnAiO85hQNS28voPMmQd8WREtVDITUQVOolZp0
 MM=; b=W0xrfEo1XCNjsfz9EriIvM1G0j+kfhg7/Sps5dJeThgvjpdIPGuUctB00
 wcR8vtdrqTParzjC3Cu2bPBtZDItYpXhMoCBv8sdohHSp6Wl3y3W4CiC90yKEGDe
 X2cEdWEUk9V+9oDo0fEm0cKCa+IqaMo3J4yJOT6gPOK8DflpRiMu0Nz4EBDHZpw9
 MdFwfjoBDBflNwXtT2Qdg4edh2U3mMfyYj4OH5ndO3zEJIac5Dg3xnnXgaxXmdvJ
 jSfZ0t35eJ76enC5T/UPBKbN9PcVjwyesLO7VZBGJG8eG+VVtd4Ztu0dvd4fhSKt
 k5fD51dZaqmoU9ElXyyuleXKd2DjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=rkvEnAiO85hQNS28vo
 PMmQd8WREtVDITUQVOolZp0MM=; b=NklsQyb85y6F8JVIXcQOgGdCcJENcmJCm7
 eTDn/8MM9grrpyFmueP6XXzN5GfLMch5ccLYlF5j/p/Eb4UHizpYU7QlC6r8TvIn
 hbGh8BwIPF33gaFa7EuOZ60PtQN4u8nT+mzUO6j+zzjUpcyAo3P/Fj5GmKTew7Y9
 4sqQd7/8yyYGI3naaQkbpCWuX0W+kdVCdRF4WyM+I2wBTPn7T99VU9grVVgDzQoJ
 GosiQ9fKCbUB8dyNKiXUfqP4bpaUsHBxzw1+BzIkIMsiSBD/d8MDfi+LvEun27+S
 j0CTM8zN+yJpD50QI7DESFscGvgcyTffg07OX210NcefQxm9ttIg==
X-ME-Sender: <xms:_dPWWTZuHGRAbmpDYZeAfj01Z_o5W_TijFcqmDbqKfh5G4zEOQz13A>
X-Sasl-enc: N3wwHBjBVBTZHYSOmNlGqABHRrbBHdzM/eicEt22o3xJ 1507251196
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id EF5CC246C4;
 Thu,  5 Oct 2017 20:53:15 -0400 (EDT)
Message-ID: <1507251192.5452.125.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 18/31] drivers: fsi: occ: Use
 big-endian values
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 11:23:12 +1030
In-Reply-To: <fe0e968e-10e5-d90b-4995-1bd1a154b51c@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-19-git-send-email-eajames@linux.vnet.ibm.com>
 <1507244587.5452.101.camel@aj.id.au>
 <fe0e968e-10e5-d90b-4995-1bd1a154b51c@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-0imgqgEHPqkaako6jnYg"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 00:53:20 -0000


--=-0imgqgEHPqkaako6jnYg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 19:41 -0500, Eddie James wrote:
>=20
> On 10/05/2017 06:03 PM, Andrew Jeffery wrote:
> > On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> > > > > > From: "Edward A. James" <eajames@us.ibm.com>
> > > =C2=A0=C2=A0
> > > Switch to __be16 from u16 and __be32 from u32. Also, use kernel acces=
s
> > > of unaligned be16 instead of manually creating a big-endian value fro=
m
> > > the occ response buffer.
> > > =C2=A0=C2=A0
> > > > > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > > ---
> > > =C2=A0 drivers/fsi/occ.c | 14 ++++++++------
> > > =C2=A0 1 file changed, 8 insertions(+), 6 deletions(-)
> > > =C2=A0=C2=A0
> > > diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> > > index 82a60c5..55f293d 100644
> > > --- a/drivers/fsi/occ.c
> > > +++ b/drivers/fsi/occ.c
> > > @@ -50,9 +50,9 @@ struct occ_response {
> > > > > > =C2=A0=C2=A0	u8 seq_no;
> > > > > > =C2=A0=C2=A0	u8 cmd_type;
> > > > > > =C2=A0=C2=A0	u8 return_status;
> > > > > > -	u16 data_length;
> > > > > > +	__be16 data_length;
> > > > > > =C2=A0=C2=A0	u8 data[OCC_RESP_DATA_BYTES];
> > > > > > -	u16 checksum;
> > > > > > +	__be16 checksum;
> > > =C2=A0 } __packed;
> > > =C2=A0=C2=A0
> > > =C2=A0 /*
> > > @@ -425,7 +425,7 @@ static int occ_getsram(struct device *sbefifo, u3=
2 address, u8 *data,
> > > =C2=A0 {
> > > > > > =C2=A0=C2=A0	int rc;
> > > > > > =C2=A0=C2=A0	u8 *resp;
> > > > > > -	u32 buf[5];
> > > > > > +	__be32 buf[5];
> > > > > > =C2=A0=C2=A0	u32 data_len =3D ((len + 7) / 8) * 8;
> > > > > > =C2=A0=C2=A0	struct sbefifo_client *client;
> > > =C2=A0=C2=A0
> > > @@ -476,7 +476,7 @@ static int occ_putsram(struct device *sbefifo, u3=
2 address, u8 *data,
> > > > > > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ssize_t=
 len)
> > > =C2=A0 {
> > > > > > =C2=A0=C2=A0	int rc;
> > > > > > -	u32 *buf;
> > > > > > +	__be32 *buf;
> > > > > > =C2=A0=C2=A0	u32 data_len =3D ((len + 7) / 8) * 8;
> > > > > > =C2=A0=C2=A0	size_t cmd_len =3D data_len + 20;
> > > > > > =C2=A0=C2=A0	struct sbefifo_client *client;
> > > @@ -522,7 +522,7 @@ static int occ_putsram(struct device *sbefifo, u3=
2 address, u8 *data,
> > > =C2=A0 static int occ_trigger_attn(struct device *sbefifo)
> > > =C2=A0 {
> > > > > > =C2=A0=C2=A0	int rc;
> > > > > > -	u32 buf[6];
> > > > > > +	__be32 buf[6];
> > > > > > =C2=A0=C2=A0	struct sbefifo_client *client;
> > > =C2=A0=C2=A0
> > > > > > =C2=A0=C2=A0	buf[0] =3D cpu_to_be32(0x6);
> > > @@ -560,6 +560,7 @@ static void occ_worker(struct work_struct *work)
> > > > > > =C2=A0=C2=A0	int rc =3D 0, empty, waiting, canceled;
> > > > > > =C2=A0=C2=A0	u16 resp_data_length;
> > > > > > =C2=A0=C2=A0	struct occ_xfr *xfr;
> > > > > > +	struct occ_response *resp;
> > > > > > =C2=A0=C2=A0	struct occ_client *client;
> > > > > > =C2=A0=C2=A0	struct occ *occ =3D container_of(work, struct occ,=
 work);
> > > > > > =C2=A0=C2=A0	struct device *sbefifo =3D occ->sbefifo;
> > > @@ -573,6 +574,7 @@ static void occ_worker(struct work_struct *work)
> > > > > > =C2=A0=C2=A0		return;
> > > > > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0
> > > > > > +	resp =3D (struct occ_response *)xfr->buf;
> > > > > > =C2=A0=C2=A0	set_bit(XFR_IN_PROGRESS, &xfr->flags);
> > > =C2=A0=C2=A0
> > > > > > =C2=A0=C2=A0	spin_unlock_irq(&occ->list_lock);
> > >=20

> > > @@ -591,7 +593,7 @@ static void occ_worker(struct work_struct *work)
> > > > > > =C2=A0=C2=A0	if (rc)
> > > > > > =C2=A0=C2=A0		goto done;
> > > =C2=A0=C2=A0
> > > > > > -	resp_data_length =3D (xfr->buf[3] << 8) + xfr->buf[4];
> > > > > > +	resp_data_length =3D get_unaligned_be16(&resp->data_length);
> > > =C2=A0=C2=A0	if (resp_data_length > OCC_RESP_DATA_BYTES) {
> >=20
> > You need to do be16_to_cpu() before any comparisons.
>=20
> Hmm, I'm not convinced. I see this in access_ok.h
>=20
> static=C2=A0=C2=A0__always_inline=C2=A0
> > <http://elixir.free-electrons.com/linux/latest/ident/__always_inline>=
=C2=A0=C2=A0u16=C2=A0=C2=A0get_unaligned_be16=C2=A0
> <http://elixir.free-electrons.com/linux/latest/ident/get_unaligned_be16>(=
const=C2=A0=C2=A0void=C2=A0=C2=A0*p)
> {
> 	return=C2=A0=C2=A0be16_to_cpup=C2=A0
> <http://elixir.free-electrons.com/linux/latest/ident/be16_to_cpup>((__be1=
6=C2=A0
> > <http://elixir.free-electrons.com/linux/latest/ident/__be16>=C2=A0=C2=
=A0*)p);
> } I think it will do the translation as well. Thanks, Eddie

Ugh, yeah, brain fart. Sorry about that.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>


>=20
> >=20
> > > > > > =C2=A0=C2=A0		rc =3D -EDOM;
> > > =C2=A0=C2=A0		goto done;
>=20
>=20
--=-0imgqgEHPqkaako6jnYg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1tP4AAoJEJ0dnzgO5LT5AYQQALhknyoA3da6n8UYsJ2Z38YY
8yE+GP5GxggQF4cB/UpSYgMPRGp/xKfQvJmwuTIFWqlBkLJ6psScfXhrSX7SndZJ
ddb/Gcg8NktNYoVVuyeQwt1s/hNpCRpI9uxyYm9ZADeihLj3jKsJiP2xARuCjkne
/Zms424AH2EjrMCylxOiLbGG5P9udSlQao/yj+dhuXP0DfYWMLt16TcSPsmMmAvq
88oJvhgiy4CCDfdfjv0bQe024rQD2saoNqSsNfgcGfc9AkXJ4VrwuuZYJCWA6sGV
iJGU73wHv4B/XEEiVqOM1o+aoDFAs4nNiVSPG0DauKKz0x9fucU5v/NDQNF8y9W5
EVdmddTBMQNh2ptZPEVR1cSChPyPE87PgU9gwihX4tiRAI9qdqq6OrwRm/5z+bOC
EVmAX9Ut/4G/t/uNUSt/zaN482XpPoerTv0i1ggdaQ5a7hSW0AqKmQgdSZ8V/V+r
+BT50YaUI3CAlYyC+6ehhGm7B+M/3h1Gd2PDDhGTAIha0eSN9uv0BxGedbydmzOy
GKveNMGR6g/atH67dRY9h6MC647+TRnh4WcVpDdiU6mFgMX4b9qfiD477MzA23Mw
RYtwMs59qdkG8Wm5v180kW3g4BFIUzl8/QIAg8HhQOK1ZDWiyzfYAR1odxNGzqcB
JiW9h/aMOejKYLL7lVcW
=MRLT
-----END PGP SIGNATURE-----

--=-0imgqgEHPqkaako6jnYg--
