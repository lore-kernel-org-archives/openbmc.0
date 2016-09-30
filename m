Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3slYxM1wzgzDvJ9
 for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2016 11:38:30 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 14751995034061013.5736255744343;
 Thu, 29 Sep 2016 18:38:23 -0700 (PDT)
Date: Thu, 29 Sep 2016 20:38:16 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: openpower.xyz updates
Message-ID: <20160930013816.GC7390@heinlein.lan>
References: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
 <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
 <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Content-Disposition: inline
In-Reply-To: <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Sep 2016 01:38:31 -0000


--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2016 at 10:37:42AM +0930, Joel Stanley wrote:
> On Wed, Sep 28, 2016 at 10:08 PM, Andrew Geissler <geissonator@gmail.com>=
 wrote:
> > Hey Joel, late yesterday afternoon Patrick reported that the gerrit CI
> > jobs were not triggering.  I took a look and found that our job that
> > does ID validation (which triggers on patch set creation) was still
> > working fine but the follow up job that would trigger on the
> > "Ok-To-Test" comment was no longer triggering.
>=20
> I noticed that many of the gerrit reviews I have pending do not have
> the OOT or Verified checked. Is the system still having issues?

Currently, the only testing is done on the openbmc/openbmc repository.
According to this query they are all set with both OTT and V.

https://gerrit.openbmc-project.xyz/#/q/project:openbmc/openbmc+status:open

--=20
Patrick Williams

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX7cIIAAoJEKsDR8wtAMEZ7+oP/24TScn2J/wTWqRlpe34CcWX
C01/7pF6D9d4ZaxExeLPttpTGP/gK342NpR7Zdfzt5YmiNQvq7IuAaUPEYxiowTD
j9OSD0aXygT9REnLR+CXzQ+Mz2Qj0zvVc213p/XaOHBYl1mfFx5CVDGkEsy3cfKO
T0C+/BAZTMmBwZUSHFBkl1OV2/qDQMi9/Bfpdtzri4Iorcv+R7IxDnSV2M4ST6mT
NUJfx6jyabTjWlU5JJOI+hdaYxetJRFHXEH+ahVtsBa2TDl4wgz+34FwZhhiwIFY
DLt7gaqRVraNVYDqOr6jpS/NYxkYjeWqGqnzgzDildp3+uCmFGrWovQXswAZ+nZy
oGdrmYsplGOMjEB7bJO6HytI/IIHyNRCZi17amO0HmMOK24/urCAL6Q3NhdE518x
booy7xHhe/CzzR2sFCmZXSivN91T2z3lP+PwuogfYo8wTawSD2fBVUJQtPQeXj+n
e7bL108kPgT3oOsVb+ZK0+x4qWMDoiL1WpHJm1TQo91ecHolQMm9AQledBTCY1Ij
9+8yUwy9r/pZcEmHPfDekeQMft8PK53NUHwpawG3J1tob0bjmopbbqO4u3MmkTrG
YDZpUvOMPMt80U3AfURp9JRHesWcbRQTb3HPwH6/8UgdqntvjAzxxT9Ov91c17f4
KfbTAtnkchQHx1Al47A2
=6Rx2
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
