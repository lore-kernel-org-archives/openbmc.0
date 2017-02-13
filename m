Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vMdDB5XnnzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Feb 2017 07:57:46 +1100 (AEDT)
Received: from localhost (32.97.110.56 [32.97.110.56]) by mx.zohomail.com
 with SMTPS id 1487019455839637.8512801328319;
 Mon, 13 Feb 2017 12:57:35 -0800 (PST)
Date: Mon, 13 Feb 2017 14:57:34 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Ben Stoltz <stoltz@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: High level security requirements
Message-ID: <20170213205734.c4snlgexo3wubxz3@asimov>
References: <CAP0xrXhBNr56y26HqUwjD_2wWh3mCqQ=uA1fgHsfT-yLBFKOiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xh46o3zuiduqkuue"
Content-Disposition: inline
In-Reply-To: <CAP0xrXhBNr56y26HqUwjD_2wWh3mCqQ=uA1fgHsfT-yLBFKOiQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 Feb 2017 20:57:47 -0000


--xh46o3zuiduqkuue
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ben,

Thanks for starting the list of items Google is concerned about with
respect to security.  This will certainly help us as was start
implementing the code-update support for the BMC.

With respect to P9 specifics, processor design team and the host
firmware team are not really on this mailing list.  I can try to fill in
details where I know them and am fairly certain the information is
already disclosed, but for others we might need to have a confidential
discussion off list with internal IBM teams.

On Sat, Feb 11, 2017 at 02:26:38AM +0000, Ben Stoltz wrote:
> I still need some background on Power9+OpenBMC and OpenBMC in other syste=
ms
> in order to form a solid opinion on system security.
>=20
> In the case of P9, I want to validate the SBE OTPROM and SEEPROM before
> deploying to the data center. I'd like to be able to automate that
> procedure and run it for any racked system at any time.

OTPROM stands for "one-time programmable ROM".  This is effectively a
set of fuses in the chip that are blown at module manufacturing time
by setting a specific voltage pin at a higher voltage level and
running a programming procedure.  Once this is done it cannot be done
again and, at least how it was for P8, the systems do not even have the
correct voltage level to do the programming outside of manufacturing.

I'm not sure what facilities exist to even read the OTPROM.  I also
don't know how you would get, from IBM, the correct image or a hash
of the image or whatever.  I suspect the image may change over time to
make minor adjustments without a new chip revision or chip part number.
(We need to follow up off-list for this one).

You and I have discussed the SEEPROM previously.  There may be ways to
configure the chip so that the BMC can read the contents out.
Witherspoon is not designed for this; Zaius might need a design change
to facilitate.  I suspect the host firmware team will need to make
changes to the SEEPROM layout to separate out code from data so the BMC
could verify.

> See https://cloud.google.com/security/security-design/ for some publicly
> available information and context. At the lowest level:
> "...We also design custom chips, including a hardware security chip that =
is
> currently being deployed on both servers and peripherals. These chips all=
ow
> us to securely identify and authenticate legitimate Google devices at the
> hardware level. ..."
>
> Any P9 or OpenBMC security solution should be a very strong story,
> independent of additional measures employed by any particular vendor. The
> threat model should be clearly stated and be specific about what is in and
> out of scope.

Generally speaking, for P8/P9, the security model is that the BMC
protects the BMC and the Host protects the Host and neither trust each
other.  This is how the Power chips are designed from a security
perspective and it certainly fits some vendor's use cases and maybe not
others (apparently yours for sure).

My understanding is that on many x86 servers the BMC is effectively
optional and on some servers the host can even begin booting in parallel
with the BMC.  The BMC might not even have a physical connection to the
flash module containing the BIOS.

We are certainly open to a configuration option controlling:
    * Does the BMC manage the Host flash?
    * If the BMC has access to the Host, does it perform any type of
      verification?

> As far as the OpenBMC filesystem design, I expect the BMC to follow the
> typical sequence for each layer of the boot procedure:

