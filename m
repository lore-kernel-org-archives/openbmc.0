Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t53WG0JlKzDvNS
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 23:50:01 +1100 (AEDT)
Received: from localhost (170.225.9.144 [170.225.9.144]) by mx.zohomail.com
 with SMTPS id 1477658993868288.89157560794706;
 Fri, 28 Oct 2016 05:49:53 -0700 (PDT)
Date: Fri, 28 Oct 2016 07:49:52 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Nancy Yuen <yuenn@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Merging rights
Message-ID: <20161028124952.d5nsytcmuve7iugl@asimov>
References: <CADfYTpGhjpJrghBk9GUw_Epi=buw_TWfhAkTr=OzmZrFvfQcSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ycbariqneah4gs7c"
Content-Disposition: inline
In-Reply-To: <CADfYTpGhjpJrghBk9GUw_Epi=buw_TWfhAkTr=OzmZrFvfQcSg@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Oct 2016 12:50:02 -0000


--ycbariqneah4gs7c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2016 at 12:37:34PM -0700, Nancy Yuen wrote:
> I'd like to be added as well.  I can help with changes coming via Google.

What I did was change the ACLs so that anyone can merge a commit that
has a +2 from a maintainer, not just maintainers.  What happened with
Joel was that I gave it a +2 (ok to merge) but was waiting for a +1
(verified) from Jenkins and then I went to bed and forgot about it.
Now, if you have a commit with a +2 from a maintainer and a +1 from
Jenkins you can click 'submit' on your own.

As the community progresses along further and individuals establish
credibility in their expertise areas we will revisit how to spread the
maintainership workload out.

--=20
Patrick Williams

--ycbariqneah4gs7c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYE0lwAAoJEKsDR8wtAMEZE4IP/2GcBUdL0oLzJFsF45Bpxl5E
JXhGs+0tmGZ9V2stCXlE8xfwR3uq4AB3Q5Y5ZkQfrlhjsKPKjMnJ7h058WRC/X8U
wUDeMYdx2+K97O+I7m+/w2ntps0HuTqhK9TwB0YnsuP+DmvF98BDOCw1EDRAv7qa
+VYnt+04m/MnDR5oJ00dVIyc+EfE5hyyWMUSkudQxPixp2Pg8Wt6gOV/QngH0Fo5
fVoZ5q6bk2mGulbXAGb8PNfWqHAYFZu5lZybUY5LsiBlFF0UW3M1zJ8LcUVjuepC
EjDG2Jlm7jl/V7SUmlBDpuDOepWnXrUMhUXiRAL9JHGB7iiMqmqb8aqBcb6G9zvq
P+6z9DTKFwWOH7tFjd8HKhiUfNwCwUu7VSkX1dzcbNet/zJvKLgVzOFJA92CuRrN
Fxv9iG/Mcgw6zln9jmriDp3Kc3oZ36O1tFrk3myz2G5qLe1CrfSpp5oAVEtXy+gf
zP+n16pJI3D3GK3Rqo+YnvqGapff5teQfqSBj1Nfe5iDMV4qvkt2O7qtGi7jyj8I
nGeqYuvIB9k/qK/Zug72PKkRGtsAUD5GrThsHJBk919IBx4Q7X8v3y3A+dcuCf2/
ipPUWk+Ac8ANH1Nnb0ObDVsqOgyfW30m14iAMo3TmaQxBpEXs+/YLipD2zKqniD0
UWF5ZEP6g3qfK5IK0hjg
=8yJB
-----END PGP SIGNATURE-----

--ycbariqneah4gs7c--
