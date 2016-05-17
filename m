Return-Path: <andrew@aj.id.au>
Received: from homiemail-a17.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7zsY00CJzDq66
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 11:15:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=b4tUxsUC; 
 dkim-atps=neutral
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id EB6A92B206E;
 Mon, 16 May 2016 18:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:content-type:mime-version; s=
 aj.id.au; bh=07f7ec+2s3MCshwDrDT4LbxMnUA=; b=b4tUxsUCXjJchmEGiOl
 OvfJ+d++9HwEw9ZeuYw7Xs+H6cavGWciILKu0aLUkgGZvVN/oPMazb2TOqtdOEmE
 B5ReasdOwMSd0woa3pj+9Lt+hCLOGiFx/RodVEZDStQLcmjCaN4eRmLprDQ0THcW
 2lJnbZutCoM+ZkyIW5Izgtyw=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id 168E42B2065;
 Mon, 16 May 2016 18:15:24 -0700 (PDT)
Message-ID: <1463447715.2703.112.camel@aj.id.au>
Subject: Extending runqemu/runqemu-internal with new machines
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Yocto Project <yocto@yoctoproject.org>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Patrick Williams <patrick@stwcx.xyz>
Date: Tue, 17 May 2016 10:45:15 +0930
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-pUkIokhvVy5Imflxox41"
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
X-List-Received-Date: Tue, 17 May 2016 01:15:29 -0000


--=-pUkIokhvVy5Imflxox41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm interested in how to best extend the runqemu/runqemu-internal
scripts to add support for more specific machine types. The OpenBMC
project[1] (which uses Yocto) has been working on upstreaming support
for the Aspeed AST2400 and AST2500 SoCs[3] in the kernel and qemu, and
we'd like to run the same configuration in qemu as we do on hardware.

As it stands the qemuarm configuration runs a versatilepb machine, but
as we have more relevant machine types in upstream qemu (e.g. palmetto-
bmc) we'd like to invoke them instead.

In the OpenBMC repo we have Yocto as a subtree to which we apply
updates from upstream. Given that, it's best if we have no changes to
the subtree so that upstream patches apply without fuss. If we want to
provide additional machine types in runqemu/runqemu-internal it seems
that we cannot avoid carrying patches to the scripts, which will need
to be reworked when we apply the upstream patches.

Is there a better way to work that might avoid these issues?
Alternatively, should we start looking at reworking the
runqemu/runqemu-internal scripts such that we don't have to patch them
to support our use-case? If so, what sort of approach would the
community be happy with?

Cheers,

Andrew

[1]=C2=A0https://github.com/openbmc/docs#openbmc-goals
[2]=C2=A0https://github.com/openbmc/openbmc/
[3]=C2=A0http://www.aspeedtech.com/products.php?fPath=3D20
--=-pUkIokhvVy5Imflxox41
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXOnCjAAoJEJ0dnzgO5LT53sEQAI0tLg8W0hfqMFhQdaiVElsF
sdVZEQGlj7nZFvLS+WCrADs6+mxiJtpmAnw57fN7SkDAwkPrjC6bYR+286NqarmA
jj67hkgBr7tjKPCnNkeVmjzwgG/qcRU/UmDtHAPIlGIRtIZw16Nlx5mjbxjW/ErU
0G3NYpw6SLeQIyL2JxWoGaO34dxOnktODsUg2myxFiFwvzx88pjl2AISai9V/eTn
4wCjNCOjxu9m9JaCx6k7/ktdRHVS/ZSxNh9xwmpJXnGoahsMkHuQEj1t5f16wDd5
/thYYQDACeiAK4Kg5wD+AyhXd2vFKZS1AIOui29vZ5srb2jUikZTDaNfEKVPLlDq
9ow4eQyvCABlVFv86/ghKON0jVACu92yTW9N8PZR2k7WZThY2rGBQn5dYbQo4nqM
1AFuefwYP4sibFxkWCu/RPWZzQi1xjHqfBD0ps3jBRlULeZEecyaRs/WaQcERYZ2
Tdwcb9zepB2buZRjVXIoRvUpuLQTdezP+n7i8qY+TE0ZxDK26vHJhYyKZBmUcOI+
v21km0mcNTTF8qcr1hnHo1GA0Y5aAeFmAvr++SKCBsB0gnvJIYzZtOX9OT1C+w/P
oiFKG6kovNjGHL+jO5ZSAR3w5tWkpLnfj3MGxXfr/awsSAj4NL4EYH0sgj98Z/Sj
XKsrpPciYq3h/Kfx+hW1
=fIxi
-----END PGP SIGNATURE-----

--=-pUkIokhvVy5Imflxox41--
