Return-Path: <andrew@aj.id.au>
Received: from homiemail-a17.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9J0l5089zDqHc
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 14:26:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=gyEnzmGC; 
 dkim-atps=neutral
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id 982FF2B206D;
 Wed, 18 May 2016 21:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=1qh7IcuTr6DdQEUdDuOS3
 M8+hnk=; b=gyEnzmGCyib5HliVFebOYIYu8jEm1Ye9F/y3ujvBGTw2fxC727TfR
 JhscbuvAh4GzECcil8KdXPaRQXyibhZBJutYRUeXgxVPAOn6V6Ogzjmb0lRnvvwc
 d0xbvRHC8RhhE5354/jWH+Z2tZEEV9pT1+hjBYxbMT/vz3BmH55OQg=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id 8759E2B206A;
 Wed, 18 May 2016 21:26:08 -0700 (PDT)
Message-ID: <1463631955.2703.145.camel@aj.id.au>
Subject: Re: [PATCH btbridge v4 3/6] Add travis dir to keep all the Travis
 CI specific files together
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Date: Thu, 19 May 2016 13:55:55 +0930
In-Reply-To: <1462324208-11150-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462324208-11150-4-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-gKK84f4GI+4BQK+bOK8T"
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
X-List-Received-Date: Thu, 19 May 2016 04:26:16 -0000


--=-gKK84f4GI+4BQK+bOK8T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-05-03 at 20:10 -0500, OpenBMC Patches wrote:
> From: Cyril Bur <cyril.bur@au1.ibm.com>
>=20

This needs a S-o-B tag.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>


> ---
> =C2=A0.build.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 23 -----------=
------------
> =C2=A0.travis.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A02 +-
> =C2=A0travis/build.sh | 23 +++++++++++++++++++++++
> =C2=A03 files changed, 24 insertions(+), 24 deletions(-)
> =C2=A0delete mode 100755 .build.sh
> =C2=A0create mode 100755 travis/build.sh
>=20
> diff --git a/.build.sh b/.build.sh
> deleted file mode 100755
> index 79b0b5c..0000000
> --- a/.build.sh
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -#!/bin/bash
> -
> -Dockerfile=3D$(cat << EOF
> -FROM ubuntu:15.10
> -RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get update && apt-get upgrade
> -yy
> -RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get install --no-install-
> recommends -yy make gcc libsystemd-dev libc6-dev pkg-config
> -RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID}
> -g ${GROUPS} ${USER}
> -USER ${USER}
> -ENV HOME ${HOME}
> -RUN /bin/bash
> -EOF
> -)
> -
> -docker pull ubuntu:15.10
> -docker build -t temp - <<< "${Dockerfile}"
> -
> -gcc --version
> -
> -mkdir -p linux
> -wget https://raw.githubusercontent.com/openbmc/linux/dev-4.3/include
> /uapi/linux/bt-host.h -O linux/bt-host.h
> -
> -docker run --cap-add=3Dsys_admin --net=3Dhost --rm=3Dtrue --user=3D"${US=
ER}"=20
> \
> - -w "${PWD}" -v "${HOME}":"${HOME}" -t temp make KERNEL_HEADERS=3D$PWD
> diff --git a/.travis.yml b/.travis.yml
> index faaa918..bfdedab 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -6,4 +6,4 @@ services:
> =C2=A0language: c
> =C2=A0
> =C2=A0script:
> -=C2=A0=C2=A0=C2=A0=C2=A0- ./.build.sh
> +=C2=A0=C2=A0=C2=A0=C2=A0- ./travis/build.sh
> diff --git a/travis/build.sh b/travis/build.sh
> new file mode 100755
> index 0000000..79b0b5c
> --- /dev/null
> +++ b/travis/build.sh
> @@ -0,0 +1,23 @@
> +#!/bin/bash
> +
> +Dockerfile=3D$(cat << EOF
> +FROM ubuntu:15.10
> +RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get update && apt-get upgrade
> -yy
> +RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get install --no-install-
> recommends -yy make gcc libsystemd-dev libc6-dev pkg-config
> +RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID}
> -g ${GROUPS} ${USER}
> +USER ${USER}
> +ENV HOME ${HOME}
> +RUN /bin/bash
> +EOF
> +)
> +
> +docker pull ubuntu:15.10
> +docker build -t temp - <<< "${Dockerfile}"
> +
> +gcc --version
> +
> +mkdir -p linux
> +wget https://raw.githubusercontent.com/openbmc/linux/dev-4.3/include
> /uapi/linux/bt-host.h -O linux/bt-host.h
> +
> +docker run --cap-add=3Dsys_admin --net=3Dhost --rm=3Dtrue --user=3D"${US=
ER}"=20
> \
> + -w "${PWD}" -v "${HOME}":"${HOME}" -t temp make KERNEL_HEADERS=3D$PWD
--=-gKK84f4GI+4BQK+bOK8T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXPUBTAAoJEJ0dnzgO5LT54EkP/2BDpGeY9eF0Rd9Y7CET98Xf
qcj8k/WpEwqs3y7i/OyAUogTZdC6eK5zdIyYEFzQ5PNqLGTRCDhtLMb7CRlkQ8Qs
O+nN848fdcwLVmGClWhxpHVL04OTotXjwvt27LwirIKt2kY8NT3FdMitWtOwNoDB
QtRwu5Cn1kOV2GyDN5fj1e4sWAUjcE2/XDbroI2C/9z/gMdGsjZObWVxiR1GeyJ1
nps2r/ZqzZqwqVg68jt5Ksi0dbiM5ngFYOgsT1ctPQtm+gNUyxsctONxesXpeeTv
L/qQ0dOUb/mwfrjvGOAqOOT1AWg9yw21ROOOibZgN1oDBWMe8L0sF+ljqUYZlA2Z
uUUX8ac91xH+1NNS7E4IDjDC2dOZb6GfcyoSxRHQWbgX7pjI4x7pdQ0VK849wg4J
uOE48mpSjImSwmdNUJCuPmK1RSdHZCPiN0ASK3XXBRrYPlgKYNVpEkV4+c6D1+Et
mfQps7bFYbFxIRw2FcAv24xkeOIoECd8kW5zROt++Dv1psjbQWppkewgezGbo/3M
QlsTZnnyK7l7rkjTrSxp5dCuzW5dZAv2MTfuttytxVSa1mV6ukNDndDVJEwPMna8
KognbtbxGEtqmBX5cQF0cGQVTJ6vePN8cq9pMCU1GjMr5PHk7+w+I6w94D4DlePw
aRBLj/demENRopL4G6A8
=FhUg
-----END PGP SIGNATURE-----

--=-gKK84f4GI+4BQK+bOK8T--
