Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tFHvX43vYzDvkh
 for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2016 09:36:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="doof436c"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ThjPqqr0"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A590D21F6B;
 Thu, 10 Nov 2016 17:36:04 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Thu, 10 Nov 2016 17:36:04 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=BgVt5m1mdZ/rDBbsP2nyGUGCd+8=; b=doof43
 6cKINBWm6zF4/IAjSRHks75C8PPTkdR7Sm1BENDClyWSyQwBeG5WMA9dZrHhOYYU
 4DOA38cfw5nAdfUavywRHe+OjNe9RoMlF1T082/jnGQh7APfc9w/hcMz9B+iiqH2
 40ZOmJIN1wESntaWolbNxJHQnJNPIdfXpF5As=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=BgVt5m1mdZ/rDB
 bsP2nyGUGCd+8=; b=ThjPqqr0mE0pTntZyjOqlfIXHywtNVK0oFjZp79mIyS8EV
 ubGe3BsLvlz9EtNq/nZk+J51Tj7aAuXW0V3O1coFhpF4oRfne6uiMzSlleBrYelH
 xuAcrWetEicQia8GpK/Kyar1w0C6Des0I1ubxixS66q+1SvQYcggD2OA9Qjfo=
X-ME-Sender: <xms:VPYkWGelw-TzNu1F5WUI-eBONetXyhLpMt2KSK9gSSSkLlUx_Rz-SA>
X-Sasl-enc: F6vF7rjcD4VxcQ6rhN6Xfcd7wgKNYcZW7KQJ9yd1MqD8 1478817363
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id A824EF29CC;
 Thu, 10 Nov 2016 17:36:02 -0500 (EST)
Message-ID: <1478817355.12438.3.camel@aj.id.au>
Subject: Re: Add new machine
From: Andrew Jeffery <andrew@aj.id.au>
To: Tiju Jacob <Tiju.Jacob@flextronics.com>, Patrick Williams
 <patrick@stwcx.xyz>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Fri, 11 Nov 2016 09:05:55 +1030
In-Reply-To: <MWHPR08MB2431CF1685C470069330770495B80@MWHPR08MB2431.namprd08.prod.outlook.com>
References: <MWHPR08MB2431CF1685C470069330770495B80@MWHPR08MB2431.namprd08.prod.outlook.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-oFDr8Xy5t7C/SAtyDvPw"
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
X-List-Received-Date: Thu, 10 Nov 2016 22:36:09 -0000


--=-oFDr8Xy5t7C/SAtyDvPw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tiju,

On Thu, 2016-11-10 at 21:08 +0000, Tiju Jacob wrote:
> Hi,
> =C2=A0
> We have a new machine made and most of the code is leveraged from
> Wedge100.

>  I would like to submit code back to Openbmc git hub.

Great!

We have been working with Facebook to try consolidate efforts, as
this OpenBMC project (https://github.com/openbmc/openbmc/) is not quite
the same* as Facebook's OpenBMC (https://github.com/facebook/openbmc/)
where Wedge100 can be found.=20

Regarding submitting code, OpenBMC's presence on github is primarily
for distribution and issue tracking. We're using Gerrit to manage
patches for OpenBMC-owned projects:

https://gerrit.openbmc-project.xyz/#/q/status:open


> I would like to create a new machine like =E2=80=98meta-wedge100=E2=80=99=
 with most
> of the references back to wedge100 and keep only the changes in the
> new machine directory.
> =C2=A0
> Could someone please suggest how to go about it? Also, is there a
> standard step by step method by which we can achieve this?

I'm one of the kernel/qemu hackers on the project so Yocto and its
layers aren't really my area of knowledge, but I expect we would have
to pull Facebook's layers into our openbmc/openbmc repo for you to
build on. I don't know if that's something we would do: Patrick and
Brad (now in To:) might be able to help you out here.

Cheers,

Andrew

> =C2=A0
> Thanks and Regards,
> Tiju
> =C2=A0

* We're working primarily on enabling OpenPOWER machines with an open
source BMC. We happen to use the same SoC series (AST2400/AST2500) as
Facebook, so there's a lot of cross-over in u-boot/Linux but the
userspace is fairly different.
--=-oFDr8Xy5t7C/SAtyDvPw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYJPZLAAoJEJ0dnzgO5LT5kzIQAJbcaSXWGHUOPuTXvIhD/kpE
VgrloBxfcqHPpKhthiduFazh4BeLP/JAVoebNAzM/QSb4geNAzSDUs9Vb3XSBjyD
tKc2HhH1xxJzPcWtqr6/P8FW38MNZXhlqV8XF03pUXggF91ygSiEC6ZfBARrQgYS
CP/gT73UHbsKs8tjuQnr3wxZJ393x3jo7pRtABPqfjRNPcSTDA2YP6u17gY3TwEh
PuSXC2lXbMdUWdOPtjKFC6Vq59zoZTivbLu5oDw32sOLLAAeMWqoCccCdEKA7lK3
bltm5A69vKpIAUe4JLYDps1kkk/HASHRgoZ2e81nkyz3RRVf0Qf09L1nnruYR8gz
60ahefy7yVnkQ7b4j63MtociWpev2aBuo+XVyQfs0TlnErlh0ljy0i9/l+Xq1ci8
Uk0BK68hpl4sK8hQPqVqkUwiMmYNclRsNNOIcdkmnu32ifAwwhjMswpa9Peq8i5+
EkLbaPuwwsXT4aBiOZlOPcblSd4Ldskdvsk9X0J21OEXgCW/ZH8xPEyJFw20JdQZ
Z6fktf+Bd/ucrLkkvmrXwfciBhE2NcEhHXbIXSo7loWTdwnk53FpFPc5BfVMUoFH
0v48a/985N7tqqIF6IbaOubJjGLvt+h6tZld88NBisY8TdIOk90IXLs1x/TH8hzS
XXx4JwPFUGVKFvwuQZ0K
=YYg7
-----END PGP SIGNATURE-----

--=-oFDr8Xy5t7C/SAtyDvPw--
