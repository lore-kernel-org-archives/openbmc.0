Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 24C101A00AF
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 10:54:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=HrgrzLkW; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id 6A2DB4B0063;
 Tue, 23 Feb 2016 15:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=apd7EdHnIt6RrSOvTo52u
 BrOUOw=; b=HrgrzLkW5s/zNyql2IyS/S5pOwfzwctLMz+0rfoPl46iSO/eR5GDG
 L52mAgB1/RADi2ddrzUE4JzdPF6G9dFScgfqZgWP6GZEO0YtlAlbphlHSSAdw7Hb
 n3ifQMl0plq8COnIZZn879PccpolvT+5zF6C8dX9yQk67ZQd/XU8Ns=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 95E084B0062;
 Tue, 23 Feb 2016 15:54:52 -0800 (PST)
Message-ID: <1456271682.27420.12.camel@aj.id.au>
Subject: Re: [PATCH v3 4/6] openbmc: Generate images that erase empty NOR
 sections
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Wed, 24 Feb 2016 10:24:42 +1030
In-Reply-To: <CACPK8Xd7cKv4jK+wLvOKs_MGbrFvWRFx0qXNzptTHwNf35Hccg@mail.gmail.com>
References: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
 <1456238703-11117-5-git-send-email-andrew@aj.id.au>
 <CACPK8Xd7cKv4jK+wLvOKs_MGbrFvWRFx0qXNzptTHwNf35Hccg@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-BqRPVWEY57Iuje8Ph/Vg"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 23 Feb 2016 23:54:57 -0000


--=-BqRPVWEY57Iuje8Ph/Vg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-02-24 at 09:36 +1030, Joel Stanley wrote:
> On Wed, Feb 24, 2016 at 1:15 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> Why do we need to do this?

Primarily for the following patch where we conditionally call
mkfs.${OVERLAY_BASETYPE} when creating the RW FS. jffs2 can mount raw
erased partitions, so we ensure flash-palmetto and image-rwfs are in a
state where this can be achieved (after the image has been written to
the NOR). Erasing the partition then writing zeros isn't helpful.

To be fair we don't have to do this for the ${FLASH_SIZE} file, it's
not necessary, but Milton requested it and I don't really have a strong
opinion on the issue.

Andrew

>=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 11 +++=
++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbcl=
ass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> > index bf987bb..96193a3 100644
> > --- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> > +++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
> > @@ -27,6 +27,13 @@ RWFS_SIZE ?=3D "4096"
> >=20
> >  # IMAGE_POSTPROCESS_COMMAND +=3D "do_generate_flash"
> >=20
> > +mk_nor_image() {
> > +       image_dst=3D"$1"
> > +       image_size_kb=3D$2
> > +       dd if=3D/dev/zero bs=3D1k count=3D${image_size_kb} \
> > +              | tr '\000' '\377' > ${image_dst}
> > +}
> > +
> >  do_generate_flash() {
> >         INITRD_CTYPE=3D${INITRAMFS_CTYPE}
> >         ddir=3D"${DEPLOY_DIR_IMAGE}"
> > @@ -51,12 +58,12 @@ do_generate_flash() {
> >         fi
> >=20
> >         oe_mkimage  "${initrd}" "${INITRD_CTYPE}" || bbfatal "oe_mkimag=
e initrd"
> > -       dd if=3D/dev/zero of=3D${ddir}/${rwfs} bs=3D1k count=3D${RWFS_S=
IZE}
> > +       mk_nor_image ${ddir}/${rwfs} ${RWFS_SIZE}
> >         mkfs.${OVERLAY_BASETYPE} -b 4096 -F -O^huge_file ${ddir}/${rwfs=
} || bbfatal "mkfs rwfs"
> >=20
> >         dst=3D"${ddir}/${FLASH_IMAGE_NAME}"
> >         rm -rf $dst
> > -       dd if=3D/dev/zero of=3D${dst} bs=3D1k count=3D${FLASH_SIZE}
> > +       mk_nor_image ${dst} ${FLASH_SIZE}
> >         dd if=3D${ddir}/${uboot} of=3D${dst} bs=3D1k seek=3D${FLASH_UBO=
OT_OFFSET}
> >         dd if=3D${ddir}/${kernel} of=3D${dst} bs=3D1k seek=3D${FLASH_KE=
RNEL_OFFSET}
> >         dd if=3D${ddir}/${uinitrd} of=3D${dst} bs=3D1k seek=3D${FLASH_I=
NITRD_OFFSET}
> > --
> > 2.5.0
> >=20
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
--=-BqRPVWEY57Iuje8Ph/Vg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWzPFCAAoJEJ0dnzgO5LT5xcUP/3ixWZKTfaptWnUhZpZiOMB7
phkaCnG/nFsU3MElxlFwReOcFAxQ45tdop/Em7tC/529k8Yuvxniek9v6tUvoPwi
XFN+LSp6teHnkdeTLvtZl1pMT6t/D6pdHSTP7JKnWaPmuUkRCKibYOqoxal8VYmi
S3rW05uNZGPF5DejUAmP16670jBEmDVEB7NcD4aDLx6hS+iW+q4dE6kqzpvFfPHX
kE343uyDM4a7xojsRkod7PFgdWOqljJQy12ZcqE8JVb56DCdqGIQZQ0p903rMMkA
lT1VDVlpsck3Vr6AwKYxLbdhkxTNh8O7Y3NP5YbJzFk49MLrvbNX4gAhMlXVzQ32
LwlhzmTzI+CRvU1ibHo1xoIQz943j6wbmYCGQxSL3rFei1abPF5xuIoOdmCLCk/7
rUCsp3c+ctPP1r/vCXPVfjGq23DKOSYFZkGR2EcqJiDGF1yhFvD3nxCiZ6qWZUw+
Z9OK+d+IqgwXuawftclhxErzEv9rL6wiXeIZRge/iWA3TKvj2RFddTFJuPnWtSnf
BPgLbpYhuXQ3n8AXD2JUQ7ilB6sa+mjndRwSdc1KJSb/o378VEkjNVTnFzZgga+e
G38Xctw8j8+BD+OIEsUGUheRv+lBDHPCGfmYaLzOXDGUmEx9kOCjtiBZMnKJrXPD
s/eMsWpNqMX7BlWbEPuG
=QJm4
-----END PGP SIGNATURE-----

--=-BqRPVWEY57Iuje8Ph/Vg--
