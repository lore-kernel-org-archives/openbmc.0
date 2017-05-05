Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKMJB1m5nzDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 05:23:37 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1494012213258950.4316409200205;
 Fri, 5 May 2017 12:23:33 -0700 (PDT)
Date: Fri, 5 May 2017 14:23:32 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC v1.99.5
Message-ID: <20170505192332.GI25937@heinlein.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yzvKDKJiLNESc64M"
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
X-List-Received-Date: Fri, 05 May 2017 19:23:39 -0000


--yzvKDKJiLNESc64M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I made a release earlier this week but did not have a chance to put
together a list of highlights, until now:

v1.99.5: 83 commits since v1.99.4
    - systemd upgrade to 232
    - Romulus, Witherspoon, Zaius machines enable host console
      mirroring at 115k baud
    - Changes to systemd boot sequence target names for consistency
    - IPMI:
        - Barreleye, Firestone, Garrison, Palmetto, Romulus inventory
          updated with present / functional state from host-initiated
          sensor operations.
        - IPMI SOL supported on network interface.
    - Zaius configuration change to boot system automatically by
      default.
    - mboxbridge added a dbus-based utility, with corresponding service
      files, to trigger PNOR cache resets.  This removed a 45s sleep in
      the boot sequence.
    - OpenPOWER P9:
        - Kernel fixes for FSI stability.
        - FSI supports i2c master on second processor socket.
        - SBE-FIFO driver, OCC-FIFO driver.
        - CFAM override procedure added to boot sequence for lab usage.

--=20
Patrick Williams

--yzvKDKJiLNESc64M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkM0TIACgkQqwNHzC0A
wRmv1xAAghK6lWvWULS5LZ2GsNR2uOo1+zaMAZNkrfTyCibk/K/f2pDEDegjJsIg
AFCaCDpBQ+smQEziYG5s1TXDCHwOedwNUD0D2LJMT6l5QL7LqjMoLKpy6JLfVoGu
7JcOnvqqosuCjMTi9SU80Vhbn4VLjVUhtJ0fIawbffd1z1yytaEK61NCddYfZXtD
zX259qco40X0D2aBJd9nmqDIBh/jC0EWlW0HvhUkoct13w2OXpvu8cHx7Rf7e77v
MbS9wkxdYEmVwmv0wd8tlRM5G8e23b1xla8es7J1VNxA2+7sUTYXsjGWLCMq7tB8
1oKau+WWumo2yB6YycHalgo9VfmaUg5+HUFACL4WBqMosPE6i3VHeBrCTuBpEgki
nR2j8TUEn4yv7snLX0gk2gmVbljmwLNODBoOe1w2vrCxmqpZAiHvqsxMkMiTyJ0h
C8dkGG/Lf3NMh5hfJssXryuLV9GinGoYh6rtCS0/nb6LKCRwmM85fkOuJBzo7W21
HmmdRza999YvqAu5tuItCW6sc9MRRRwDf5HuFP53EEGRSdJL+Hm69XZPayk+ztVx
ujEY2PSViScntdf7Uxzgn8luiOd32tHHVOYuKRkb3m8NJpxWc4yfLEDx2/woZXUS
VITIVsMQm/7y0uiNA5GntkLw0vbpFe1kPbDD0IkSf7WJfvT8Gcs=
=HLOX
-----END PGP SIGNATURE-----

--yzvKDKJiLNESc64M--
