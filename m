Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVspf63SXzDqpd
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 04:48:26 +1000 (AEST)
Received: from localhost (207.45.155.253 [207.45.155.253]) by mx.zohomail.com
 with SMTPS id 1466102898621126.76151889730647;
 Thu, 16 Jun 2016 11:48:18 -0700 (PDT)
Date: Thu, 16 Jun 2016 13:48:11 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vishwanatha Subbanna <vishwanath@in.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Fw: Need some thoughts on systemd service file
Message-ID: <20160616184811.GB19968@asimov.austin.ibm.com>
References: <OF27BAEC52.32D2FF79-ON65257FD4.0060E8C5-65257FD4.0061238B@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RacQGezy2Y99S6cT"
Content-Disposition: inline
In-Reply-To: <OF27BAEC52.32D2FF79-ON65257FD4.0060E8C5-65257FD4.0061238B@notes.na.collabserv.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 16 Jun 2016 18:48:28 -0000


--RacQGezy2Y99S6cT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Vishwa,

A few suggestions on your commit:

1. I see you put the files into .../network/files/ and moved them from
=2E../network/network/ .  Why is that?

2. 'inherit obmc-phosphor-systemd' causes your recipe to import
obmc-phosphor-systemd.bbclass.  This file has:
=3D=3D=3D=3D
inherit systemd

SYSTEMD_SERVICE_${PN} =3D "${BPN}.service"
SRC_URI +=3D " \
    file://${BPN}.service \
    "

do_install_append() {
    # install systemd unit files
    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/${BPN}.service ${D}${systemd_unitdir}/system
}
=3D=3D=3D=3D=3D
This means a few things...
    a. By setting SYSTEMD_SERVICE_${PN} +=3D "network.service", you're
       actually getting network.service added twice.
    b. network.service will be installed by this do_install_append
       snippet, but network-update-dns.service will not.  I think you
       need to 'install' it.
    c. I'm surprised we don't 'install' everything in
       SYSTEMD_SERVICE_${PN} automatically or in this .bbclass.  Maybe
       Brad can comment on why it is set up this way.

3. Before you made your change are we sure 'network.service' was
working?  Hopefully someone has previously tested this but there is
always the possibility that systemd is confused by 'network.service' vs
'network.target'.  Maybe 'network' is effectively a reserved word.

4. There is no advantage to setting SYSTEMD_AUTO_ENABLE because it is
already defaulted to 'enable'.

On Thu, Jun 16, 2016 at 11:11:00PM +0530, Vishwanatha Subbanna wrote:
>=20
>=20
> hello Team,
>=20
> So here is what I am trying to do with :
> https://github.com/vishwabmc/openbmc/commit/f28651bb92bc7af6b503c9ca07aa8=
d76a3f0660c
>=20
> 1/. Point bb to the git repo with commit #
> c69c3d30fd7d5fd04ba990788b6d75b19f275fc8 that introduced netman_watch_dns
> binary
> 2/. Create 2 .service files inside
> meta-phosphor/common/recipes-phosphor/network/files/ --> network.service
> and network-update-dns.service
> 3/  Make necessary changes to bitbake file so systemd can enable the
> services and start at boot.
> 4/. Build a Palmetto image ( or qemu too ) and copy 'em over to tftpserver
> ( /tftpboot/cuImage_vishwa_1 and /tftpboot/initrd_vishwa_1 )
> 5/. reboot palmetto and run netboot to new image.
>=20
> I expected that the netman.py ( which is part of network.service ) and
> netman_watch_dns ( part of network-update-dns.service ) would get auto
> started but they did *not* start and I need some thoughts on why this may
> be happening.
>=20
> https://lists.yoctoproject.org/pipermail/yocto/2015-April/024470.html
> ( Someone else also had same issue )
>=20
> What is that I am seeing :
>=20
> 1/. I see these 2 files are actually inside /lib/systemd/system/network
> Palmetto in as expected --> Good
> 2/. Services not started
> 3/. systemctl status network shows that its disabled. Same for update-dns.
> 4/. I see systemctl status skeleton displays everything is running
> 4.1/ Removing the Requires=3D and After=3D in network.service and booting=
 to
> that changed image still does not help.
> 5/. Manual start using systemctl start network -and/or- systemctl start
> network-update-dns does everything okay and starts the expected services.
> 6/. No error seen in journal
>=20
> Thanks
>=20
> -------------------------------------------------------------------------=
------------
>=20
> Thanks and Regards,
> Vishwanath.
> Advisory Software Engineer,
> Power Firmware Development,
> Systems &Technology Lab,
> MG2-6F-255 , Manyata Embassy Business Park,
> Bangalore , KA , 560045
> Ph: +91-80-46678255
> E-mail: vishwanath@in.ibm.com
> -------------------------------------------------------------------------=
---------
>=20

> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--=20
Patrick Williams

--RacQGezy2Y99S6cT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXYvRrAAoJEKsDR8wtAMEZjjYP/002Ofzs8+4+ErF8aXmIcGiL
q04N9uCqivPftP/b8gD2gnnUctEngEoPFdIu65iuvnGoddnoNFL2VLBC5xBqaWiq
MadRyfxzNkG/EZe/MOE3T7iAtEm+BX+XYGdv170cRWnB1bHVy6bNMNA2rpyZLIko
+gIZI1n4gkpQGJ9TXkgp+GhNExCm/GW74LFDF4OuG3epP3swnKv6XuHooOvtZcYE
3YJnxC0OfhxJHtG3QdMYLyL02c7OyoZnMOLX/tXqrA3UO6S1EdAR/G20bHryxtqv
gFTJp0ZTqHpmfP3qxDu9tNRtliGwYkvBJlyTHpLsj08B6tmw0kYWluEQIERcyB7w
ykD89168K9T2gknpyzwauqS5DR67G99b5WUUXVWBMyX5BD+syAcNZ/GC9pRRmwjq
8XSwg9ZEFcraTUc46h+oAYGIb8LQO6xtb2/U8w95H5D7n++Se+aYuRLFrIgFymEk
Sr8dsRjJQHVHkiZv/J2e2wUSkJoD1lsVLLrgdHjr3YRSX3ASI0xWiqu/sS7w3++l
WEXEnBnB4eCVaqeHSnRTfdYv7/y6BQXTQd9o0Rlw9htFkuKYzjTG52X5IkvQV3CA
cD9yMfyP2ddtUwf36WoMLIg3IQ+b3jsL05Y5Ufy2vlEO+kPtFAKSZ7Ed/jj0MVfa
9KdrhxIpdLfAlacvlQ46
=lpfT
-----END PGP SIGNATURE-----

--RacQGezy2Y99S6cT--
