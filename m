Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v4r8p4MdjzDqHW
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jan 2017 06:18:34 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1484939908741736.0696141526101;
 Fri, 20 Jan 2017 11:18:28 -0800 (PST)
Date: Fri, 20 Jan 2017 13:18:26 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mine <mine260309@gmail.com>
Cc: vishwa <vishwa@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
Message-ID: <20170120191826.GC5120@heinlein.lan>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
 <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
 <20170118144408.GA5120@heinlein.lan>
 <CAARXrtmRRC0ix9cXbe=PKdmw_cs=Eend52A1NKy-9WGa0hJwRA@mail.gmail.com>
 <38683dc2-7d4f-11eb-589c-c87784253610@linux.vnet.ibm.com>
 <CAARXrt=ZcCdUC73c27aY28ZgLo8Fsu7GH49RWc-wySK4AcXnkw@mail.gmail.com>
 <24b6ca2f-fbe2-bd0a-2fb5-7200f09d9147@linux.vnet.ibm.com>
 <CAARXrt=wECQNYUOZvVQ0OT9hnB8-za3b2cHoZENkgAC4LhcugA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Content-Disposition: inline
In-Reply-To: <CAARXrt=wECQNYUOZvVQ0OT9hnB8-za3b2cHoZENkgAC4LhcugA@mail.gmail.com>
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
X-List-Received-Date: Fri, 20 Jan 2017 19:18:35 -0000


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2017 at 05:48:23PM +0800, Mine wrote:
> Btw, is there any specific reason why the time mode/owner is only changed
> when host is off?

Yes, I think you're missing the point of having a split clock at all.

Typically you think of a machine as being "owned" by a single party.
They decide if they want to run NTP on the host or run NTP on the BMC
and they point at an NTP server they trust and all is fine.

There is another case of a machine being "owned" by one party and "used"
(leased) by another party.  Typically the owner maintains access to the
BMC and the lessee maintains access to the Host.  Neither side necessary
trusts the other side to keep the time correct, so we have the "split"
mode.

(There are potential security issues with having an incorrect timebase.
A clear example is that your OS will accept expired SSL certificates if
you tell it the wrong year.)

If the machine owner sets the clock to "NTP/SPLIT", they no longer care
what the time of the host is.  They point the NTP config at their own
NTP server and time, from a BMC perspective, is "correct".  At that
point the machine lessee can:

    1. Ask for 3rd party attestation records from the BMC to confirm what
       level of code the BMC is running.  (TPM support, not implemented
       now).
    2. Audit the code on Github to understand how the modes / models are
       implemented and what the system will do as a result.
    3. Query the BMC on boot to determine what mode it is currently
       operating in.

At this point the lessee:
=20
    * Can trust that the machine is running a non-tampered version of
      code that behaves like our reference implementation.
    * Knows from our reference implementation that the 'host time' is
      maintained in a secure manner so that if the "owner's" NTP server
      were compromised, the 'host time' is still correct.

If the BMC were allowed to change the mode while the host is running (#3
is no longer accurate), then it is impossible for the host to trust the
time.  An attacker could simply change the mode after the host as
queried.

--=20
Patrick Williams

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgmKCAAoJEKsDR8wtAMEZJewQAIHj3tQ6tNd/T3NyD4oEpm0x
C+QIxtqLLAiCz7xMDIUQXPSZrLnL1rY8iQN0I+3m4sddt7tz8LW0C58SXc3EjCvU
4sis8GP+Y0hijIyWVd4QuSURXHL4RR6EpxrvkjUXddg9Fdg7QEWF7dmYUu9tlykB
4yKY6hROhFlLjCkJ0CaRNNBpeS0ffRdpnZ9l3O4OdCsLknGe9fZhwI+z8/vXeUcI
Qb5qBQxDqKFpAMGxVNB9+L3kYbPvZYuFWk2tNhpkpDSPh20uCpOU5hVN15FmVJGO
3CyaFD//Tnx4Zv5rM45KIcHVWmM9uvTmlR5cqaTCoub8PvBCWEbIwGJFXQquF6UR
XLWdsaLnNyJ0RuANKK7gHeUHZ/J0r+WM7JQG69qpYPbFeeH0lM2r6o6U3OJyvYOg
/TJIm9tvPX/pIGx9vc6Xm6zhZnz96BggzfAyd8m1nOe3YwA9Sdl3+14HDq86OCUx
lKVR/o+wNYFnfzVQCw6cISkqwFxuSpurxAclKQxDqLtRuvhgEU9CZupiJU552mWk
bvCcy5dgUsm/eTbEYIpxAMut3UklnSIUYizgv/dexuhmIkhrK6FD9UG1+WuVg0VQ
9FpdNFiSrfLD0u+SqUjDYEvWLms3JPPXjjcAHWlenSFftB4TKQ/5GAgglXEKjt+6
srenQdzZb2Y5XfKn14I1
=wjf4
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--
