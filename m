Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9P4N1WPHzDvXp
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 01:15:15 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 14782689028621007.9618834532608;
 Fri, 4 Nov 2016 07:15:02 -0700 (PDT)
Date: Fri, 4 Nov 2016 09:14:55 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: tomjose <tomjose@linux.vnet.ibm.com>
Cc: Li Nan <william.bjlinan@hotmail.com>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: IPMI LAN command story design - try 3rd send
Message-ID: <20161104141455.GE17105@heinlein.lan>
References: <TY1PR06MB0863871D99A02C72E98F2462F6C20@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <57F37746.6040304@linux.vnet.ibm.com>
 <20161004145104.d5co7h25dakpcxyz@asimov>
 <TY1PR06MB0863CF900A7338954B8ED956F6D00@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <TY1PR06MB08635DA92530A90D5D2C039DF6A30@TY1PR06MB0863.apcprd06.prod.outlook.com>
 <581C8C7D.8080702@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mR8QP4gmHujQHb1c"
Content-Disposition: inline
In-Reply-To: <581C8C7D.8080702@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 04 Nov 2016 14:15:16 -0000


--mR8QP4gmHujQHb1c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Tom,

On Fri, Nov 04, 2016 at 06:56:21PM +0530, tomjose wrote:
> The Set Channel access command was decided to be used to mark the end of=
=20
> a setting LAN configuration transaction.

The IPMI spec for the SetLanConfig has a parameter 'Set In Progress'
which states: 10b =3D commit write.  Why are we not utilizing that?  Maybe
in addition to Set Channel Access?

I don't see anything in the Set Channel Access command description that
would be obvious as a mechanism for updating IP addresses.  Was that
just quick behavior we decided to do for Barreleye?  Is there any reason
why we would not deprecate that behavior in favor of the Set In
Progress / commit write?

--=20
Patrick Williams

--mR8QP4gmHujQHb1c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYHJfSAAoJEKsDR8wtAMEZRaAQAIFleWPcAPVWf+yv5o77VLDa
rnqSeWX6RfIR+/4d4Y+Wegmn3FYTVC62KDokyFd6KmtTvzoVWV91ocwr6za/HKcx
3Bwqme15b9veIAAELNEbaHLIWmKOIwNmmQHP9poTThN1Kj8sjhGGtA7NPioFa13s
WfutP+xR9n8S+C2Ev5adsCS8cJZ2dyA1tc1Fw/vZYYffnvhSbOpDz2oHtKWe7SXr
3xgw6vPd5eeNHAoEFRa/puCsFvyfTZiqPLtP3KwH5EeEbFAuH3k50Sj+D3apcseC
nGYJQIbtxuUlnl4952yygq370fJAcJwScuoIl6ml4WXNwWYSF6iL65ZHRA2VzS4C
9c+7i69CJcQaA3rWLoYMwuEH7fSytDbdgGEHqSP/55++puzJZtPDbQ1mx1i+/r3H
KWCnOKoAFC2sqbBnmK4jxfdI61WIRX+hhs+r06b+fcAqi8+u8cczi3VlDTSWHJsj
PwpRIqfhoQ7QLSvCBFui8CvnqDNZMUgDxT4TZDnRyIEXYkKy+G7tmziMli26jx6O
sP6knxZ3E8VxWeLc0ZLQVZNre4xO5ahx6/BH01W00q0m49NAkZQzl94SrbNIWzk7
H9s2ZZMkvYfSn+Gp3OKTK5AKV8BW6k4/Qx0l5ZvcTNI8yiaodNeYxgDNtU1TFFzi
s+rUAYx9kFKhgR4rpy1n
=MoAV
-----END PGP SIGNATURE-----

--mR8QP4gmHujQHb1c--
