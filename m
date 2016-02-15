Return-Path: <dja@axtens.net>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BA6351A0063
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2016 13:37:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=q+Iu+5A4; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id fl4so6586145pad.2
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2016 18:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=VUnGhc9GYS8oSsEd1RnDwWtvjKAjoDMdvYOm8UByIBQ=;
 b=q+Iu+5A4XKorqnW1QEyacJcXEdof8C0RymSESr7x7WBWo6K7SQ3FCVTyTp848WSkgJ
 DUC3zXVUFmoBNzVIkZqNGXDhXeZo5Xl3XdI6dqzDg9yWLMndfSitIcHHkrbhaqLeT4oS
 bSHWw2vteSpXCgmgxhvoYV0AzjR38WBo29Jzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=VUnGhc9GYS8oSsEd1RnDwWtvjKAjoDMdvYOm8UByIBQ=;
 b=hC0XVbOCsnHl5WjNLA4O5QQBJ6sBgOipcl0bKV8HDKWmF5CtLIqIDULmSCbtmZh/YP
 0GM8LeMpMZbOX8//sv2b7rhwJPTTOd7TSItHo5KhOUE2EPYfTDvXxv9Y6MlRzCB3vf21
 bSesIZ11F0eoArXRWexK0w41U/g8tjFq9ghzeHzYQDBrLcesPg/4GylDGJQbrHfRCwdG
 nIpu0JO3pRz+2LE1E+apm2E7Sa2J9Hw49hBSUz6avhhT4wfUALzYRcYrdWl9oIwo7E8B
 vCcYPUIX7K6SEa76il/lGLEwNLKrMPfX6ZB5T4eSPHRowqVxJ7YNvniuLQYntpcZkUG6
 WWfg==
X-Gm-Message-State: AG10YOR7mIaxHqJM/fQgEMV/MKwGSc7xtKX29s+mXzKsyyWbOHu0eyfw4ERJbtJg92NUYA==
X-Received: by 10.67.1.237 with SMTP id bj13mr20455409pad.130.1455503860013;
 Sun, 14 Feb 2016 18:37:40 -0800 (PST)
Received: from localhost ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id ud8sm34241561pac.11.2016.02.14.18.37.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Feb 2016 18:37:39 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc-build-scripts v2] build-setup: Ensure we fail the
 build when a step fails
In-Reply-To: <1455495021-25108-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455495021-25108-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455495021-25108-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Mon, 15 Feb 2016 13:37:25 +1100
Message-ID: <87twlak8be.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
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
X-List-Received-Date: Mon, 15 Feb 2016 02:37:45 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Joel,

Looks great!

Reviewed-by: Daniel Axtens <dja@axtens.net>

Regards,
Daniel

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Joel Stanley <joel@jms.id.au>
>
> Currently the build step can fail inside docker but we don't propogate
> that error up, so the Jenkins build will not be marked as failed.
>
> We set the following options:
>
>  set -xeuo pipefail
>
>  - bash trace output (-x)
>  - failing when a step fails (-e)
>  - failing on undefined variables (-u)
>  - failing when a command in a pipe fails (-o pipefail) - the default
>  behaviour is to use the exit code of the final command in the pipe.
>
> http://redsymbol.net/articles/unofficial-bash-strict-mode/
>
> Thanks to Daniel Axtens <dja@axtens.net> for the extra suggestions.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  build-setup.sh | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/build-setup.sh b/build-setup.sh
> index a96ed44..9c156f7 100755
> --- a/build-setup.sh
> +++ b/build-setup.sh
> @@ -7,8 +7,8 @@
>  #   distro =3D fedora|ubuntu
>  #   WORKSPACE =3D=20
>=20=20
> -# Trace bash processing
> -set -x
> +# Trace bash processing. Set -e so when a step fails, we fail the build
> +set -xeuo pipefail
>=20=20
>  # Default variables
>  target=3D${target:-qemu}
> @@ -85,10 +85,6 @@ fi
>=20=20
>  # Build the docker container
>  docker build -t openbmc/${distro} - <<< "${Dockerfile}"
> -if [[ "$?" -ne 0 ]]; then
> -  echo "Failed to build docker container."
> -  exit 1
> -fi
>=20=20
>  # Create the docker run script
>  export PROXY_HOST=3D${http_proxy/#http*:\/\/}
> @@ -100,7 +96,7 @@ mkdir -p ${WORKSPACE}
>  cat > "${WORKSPACE}"/build.sh << EOF_SCRIPT
>  #!/bin/bash
>=20=20
> -set -x
> +set -xeuo pipefail
>=20=20
>  cd ${WORKSPACE}
>=20=20
> --=20
> 2.7.1
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWwTnmAAoJEPC3R3P2I92FaQcP/1cN64sp7XyIw6DStGebNekW
emnFrYTjMhfAOLgDJ5lD+kaTZ0oGTAWaeaXa4sGfrpHgPcG03WTsCmqxTvHcwo2d
2DXQeT1JPSNAdZKMqhi8d1MS8Kv3cbQ9iXSvDga26353dZ3MjaL9eZBhUWBCq29o
uOjNdR/NIrxb9Sehm6H2igXNU4NxqF+OStsDHySeY4InYAVj2z8zYmpIM4ZnLkid
8ngVZyslamuZbxmCPWN7QmxpPzUaWsosPzl3PWgEHBpXvSFWpsHK62b/aQ69EXf6
u94H7Y3LhWgFbDUzuQTU19BdSBL9zwLFiLWCvn2aZ53YXhQ45+e3xKuZ1Cp8I8nl
sz0hpftx+DuynMZHWHsN31JMByv8RrIrgR0OxDJNwHQzVoyRwxaDZRaftZN1iMUu
hP5hwz4JsPBfzYz8nkRq6D55uzJsH3CQumuUXCiUrb8D3P3Z/lbeao7poaSLP7S8
EX3i6xhEkFZc3f6JugYaUvo3oMyJMkkyAf4yOAwtVzypZT1t8AZNTsknBQ3ST3f0
p0Ji3+0Ky3KcptoAYladEatwKNQdURDrerUbD+mCz+e4ss5IhuOg+Uh6iiMz1jYr
xelJBBVRlZhYjfsM/DYzmYWQpDMRre27qDhPYwuRmrl0ArpTzUMyLjh9tVYYO96F
op3gOBJn5aN2BXSPvop3
=pR5Q
-----END PGP SIGNATURE-----
--=-=-=--
