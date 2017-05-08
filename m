Return-Path: <trini@konsulko.com>
Received: from mail-qk0-x22c.google.com (mail-qk0-x22c.google.com
 [IPv6:2607:f8b0:400d:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCXG68tQzDqJ9
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:40:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=konsulko.com header.i=@konsulko.com header.b="OuoPUI92";
 dkim-atps=neutral
Received: by mail-qk0-x22c.google.com with SMTP id y201so28960102qka.0
 for <openbmc@lists.ozlabs.org>; Mon, 08 May 2017 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=laRRCWPkO+A5Yp9C70LEF77SjOEzJMeLDfx/HxFH6UY=;
 b=OuoPUI92D+rNXhSGWXj+vV35qyEYtFmAuma9dKkmnB0W9ACJlYKGRv7Q/sMLCA4lmo
 XXjBXg+qak/FzSVBq9jMzL8WCfOLOSBLJGJcRL44jznZKfKasi3B4BcD9hXkMwcF2G/f
 0Z0+UqFreNX3NogXtJvZMVntyl95NZIl8huS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=laRRCWPkO+A5Yp9C70LEF77SjOEzJMeLDfx/HxFH6UY=;
 b=nj9VKJyZhFuruV3v6e5hVv05lp9gO8E4PzpJ+++ZFUXzsmAtUrIZvxk44AYgCRwmg5
 pqc3TOy0dEduYWJcgLyWrvPn4WI6qU2cpq2iWWsiNOHLyjaXigq0Qpec81e9E6HM2a1h
 DzF03IvQraNzxK4dwW8CayzlBK388Ffiiibsf1GhpMJsM9CfMpRSQor12cktFNnEtW6z
 KuaO9kT4jXNRBdfS7s/DEBrA8Aip7ZrSV6pCvUL5Du06CBGpsKWQthyMGhzkeQDVyBLG
 44DNcLY0JK+JS60HUbH7NT1dkKSxxMnQdwOV8WrIjd2a7yQm0WL0J/fZb+lMMHz4KuO1
 OkXg==
X-Gm-Message-State: AN3rC/6ujdTcAwKq9IDa2kKe3f2s7tN8z5s43x3BF7RrfljN41Jp8IIE
 a8PxegPYQC+7Mg==
X-Received: by 10.55.186.134 with SMTP id k128mr25792677qkf.40.1494272427935; 
 Mon, 08 May 2017 12:40:27 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
 [75.180.228.133])
 by smtp.gmail.com with ESMTPSA id n31sm10167552qte.41.2017.05.08.12.40.27
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Mon, 08 May 2017 12:40:27 -0700 (PDT)
Date: Mon, 8 May 2017 15:42:09 -0400
From: Tom Rini <trini@konsulko.com>
To: maxims@google.com
Cc: u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Subject: Re: [U-Boot,v1,01/15] aspeed: Update ast2500 Device Tree
Message-ID: <20170508194209.GD12511@bill-the-cat>
References: <20170417190034.71945-2-maxims@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="3sRwfncvzkGxASyn"
Content-Disposition: inline
In-Reply-To: <20170417190034.71945-2-maxims@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 08 May 2017 19:40:31 -0000


--3sRwfncvzkGxASyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 12:00:20PM -0700, maxims@google.com wrote:

> Pull in the Device Tree for ast2500 from the mainline Linux kernel.
> The file is copied from
> https://raw.githubusercontent.com/torvalds/linux/34ea5c9d/arch/arm/boot/d=
ts/aspeed-g5.dtsi
>=20
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--3sRwfncvzkGxASyn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZEMoRAAoJEIf59jXTHXZSTEMP/Aw6cv5YTPZVkxf0tU2EDLLM
FSrTGrOlB3xYDQsxQ/8SPwKtCECq0nYFloZ6jNEUXfRzbEUCivPFL7Nxh+Jj1aj8
Czkrcv3DyVuAsFC7LXkD5cS7EyRJqwVRcIGJ2RnOmHCierGQLQ9dcLUT4ln3D6E1
i+chUOEroLFBDABkR74pAYnMEgkzw2Tj1MhHqaDfX1/rRKxr9W4ZJLQSCSXEuY6w
QvDh3GZAeGzI1S7B/L/qMywgOuvGv/aePI/K1FwxcuHQbRNX1J5ltGPE6J35F1JX
Y90YapDdKNQk3hDjkaIE6pg50SnOfuk6gK/wP/l35nF1gRmAtWFRVRyOvRsBYpwX
LmWK58ZzY0Ny8Mgj5iLUewbByFYlYQIlr2FYVwy4TYcdPoEV9Ne/pTH/bRqpSPJi
tT9uY7+GCGI85kPJm+2adf2s+kP3yhkDH3CoWe+w/nDyu8Qxq+Rl+w4fTXErvRQt
3qGeZnyxodS9JryuRe544Oj80+BEYd0JKGrxB91z5lodJ9rOXf0nzhq0cA7XNvD9
4ay9iWa19Mp2oAobOTQt3f0cu5qcwcjH5MlFxxLCuvlfE2c9u2n9SxgBE6cRV2fh
MVRy+ZURXGpoSU92X7z8hV9L9yVC204QxY7YrbU/nx26gKKWKXUc1hNphYfVCRrg
EPwSoSbMEG92kwx3klWO
=hu0Z
-----END PGP SIGNATURE-----

--3sRwfncvzkGxASyn--
