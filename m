Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDmZQ5NPxzDqLp
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 06:03:58 +1000 (AEST)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1464120231840225.54890332677166;
 Tue, 24 May 2016 13:03:51 -0700 (PDT)
Date: Tue, 24 May 2016 15:03:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Hi contributors!
Message-ID: <20160524200349.GN19968@asimov.austin.ibm.com>
References: <20160524153000.0a505092@camb691>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2+jOUFLb7N+7fooZ"
Content-Disposition: inline
In-Reply-To: <20160524153000.0a505092@camb691>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 24 May 2016 20:03:59 -0000


--2+jOUFLb7N+7fooZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2016 at 03:30:00PM +1000, Cyril Bur wrote:
> ...
> Sincerely,
>=20
> Cyril
> _______________________________________________

Cyril,

You wrote a lot.

On commit messages:
    I totally agree.  Poor commit messages are a pet peeve of mine as
    well.  I also recommend http://chris.beams.io/posts/git-commit/ .
    Going forward, I will attempt to do a better job of encouraging
    better formed messages in reviews.

On git documentation:
    Thanks for the write up.  Rather than put yet another git tutorial
    in a wiki, I would prefer we point to a good existing tutorial.  For
    some reason new people seem to always want a "cookbook" of simple
    git commands.  [Un]Fortunately, nothing in git is that simple.

On Reviews:
    We do have a problem with some people reviewing in Github
    (Reviewable.io) and some people reviewing via mailing list.  We also
    have an issue with maintainers not ensuring all comments have been
    addressed.

    We discussed at the Wed (5/18 PM for US) call last week how to do
    reviews going forward.  We agreed to the following:
        1) For OpenBMC specific packages we are going to set up a Gerrit
           server for all code reviews.  There is a Github integration
           module for Gerrit that allows mirroring pull requests into
           Gerrit and replicating merged code back to Github.  Look for
           this in the near future.
        2) For packages we are modifying from upstream, we should use
           upstream method (ie. mailing lists for kernel, yocto, etc.).
           Patches accepted into the openbmc meta-layers should have
           already be submitted upstream and have a reasonable
           confidence about their long-term acceptance.
        3) For packages we are _temporarily_ forking from upstream, to
           do significant and focused development on, we can use either
           Gerrit or this mailing list.  Eventually, changes should be
           submitted, via path #2, upstream.

    Once we get the Gerrit server in place, I plan to deprecate the
    automatic pull-request mailer.

On 'Reply-All' issue with patches:
    At some level, this is an intrinsic problem with Github.  People can
    optionally set their Github profile to "Hide my email address
    whenever possible."  The content for the cover letter comes from the
    pull request information they have entered into the Github
    web-field.  When my patch mailer gets the content from the pull
    request to make the cover letter, it has to ask Github for their
    email address.  For people who have hidden their email address in
    their profile this yields something like "Joe Developer
    <joey_d@users.github.com>" (I forget the exact format off the top of
    my head).  Unfortunately, this means my auto-mailer and anyone
    responding to the cover gets lots of bounces, so I disabled the
    auto-cc on the cover.  (There is an obvious solution to filter out
    the @...github.com email addresses but I haven't had the spare
    cycles).

    For the code patches themselves, I use git-format-patch and
    git-send-email and I don't think I suppress-cc at all.  That means
    the author, per the commit message, should be cc'd.

    Like I said early, this script is planned to be deprecated at some
    point in the not-too-distant future anyhow.

--=20
Patrick Williams

--2+jOUFLb7N+7fooZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXRLOkAAoJEKsDR8wtAMEZtjUP/RBAiY7EFnQNEHTn+idhUzwO
uC1StFJrZ7x/KZa8TvAJnLRDC0Y3W4bHL50URF7KCHYRK1KUct40BqGYFnHq6Zrg
nvVSzqUNj0CIMmpg6uqMGBRS9XXJaa4trz7rBf6GAYpK4tMhgUH8s8RsPr7RHE1b
wQ6OkF/K6PINI/w4dW2XVz5JSnIRT/ABi6fZ26C2KCIAEGo74ACMR5JC712Qwcl6
0gzkvbreUAxAGygwb3Se9/IO8bUmQgOJW2lbeIqLDqZ7dKdOZzr6aewYjgg61CAB
NJK2opM50MemeEI/cDE8UsIiKYT57sWQuNuO9ogKTSyhXyRjC3WE+Fu7C2F7VA0z
LWLK5i8dvTCf3iM9R5scmamgECy66DMA83YI4HK/x7Eom5oPTfSxgZCgqZMn49Kj
gr35D4zqwJJDI35GA4lG4rGx6wwxtqcKb9yTy4BVOkfVbSzyMuLlH+H8e0FQKjQ1
gAfVa05le0lKIUVOpTcVPAFjB64UTaWbN/xmCrKvGapDBk/Mq263xymL0gKwPI6/
8tCOwupOJmBbw0Z1F1+nx6P0RREWDI9iun8/FvN0H7S1R9V68FtuA3JUE7dplFsK
RcUlj6hYhj+26dWl7E8UiKVdZW4ZX0IJ1SvUMtEYGi7Bi/PzRNeXQV17M9/iAmNH
nGvpmyWUtvhfSmy/nb+D
=GUqM
-----END PGP SIGNATURE-----

--2+jOUFLb7N+7fooZ--
