Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7yfh3LtJzDq66
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 10:21:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=QttwEIxf; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id C4F4D45807C;
 Mon, 16 May 2016 17:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=H789tr+d1sbXcBSliGP6B
 wULtpM=; b=QttwEIxfd+QBOtJ8RSVnv1Sb/o0/XTz7flDlQMKdhgFPv+hFPEWh+
 s+Bq3R5KR6vzzkj5aRO1NZXUQeu+UQvk6z2nG8JQE6eQHRQNSrCLxyu8z14v/qmM
 RbqLXPxb7VDE19lAWPA2FNWO6UmcA9yNkeJXawkCIeMWFUH4Q270Bo=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id E95C445807B;
 Mon, 16 May 2016 17:20:57 -0700 (PDT)
Message-ID: <1463444453.2703.84.camel@aj.id.au>
Subject: Re: [RFC PATCH openbmc v3 2/8] runqemu: Add palmetto target
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Date: Tue, 17 May 2016 09:50:53 +0930
In-Reply-To: <20160516201729.GI19968@asimov.austin.ibm.com>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
 <1458720215-25302-3-git-send-email-andrew@aj.id.au>
 <20160516201729.GI19968@asimov.austin.ibm.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-j/FIOKegtWZcNuek7kYf"
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
X-List-Received-Date: Tue, 17 May 2016 00:21:00 -0000


--=-j/FIOKegtWZcNuek7kYf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-05-16 at 15:17 -0500, Patrick Williams wrote:
> We need to find a way to do this without adding new machines to
> scripts/runqemu each time.

Okay, given that I'll close the pull-req and start a discussion with
upstream about how to approach the problem.

Andrew

--=-j/FIOKegtWZcNuek7kYf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXOmPlAAoJEJ0dnzgO5LT52s0P/1b3aYmq1vFzVrSlYZsGYUu7
E8rP63vCnfog6wIhnSMFMC5ZXlCWG51iOUSrHsk6sGunYEnP45wCaEm7Wen0tb5n
vLMDc4aIQg8wFoyIh5znDSzCPPqOrM0O5l9gcGb48iRkaVOQ4NYFxplu6dNJTgiP
Faars4fiofNRsMkBA0jutBmPyMgjnU3rMcmRsSTmbz0tl04oLkh/9HskOLUm8nbs
OHU+LBBbVhHdb0HJjzBbGyihGLBYfZ51toCLJI1TR+6jucknwHwX9fWVhzBrke5m
WcAV4YKMeYmWMc5DRIwHfkZE4vT1iyDIuTgdRNZHfVjKcphpwcjlUoEBPHvJK//+
QQuqcqmWIKDCr1f/gsE3z6VfgM//VHypxMHh7avhCRUBTOngGBnjOduI+QroJb2C
r4hxMqfAh0F4CoCHAj+8s4LWdfOMZrUgt5WB0ToygMG7Wtnwf8cPdB/HPqVn5Rjm
fjRY7lx2H6/ghBe0Q2W/Zhr5ScNBcrF4jjvlUoVFJBxFEH91RSyYF8eghsZQyalj
uCC5Qd27/cky4oMq5ao5Z82dyguPHWFaS4pwyux+sNx7Z0pHcIGl1jw7x5XkBtBq
r70qyb6PxfbaKhdFDC2EBeyv1dkLgUlbvqea8XNWdJO2qjI7jojncHMzatxL2A4s
2EHTUy0troPh1rLb+kHh
=Rzr8
-----END PGP SIGNATURE-----

--=-j/FIOKegtWZcNuek7kYf--