Does "layer" in this context mean u-boot, kernel, userspace on the BMC
or does it mean BMC, Host, ...?  If you mean u-boot, etc. I suspect not
all of these in your can be done by every layer.  (How does u-boot check
for a pending update?)

> 1) check for pending update and update if needed and valid
> 2) remove the ability to update
> 3) copy code and configuration into place for execution
> 4) validate code and configuration
> 5) record measurement or equivalent operation for the system
> 6) transfer control to next layer
> 7) next layer does its work including progression to its subsequent layer
>=20
> The BMC, even though it runs Linux, is a fixed stack and has lower overall
> complexity than the host system. Ideally, the BMC can re-enforce the chain
> of trust of the host. In particular, I'm looking to the BMC to close the
> possible gap in the SBE OTPROM and SEEPROM which could otherwise harbor a
> persistent attack (e.g. load HB, validate it, maliciously patch it, run i=
t).

I think we're going to have to talk in detail on the specifics of P9 on
this list and paragraph.  I don't know how the BMC could remove the
ability to update the SEEPROM because the P9 host firmware certainly
needs the ability to write portions of it.  Otherwise, someone would
need to port a significant amount of SBE update code from P9 host to the
BMC and figure out how to feed it with all of the appropriate data.
That means, just as one particular but complicated aspect, the BMC using
FSI to read all of the DIMM SPD, determine the desired DDR frequency,
and calculate the P9 nest internal frequency and update the SEEPROM with
this.

At a basic level, having the BMC verify PNOR contents can be done.  We
do not plan to do this for Witherspoon but we are trying to organize the
code-update and host flash management implementation in a way that this
could be straight-forwardly extended by someone motivated to do so.

> The OpenBMC filesystem and its contents should be verifiable before they
> are used. What is the scheme to be employed?

Rick did work for u-boot and kernel to use FIT signing.  We have not
determined what to do for the userspace rofs yet.  We are using squashfs
today and that will likely stay the same.  I suspect either FIT,
dm-verify, or IMA could be used, each with their own set of trade-offs.

As of right now, we do not have verification high enough on the IBM
team's priority for Witherspoon for Google's Zaius timeline.

--=20
Patrick Williams

--xh46o3zuiduqkuue
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYoh2+AAoJEKsDR8wtAMEZIgkP/jQswWkBMtKOhUdje3JQ1GkB
YQd6BOvTOeYybD/o+UQpKS5N1uJ7eTd6Xhy3l0n6GWg4V3qsxpgomWpYv0y5qcH/
UqNiVQ/KoHwzzmsA+GLfnYrN2kf0FpNiqcapDTRnbvqNEddjV598dUuVAd4moJiW
Y9rXq7IGI/9SVD958AVJqmC0Ov5/hPMSO+FxxZ2NjLs96KwKdy0Q9lSjM07cSYt6
YPi5SniE02PxYzHnQ2dGkpOl6JpZqWLWydPd0J4c8gl4StTUKqo0kbmexxrCoPz5
PF6wQzTFS/aD9EvYiOD0lTmmec4y/IusbVo8Oeb0iMXo1hg1wAcd3utxO4k18MRs
P51j+9QLSi6QViSKsMQumBKYuF5B6lsh1cgQvcPBN3bG+WlfOoy+syvVsIHIzkd8
nxVQ9LLU9rlIXZvV7KF9tI6KkspIT84KSEE4+vsgQ6uxC9lrsAhboAenTr71bm5x
tBDawJxZVoSfMicxLGH+uawasTLXnh+B9uR9vXlCCEhOtBkXPBB2aGDmsExY2q8A
SGwCOmE4/VKb70SLbMO8SHyHu7eDmkQCUcIY4Xq6WMp5OCAnt8Jjh0ZG5gZCJwB5
JnT2XFyD/tcxkESH2wVtgoSpFrlSoNwUgRqeKxyduEDJnPMHUkG3odHyJKlL9rGN
Rckb9568RL/hQvFnhAxB
=w9E2
-----END PGP SIGNATURE-----

--xh46o3zuiduqkuue--
