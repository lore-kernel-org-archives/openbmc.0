Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5751A1A08C9
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 08:13:42 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444684418288331.2916234038961;
 Mon, 12 Oct 2015 14:13:38 -0700 (PDT)
Date: Mon, 12 Oct 2015 16:13:36 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Moved from gdbus to sdbus. Fixed
 sdbus memory leak. Added commands to get a Palmetto to IPL further
Message-ID: <20151012211336.GO12084@asimov.ibm.com>
References: <1444610029-11956-1-git-send-email-patches@stwcx.xyz>
 <1444610029-11956-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Vxa5joy26gVGOrvU"
Content-Disposition: inline
In-Reply-To: <1444610029-11956-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_1
X-ZohoMail-Owner: <20151012211336.GO12084@asimov.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.55
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
X-List-Received-Date: Mon, 12 Oct 2015 21:13:42 -0000


--Vxa5joy26gVGOrvU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2015 at 07:33:49PM -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
> +ipmi_ret_t ipmi_app_get_device_id(ipmi_netfn_t netfn, ipmi_cmd_t cmd,=20
> +                             ipmi_request_t request, ipmi_response_t res=
ponse,=20
> +                             ipmi_data_len_t data_len, ipmi_context_t co=
ntext)
> +{
> +    ipmi_ret_t rc =3D IPMI_CC_OK;
> +
> +    // TODO GET REAL VALUES HERE....  I made these ones up because=20
> +    // we are in bringup mode.  Version Major and Minor can be what we
> +    // want like v1.03  but the IANA really should be something that=20
> +    // we own.  I would suggest getting the IANA from Hostboot as=20
> +    // long as IBM owns it then no problem.  If some other company=20
> +    // gave us the IANA to use then use the one we have from the=20
> +    // FSP ipmi code.
> +    unsigned char str[] =3D {0x00, 0, 1, 1,2, 0xD, 0x49, 0x42, 0x4D, 0x4=
3, 0x40};

The IANA number would be '0x41, 0xA7, 0x00' according to this:

http://www.iana.org/assignments/enterprise-numbers/enterprise-numbers
42817
  IBM Platform Firmware Division=20
      Rashmi Narasimhan
            rashmin&us.ibm.com


--=20
Patrick Williams

--Vxa5joy26gVGOrvU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWHCKAAAoJEKsDR8wtAMEZhAkP+QGLRZuFaGDAWOKv+WoCbNx2
7zloDBWJwLw/W5bAnK6b1P0pVKtNWSGYruJRRvoB81scyg6mwDefuQw9EKMrGcW4
ZMN33YlRFUgO8ZdqiS1SEk9Qs+UZgHOvbSOyBYHUdjJtW5/pVaL74NOiAKWGPhc8
0UcvGoHizfaQTqTs1iOZXP7xPjAbvEod5y7zYG15BPebou1Xnv9/lreuXIZ+nSJl
lnn6+lHYDYQFI+8YzSKP90Sn8N0AqSe9tWfumhBa3+ZKAF0sSydJzxvCUchzzVaL
Cp7LStWPD+HKiYqngjlo2EvPbZg5uZHjBRGEtoP0ieWa/4t3i+7zkJw384FxgfNE
8dZIx4mxr4rhLYwJox5PWDkYYryIXHftAaumIvnXpT2RJZibbxawTfc/8yafkBrp
UrrCCrnj5B8tImC598sOblcip/WNKjkobDENCbeMW2xg4r3ea9rCxfdqYuwdDPeG
BPuMk0C0kfyfbYFJE8cNiTyFb25BDIG3MBi/Q6Q3IqU6wqiTaTp0dObSinaNQ09r
+nfKtF2stML63tMLh7MiXYyPMyWmSYOZ1DSakANfbbHPwFFAWYz0AjZxdvfI6J8K
PX9JaeLJEG4nyZ0qTWnRXfMx9d6Wy/h+x0CNLJlH6yVh6d0m8cAjaBkNPgt6slWC
0wpajyRUezkj6Q0G2gNj
=iNOK
-----END PGP SIGNATURE-----

--Vxa5joy26gVGOrvU--
