Return-Path: <andrew@aj.id.au>
Received: from homiemail-a12.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9R8C2g0fzDqJv
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 19:48:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=YAJ/O1Do; 
 dkim-atps=neutral
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id BFB93103006A;
 Thu, 19 May 2016 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=TCn9coFwe6VqfsOwrmVIf
 qiDzrw=; b=YAJ/O1Do6UbGtyCUICmHHwVdXgZ7x3+MchdzK3yioZ09OgSmbW5Ki
 6ZDOE/yvWsCNoiY6lBwrh1rxY708P/21zyUCbYPUmL127vqSgsH+vXx7tcTFrMeL
 TOmieEh8Mh+AyB/xgZVPCbpCoBpUx9IWYIeqRFcDTRWotczLUJ5s5s=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id 6DE3F1030063;
 Thu, 19 May 2016 02:48:07 -0700 (PDT)
Message-ID: <1463651272.2703.223.camel@aj.id.au>
Subject: Re: [PATCH btbridge v4 4/6] Initial set of test.
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Cyril Bur <cyril.bur@au1.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 19 May 2016 19:17:52 +0930
In-Reply-To: <20160519161818.7be3b500@camb691>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462324208-11150-5-git-send-email-openbmc-patches@stwcx.xyz>
 <1463635546.2703.172.camel@aj.id.au> <20160519161818.7be3b500@camb691>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8jffuXUfxH+bA27WL1eH"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 19 May 2016 09:48:12 -0000


