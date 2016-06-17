Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rWKyq4gf9zDqJn
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 22:57:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=q/Kv5eiv; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 4A7472889D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1466168224;
 bh=BeZt+KrMWpgMyJ0NxFrPI/i1Co/NcbvOHfy6SLvnsn4=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=q/Kv5eivwLyIL3PS4awNLstNOw1To+Ipi/hig92yUBbQ/piaK6+p9glQbH29epwF9
 PbHntwEPkPz+bsPvn/GYmAMQ4dSwk9U0+0zofL9vFkfKGKPlIZKSYpi/8BryxE/5jk
 2x8I68mJpmxmtJH9Wdl4q9V56VCC83CyjQmBm2vw=
Received: from [192.168.253.29] (unknown [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id 6AC5228863;
 Fri, 17 Jun 2016 08:57:03 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH phosphor-rest-server] Add a convenient/short logout command
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20160617120046.29620-2-openbmc-patches@stwcx.xyz>
Date: Fri, 17 Jun 2016 08:57:03 -0400
Cc: openbmc@lists.ozlabs.org,
 Nan Li <bjlinan@cn.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DC50D0E2-B46B-4E33-A50F-CB4EEE809360@fuzziesquirrel.com>
References: <20160617120046.29620-1-openbmc-patches@stwcx.xyz>
 <20160617120046.29620-2-openbmc-patches@stwcx.xyz>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
X-Mailer: Apple Mail (2.3124)
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
X-List-Received-Date: Fri, 17 Jun 2016 12:57:08 -0000


> On Jun 17, 2016, at 8:00 AM, OpenBMC Patches =
<openbmc-patches@stwcx.xyz> wrote:
>=20
> From: Nan Li <bjlinan@cn.ibm.com>
>=20
> With this patch, we can logout by:
>    curl -c cjar -b cjar -k https://BMC/logout
> Traditional/json format logout is retained.
>=20
> Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
> ---
> obmc-rest | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/obmc-rest b/obmc-rest
> index e7dbbba..8750a1f 100644
> --- a/obmc-rest
> +++ b/obmc-rest
> @@ -411,6 +411,7 @@ class SessionHandler(MethodHandler):
>     ''' Handles the /login and /logout routes, manages
>     server side session store and session cookies.  '''
>=20
> +    verbs =3D ['POST', 'GET']
>     rules =3D ['/login', '/logout']
>     login_str =3D "User '%s' logged %s"
>     bad_passwd_str =3D "Invalid username or password"
> @@ -460,6 +461,10 @@ class SessionHandler(MethodHandler):
>             request.get_cookie(
>                 'sid', secret=3Dself.hmac_key))
>=20
> +    def do_get(self, **kw):

I like what you are thinking here but we can=E2=80=99t do this.  A good =
rule of thumb when deciding if something can be a GET rather than POST =
is if everything would continue to work if the client cached the reply, =
which for logout clearly isn=E2=80=99t the case.

One thing that can be fixed with logout is right now you are required to =
pass post data like this:  =E2=80=98{=E2=80=9Cdata=E2=80=9D: []}=E2=80=99

It would be nice if we could get rid of that (but still do a post).

What I do to cut down on typing is create a .curlrc file and put all the =
options in there.

$cat ~/.curlrc

cookie =3D "/tmp/.cjar"
cookie-jar =3D "/tmp/.cjar=E2=80=9D

Thats all I have in mine but you can add the other options too.  Check =
out the curl manpage. =20

> +        if request.path =3D=3D '/logout':
> +            return self.do_logout(**kw)
> +
>     def do_post(self, **kw):
>         if request.path =3D=3D '/login':
>             return self.do_login(**kw)
> --=20
> 2.8.4
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
