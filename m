Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tCG0H1plpzDvNG
 for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2016 02:03:10 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1478530979978297.8743831448277;
 Mon, 7 Nov 2016 07:02:59 -0800 (PST)
Date: Mon, 7 Nov 2016 09:02:57 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Cyril Bur <cyrilbur@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux dev-4.7 7/8] ipmi: maintain a request expiry list
Message-ID: <20161107150257.ug6zvs4v656cesep@asimov>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-8-git-send-email-clg@kaod.org>
 <1478132769.728.3.camel@gmail.com>
 <20161103182300.wt2lyseogigfxqfn@asimov>
 <53954820-3eaf-56c6-0a4c-9347ff4dc358@kaod.org>
 <20161104015543.GD17105@heinlein.lan>
 <c1423337-705b-5d24-4205-c9ce8c32f1f4@kaod.org>
 <CAFd5g45PHWivKg17TRofahmtpZiTP8eWpBVrds=XB1EBh1t7QA@mail.gmail.com>
 <66e47401-a567-c100-2a92-ca2ff32023a2@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vagmfvn3n2ifvdhm"
Content-Disposition: inline
In-Reply-To: <66e47401-a567-c100-2a92-ca2ff32023a2@kaod.org>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2016 15:03:11 -0000


--vagmfvn3n2ifvdhm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 06:25:41AM +0100, C=E9dric Le Goater wrote:
> Hello,
>=20
> On 11/04/2016 07:22 PM, Brendan Higgins wrote:
> > Thanks for roping me in,
> >=20
> > Patrick summed up my intention perfectly. IPMI messages will be structu=
red=20
> > the same and use compatible fields, but would allow for different flow =
control.=20
> > In particular, the goal is to allow multiple requests and responses und=
er a=20
> > single sequence number.
>=20
> So if the combinations of { Seq, Command, NetFn } values are unique, we=
=20
> should be fine. The expiry list patch needs to be more precise when doing=
=20
> matching though.

Brendan was implying that this is incorrect for OEM commands.

Brendan can you clarify?

--=20
Patrick Williams

--vagmfvn3n2ifvdhm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYIJehAAoJEKsDR8wtAMEZCQYP/1auUnp2BDwH0lrSKN6gKl70
4xsn9kOOmo7Uj+nncdh2B6XV1kDqBZgNPPzqqU5uFD/xvm66ITVObqY93EwatgNp
bLJ6MB4pIe0cHaP9/h7Jj3Lt6LVMK3jOHHUPN7HKXG1dRchrDo+rbZ+pIfoEgAwi
nlZadw0tEJ8Z8S4GTsZEwJ2WjjIX40S+CDaMnevNSkSbLChwqKU93Ci0h91EHivR
gMAp2rOY922W4d+GHmwWOjcH64Q3nwHV++1UMZ0Do3v9JOCBnVZwrJP9jHAsnzdy
6/ThK261wa20xr9WNHiW6s3SyyOn3d+q0ZxXTVMBRabD0UU2RyFDmpSSmv+4p5h1
/08fTkOvH2Aj5rUJNhYDYjirmQ1O/JsFBHwrbRL0aSTXYLWVwzlaXEGPFRlovP99
rX4QF84fA1MO/aw00hsn+n2jC7heKLFerIXXNBTkleWDvlY8sOhVtwpwSjc48olG
er2u4ybS08WeMt24sOVHS7AYs1XKKbqKlKFi9SP33HMX7tXRjOq86ia0sra/+u3j
bgOizVgCfeQ4WJac9B9FQfAE8U5NN6lpYDFxdxPX4ajwZOq52J2EAEFzBM4KwywC
fnHIZ46NfhA8Zy8eF3V4SjzFrG1Uo/ib6wVv2HeSCD9KiPxaMunm666ZRh2MfLOp
XxQbvciZimMmx5r+x0nY
=Bd6V
-----END PGP SIGNATURE-----

--vagmfvn3n2ifvdhm--
