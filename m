Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="pmgKxURR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="D1xI4+ka"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnjyL731mzDrVm
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 11:47:54 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 44E43219F3;
 Wed,  6 Sep 2017 21:47:51 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 06 Sep 2017 21:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=ScejXre8qU4p6cJgCmOWJ9ZdmvfW1JmCSjssr98+t
 wU=; b=pmgKxURRl2Eg9JUHP/peVhdckDk7uIDT7luq4dXQfRt28h4YcoRs6ovG+
 UQXgZOQ+idM+kCz4LQsHRnnd4iowiw/ycTv99BSHj8RyTTeV3S8rJU3guO9h10Sh
 ynnXjhoP+Fd0aLI/eEMrw2UYVEmN+wfIC4B92fTxtV1r54SCNbOvl5GPV2Flq2OW
 5muYfj1XYKFC7AB7zBnkHESaDL/TpbFm8KkgxU2inggc11PuE0TCiR63M++cRP6J
 QCuN36sUaJYAb9bQAT9q2dKKu4KzvBxwT5PDb3e5zC9TsxZykGBCWwdKcUGqfTWx
 SZfX8lUrAP5FlrlzK6CCQhVmkxwJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=ScejXre8qU4p6cJgCm
 OWJ9ZdmvfW1JmCSjssr98+twU=; b=D1xI4+kaME9lho3P4d+DzpjnqCpfHvAWW/
 Q9Lv4iZuv9WJ63cIkE/DtoCnHJfOAcP+fA8S54XXFCRg9UfZVLkohxb10SkIincw
 BxwHI5EkgnpUDa8lEt76iwbf3LceRlxZBmZXogxmzIbsi+QgQInZI7CUBQx3wwks
 vkrpRRAvw206oGqyb/hRaRxwrBXB4or8Ex4GRGyDWwEdWF4tjMXxnKAvyY9ffTit
 9/BzQbpSDu9TKLuU1weE6pceW9uNH2V04vjOO0qoYjhg4nPHlMeDFMNqpZeOTChu
 ROhPqxfbogg+MNKlTh1nCd6WS4K83j4ad0LONo34zvK+aYAeeACg==
X-ME-Sender: <xms:RqWwWQMTipi_Jd5Z13kn3wePpzdzdDrZTso53FksO4YmYCRYtDOV0g>
X-Sasl-enc: HeiKDjxCFku6MzFqYqmmzw0HfS4PFdDobDPkgK/vklZ1 1504748870
Received: from keelia (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 67294240B3;
 Wed,  6 Sep 2017 21:47:49 -0400 (EDT)
Message-ID: <1504748863.5105.4.camel@aj.id.au>
Subject: Re: RFC Systemd Service Restart Policy
From: Andrew Jeffery <andrew@aj.id.au>
To: Vernon Mauery <vernon.mauery@linux.intel.com>, Andrew Geissler
 <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 07 Sep 2017 11:47:43 +1000
In-Reply-To: <20170906195026.GD69617@mauery>
References: <CALLMt=q55PXP7_D49z2NHh9eZDzm1Z6MRzbSe=j1uaoUjsuFiA@mail.gmail.com>
 <20170906195026.GD69617@mauery>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-3BMWKi54dWdJHv97lCED"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 07 Sep 2017 01:47:56 -0000


--=-3BMWKi54dWdJHv97lCED
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-09-06 at 12:50 -0700, Vernon Mauery wrote:
> > I have some maintainability concerns with trying to pick specific
> > services to cause a BMC reboot.=C2=A0 Maybe it would be better to defin=
e a
> > default=C2=A0 that all services cause a BMC reboot, then pick specific
> > one=E2=80=99s that would not result in a reboot?=C2=A0 Or maybe it=E2=
=80=99s best to never
> > reboot, and just let the system owners manage it?=C2=A0 Thoughts
> > appreciated.
>=20
> I would prefer that we have a set core (such as dbus and the mapper)=C2=
=A0
> that are terminal faults (maybe even without retries) and then assume=C2=
=A0
> that everything else can be restarted nicely. If something cannot be=C2=
=A0
> restarted nicely, there should be a really good reason for that and that=
=C2=A0
> service's unit file can specify something other than the defaults to=C2=
=A0
> change its behavior.
>=20
> This is a Linux system; in the ideal world, it should only need to be=C2=
=A0
> restarted for firmware updates. All other faults should be recoverable.=
=C2=A0
> Ideal world aside, individual services that can only be recovered with a=
=C2=A0
> reboot can handle that case without adjusting the global default.

I second Vernon's position.

Andrew
--=-3BMWKi54dWdJHv97lCED
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsKU/AAoJEJ0dnzgO5LT5QDMP+QEeaDMYnrsyAy1/73WxcwVv
dz2ZK6uv7x/ZMi8U1pbSeyxUQ+Mxo+G3mLHyEAzX2k1x7/Hqp+fMJ8vgSBiExcmB
3rpRLUdJcfM/JiMk8reCNCDZGIEYpzBdbc588kYsEIaYNYRAS4dECR1chzspZuIp
mwI2LVJxbgs3B+UU5B02a+eH+Trv6whSWMoDFctk0hLObnbDZ31le3IBYjE3uWPy
fxOjUoM2A5pCpMHvT6PXBFdpM/D7C7PYhMNnVkl+hpaI7VLlUS/XZKHjgLatXmbA
qhnYD8S99UpRnjVcqIvT9E2XYYyR60LKuKN5I+bL3yYxICwfNKtDSRyWQYIS4MAU
6ypiYd5zVsuQbjR0nhwcDMsKH3LmiSOEBB5yxCjv4aqiIAV/kwpuvWEgK1dtMObo
BsKRLxHRRFWC4p922mlKXZbnQq8wdRtCl5LI1OYRFLHnWcfUdBtvJ0hGxm8fL0il
rwvitlrJuHR+XVUxqFPnM0SvlheAZemBYiNYmfwtw2BhYsnjYXMKxmamIho6HOs5
GeiAANeQn3xGyKNYS00DVPaDAjwgI5xS1SRgyHbY4UvFfTIH/QPRCMqpdKgLKEEo
zc3a2w14GYPTHaaV+l6GuuNtF/GO0zPTR6BD2zxcjMUoau/JInHXOmtZBWuAz4Zt
MMZ2wu1TkhXyIUdxK8BH
=PzqK
-----END PGP SIGNATURE-----

--=-3BMWKi54dWdJHv97lCED--
