Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxx5C3mM7zDr3P
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 05:37:02 +1000 (AEST)
Received: from localhost (32.97.110.57 [32.97.110.57]) by mx.zohomail.com
 with SMTPS id 1498592217229549.6289315920176;
 Tue, 27 Jun 2017 12:36:57 -0700 (PDT)
Date: Tue, 27 Jun 2017 14:36:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ilya Kuznetsov <ilya@yadro.com>
Cc: openbmc@lists.ozlabs.org, Vlad Vovchenko <v.vovchenko@yadro.com>
Subject: Re: phosphor-net-ipmid
Message-ID: <20170627193650.GD31439@asimov.austin.ibm.com>
References: <20170619144445.xpoo5x2sbt3ct22p@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Content-Disposition: inline
In-Reply-To: <20170619144445.xpoo5x2sbt3ct22p@yadro.com>
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
X-List-Received-Date: Tue, 27 Jun 2017 19:37:04 -0000


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2017 at 05:44:45PM +0300, Ilya Kuznetsov wrote:
> Hello,
> we would like to help with phosphor-net-ipmid and have volunteer. For us =
main=20
> priorities are sensors and sel. Obviously work is in progress there and w=
e don't=20
> want to duplicate it, so please share tasks with us and tell how we can=
=20
> contribute?
> Thanks!

Ilya,

Tom and I did some discussion last week while I was in India on the
remaining work items for IPMI overall.  The biggest outstanding item is
DCMI 1.5 support and he has started creating stories for that.

With respect to Sensors and SELs, someone at Google already has some
commits up that take care of most of the sensor commands and we have
someone assigned to enhance that.  Before we can fully start on SELs
there are some backend work items that need to be done, because we do
not currently keep track of state-items like "when did the machine last
boot" which are typically placed into the SEL.

We think the best bet would be to have your team work on a small DCMI
story to get into development.  From there, we can arrange some more
detailed discussions on some of the breakdown of the bigger items,
perhaps becoming involved in the SEL development.  Would this be
reasonable?

A smaller DCMI task that Tom already created is #1855:=20
https://github.com/openbmc/openbmc/issues/1855 .  This would be an IPMI
provider that maps the "get/set management controller ID" function into
the xyz.openbmc_project.Network hostname property:
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc=
_project/Network/SystemConfiguration.interface.yaml#L4

Feel free to discuss over IRC if you want some real-time discussion on
this.

--=20
Patrick Williams

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAllSs88ACgkQqwNHzC0A
wRmurQ/9H/HXsY+9i2fNDvy0y2VS7ojaKjlv3O1OgYK4vZyikby/xD65sAri65zt
SD4FTx0NHU1CVCTNVFt0SzukFYosOaAv9I7bB2Rx1PBH38oS/IBejuxJMUjeQIIu
hPSjAIg72siRATD57/X/k4R+Qx3KSPbT4iwiy5TPZ1gmyJYBaJhlqW7zQsC+9KBQ
r0YybNE/W+LrVdwSJ1c7dyNwaNiRiudXuv51sgQCVzgcdyL9rWfBmyahGmebGKCG
MsDwGRMbWF3MTfjcB3uAbUmjGhXledptTBHuYOZZab0EAFZVJgmontmYsoso2/PR
pcrjvksSbUL7oqxBZJBGSQTF7xhR2J6x6wf4lbjsldIRSaBz8qfpqnf4qtoVGQ6b
Xem4fYgI3rUo4vEOBynDyq7fJj/JUyagRJW6PEl3DX1SrZtctRjWtDYXqba6T4Ce
1263xG7ZpWXIFH86cD0SSHZ45PHB2ZQuyjq52ZhVmFzYnG1EzJ5c8s6HGgOjFWJC
8mC1ZA5RaCsAPMoUKSHQn/P7edfZhBZ9w3QLywcqtA4skXRB8n172/pG4vqoiZOH
gI30WKRN5zeoZfUZQQpMeLP1HJvUQ0MXyCEycJDxBZNqR4lNe0sH7XsVV4kXwjl/
DELYAf+rQcOU6hy6avgyfUscvH2HrV3aQNLlK0XMHJS0EycdpEQ=
=CBr0
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
