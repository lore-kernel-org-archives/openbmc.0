Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpZzX6dlhzDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 19 Apr 2016 03:35:20 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1461000914128526.3018390567937;
 Mon, 18 Apr 2016 10:35:14 -0700 (PDT)
Date: Mon, 18 Apr 2016 12:35:10 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] Update to yocto 2.0.1
Message-ID: <20160418173510.GC5827@asimov.austin.ibm.com>
References: <1459459235-16287-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1459475158.3978.14.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline
In-Reply-To: <1459475158.3978.14.camel@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Z_61896388 SPT_1 Z_56716064 SPT_1 SLF_D
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
X-List-Received-Date: Mon, 18 Apr 2016 17:35:22 -0000


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2016 at 12:15:58PM +1030, Andrew Jeffery wrote:
> On Thu, 2016-03-31 at 16:20 -0500, OpenBMC Patches wrote:
> This shows that no modifications were made that weren't from upstream
> (i.e. no conflict resolutions or sneaky changes). I also verified that
> c8a4ed9 corresponds to the tag yocto-2.0.1: a nit-pick suggestion would
> be to use the tag name in the range spec instead of the commit id (i.e.
> 7b86c77..yocto-2.0.1).=20

The content in the commit message comes from 'git subtree merge'.  I
agree it would be nice if they used tags instead, but I didn't bother
modifying the commit message beyond what the tool does.

> I don't know how it came about that we based
> development off of 7b86c77 (it's not a tag), but `git merge-base`
> suggests that the 2.0.1 directly follows from it and `git branch -r -
> -contains 7b86c77` shows that upstream master contains it, so
> presumably it was the tip of master at some point?

Yes, it was a tip-of-master at some point in the past.

> Anyway, I've build tested it from scratch after merging my qemu
> changes. The build completed successfully but it produced qemu-2.4.0
> rather than a build from the qemu_git.bb I've introduced. Tracking that
> down now, but otherwise, to me, this looks good so far. Once I've boot
> -tested it I'll send a reviewed-by.

Thanks.  I also had Milton do a netboot previously.

--=20
Patrick Williams

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXFRrOAAoJEKsDR8wtAMEZeKUP/1nNGyz9u7JVBkUq52d5gbqI
d8HZy5R2xR+WdIUUenL5qNbRgXm0V0kMn5PVC6OBCwvy5WEP+RGjXWSBd9OENQkT
vf/YwvVeElYNmqoI7rn/8OfUVJ7EPl49NztB8Uk3jWX0WF0xtRQ9WF4sYCC/KEYM
nby9vwkbgicPFQFgSIupSDoqjd0qRWUt3SFWshm5059dun1fwRAjdyaE0plLBRs2
vWdywd7/aeM3egPJNsAYy7YrAvfBs0K1pFcA/k5pxmLGSONJfEGJvF+pWEhYGf8H
pVnMQGBHK5wCeO45BS0I3UpsFrGpfg/mEKtd/uqY/rMjceX6SRVmdBEs77DifaaP
xNR/vtw/ImnEtW9IXll7ZWJnefyugQCBwYD5bQzpXlwjHC34a3rZon7sfiHOoxK7
TP0G5Z2SNvm8jEC8CFB65ufvI8ynGTwF+tw/mb8bTwjXYZJqIpTd2CNjCD8M2LU1
YAr8j9Bg0OIv3HNlTQCogSbrxXFCruwuxT7ro2vKLf/Ecj1Xa4jNlvj4SHbv7Yft
uVwyAf8+WZNqQ4GAH5S22WAubWcw7gtGec82qvMHTH/sY4jWU7GQO53iJeB4VVfc
5GsA736AEdnwecWmPmOzfebNXAfXsEqLRV6ijc07eEnrVhPnUuytLJMxwo5DJNNP
DT9KeapSrxqz3bUSyOyS
=RblA
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--
