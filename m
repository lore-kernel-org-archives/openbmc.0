Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42YzC862DhzF3Vj
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 13:04:36 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id EB40B6DC97;
 Mon, 15 Oct 2018 22:04:33 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Opt-Out vs Opt-In
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notxKDiY8d5WriLfB6-jNvHxJpJwSivYki0tjhmKwq_PDeg@mail.gmail.com>
Date: Mon, 15 Oct 2018 22:04:33 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CDC64306-BE5C-40A8-AF9C-7FC921B68FB8@fuzziesquirrel.com>
References: <CAO=notxKDiY8d5WriLfB6-jNvHxJpJwSivYki0tjhmKwq_PDeg@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.9.1)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2018 02:04:37 -0000



> On Oct 10, 2018, at 3:33 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> I have rsyslog running on my image.  I have no remote logging servers
> for this... I have no desire for this daemon to run or take up space.
> In general, I turn off about a dozen IMAGE_FEATURES for my builds.
> Stuff that I don't have set up, or just don't need.  Every time I
> rebase I have to build and look for new things to remove.
>=20
> Recently in the security group we've been discussing the opt-out vs
> opt-in model for packages and configurations.

Isn=E2=80=99t opt-in just core-image-minimal?  If that is what you want, =
then
just use that as the basis for an image recipe in your layer.

My take is that the image recipe provided in the phosphor layer is
the reference/full-function image recipe and as such should use as much
software provided by the project as possible (for ci/testing/validation
purposes).

New/additional image recipes in phosphor could make sense if they were
re-usable=E2=80=A6 something like phosphor-no-nic-image.  But the =
full-function
one can=E2=80=99t go away in favor of something with less functionality =
out of
the box.

>=20
> I want to take the community's temperature on this.
>=20
> Patrick
