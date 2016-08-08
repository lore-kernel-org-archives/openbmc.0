Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s7V8S0T6wzDqd9
 for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2016 06:56:53 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1470689809676294.0624377922436;
 Mon, 8 Aug 2016 13:56:49 -0700 (PDT)
Date: Mon, 8 Aug 2016 15:56:48 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC v1.0.4 released.
Message-ID: <20160808205648.guz3jqkg5czjz6o6@asimov>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rhqf4jojsmixk5uk"
Content-Disposition: inline
User-Agent: Mutt/1.6.2 (2016-06-11)
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 20:56:56 -0000


--rhqf4jojsmixk5uk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Another fix release for the v1.0.x stable tree was tagged today.

https://github.com/openbmc/openbmc/releases/tag/v1.0.4

Changes since v1.0.3:

* Kernel version update:
    * Stable release 4.4.16
    * Power button debounce fix for Barreleye
    * Fix for an NCSI race condition that caused the device to not come up
      (openbmc/phosphor-networkd#18)
* Load inventory from cache (openbmc/openbmc#487)
* Start host watchdog timer after magic sequence (openbmc/skeleton#127)
* Restart REST server when network configuration changes
  (openbmc/phosphor-rest-server#24)

--=20
Patrick Williams

--rhqf4jojsmixk5uk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXqPIQAAoJEKsDR8wtAMEZZ7IP/iPf9CxCmX6BXSDhiKpHfFoy
bCu5k1Vsmfld2a+XTpHHclQS9TZLu+PQcNxETxaOnk4MMN5t6EAxvaoBSV4xokAn
kah7ugSukRMzgGOQRL4nn4XH9TsBI/XDf6zvfeAnZY86qAfZUlg7m84OMWDyLYe1
GuRLHrjvhC8naA264MCXiHf4dws0U0ahebPwlMl0JYtQTbfAQVNiyYcVaAab/LLw
ygpm5ZrAnNdaMdiOCk8ng+dvF/w5mC9xr+enqHS1Q+tw3ds2psD6vhkiHCC2Se6r
Kw3w66RHhHdak/hYyIjzhQnOVKkKSIXbMi5GifDT0gxDEMUbvREZ/jsJNMQRas6c
0lhxqTnfluQAVPvw7TVyFTWhvpFn+V1h0UvjHFgnB6R0R/31mQmBaNM5yKuOvQtr
9tLr37UX9QLwE1Y7UpUG6PZkJMlaMZj0AOOkQSfF72ctEejQutGIBZ+tGtTGwcUT
hmgTRapLkfWN1tdNy4GHbkTsosD17ifp7+lKfVV6nce4EaHW69ZgHNYh81E/QRGF
/uvMzrtSdZmIkw3x5YGgLcIm/L9MbFdsk/VD7nBhJgCwqqFB2LEGrvcsskr/rjWs
CpgY9zoaaw7aROXfn0XkcpvLTBHinOoGjPmjJHL1Doi+B1731nQYokkdHW+lTOnC
75oVy5F0Y90tiawmQCcl
=RdRk
-----END PGP SIGNATURE-----

--rhqf4jojsmixk5uk--
