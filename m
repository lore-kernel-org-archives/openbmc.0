Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 38F521A0060
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2016 04:01:33 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1457542873448970.3549466751786;
 Wed, 9 Mar 2016 09:01:13 -0800 (PST)
Date: Wed, 9 Mar 2016 11:01:11 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org,
 tomjose <tomjoseph@in.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid] ipmi daemon return code modification
Message-ID: <20160309170110.GM6601@asimov.pw-on-the.net>
References: <1457467833-17690-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457467833-17690-2-git-send-email-openbmc-patches@stwcx.xyz>
 <20160309133123.5d11a1ea@camb691>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6CiRFyVmOOJ3DkBX"
Content-Disposition: inline
In-Reply-To: <20160309133123.5d11a1ea@camb691>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Wed, 09 Mar 2016 17:01:35 -0000


--6CiRFyVmOOJ3DkBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I agree with Cyril's comments.  This code should not have been merged in
the current state.

The first line directly contradicts the comments.  Need to update the
comment to explain why '8' is needed now.  And removing an error path is
non-obvious.  Even the commit message doesn't really give any details on
what / why this change was made.

On Wed, Mar 09, 2016 at 01:31:23PM +1100, Cyril Bur wrote:
> On Tue,  8 Mar 2016 14:10:33 -0600
> OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:
>=20
> > From: tomjose <tomjoseph@in.ibm.com>
> >=20
> > ---
> >  apphandler.C | 2 +-
> >  ipmid.C      | 1 -
> >  2 files changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/apphandler.C b/apphandler.C
> > index a921643..fc6c811 100644
> > --- a/apphandler.C
> > +++ b/apphandler.C
> > @@ -358,7 +358,7 @@ ipmi_ret_t ipmi_app_channel_info(ipmi_netfn_t netfn=
, ipmi_cmd_t cmd,
> >      printf("IPMI APP GET CHANNEL INFO\n");
> > =20
> >      // I"m only supporting channel 1.  0xE is the 'default channel'
> > -    if (*p =3D=3D 0xe || *p =3D=3D 1) {
> > +    if (*p =3D=3D 0xe || *p =3D=3D 1 || *p =3D=3D 8) {
> > =20
>=20
> So I take it that the comment is no longer valid? Can we take a break on =
magic
> numbers or at least quote and link the spec nearby?
>=20
> >          *data_len =3D sizeof(resp);
> >          memcpy(response, resp, *data_len);
> > diff --git a/ipmid.C b/ipmid.C
> > index 6726a27..728ba0b 100644
> > --- a/ipmid.C
> > +++ b/ipmid.C
> > @@ -267,7 +267,6 @@ static int handle_ipmi_command(sd_bus_message *m, v=
oid *user_data, sd_bus_error
> >      if(r !=3D 0)
> >      {
> >          fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]=
\n",r, netfn, cmd);
> > -        return -1;
> >      }
>=20
> Was this change intended?
>=20
> > =20
> >      fprintf(ipmiio, "IPMI Response:\n");
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--6CiRFyVmOOJ3DkBX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW4FbWAAoJEKsDR8wtAMEZkIgP/26+IlR9UyRVRDqoCF8lUujf
L2ghWZ+Ja/y+x75wNH6hk0XD7zx0Gs7ROImifXqaxLf9gpGNotWoArdTtVMNsaRu
QBkcqDzYlt2Y5m/g5PwZfT5U+QmY3DM5UNgXtpx5kWpPJyEQBgDYZBE5004L/06I
owAr8JP+KI8cWWb0lDt2q9hGaCX6M2QpmCX6797H+1fgHxkaXYxL3AlAdVm1S4Te
fYc8qIDGKCQWEANOQRItaGdXMVjZw7k2VDhS//jqOGXuqXGoMx4CrCyxHv/YDpZO
q6yJZyT/iZYPM+QKBiWObbhZZzaS6mMh0ruF9hx292f2C9pBBkjZDy0Utslk6QNR
O1Df6LyMjzjoIAYm7CBeuhh7NIG4eay8vr9707f/3D1vqzGpEeiuQKtDvY1BEoKQ
DoT1lyoz4ngjzj0rMG4Me7zFII+Z/+UyHtXDb1WyMAb8uXxdCCPdEyNksm/StAvH
1VJKnH11xw72wmJWLmYxS99o0aq/02UZvJ0ZRO8IdTc+GqbkSTQqAsa+vNn+0A6g
bhttNzjOkSOMdcFx/jpSNelJn0hWoLEjcUXhXE8X7zRoDeNlJJb6dyUcWDCYeUqG
21XXfSiqxlxdaM14cM3QPaSwdZS4XdSD0h4qdvsxosd9BtJrgVpZM5fjn+/tr9Wl
NcRplX4kDPdaYLYLUAEg
=2spr
-----END PGP SIGNATURE-----

--6CiRFyVmOOJ3DkBX--
