Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNKPc5kvkzDqmm
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 16:08:52 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1501740525792385.5998284701053;
 Wed, 2 Aug 2017 23:08:45 -0700 (PDT)
Date: Thu, 3 Aug 2017 01:08:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Benjamin Herrenschmidt <benh@au1.ibm.com>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: REST API docs
Message-ID: <20170803060844.GH14987@asimov>
References: <87y3r3ooyv.fsf@linux.vnet.ibm.com> <20170801212832.GC14987@asimov>
 <87bmnymoz2.fsf@linux.vnet.ibm.com> <20170802130148.GF14987@asimov>
 <1501719746.2664.16.camel@au1.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Content-Disposition: inline
In-Reply-To: <1501719746.2664.16.camel@au1.ibm.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Thu, 03 Aug 2017 06:08:53 -0000


--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2017 at 10:22:26AM +1000, Benjamin Herrenschmidt wrote:
> On Wed, 2017-08-02 at 08:01 -0500, Patrick Williams wrote:
> > he documentation should be updated.  As I said, I've been
> > pointing out new interfaces being available (with an implementation) in
> > tag messages.  There are on the order of 500 commits going in every
> > month.  It really isn't possible for me to know which ones someone on
> > the mailing list might be interested in.
> >=20
> > As we've said since the beginning of the 2.0 stream, all work is being
> > tracked on github.  You can see every feature being worked on and see
> > exactly when it closes due to the code being merged.  I get that Linux
> > has amazing announcements and wikis for each release, like
> > kernelnewbies, but those aren't done by Linus himself and I certainly
> > don't have the bandwidth do it.
>=20
> Nobody has the bandwidth.
>=20
> What you are saying is "if you use the project, you have to read and
> track every commit message for breadcrumbs of documentation because we
> aren't goin to keep the docs up to date".
>=20
> This is just wrong and impossible for your users.
>=20
> Ben.

Ben,

That is not what I wrote at all.  What I tried to write was this:

   * I've been attempting to point out high importance features in the
     release notes for the tags.

   * There seems to still be complaints about this being insufficient.

   * I cannot write the equivalent of LinuxNewbies for each tag, giving
     a paragraph for each commit.  No one else has volunteered to do
     this either.

   * I cannot know a priori when I have failed to sufficiently point out
     a change that might interest someone in a sufficiently obvious and
     detailed way.

Do you have any guidelines to help me out here on what is significant
enough to write a better "announcement" of and how detailed it needs to
be?  I'm obviously failing and I don't have any clear advise other than
"this is a particular instance when we wanted to know more details."

What Stewart does for skiboot is great and I respect the effort he puts
into these:

   * https://lists.ozlabs.org/pipermail/skiboot/2017-July/008067.html

What he does here, to the best of my reading, is to write a paragraph
for nearly each commit sequence he merges.  Again, this is great.  I do
not have the availability to do this.  If someone would like to help
out, I'm all for it.

I will warn that we have on the order of 150 commits per 2 week sprint
spread across about two dozen repositories.  This would be a pretty
significant undertaking for anyone.

--=20
Patrick Williams

--qM81t570OJUP5TU/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlmCveoACgkQqwNHzC0A
wRnWvQ/+IF8gV10Q4x9NgADFMJuI3iQUe0SJWnGHYWPNl4OTrd+qHDVtCoh4E1PQ
KQb/h2mVLA/j5VdVB6f4EfF2Fn7l5tPVrsFzmWFoExeNTA7b0QkNXi/0b9vcncVm
nWun/X7x77satr9ChJOahy0j8owEAwcqN16j1t1gELefmE93q6RFPIy3IyLbee1I
PTE73xWZbAuMqSUk90kBeoPJK7Kq3w6vPGXOv3n35HzKKKCnJqGkOFJVBTrjsOFB
noEmRJhUw8wgcVMUgrleMROTiwwUsgOURhd9gCce2U0WjivN6cyrVF5K9pfnZou7
d5pTd6MGOEc/0XpgBVXrH82DdmCknkkuPuHzLtHXz8T0x+9wzZ9G2PxP5o9AN6vB
CVZAalRQsVhIq/KZ23p7BC+bLdc0DT9G2c5QSL4P9YKREBoZA9FHoQshD4CpKPvO
uPih+Rp057yusOs3OTOol2ftIqJCh8XSKNMwZcLYglgs2SpQa7lKO2v1DxYShwov
cgk65QUfkpe5slGewMldjYBzq+6jDYDaX7NgdQKIc/5dL/eSR5zBaScdhieZP262
O0LbaU9GYIH2/H8XUTVPYmKXoaQPvGnrmw3mU4z0DKWUvmhoikzMmlXJVF37wYoz
sbsT6ao6Saan5X431MAgoQBzDFRe1dySmHeju6JFqJQuJQ5NP1Q=
=j3G9
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--
