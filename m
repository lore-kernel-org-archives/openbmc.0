Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tByxM03PPzDsrT
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 14:44:38 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1478490270977998.1345668048458;
 Sun, 6 Nov 2016 19:44:30 -0800 (PST)
Date: Sun, 6 Nov 2016 21:44:25 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Nancy Yuen <yuenn@google.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: C++ Feature Whitelist/Blacklist
Message-ID: <20161107034425.GA15757@heinlein.lan>
References: <CAFd5g47LDkSS2g62NTTsXHMyDkwERK9CF=5xaO8Ww9sTvwiGRQ@mail.gmail.com>
 <CAFd5g44ro35Wi4-tJK65nucXWoA6n1fxvHAFKXeRZisqH=KHbQ@mail.gmail.com>
 <20161102171839.GB17105@heinlein.lan>
 <CADfYTpF_MtD2v07Rmopu11_VVo0SnzTKN73A9NqyBvtsTkSE_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <CADfYTpF_MtD2v07Rmopu11_VVo0SnzTKN73A9NqyBvtsTkSE_Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Mon, 07 Nov 2016 03:44:39 -0000


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Nancy,

A few minor responses below.

On Fri, Nov 04, 2016 at 02:46:42AM -0700, Nancy Yuen wrote:
> As for fitting in the head of the contributor or maintainer, I don't think
> it's reasonable.  One of the points made during our meeting was that
> openBMC should be a project other people can come in and contribute to.
> Future contributors may or may not be devoting all their time to openBMC
> and may not have the bandwidth to "fit" one of the repos in their head.

What I meant by this was not that every contributor is expected to know
all of the code, but that the maintainer is likely to know the internal
APIs of it enough to be able to review contributions.  One of the main
points of contention is a proposal that "makes it easier to review" and
that is the part that makes more sense when you are talking about 1+
MLOC of interdependent code.  That particular point is less interesting
when you are talking about <50kLOC.

> Btw, Google's codebase is not monolithic.

I realize that was not likely the case, but those were the words Titus
used in his public talk.

> I also want to echo Brendan's caution in his reply with regard to citing
> industry experts.  [3] is not a list of do and don't dos by industry
> experts.  Their abstract clearly states "Please try to verify or disprove
> rules! In particular, we'd really like to have some of our rules backed up
> with measurements or better examples"

I feel you have taken this one sentence very much out of context.

The first paragraph of the abstract says:=20

    The C++ Core Guidelines are a collaborative effort led by Bjarne
    Stroustrup, much like the C++ language itself. They are the result of
    many person-years of discussion and design across a number of
    organizations. Their design encourages general applicability and broad
    adoption but they can be freely copied and modified to meet your
    organization's needs.

They are actively encouraging others to use this list.  The also state
in the abstract:

    The rules are designed to be supported by an analysis tool. Violations
    of rules will be flagged with references (or links) to the relevant
    rule. We do not expect you to memorize all the rules before trying to
    write code.

In fact, clang-tidy has a number of checks for these rules to encourage
their use.

The one sentence you quoted I read as "We are willing to change these
rules if evidence points to the contrary.  Please prove us wrong."  And,
in fact, the guidelines are "actively maintained" on Github and have
changed since their original introduction.

--=20
Patrick Williams

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYH/iXAAoJEKsDR8wtAMEZLTwP/jZpL7OJQpCmswigWtp9Sgy7
GDXT6Pj9RzSynYRmVXaVYY1W4CQg+nF3x53TJ3hUpl1UNRwJtFmDdyZIuX1zorji
pOxF2iQLuj6TEzkr+W80ZxEGY7NGXa8ixBPfMEhuhYDk9OCXP6ehnQYfIHfAoOaP
KJ/GnhmwH1T+EjSsUww1HMnGD1e+YHgPzQtvu/CQ9xCweRb5adE+zfJKp4rRLKzG
VEvzAD0/mFp7dcE+MkKJtZPMiOlz6+Jq81OSlYF6isz3RKfGDj0E8U2AQmKbpQoo
esV2073qX77416MLFJ6E6aPxGlCC+Ip2A+zdcg8ZMjog3gY54m0xPNBJgLPgb+Pq
94go/LBoQghPazEHE0DDa5bCFbk+Qa+40tEm5S1D+aTeiCVM+45HDRv7oo2UHmwf
mm70i/NAzfy/uag+xGsjF8eOZDKOPMqssftmuMZC9KP15n00CJ4wc+VgHWqpjlgn
JjC0swVEDFgyk758ZvogGRjVHYSe62x+ByYzgavgTA9gjWqOO9tGJmP1z5sZ0SR4
pAEvHZnvYQkbBhpgq7JNruU9rYXCmWoWijNZaHpXNUmmYycq9S+2+clHFuDK3wfn
eEHlzt/L7jFWLsiry3LF5p8WLzmm+9XdtmXe+pvuxxiinKxcSfUwQzQLfKlGGmqe
97bOg0rfZSW8DIZpUpfK
=yPkk
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
