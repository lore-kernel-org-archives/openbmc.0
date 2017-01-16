Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2PJm3VCTzDqQK
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 07:02:00 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1484596914978207.96571411605873;
 Mon, 16 Jan 2017 12:01:54 -0800 (PST)
Date: Mon, 16 Jan 2017 14:01:53 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mine <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Introduce yet another C++ naming style
Message-ID: <20170116200152.i33vpduimcqkm4zg@asimov>
References: <CAARXrtnAQEo_Gt8D+abpHYCKb4O3z2FxmsCJWbVXH=TnXdCD+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jz4ctkuqqd27troo"
Content-Disposition: inline
In-Reply-To: <CAARXrtnAQEo_Gt8D+abpHYCKb4O3z2FxmsCJWbVXH=TnXdCD+w@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 16 Jan 2017 20:02:01 -0000


--jz4ctkuqqd27troo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I was out for a while at the end of December and didn't get around to
replying to this.  I don't want it to seem like you're being ignored.

On Tue, Dec 20, 2016 at 05:11:12PM +0800, Mine wrote:
> Hi All,
>=20
> This email is to introduce a naming style I used in previous project, whi=
ch
> I think is elegant and makes the code more friendly to read.
> I just want to share this style for discussion and if you think it=E2=80=
=99s
> better, we may use this style in OpenBMC projects.

There are a lot of different C++ style guides available online.  There
was quite a lengthy discussion previously on this mailing list as to
style guides.  I'm not really interested in doing a wholesale
replacement of the style guide at this point.  Part of the intent behind
what is currently there is to make them as simple as possible and then
"improve" them later.  Incremental changes are certainly welcome at this
point.

>    Some one prefer underscores like _bus to resolve this issue, some other
>    may feel bus is just good.

I am certainly not opposed to an "enhancement" of the current style
guide in this area.  The current wording is:

    We generally abstain from any prefix or suffix on names.
    Variables should all be lowerCamelCase, including class members,
    with no underscores.

I think it is reasonable to allow an underscore on class members because
it is not an unusual practice.  I personally don't find it necessary
=66rom a code-review / code-maint perspective, but the Google guide
prefers an underscore suffix on all members.  Some code in our
repositories has an underscore prefix.  We should come up with a
consistent rule and document it if we want to allow it.

>    3. We may want to define a object with the same name as class=E2=80=99=
s name,
>    such as:
>=20
>    class foo {
>      ...
>    };//foo foo; // This does not compile
>    foo myFoo; // We'll have to use a different name

The current wording is:

    Types: Structs, classes, enums, and typed template parameters should
    all be in UpperCamelCase.

I'm not seeing your issue.

>    4. During reading the code, sometimes it=E2=80=99s hard to find if a v=
ariable is
>    a local varialbe, or the class=E2=80=99s member, or a constant, such a=
s:
>=20
>    class Host {
>     std::string somePath;
>    };
>    ...const char* constPath =3D "xxx";
>    Host::xxx(const char* anotherPath) {
>     std::string theThirdPath;
>     // In this function, how do we tell if xxxPath is a local variable
> or class's member?
>    }

Why does it matter?  You're talking about two different attributes: constne=
ss
and scope.

What makes 'constness' special enough to warrant an explicit style-guide
requirement to differentiate?  Where do we draw the line on which
attributes are special enough to encode?

Isn't your function too large if you cannot easily differentiate between
local scoped variables (or parameters) and member variables?  This can
also be solved with the _ suffix, but I'm not sure if we want to go to
the extent to say "all members must have _ suffix".

> The naming style I introduce will address all these =E2=80=9Cproblems=E2=
=80=9D.

(see above on wholesale replacement)

--=20
Patrick Williams

--jz4ctkuqqd27troo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYfSawAAoJEKsDR8wtAMEZptMQAJ2ATi7STmgNyyRZkJ2IeuyJ
5s3MRzvSL+7kF+88kBkAoZOgg5eUrtBehGFuBFLZj+qdq93rxczwlqRU/BkzsZzl
Y2KVGtbtAAEA3eSqb4TZ2nbIrYHfejw3nF+TjbbU3DTM1PTPpmsbacwXnJ9BFCYs
w1TkA+KY08/5OZpQRgPr88JD/NTtPc8ZEqx9mV1zbyqT49itr3rorOzpsQXA9TRr
uUDYmilX7FBu3XmGrnfomV2hFiCK75MkoePtJZL2rlJVf/8Pmuz9sJbuDCBPBjUf
IfRTL9YEAqqmetzCmpxQQxwIzq89nGafUxWOcK7NxZ59aRIul9v2rqp3K8z5Vedm
12jypTlLJkrDXbxInazRK5JE8xtSrtSG2Xw4xevATW0W9HzlFCjBGoGR0iBU7EaU
Hi3YXijsGihisnzCacIkJgMaI9nMktz2D4ZfHdEy7X0xgGddIYap5cDf8xsaJali
e3KgQL1iI6qpbkLAq/Y5RNH6L7VJ/VQm6cn0/zFgUAJr29WKDe48KOZtGlVoFwXV
prfJ0wPt+oZBy/SscW4lB7SS2US6ZPCKU7b0sjna1IYcE7Ap9erDSpMVfTXRYbQp
tggcZvmHUCR29r6mw7GQ4xlHp0B144oVyBK2r+losS2V8aS+noyy1V/o8BEPk2IU
Nk5MMa1o4neowax6PzhX
=jIOn
-----END PGP SIGNATURE-----

--jz4ctkuqqd27troo--
