Return-Path: <andrew@aj.id.au>
Received: from homiemail-a21.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qzN0x588PzDqBs
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2016 10:52:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=FCDxb1n7; 
 dkim-atps=neutral
Received: from homiemail-a21.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTP id 42A2B300072;
 Mon,  2 May 2016 17:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=aj.id.au
 ; bh=907sON7cOvfMBYFC+MQcyO5rTeI=; b=FCDxb1n7jEhBf62ppH1IDwjUJbf
 y8RFUbiRCQp/oWKw9jjQm/dlrz4yaSBM+W853AO58g7Jd9L7Ii4nCulM+u8jGK9B
 bZEzYoNHJOeM5AUey4dgxKxJRtvR1I0MCQmfht0hL0FqTIFvo454je9wwmm+poJr
 PH2XvpZVHdfKTr2A=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPSA id 66844300061;
 Mon,  2 May 2016 17:51:58 -0700 (PDT)
Message-ID: <1462236712.3462.34.camel@aj.id.au>
Subject: Re: [PATCH phosphor-host-ipmid] ipmid crashing with simplified
 VERSION_ID
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 03 May 2016 10:21:52 +0930
In-Reply-To: <1462052436-1235-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462052436-1235-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462052436-1235-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 03 May 2016 00:52:02 -0000

On Sat, 2016-04-30 at 16:40 -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
>=20
> if the VERSION_ID is v0.1 instead of v0.1-1 then the code will crash.=C2=
=A0=C2=A0The fix is to always check
> for a NULL token each time.

Do we have a test suite? This kind of patch feels like it should come
with some tests so we don't break things in similar ways in the future.

Andrew

> ---
> =C2=A0apphandler.C | 24 ++++++++++++++++--------
> =C2=A01 file changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/apphandler.C b/apphandler.C
> index 53a83d3..80f239c 100644
> --- a/apphandler.C
> +++ b/apphandler.C
> @@ -135,9 +135,18 @@ int convert_version(const char *p, rev_t *rev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0// Capture the number of commits on top o=
f the minor tag.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0// I'm using BE format like the ipmi spec=
 asked for
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0token =3D strtok(NULL,".-");
> -=C2=A0=C2=A0=C2=A0=C2=A0l =3D strlen(token);
> -=C2=A0=C2=A0=C2=A0=C2=A0if (l > 4)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l =3D 4;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0if (token) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l =3D strlen(token);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (l > 4)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
l =3D 4;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0// commit number we sk=
ip
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0token =3D strtok(NULL,=
".-");
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0} else {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0l =3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memset(hexbyte,'0', 4);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memcpy(&hexbyte[4-l], token, l);
> @@ -146,12 +155,11 @@ int convert_version(const char *p, rev_t *rev)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rev->d[2] =3D 0;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0// commit number we skip
> -=C2=A0=C2=A0=C2=A0=C2=A0token =3D strtok(NULL,".-");
> -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0// Any value of the optional parameter fo=
rces it to 1
> -=C2=A0=C2=A0=C2=A0=C2=A0token =3D strtok(NULL,".-");
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rev->d[3] =3D (token !=
=3D NULL) ? 1 : 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0if (token)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0token =3D strtok(NULL,=
".-");
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0rev->d[3] =3D (token !=3D NULL) ? 1 : 0;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free(s);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
