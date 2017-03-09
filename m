Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vdyG86qcczDqXh
 for <openbmc@lists.ozlabs.org>; Thu,  9 Mar 2017 15:34:08 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1489034043090283.90344191055146;
 Wed, 8 Mar 2017 20:34:03 -0800 (PST)
Date: Wed, 8 Mar 2017 22:33:57 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: DHCP client behavior
Message-ID: <20170309043357.GA26189@heinlein.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 09 Mar 2017 04:34:09 -0000


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

All,

I'm looking for feedback from any networking experts.  We had an issue
reported by Witherspoon system manufacturing that our DHCP client was
not sending MAC addresses as part of the DHCP request as legacy systems
did.  I tracked this down to newer behavior in DHCP clients called
'DUID's, which are intended to be system-specific rather than
interface-specific identifiers (MACs would be interface-specific).

There are three options for IPv4 DHCP clients and two for IPv6:
    * MAC address based client IDs (legacy behavior, IPv4 only).
    * System UUID based DUIDs (single ID per system).
    * IPv6 'link-layer' based DUIDs (single ID per interface?)

I'm curious if anyone has a perspective on how data-centers would like
a BMC to act based on the three options for IPv4.  IPv6 we will need to
decide between system or interface based IDs.  (ie. what should be our
default configuration; individual vendors can always change.)

I have created an issue on Github to track the long-term decision and
as a temporary solution I forced IPv4 to MAC.

Original issue is at [1], follow up for this assessment is at [2], "fix"
in Gerrit is at [3].


[1] https://github.com/openbmc/openbmc/issues/1272
[2] https://github.com/openbmc/openbmc/issues/1280
[3] https://gerrit.openbmc-project.xyz/#/c/2933/

--=20
Patrick Williams

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYwNszAAoJEKsDR8wtAMEZQqkP/RtpruG9U+oHAjrrkGvClgkQ
m1hcn6kZq6HdNHXjYc1gjLwCv6lgzc7g/ojVJLrOppgopM3lroj5vTq1l+dPcnsI
68Z0pCSsfhIBAN6P/IM5BTMmlqKxWLrZ0ditTPGFvFyZ1EJdgCpPLEPZMDU7HMnI
9kFJieWB8R45iyXyDgtatxBEfLYPZt4sEohtiYIgfLQoe1B/rRhw8yRwhQRdVw7s
8svUYkO+6EIqEMdXT1p08KDjLZks04NvKVLHW00LaDle6DIIclX/RkkRIUW0uEAC
MmyQa96JxEG72CYSYHIUgXqezAEAJyemDRU1MCBHn/c7/d1wwBGSbMZeAKsenMe0
W4rjft/DDv0pCcKFloP58NGRzrqQPIaDAAmbJXTbZsmFETdh8yffCfHYZsYTF0UK
v216LC/f/ZzQyv99ze0dsHmjwxhykc2npzX1HjszqlNvJtgvv4M4Y3JtBBWqeeXf
fht3lI3DjgjEe+rWAk5A5EfCMvOtAFtn23iKTGVPbOV9JoF1kB5UUyP16vxQwHDf
jD1pbaD18dDdfn2UJBw7U3Kw1pGjvbaPtbQfpVJL5qg1LT/RUK9FPqEB0cG9hsQq
MmSM/xkhMCSJrUCCTttjP6p1HvpZZ7S2B8Xe/Ip5R1+6j+128sDRi3w3ILwS7LFU
Xru76oGt+iqhjCfqaOkN
=JnEB
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
