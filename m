Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5AA221A0B62
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2016 09:35:25 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1457044519969807.5491566998361;
 Thu, 3 Mar 2016 14:35:19 -0800 (PST)
Date: Thu, 3 Mar 2016 16:35:18 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: Cyril Bur <cyrilbur@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH linux] net/ncsi: Fix possible deadlock caught with lockdep
Message-ID: <20160303223518.GI6601@asimov.pw-on-the.net>
References: <1456370426-11311-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456370426-11311-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8Xf2LmYJ+bjd3EY-RRm_VW4mOXhTAYC_aMuf-nnPHQNuog@mail.gmail.com>
 <20160226163612.4491a525@camb691>
 <CACPK8XcNM2j-ehHWC9mF_HXLUeuqc4M2HZxE_=ZXy1OMoEAyfA@mail.gmail.com>
 <20160229090853.3559a7af@camb691>
 <CACPK8Xe4XQu9EcoJZ5J3q_LFgS_n_D36dfG+9fh_i7VRhvXUdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VkVuOCYP9O7H3CXI"
Content-Disposition: inline
In-Reply-To: <CACPK8Xe4XQu9EcoJZ5J3q_LFgS_n_D36dfG+9fh_i7VRhvXUdA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_2_25026_10
X-ZohoMail-Owner: <20160303223518.GI6601@asimov.pw-on-the.net>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.52
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
X-List-Received-Date: Thu, 03 Mar 2016 22:35:25 -0000


--VkVuOCYP9O7H3CXI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 11:30:58AM +1030, Joel Stanley wrote:
> On Mon, Feb 29, 2016 at 8:38 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > On Fri, 26 Feb 2016 17:09:40 +1030
> > So that is the preferred workflow? Happy to not do pull req but I've so=
rtof
> > just gone with the majority.
>=20
> Yes. Doubly so for kernel patches (I'm the maintainer of that repo).
>=20
> We want the project to use the same workflow as most of the other
> projects that open source developers are familair with; xorg, kernel,
> skiboot, etc.
>=20
> I think the reason we're using the github -> mailinglist bridge is
> down people on the project not having access to real email servers
> they can use with git send-email.
>=20

The other reason is that many of the repository 'maintainers' use the
Github merge button instead of manually applying the patches in their
git repository and uploading.  For the non-kernel repositories it is
much more convenient and easier to track if they are in a PR.

> > There's simply no way with stuff coming from GitHub? I find myself misr=
eplying
> > to a lot of those...
>=20
> The github to mailing list bridge is Patrick's work. I suggested to
> him that we pull the author's name from patches and cc them; he's
> added it to his list.

I actually had it that way at one point and then started getting too
many bounces with people that either hadn't properly 'git-config
user.email'd or edited in Github directly which scrubs the commit author
email.  I'll have to think about the best way to detect that so my bot
doesn't get tons of bounces.

>=20
> Cheers,
>=20
> Joel
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--VkVuOCYP9O7H3CXI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW2LwmAAoJEKsDR8wtAMEZgMYQAI7PS7nd8BqnNMdexEVeOXQ8
Q7Cvv8LWvvGuxNtex+BNUXJ2XHCQbBWGjvZp5bH/Om5wFb+SdEPE8I1nnAwokaZx
ptsf0VBTumTAGEFDizFwMGkwQTR70DdTT1IRT9HVEynkdRVZxqaoDgocIB4JGut3
KuO4qOV2KuvgVxvppF2Mk3LFqfm+fT4ztMbxhaEgqFvC9z48SKlj3k91zhPvhwvK
JFQrWAlm2l2YXUxjBmAAzduY1x7uxvU+vvDHEikP4ScDbtE33Ek86w+eV1i1Gdj9
hNOm3FaIghpFmQUt6o4lAiRxisQMcrKxoxXkGvkKjGZEz2NH5lz4y3Twk8gH8EOG
s7Hiu2LcPdRah2YAZnjhLnMcYDsxZ7u43YafRQH+C50nT+jYD+Ds1vLcqaOtk8dk
JUunDEvbyLdMNVJ5Gxbnl8hiwMNMQ1EfeYpnHTFocP5qtfXw3J7kRlsrfgE49qXk
lc7v8Zkum+9ZNFWadiQ5cX1nvVSQZGqXXAtByjGLLpNA246cWwIjtWemtZK9P3/m
B8DhSSgaQfCXHoltcAUNzkafaQPzINMbOiQIAyjGXtNu70mmNY13FdYPtxz9RuMo
+H+yGJ9XwHRiBPiIe868PXt4DTayi6hMs/uhEGYhBIRzj/ii4VHkeR923WwebSoc
kMrXQiRXH+GPodFuud8C
=s7nq
-----END PGP SIGNATURE-----

--VkVuOCYP9O7H3CXI--
