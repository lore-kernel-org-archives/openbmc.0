Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbqNh39MdzDqlN
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 06:16:36 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1466799389689656.059241519551;
 Fri, 24 Jun 2016 13:16:29 -0700 (PDT)
Date: Fri, 24 Jun 2016 15:16:27 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH openbmc v5 05/11] meta-phosphor: Ensure INITRAMFS_CTYPE
 defined
Message-ID: <20160624201627.GI20922@asimov.austin.ibm.com>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-6-openbmc-patches@stwcx.xyz>
 <CACPK8XdJ3u5mSnG61ZSaUkN=RZefAC4RzZ-mFEibJpi8zrFx6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FK65GREB+Evh/hTL"
Content-Disposition: inline
In-Reply-To: <CACPK8XdJ3u5mSnG61ZSaUkN=RZefAC4RzZ-mFEibJpi8zrFx6g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Fri, 24 Jun 2016 20:16:37 -0000


--FK65GREB+Evh/hTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 12:23:15PM +0930, Joel Stanley wrote:
> On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
> <openbmc-patches@stwcx.xyz> wrote:
> > From: Patrick Williams <patrick@stwcx.xyz>
> >
> > The hardware platforms use obmc-bsp-common.inc, which defines
> > INITRAMFS_CTYPE, but the simulation (qemu) platforms do not.
> > core-image-minimal-initramfs.bbappend currrently uses INITRAMFS_CTYPE
> > so we need to make sure it is defined.  Default there to 'lzma' if not
> > already defined.
> >
>=20
> Should it default to none if it's not defined? How do we make sure the
> kernel has decompression for this type enabled?
>=20

I don't have a good answer on that.  There are a number of places in the
phosphor tree that is either using 'lzma' directly or something like
'cpio.${INITRAMFS_CTYPE}', so we seem to be assuming there is
compression support in the kernel.

Milton was mentioning we probably need some clean up of all these
variables due to some changes in Yocto 2.1, so I'd vote we leave as is
and figure out a better approach then.

--=20
Patrick Williams

--FK65GREB+Evh/hTL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXbZUbAAoJEKsDR8wtAMEZLPkP/0tkTXFJH8S/c9VfK0Jb+hz+
W29wh/JUb2LzDWF/BmmzPRteOhztgAsXw9uwVloZ63rA/RXWmKLOea/vgw88rIkh
sNdarB1Nwq4BjORCE5eKeGxQJbFldhvprFdah9e+US1wEi9HOHT4ZjTjehLn+h9J
NBAMAX8wwnUTDJjO96HshlEO2Ik8cYLO462JK7HPWBrZ8vJhkiG1SlDQE5KG3u9T
c1fNIvDCLiLXs6uJ5gmoGTtLmFoyUuLS93Hfo3u+XQ4Skt7KauLURfOXSqlcOiLu
H89YtLDYvsuSVwhRgwR7lz5zNQam2FiDnhqGu5th/nxQnZNfvWP9e9NQyfWOyyDT
PQxTWwMr3jVRIZchWPMTIU8fgqdkavERruxEXl92Za8hlq2CqdA6GYAiaGEu6DBw
IG5lAVWInXlcF5itov+I+wmdiYL+bgFIqNfrToHTyVUAZ7++MlK8UDl77UiuoCpJ
GxpQD/agM4yQwJJhl/33GA0y2LsdyQhdnDMyy2/AT0csyM/ukQx/txBUq0OJBJYz
QICgGcOcrPJ9rbAFlvNv70yCGoOJ56svS8nesoWlwEMth1wHRnih95pCdb9JFObk
b86jbrqU3ic8xkglG7C9PumcEj8PIwS9p3d6GxKoQwAgmZaYhUCBm8eTS/NkMM1G
l5w8gBFy39BwnjaMaOom
=lQI3
-----END PGP SIGNATURE-----

--FK65GREB+Evh/hTL--
