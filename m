Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0J2h3Fx5zDswt
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 13:56:59 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1469678214367288.6997125797634;
 Wed, 27 Jul 2016 20:56:54 -0700 (PDT)
Date: Wed, 27 Jul 2016 22:56:52 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Deuskar, Prafulla" <prafulla.deuskar@intel.com>
Cc: Rick Altherr <raltherr@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: REST API support on AST 2500 EVB
Message-ID: <20160728035652.wo7b54ncrmf2mw6x@asimov>
References: <86BC2638B1D5DA48B2AEFCA5BCA462667134F6D9@ORSMSX115.amr.corp.intel.com>
 <CAPLgG==6C_JOvE=ZkeVNYOYS1K=Qo-GaRwAnkqrBSoCJEY5k2A@mail.gmail.com>
 <86BC2638B1D5DA48B2AEFCA5BCA462667134F7FD@ORSMSX115.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uh5te2etmbfqqh3b"
Content-Disposition: inline
In-Reply-To: <86BC2638B1D5DA48B2AEFCA5BCA462667134F7FD@ORSMSX115.amr.corp.intel.com>
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
X-List-Received-Date: Thu, 28 Jul 2016 03:57:00 -0000


--uh5te2etmbfqqh3b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Prafulla,

Thank you for your interest and inquiry.

The 1.x release stream is, in some ways, a proof-of-concept of our
vision of a BMC and specifically targeted the Power8-based "Barreleye"
system for Rackspace, which used the AST2400.  Due to aggressive
schedules on that system there were some implementation choices that we
are currently investing time to refactor into a better state.  The
master branch, which will become 2.x, is therefore in a pretty unstable
state and might be the cause of some of what you are seeing.

Most of the developers currently working on the 2.x release stream are
assigned to work on a set of Power9-based systems that will use the
AST2500.  (These are not just IBM developers but a few other companies
are also involved in this effort.)  Obviously, our expertise is in Power
and our current focus is there, but we are trying to be mindful to
not design ourselves into a Power-only BMC.  We would be very excited to
support other processor architectures for the managed server and will
assist where we can.

Since we are working on a few AST2500 machines, we have a subset of the
team that was doing BSP work for that.  This is where the EVB machine
target came from.  This includes u-boot, kernel, and base Yocto.

We also have the other subset of the team working on the [userspace]
management applications to maintain the server.  This part of the team
is still using the AST2400 machines or qemu for most development.

As a result of this split and where we are at with the 2.x development
stream, you are seeing limited functionality depending on which board
you are compiling for.  The EVB target should be very solid on the
u-boot and kernel support but the userspace applications are not
configured correctly or functional.  The QEMU target is using the Yocto
kernel and is more likely to have functional userspace applications.
The machine targets are varied states, but "Barreleye" and "Palmetto"
are both fairly stable.

Your best bet for trying to evaluate the userspace applications is to
use qemuarm or qemux86-64 targets.  As I said, these still are not fully
functional due to where we are at in the development cycle, but might
give you a better view than the raw EVB right now.  We should have a
much different story in about 3 months.

Now, with that background, on to your questions...

> Looks like obmc-rest is running (according to =E2=80=9Cps=E2=80=9D) and t=
here are
> services listening on ports 22, 3000, 2200 and 443 (=E2=80=9Cnetstat =E2=
=80=93lntu=E2=80=9D).

* Port 22 is the BMC's ssh (user: root, password: 0penBmc).
* Port 2200 is a ssh-based SOL that relays the server's LPC-based VUART.
* Port 3000 is an http-based debug application that is not meant for
  production.  You should be able to point a web-browser at it.
* Port 443 is the https-based REST server.

The way our application stack is organized is as a set of dbus services
and objects.  The REST server uses dbus introspection to automatically
create corresponding REST APIs from the dbus interfaces.  Port 3000 was
a quick mapping of the dbus into a web-client for developers to use.
Consider it a browser version of 'dbus-send' or 'busctl', but we will be
deprecating it in the near future.  Port 443 is the _real_ REST server
that uses introspection.  This is what is documented at the link you
mentioned.

I would suggest first logging in and then looking at system object out
of the inventory:
* https://github.com/openbmc/docs/blob/master/rest-api.md#logging-in
* https://github.com/openbmc/docs/blob/master/rest-api.md#http-get-operatio=
ns--url-structure

> We get =E2=80=9CHTTP/1.0 404 Not Found=E2=80=9D when trying to login to p=
ort 3000

This interface does not use login, so you should be able to just point a
browser at it.  It doesn't work with 'curl', etc. very well.

> =E2=80=9CHTTP/1.0 400 Bad Request=E2=80=9D when we try port 443.

Make sure you are using https, but this should work.  Since this uses
dbus introspection and the EVB does not have the userspace applications
working completely, it is possible that there isn't much there.  I would
expect login to work though.  Please let us know what curl (or other
tool) invocation you are using.  As I mentioned earlier, using QEMU
might give you better results for looking at the REST API at this stage.

--=20
Patrick Williams

--uh5te2etmbfqqh3b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXmYKEAAoJEKsDR8wtAMEZ+OAP/RSEVkyPCpir3KMf+8VnsI12
XGxCP5M6WvhIxEzMPvtxfC3aS+2bOYRz255J0UbG3z+Y904z6UxGwg6UOITHzcIi
erpyfznNliH2Z52yRFIZ9lrSATEf/xCB7ixxsK/hoYvhPxbtoCMSlqPghV6U1MsB
uBKQWlX1wlcSF6JnphH5LWWx9N8cae0OGo77oXNXUwpP3FqQ0+z/olnmxzMoJN91
7gJfKvmT5e9bfnLXiD/XdtkmiDVYVbnp3S8WhsIz/VWDVjfTu7yegu6fveEoA+6c
kxUjdvtQ3WXqHUbv2hFwMZLgDTrgH2zlPMA8KMuCecge2641Gnhv7H/dst4t+c9E
d2Hr/J39XAs8uDFF5GmNEYqnCv9GuVdcfokQKVacQU+E8GEueVibP2GU415OSYi8
N8Sp4gaXZj85+B638w7c5MPzyKRaLwdQhhVNIm3/4OA9kKwzw8AIBLFzsKLl6Z0z
iF2Re2YxLZ3MoBAj1UMCarI/u7e4fJ2dWNFnGsW/AMajvbwU3vXztcERtj8quqHo
oc49SKobpU2zBZ+7JKyWJERvhAYpV95O6rjE6EVr0MIOTbiVWFWpzXUziH7TLPYO
/eiGCzZHSDed5R752ROxT617j6ReQsB0pSmZXMXDToUVQKcXIgiwvEhs2YxO3Sns
3oFLra+veFLol9eLj4el
=aCZ+
-----END PGP SIGNATURE-----

--uh5te2etmbfqqh3b--
