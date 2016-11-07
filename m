Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tBzKR446NzDvNV
 for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2016 15:02:03 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1478491313804709.1114488447149;
 Sun, 6 Nov 2016 20:01:53 -0800 (PST)
Date: Sun, 6 Nov 2016 22:01:41 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Opinions on CLI tools.
Message-ID: <20161107040141.GD15757@heinlein.lan>
References: <20161031150038.zcvop7gbpu44ojsf@asimov>
 <1AF77AD5-4ACB-4DCF-8429-A87096312A27@fuzziesquirrel.com>
 <CAPH-5w5ZUracAQ+mbLtBHaAeo9F+FpyDi-2yQ9UPWExj2__Xiw@mail.gmail.com>
 <CACPK8Xd3XC9WcSmnz61NFaEJZPDowL71XovBRqPVYE7DbpEqsQ@mail.gmail.com>
 <CALLMt=oSw8qupiSjqzCTsByYqjRMwEaiiY5nmaRGABrnFTWPyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Content-Disposition: inline
In-Reply-To: <CALLMt=oSw8qupiSjqzCTsByYqjRMwEaiiY5nmaRGABrnFTWPyQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 07 Nov 2016 04:02:04 -0000


--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2016 at 09:00:28AM -0500, Andrew Geissler wrote:
> I still feel like we're doing a lot of "developer-biased" decision
> making here.  We're going to have people in the lab and other general
> users of obmc that shouldn't have to understand the details of our
> implementation of things like service states and such.

I don't think this is "developer-biased" as much as you are implying it
is.  There are two kinds of people...

    1) Person who has some familiarity with existing open source tools.
    2) Person who has no familiar with existing open source tools.

For person #1, if we document power-on is "systemctl start
host-power-on@1.target" they have learned something about our system and
they might be able to learn more on their own through exploration.  If
we document power-on is "obmcutil power-on" we have taught them nothing.

For person #2, if we document power-on is "systemctl start
host-power-on@1.target" they will copy and paste it into a terminal.  If
we document power-on is "obmcutil power-on" they will copy and paste it
into a terminal.

We haven't lost anything by not providing "obmcutil power-on" except 15
extra characters.  We have lost something by providing (and documenting)
"obmcutil power-on".

You use the term "developer-biased" but it is really "general Linux
knowledge" biased.  Person #2 doesn't have it and probably never will;
they are going to be a "copy and paste" user their whole life so why
cater to them?

--=20
Patrick Williams

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYH/ylAAoJEKsDR8wtAMEZUNQP/06slxeXvMZSUY56RUahJdCb
xoIC4H4OzidTYZ5CrhVQCgNLWgnn5XGoCaUMBdJBRS0KN6dhqLymyBqdSTqnvvwm
r1ppZpZbx3rAD5FnBhycd6HMTqfWA6WSd7c2rw5bZMcEfqg9myEh9DtQuVpacU8K
rEpNyKg6T2IAd5c7Xlgq/yAjuLzPo7MPTOWUBcvgPM5Ifng5mNzS6e20e0puwT8A
IIE65DOiY7vJc8BpwpyF7yaikpoBygRArgCjZ7qdoc7vYrXl9L1/ntPkTod9wvQU
HCD4yOLulwKsfAVx4p6TIcvADjFBcVWHTDSuC0MAUpeju34vYnWPbTSDfzxV832Q
I1w7J5OP2XqVybugoXZ/wW0YhREoD2VihMkgIxS1lcdK0OHtTpLLSgNB2Jzwgm5u
i0EqKb9VkxIBQWQfsESQ9xMF4Q4JBH9nPXlNQLp0w6DbChh1H6dUkPiLAZHZ0rS/
jKFrxxiUg/vmT4NF1c2FosWhMRHLEJ9IgJ9o6DGNbl0L3dEyoqba3MFWbWyegjlZ
Pr2CMD/Y5Rvmr2PhceoKN+uOXXwJOTIVwfxLPMfOMtiE9EyPXmzef9dxT++K2QNv
OEEkm67+zJplLvh+S5W3QlvSIIUwvv7ofRD7/ciUvkks2t5lck9aLFwNew1H8tyq
uLDM2O0NHvvldoBina3o
=yN3F
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
