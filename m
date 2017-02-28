Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXKXd40JJzDq8M
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 11:42:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ny2nIPd4"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gvt8PRxn"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 16A302085B;
 Mon, 27 Feb 2017 19:42:05 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 27 Feb 2017 19:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=iSHQnbbsK25RKo8FsPaTAxDVAJU=; b=Ny2nIP
 d4lgA3Wv3PsNZwjwv1oTPy5p4TjV1eCpEivXIitI927NcWGSobo+w9x5uG7VWlsa
 R63jzuAJGeeVKpiCqvBT7ygzF/NooL2PNwRNz/6T5lFIj4rNrU8/1TMkwABOPB0j
 KAcIZFXF2WWrKDu6TE/Yn/sy6R6hEpYVdDLnw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=iSHQnbbsK25RKo
 8FsPaTAxDVAJU=; b=gvt8PRxnJoivtBtNMQbJKDuD2b0D+4jlZo1LxKfRJUMod6
 ojPfPScdkp43YEMiB31EIAbkXqssfEGWyW0cuh80d7Q7iU7ZDinCNKAEFG9Hf1NC
 rHIrXyjzy/CJVd7wfn/urJyculwFupuxoBDSoRSmJXZOtv+o1IIMtR8RHgjcY=
X-ME-Sender: <xms:Xce0WGpyQsugVMtTF1-AmCaSJhydQctXMtOHi9sYK6iKVj1WzAif0Q>
X-Sasl-enc: Y8XTV6OTtarZbTaEfoEawBNPWdkROtYh1GiC/D+nRGYj 1488242524
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id C452B240A5;
 Mon, 27 Feb 2017 19:42:02 -0500 (EST)
Message-ID: <1488242516.4258.1.camel@aj.id.au>
Subject: Re: New GPIO API from upstream
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Edward James <eajames@us.ibm.com>
Cc: Bradley W Bishop <bradleyb@us.ibm.com>, Matt Spinler
 <spinler@us.ibm.com>,  OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 28 Feb 2017 11:11:56 +1030
In-Reply-To: <CACPK8XcrzLyjbxKv89WJyOwidfKb=9Y-+0GASkrgEseAwKXkng@mail.gmail.com>
References: <OF0AB1CC1B.32E73912-ON002580D4.007C5341-002580D4.007D7856@notes.na.collabserv.com>
 <CACPK8XcrzLyjbxKv89WJyOwidfKb=9Y-+0GASkrgEseAwKXkng@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-46LXat7tI5YGHkDQgIOn"
X-Mailer: Evolution 3.22.1-0ubuntu2 
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
X-List-Received-Date: Tue, 28 Feb 2017 00:42:10 -0000


--=-46LXat7tI5YGHkDQgIOn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-02-28 at 11:03 +1030, Joel Stanley wrote:
> > The new API provides some useful stuff like
> > triggering events when a gpio line changes, etc.
>=20
> Triggering from GPIO line changes is also possible with the sysfs API
> - you can poll() on the sysfs file as described in the documentation:
>=20
> =C2=A0https://www.kernel.org/doc/Documentation/gpio/sysfs.txt
>=20
> When we're dealing with inputs, another useful interface we can use
> from the kernel is input events. We use the device tree to bind the
> gpio-keys driver to the GPIO, and this gives us an input device to
> read from:
>=20
> =C2=A0https://www.kernel.org/doc/Documentation/devicetree/bindings/input/=
gpio-keys.txt

This is primarily useful if you want to apply pinconf settings to the
GPIO, e.g. debounce periods. It does require that you assign a keycode
to the GPIO, which will then become part of the system's kernel ABI.
That's a bit of a detraction, so your use-case will play an important
role in determining whether this is the best approach.

Andrew
--=-46LXat7tI5YGHkDQgIOn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYtMdUAAoJEJ0dnzgO5LT5iz4P/jnI+crEGRwrI4Coaqqokl5V
o3G+26yt44xEQTi08gj/m8LIePPNpeuHpslGO4Dk63R7asDKQmDDkTelTn8IOgAg
+O+Xlt+xVOyU6w3uAoMzDrLT3USPjDAZbqWRMm39M4LQhU0yYTxKkCJ9RsR3kVeh
2cBX+fXO+4/zt1vudzEiRlWJrtgQdzaMGxasmLJaLGIsl7Oic7vWu75JR1ccM7P+
kovTfQmFi4FXBuptrPVm/bHFISVCHrVGZTLTnHUEK4blWbYxsyxS51jUTTG+VdL5
GHjBbTr3xwJTHEvtTPwjROnfS+LVXnePQoZeV1nDWb76mxMFYMvzaRpmPGeShUeh
b0tXirgZGXlO5qaz2/GkEvSZWVxA021NnI+asPS6j+fU+zUMoQ1V4XaWtA3yFA8r
VGUceTK3w2EWsldMrCmgzItOSGS+0oOQmikqERsfEnnxNZyzRIdzcoHUTPEWU70Z
V3GbMeFlk2B2sGsdANLeWNuXzf2i1REbWnSm7iP/2xM3JupG2ssA1BhHiIoBUBXE
UKcvaJQWAs69DlGobjbMjOBQQ4AcM1tpYiLkKu1bkwVZG+qANuQmWhfnNWNSAgSl
M6cOjr5lL4QUGYb/XnvkqiXdS3rQyjw6j13qHy+hxsKhkQOU3ZiGHc1/R8Bpx5Aj
pcl1sEMdEmt6RHcwq/mv
=i7AI
-----END PGP SIGNATURE-----

--=-46LXat7tI5YGHkDQgIOn--
