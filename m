Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYTDx6s5YzDqjj
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 22:32:49 +1000 (AEST)
Received: from localhost (104.220.240.150 [104.220.240.150]) by mx.zohomail.com
 with SMTPS id 1495715560645543.8143804011426;
 Thu, 25 May 2017 05:32:40 -0700 (PDT)
Date: Thu, 25 May 2017 07:32:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC v1.99.6
Message-ID: <20170525123239.GA8467@asimov>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 25 May 2017 12:32:50 -0000


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I just release v1.99.6 which has 86 commits since v1.99.5.  Half of
these commits were version increases to underlying OpenBMC repositories
with new features and bug fixes.

Highlights are as follows:

- Fan control
    - Beginning of a reference fan control using phosphor-hwmon which
      sets fans to high speed on boot of managed host
- Code update
    - More work in prep for UBI-managed PNOR
    - systemd targets to block boots while code update is in progress
- State management
    - Soft poweroff requests to the Host on shutdown
    - Refactored transition targets for consistency
    - Bug fixes for BMC reboot while host is running
- Error management
    - Assert fault LED groups when an error indicates a failing part
    - Better support for repository-local errors
- LEDs
    - Add "lamp test" mode, typically used in system manufacturing.
- OpenPOWER
    - OCC AMESTER passthru fixes
    - Virtual PNOR daemon now provides mboxctl to control flushing PNOR
      cache.  45 second sleep in boot paths now removed.
- Machine specific
    - Quanta Q71L - Add configuration for phosphor-hwmon

--=20
Patrick Williams

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkmzuUACgkQqwNHzC0A
wRn+Bg//feCxhsghEQ3oyJm0rhZ9AlU4MyeuwGaPneubCoh2LYrFaZKNTmYIQDJD
pi2zpMInTn5DLp7B/m8ULZ4sST189e/H7vq44TsJAf9eV0mXjiA8PX2EsBzLcEpT
0JmvQTrdVvkK8hbHCm//aJDaULZwHjRPlzM9xthVibgCdG83nl02HIS34Bg2VHcv
FC0BfS1hYtUB1+MuqwWodH1h/V7OFyNvNoEEG1lSbR8eypPl/5I5asZKYpmDCK8C
W64kfSMc4DrJszMx3PswiuDfoQYvnhY6Eqel78N4WKT9zU2GT7WxM243qkWFHnJG
T5B2I8sH+mgY0TV/8J69vfQ9tsJNjRUU6zEmOy3qVnuVE7yr7b0dN/neofkgGmtj
xqeLlxH7ZiYdS8+FbdXdvpIg7ZhFBXgnruyGphtSPjMPmT+RnbtT/ILFwtQYdlim
GJ4yzOOo/Hkv0eoQyJY8lX3uNJVBIt6dkS9ZVjIUQLkETM5lD1bWLE2ime3Dc1hY
46s9566Ufvz2fKtcwIjAHT/tLpFTeKVdjfrsB+d5q3Tl/lfHk3E2FDaVdirO2kkb
aLAru5Wwdgimv0iS7Z3mVCo9eNqA6FnNILPQeMQlCLKA8mOBotDu1w9OzVQDN3Sk
GgP5KB7Mh62Z/0E1Y0Q3aDvjXa9KQa5RUPhEIEL8yBxMgbY+gnw=
=RbwJ
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
