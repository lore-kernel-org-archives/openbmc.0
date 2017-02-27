Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vXGm73cvMzDqGn
 for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2017 09:36:53 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 148823500828764.32892327997831;
 Mon, 27 Feb 2017 14:36:48 -0800 (PST)
Date: Mon, 27 Feb 2017 16:36:42 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC v1.99.3
Message-ID: <20170227223642.hz73zldzlq3jmde7@asimov>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tcqw4hx66tkjbej5"
Content-Disposition: inline
User-Agent: Mutt/1.6.2 (2016-06-11)
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
X-List-Received-Date: Mon, 27 Feb 2017 22:36:56 -0000


--tcqw4hx66tkjbej5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Another tag towards v2.0 and another set of significant development
content.  Highlights are below.

* OpenFSI device driver
* Phosphor Inventory Manager
    * Inband IPMI and IPMI EEPROM parser moved to new interfaces
    * OpenPower VPD EEPROM parser
* Phosphor Sensors from HWmon devices
* Phosphor State Management interfaces and corresponding systemd targets
* Event entry management for BMC-sourced and Power-host eSEL errors
* Phosphor Software Version for BMC version
* Power9 System support:
    * Misc fixes for Zaius and Witherspoon chipset
    * Romulus system.
* Initial support for Quanta-Q71L

--=20
Patrick Williams

--tcqw4hx66tkjbej5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYtKn6AAoJEKsDR8wtAMEZVecP/1jKmlAiW5rvZqyemIYcNcTY
9c4cAjnhMAPElEXCJOO1k1WUg0MvJ6o2L4Gbx4IrglPyZAQNJlA1Y8gV9z9ph3qT
YA+NULmhsZ8DKIe6MEZD14CNLpUbOd9kHz+DrxrWfvj1XLP2Vf9LGW60sMxwCgSs
Emq18uXADIcFv3xw+58tbA8q2va5zQprRAFsEBdL8JJk6vzjdPUt7SeEQqeP5isb
2384V5XeyWhEt4zZSQ9jTZupyGDMXXJFX/6r521D2wp8i18OLl0KB5VSO89NupxL
Elb5B8fhY89o+EfM+dxH3t7QuAxUS/+S5YqzV2saJeZIMPcpKOahXOa+++9ScpvX
ywE+ylh+ayyZ1yA3cue4HlcdtLLL8tqjw34HBNeMA2goWkUxH92B+KvRBW+n1Lef
DhzQAjfMQeyMvE7Pbl4zKwBKDM/hz0iF1QzpmZL8GJRDUHrVxjpWaau0BFyYwven
2LdyHUMX5lzL1AHnahyyBasRp9l+pSQcwPNY+3fUS9vzDAyqfsvn6Gskk83N/4vx
AMnFiUkemp97B3nE/0N3sYzoA1sA87EVV2fEQDtWyL/COTEMO2J9rchaM3RzuOqf
SuSsOuqI1YzI6haiAp5S3XSfuMdkb2NEa7KyKVQTGLzhOTlMLp1vHWDYrD6UzP2q
91JONBd41y3lhPqUiQpq
=hdbx
-----END PGP SIGNATURE-----

--tcqw4hx66tkjbej5--
