Return-Path: <patrick@stwcx.xyz>
X-Greylist: delayed 628 seconds by postgrey-1.35 at bilbo;
 Wed, 30 Sep 2015 00:45:00 AEST
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F19A21A0024
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2015 00:45:00 +1000 (AEST)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1443537893194704.6000906531823;
 Tue, 29 Sep 2015 07:44:53 -0700 (PDT)
Date: Tue, 29 Sep 2015 09:44:51 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <brad@bwbmail.net>
Cc: openbmc@lists.ozlabs.org
Subject: Re: BSP layers
Message-ID: <20150929144451.GF14293@asimov.ibm.com>
References: <722865DA-D254-4972-9020-E6D01F95EC60@bwbmail.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kR3zbvD4cgoYnS/6"
Content-Disposition: inline
In-Reply-To: <722865DA-D254-4972-9020-E6D01F95EC60@bwbmail.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Tue, 29 Sep 2015 14:45:01 -0000


--kR3zbvD4cgoYnS/6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2015 at 02:47:59PM -0400, Brad Bishop wrote:
> I have a couple new layer repositories:
>=20
> https://github.com/bradbishop/meta-aspeed <https://github.com/bradbishop/=
meta-aspeed>
> https://github.com/bradbishop/meta-openpower <https://github.com/bradbish=
op/meta-openpower>
>=20
> Appreciate any feedback.
>=20
> Thx! - brad
>=20

Brad,

I noticed in the layer.conf files we are manually assigning priority.
Do we want to allow the automatic assignment or is there some guidelines
on what the priority should be?

Seems that you have:
    * BMC Hardware Layer - 7
    * Host Machine Class - 8
    * Host Machine Specific - 9
    * OEM Machine Enhancment - 10 (not there, but imagined by me).

Based on the conference call we had last week, I think we should go
ahead and make github.com/openbmc repositories for these two you have.
I can create that if you want.

What is your proposal for where these repositories live in
openbmc/openbmc?  meta-openbmc-bsp for meta-aspeed?  I'm unsure if
meta-openpower belongs under a meta-openbmc-machines or
meta-phosphor/meta-machines?

--=20
Patrick Williams

--kR3zbvD4cgoYnS/6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWCqPjAAoJEKsDR8wtAMEZHU4P/35Fi0zBBiNSCpLehSFX+PXY
UZXdzoegndOAnA30lReNvOnKzgN95GLfPpBK5RafrNR5jbljRxazbZtAGMe0Uu0d
qopwGAW2FMTCS94thwpcocTFPD7rB9cfSTM4WFa4wgI3+DUn8NF1nkf1s2PytuiN
uhsf9FRSMV5Wl+CNjwIXmlLnLteVR67N7UiIXNEcRFVMtgD5WO5GmE7Ol+WrXXmY
ZxZWq5Z2fwaIzJCOeDpO1ekDcB6z5i/vq+oNXwq9K4JoXWBY8Xr8xUBHeBDHg5wh
xYzKpUdcJLGbqV4Vf2ijEzNoryplchhAP8Cznnca3z9tqH/Js8c/EzJ8beEUogcD
C8hq9mYGCphHaaafVAhTjkNhA7+cI/5SQSYXVJA4AXLk2oYat2sDpOq16kiZZ5xv
UnT5vME/fyE/KdCVvsonqnOkswIeDrqkUWM9Npb+lGTg1cjjmsxpmUs1YxYteZTa
zy/hX0awsACMigJa9w4iOzw4AnCJGSu/krRJiG8PQjHnqVWIUzCfXXMGwCbea8a5
b07z00zkR5A2weLjtYxWdz+fou4W2wgypXmyY2CfzWp5SRaCHboiaVUJime+DXU+
Qy/fh1JI/4h9bf7GQHfAKrzBgSvCh0mXBSVe59dkNU35pvfVy4hAx2ZauB0HSkQm
NGQlYlq74H6NJzUSj0nH
=Uu99
-----END PGP SIGNATURE-----

--kR3zbvD4cgoYnS/6--
