Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sYZ9T35FwzDsTQ
 for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2016 05:14:21 +1000 (AEST)
Received: from localhost (32.97.110.51 [32.97.110.51]) by mx.zohomail.com
 with SMTPS id 1473794053889529.9310847534915;
 Tue, 13 Sep 2016 12:14:13 -0700 (PDT)
Date: Tue, 13 Sep 2016 14:14:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Supporting one IPMI request does not yield one response
Message-ID: <20160913191412.5orurrahenhubsn2@asimov>
References: <CAFd5g46OwV7OEcLQmkyajxcDpy+fztAK3reo3iDcjkBOcBncBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y4sowpynerfhmojk"
Content-Disposition: inline
In-Reply-To: <CAFd5g46OwV7OEcLQmkyajxcDpy+fztAK3reo3iDcjkBOcBncBQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Sep 2016 19:14:22 -0000


--y4sowpynerfhmojk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2016 at 01:02:02AM +0000, Brendan Higgins wrote:
> Hello,
> The reason I am interested in having support for not requiring one respon=
se
> to be tied to one request is because I am interested in multiple responses
> being associated with a single request. In particular, I am interested
> adding an OEM Group extension that allows arbitrarily large payloads to be
> broken up across multiple Block Transfer messages.
>=20
> I have a prototype for this OEM Group extension that I have tested on the
> Aspeed 2500 EVB; there are some changes that need to be made to the handl=
er
> code in phosphor-host-ipmid to make it work, but nothing that seemed to
> have any potential for controversy other than allowing a single request to
> solicit none-to-many responses. There are other ways to make this work, b=
ut
> this seemed to be the most palatable to me for the reason that it generat=
es
> less traffic than having to send a dummy request to get each of the
> responses after the first one or using something like SMS Attention. I al=
so
> thought that the OpenBMC community might find supporting one request
> soliciting multiple responses to be interesting because it would add the
> capability to support IPMI Message Bridging as it requires sending two
> responses for a single request (see '6.13.4 Bridged Request Example' in t=
he
> IPMI spec).
>=20
> The OEM Group extension I mentioned could be thought of as a transport
> layer over IPMI; it is something that I would like to get some more
> feedback on later at which time I will send a more specific email detaili=
ng
> how it works. Right now, I am just interested in whether there is any
> interested in allowing a single IPMI request to solicit none-to-many
> responses.
>=20
> Feedback is greatly appreciated!
>=20
> Thanks!

Brendan,

I don't see anything wrong with doing an enhancement so we can support
0-N response messages.  I could see that being beneficial for both
directions on some of the larger messages we have, such as inventory and
oem-esel.

In addition to host-ipmid, you would need to enhance bt-bridged to
recognize that there is a continuation to the message.  I think we would
want host-ipmid to always indicate to bt-bridged even in the 0-response
case, so that bt-bridge can properly clean up its timeout states.  (We
don't want the knowledge in bt-bridged to interpret the IPMI message to
know it is a continued one, unless it is simple and standard).

Is this something you'd be adding support for on the host-firmware side
as well?  I do know the current openpower firmware would not be able to
handle it.

We usually advertise to the host support for something like this via the
capabilities exchange.  Would we need to support a fall-back mode or
would lack of host support just mean that whole classes of IPMI messages
are disabled?

--=20
Patrick Williams

--y4sowpynerfhmojk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX2FAEAAoJEKsDR8wtAMEZsPoP/RfSmubAP4USxBSgMcvrm76B
0jR0lIhw8JSQ4HU4i/BqrcpMAFaTsl8JjnhzR1yHs7JOtLNBMl75USQyMzAhaw6U
iZFmqNjeA94Nozc/KTt/9XeIKkmsYX3zmNI4NCP+naH0VPqO+63+quVHPugVVoXZ
Ew1+wK757FUpHf038Po87/gPgbhpH53NJaoxrKaGpOiOspQi7i4aTisCem6zfhuA
LKZAOmBcf3QWbpkBjiLT/IrNRrc89TeaYISUUWHCzu8e2sOQphAxYbYUTebcTL7k
tLWSOEsJXBcx3C6Gv5jlpyjpD4bL1wbRJsjy6q2SG7Qw/UcsnkAHa7hD0yrJI4WA
/CCqymQWCXAcmzyhB6wXZ8uU3xWgZ9Q5PeQNGRg+jV793778ydN7jExU1FJcOd8j
8drsLw2ZJuDGIOjzhjug0uZmX30Z374k5IC3n6bl5z0Br23umnbHxJ0vnQWMtJYB
EaK3g8nuhmgJrb+POXGWSD+lZoeqiTI/ti5tT8y9SpvhJiKJzMFTKRrd9CmrNLbo
T5Ke0+b+EIiaotpyh/0aTSNfkUL3u3KGLxgQ9XYIs9EGCU/92bhYnJI9iqkV0Apa
YK7pjSXo+akTb2r9lsDkZWYNIEIqk43nwDeUV81boCu6EfC3rr8Gx7me+XVRH4nk
7alqN6Vd13rBFSQrEKZn
=GHgy
-----END PGP SIGNATURE-----

--y4sowpynerfhmojk--