--=-8jffuXUfxH+bA27WL1eH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-05-19 at 16:18 +1000, Cyril Bur wrote:
> On Thu, 19 May 2016 14:55:46 +0930
> Andrew Jeffery <andrew@aj.id.au> wrote:
> +
> > > +int write(int fd, const void *buf, size_t count)
> > > +{
> > > +	if (fd =3D=3D bt_host_fd) {
> > > +		MSG_OUT("write(%d, %p, %ld)\n", fd, buf, count);
> > > +		if (count =3D=3D 5 && ((char *)buf)[4] =3D=3D 0xce) {
> > > +			MSG_ERR("CAUGHT A TIMEOUT!!!! 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x\=
n",=C2=A0=C2=A0((char *)buf)[0], ((char *)buf)[1], ((char *)buf)[2], ((char=
 *)buf)[3], ((char *)buf)[4]);
> > > +			exit(1);
> > > +		}
> > > +		if (memcmp(buf + 1, data[recv_id].msg + 1, count - 2) !=3D 0) {
> > > +			int j;
> > > +
> > > +			MSG_ERR("Bad response/inconsistent message index: %d\n", recv_id)=
;
> > > +			for (j =3D 0; j < count - 2; j++)
> > > +				MSG_ERR("0x%02x vs 0x%02x\n", data[recv_id].msg[j + 1], ((char *=
)buf)[1 + j]);
> > > +		} else {
> > > +			MSG_OUT("Good response to message index: %d\n", recv_id);
> > > +			data[recv_id].status =3D 2;
> > > +		}
> > > +		if (recv_id =3D=3D BTTEST_NUM - 1) {
> > > +			MSG_OUT("recieved a response to all messages, tentative success\n=
");=C2=A0=C2=A0
> > Typo: received
> >=20
> > >=20
> > > +			exit(0);=C2=A0=C2=A0
> > Is there a nicer way to do this than to exit the process from an
> > LD_PRELOAD library?
> So, there's always a way. This exit achieves 2 things. 1 reporting succes=
s (or
> fail in the case of other exits) and to end the btbridge process.
>=20
> At the moment there isn't really a nice way to end the btbridge process, =
and if
> we did it would probably be signal based, I don't like the sending oursel=
ves a
> signal from an LD_PRELOAD library solution either.
>=20
> A nice solution would be to have another thread that the LD_PRELOAD code =
could
> report to and on pass results to and then it would be in charge of cleani=
ng up
> btbridge, that solution is more work though.

Adding threads as an alternative doesn't excite me. exit(...) is at
least succinct.

>=20
> I have thought that a kind of test runner thread might be a good idea, ma=
ybe
> one day.
>=20
> >=20
> >=20
> > >=20
> > > +		}
> > > +		recv_id++;
> > > +		return count;
> > > +	}
> > > +	orig_write_t orig_write;
> > > +	orig_write =3D (orig_write_t)dlsym(RTLD_NEXT, "write");
> > > +	return orig_write(fd, buf, count);
> > > +}
> > > +
> > > +int timerfd_create(int clockid, int flags)
> > > +{
> > > +	orig_timerfd_create_t orig_timerfd_create;
> > > +	orig_timerfd_create =3D (orig_timerfd_create_t)dlsym(RTLD_NEXT, "ti=
merfd_create");
> > > +	timer_fd =3D orig_timerfd_create(clockid, flags);
> > > +	return timer_fd;=C2=A0=C2=A0
> > What is the reason for wrapping timerfd_create()?
> Yeah wasn't thrilled about having to do this. So obviously I've wrapped i=
t
> purely to know the FD that is going to get passed back to poll().

Hah, I actually overlooked that. I noticed the test against timer_fd in
the poll() override, but for whatever reason it didn't click.


>  In poll I
> catch it and drop. Because the travisci environment isn't particularly qu=
ick I
> was getting timing related problems.

Right. I think adding that as a comment would be useful justification.

>=20
> I don't want to claim we've really tuned the timeouts in btbridged but th=
e
> tradeoff of upping the timeouts just for tests VS increasing the test
> complexity, well, I went with removing those timing problems by not repor=
ting
> the time to btbridged.

Seems reasonable.

>=20
> >=20
> >=20
> > >=20
> > > +}=C2=A0=C2=A0
> > Overall the wrapping seems like a lot of effort :/
> >=20
> Maybe rather than do it the way I did it, I could have simply increased t=
he
> timeout in the timerfd_create wrapper... just occurred to me now, still, =
then
> we get the problem of how much more... although it would allow us to test
> timeout pathes...

Maybe leave it at adding a TODO comment to that effect?

>=20
> > > diff --git a/travis/build.sh b/travis/build.sh
> > > index 79b0b5c..e330afd 100755
> > > --- a/travis/build.sh
> > > +++ b/travis/build.sh
> > > @@ -1,9 +1,11 @@
> > > =C2=A0#!/bin/bash
> > > +set -evx
> > > =C2=A0
> > > =C2=A0Dockerfile=3D$(cat << EOF
> > > =C2=A0FROM ubuntu:15.10
> > > =C2=A0RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get update && apt-get =
upgrade -yy
> > > =C2=A0RUN DEIAN_FRONTEND=3Dnoninteractive apt-get install --no-instal=
l-recommends -yy make gcc libsystemd-dev libc6-dev pkg-config
> > > +RUN mkdir /var/run/dbus
> > > =C2=A0RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u $=
{UID} -g ${GROUPS} ${USER}
> > > =C2=A0USER ${USER}
> > > =C2=A0ENV HOME ${HOME}
> > > @@ -14,6 +16,9 @@ EOF
> > > =C2=A0docker pull ubuntu:15.10
> > > =C2=A0docker build -t temp - <<< "${Dockerfile}"
> > > =C2=A0
> > > +sudo cp ./travis/org.openbmc.HostIpmi.conf.test /etc/dbus-1/system.d=
/org.openbmc.HostIpmi.conf
> > > +sudo service dbus restart=C2=A0=C2=A0
> > Can we instead run under dbus-run-session(1)? Or maybe use
> > sd_bus_new()/sd_bus_start()? If so we might not have to install the
> > conf under /etc/dbus-1/system.d/... either?
> >=20
> So I struggled to get any dbus going and I did initially think that a ses=
sion
> bus was the way to go but it just never worked. I will revisit now that I=
 know
> a bit more about it

Okay, hopefully it's not too much messing around.

Cheers,

Andrew
--=-8jffuXUfxH+bA27WL1eH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXPYvIAAoJEJ0dnzgO5LT5vAkP/Ass5EZPk1BIvIYtmWI4TQ7e
eApKZKXK0cs6qpc6YzXcTzudITTY4SVwevyGHnP8ElATHvFeTFDIoq4JgmtGVWOq
2fW232qpkPzNt/r76KG4kURgb8G4BKkw+MlRHZS8IPYuB5SZ6nRvy5kYS3J7FTeR
Pimt2XU15LiWfkt6ZW+DQXDFmt8E7lFri9LizcMmRSEnRtQUYuJICoA2hy5840yb
91L163ULDJ8PiWT2NsDkM+PeNJ9vZZ6FLFz0ZfksEY6UCo7zIuph5hY9SnhGYrlR
v9bjKdc+DnT1DnYHrRPMJpjnR+gN4rwgSTdDU1NmeRngD2ohAMukTD4Qpm0PPwku
4Db0DIDi4ymGWPz6/nnovERJyzKJoDpgj3kVKz0nrHT3pj57QIoMib6BjEQcDpGb
UWbJKf3o3DYaXY7eo1/yqPsCiGffz7JWrtkooWXP9KPWsvQmqxlpWI23Qb/tQdXm
n3D6Bw3Cjz2cj2RqneN1TJ4S691/3jAIfyVC6Lcvf66kq3BiZMjC3eBrbXMiywHr
UsGsvvgL5yaPNf8VJMwxfXU6LZhqwwCRh7HoW0gyrPYoc+itkeDjYayqr6xUU9Yx
M/u7hvVopVNYY+cb10uDqmRv8cipkBfzkUDuXV9dwF6p3D4TRo9eRCcN9rBfOwqO
OU3yej06RSBCRz5NMoLr
=vGq6
-----END PGP SIGNATURE-----

--=-8jffuXUfxH+bA27WL1eH--
