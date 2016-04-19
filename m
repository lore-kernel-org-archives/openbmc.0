Return-Path: <andrew@aj.id.au>
Received: from homiemail-a22.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpsPH45WhzDq5y
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 14:25:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=JZPQaoyX; 
 dkim-atps=neutral
Received: from homiemail-a22.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTP id E3B4F114066;
 Mon, 18 Apr 2016 21:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=cqvHI+E/6eIX0AWSzujvo
 iUdfDQ=; b=JZPQaoyXf5lqDMkpxf3pcx0lklr1XHcuwu27nk+PWtgxOk9mdNyXH
 5bUw1f4YVwJ5KXOqZQ1q+sjMFyynzCil9J3nQ5Ce7RoD4iHwkD2IVk023SayrtZt
 2ObxKScyA6WHF6JzfAzg50a9vIEU28PYDBQ/q256781HuCa7GKQ2C0=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPSA id C5E7F114065;
 Mon, 18 Apr 2016 21:25:03 -0700 (PDT)
Message-ID: <1461039894.22188.60.camel@aj.id.au>
Subject: Re: [PATCH pyphosphor 3/4] Added python to dts encoder
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Date: Tue, 19 Apr 2016 13:54:54 +0930
In-Reply-To: <1460724647-4184-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460724647-4184-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460724647-4184-4-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-O58P+ioqj1DORR1QDJr8"
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
X-List-Received-Date: Tue, 19 Apr 2016 04:25:08 -0000


--=-O58P+ioqj1DORR1QDJr8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brad,

On Fri, 2016-04-15 at 07:50 -0500, OpenBMC Patches wrote:
> From: Brad Bishop <bradleyb@us.ibm.com>
>=20
> This is a rudimentary python to device tree encoder.
>=20
> It supports nested nodes and, cell, cell array,
> string, string array, and mixed array properties.
> At the moment there is no support for binary properties.

I think the patch should come with test cases exercising each of the
supported properties. For the tests themselves we can use dtc as an
oracle - throw the code at it and see if it compiles successfully (and
assume that the dts structure is what we wanted).

The tests would also serve as an example of how to invoke the root
dts_encode(), given it is self-recursive and seemingly has a bunch of
optional arguments to support that.

> ---
>  obmc/utils/dtree.py | 63 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 obmc/utils/dtree.py
>=20
> diff --git a/obmc/utils/dtree.py b/obmc/utils/dtree.py
> new file mode 100644
> index 0000000..ce349ee
> --- /dev/null
> +++ b/obmc/utils/dtree.py
> @@ -0,0 +1,63 @@
> +# Contributors Listed Below - COPYRIGHT 2016
> +# [+] International Business Machines Corp.
> +#
> +#
> +# Licensed under the Apache License, Version 2.0 (the "License");
> +# you may not use this file except in compliance with the License.
> +# You may obtain a copy of the License at
> +#
> +#     http://www.apache.org/licenses/LICENSE-2.0
> +#
> +# Unless required by applicable law or agreed to in writing, software
> +# distributed under the License is distributed on an "AS IS" BASIS,
> +# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
> +# implied. See the License for the specific language governing
> +# permissions and limitations under the License.
> +
> +
> +def dts_encode(obj, fd, **kw):
> +    ''' A rudimentary python to dts encoder.
> +    '''
> +    indent =3D kw.get('indent', 0)
> +    depth =3D kw.setdefault('depth', 0)
> +    tab =3D indent * depth * ' '
> +    kw['depth'] +=3D 1
> +    newline =3D '\n' if indent else ' '
> +    context =3D kw.get('context')
> +
> +    if(isinstance(obj, dict)):
> +        nodes =3D []
> +        for k, v in obj.iteritems():
> +            if(isinstance(v, dict)):
> +                nodes.append((k, v))
> +                continue
> +            fd.write('%s%s =3D ' % (tab, k))
> +            dts_encode(v, fd, **kw)
> +            fd.write(";%s" % newline)
> +
> +        for k, v in nodes:
> +            fd.write('%s%s {%s' % (tab, k, newline))
> +            dts_encode(v, fd, **kw)
> +            fd.write('%s};%s' % (tab, newline))
> +
> +    if(isinstance(obj, int)):
> +        if context =3D=3D 'int_list':
> +            fd.write("%d" % obj)
> +        else:
> +            fd.write("<%d>" % obj)
> +
> +    if(isinstance(obj, basestring)):
> +        fd.write("\"%s\"" % obj)
> +
> +    if(isinstance(obj, list)):
> +        ctx =3D 'int_list' if all((type(x) is int) for x in iter(obj)) e=
lse ''
> +        delim =3D ' ' if ctx is 'int_list' else ','
> +        closure =3D ('<', '>') if ctx is 'int_list' else ('', '')

We're branching twice on the same condition here. Perhaps:

    delim =3D ','
    closure =3D ('','')
    if ctx is 'int_list':
      delim =3D ' '
      closure =3D ('<', '>')

It's a little longer, but possibly a little clearer also?

> +
> +        fd.write(closure[0])
> +        for v in obj[:-1]:
> +            dts_encode(v, fd, context=3Dctx, **kw)
> +            fd.write(delim)
> +
> +        dts_encode(obj[-1], fd, context=3Dctx)
> +        fd.write(closure[1])

Cheers,

Andrew
--=-O58P+ioqj1DORR1QDJr8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJXFbMWAAoJEJ0dnzgO5LT5PZcP/0RQzzAlCbSJUy7DDu7uhoWO
QPFQA7pw0B5Yv9mIrq7PNUUSUsEZJEOQFDEbOfDHmgJW/hwk2NUWhfbEvf7sD6FN
odzB+W+ZCDAjQLrrYvfw9ikMt+GM1P7fCfYE+Eq604clZzid4aQ8FQ7G212G2kXj
yVT2JpS7OqENDn/sRBGZ7z92BM7/dKiSsSKBjAwFzO61UOeuFXp+eIM/n+qzj910
YtirKi2DBjMyeNRDAlspb87BhCKSwIN0zxB6KZ83YCa9QnEu+hH5z+R0WbJK4cbu
XArI/xJ4ItQ5Omqne28a2ZjWzVhWknpjOYZQMKNlhuZhUKVrf+e8ujcMmkcog7fl
9+eVfKNzzdZysGTRyi4NCi3zjmVd4e4n8DH/93j++h/yKDjzQGGEtmiC1bq+W8Hh
MP6nT/io+Y3p7K60EXqtPISo1z0uov2nt5iLFy65xdNkP4TdDFkL/RGidQErCT2N
lhv6Mimnzg8tT1uiw/C9vgMOFscSZgIv9dO9UHoJ0NwGKsQEG/PiIRG3zMX5Enix
dzuIHwot4MQiW7Mj0SZquXqXQQIg38A3BGcBzUq43Ae27t/vyK/TYgOJ2Yhz1jlu
zOD0Owg0qIUE69+chgFeGmxcX7Q451ivAKn96VGAE1WrVgKSWxkv5C7HN3LtGF5f
CI2OeilLahpceFvEUaGb
=nelk
-----END PGP SIGNATURE-----

--=-O58P+ioqj1DORR1QDJr8--
