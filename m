Return-Path: <andrew@aj.id.au>
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDbFQ0td4zDqGZ
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 23:03:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=gFVA1JAu; 
 dkim-atps=neutral
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id DBFB076C069;
 Tue, 24 May 2016 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=c++uYB3URIxJ9FN7TRYEH
 BZ9niI=; b=gFVA1JAuMkxqEYa2VwszdBpw9HpuxbxaU686KZ7R1WTqtGAAJ/E34
 hENtPQ5c6RdEpgxG8/RUsj/w/E6P8j5HQeceOqnhgLfn9PxeRd8ROJLBxUxuU/mg
 VHLDV/9wLVYh0opdioWKAnCPC9v1PH9/5RTbiDKF1dixWuFK7S4c4w=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id 7A1F876C058;
 Tue, 24 May 2016 06:03:34 -0700 (PDT)
Message-ID: <1464095002.20948.5.camel@aj.id.au>
Subject: Re: [PATCH btbridge v4 1/6] Initialise variable to avoid using it
 uninitialised
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: Cyril Bur <cyril.bur@au1.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Tue, 24 May 2016 22:33:22 +0930
In-Reply-To: <20160519154450.3a1c5c0a@camb691>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462324208-11150-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1463627449.2703.140.camel@aj.id.au> <20160519154450.3a1c5c0a@camb691>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-Y1kYDXMLMutDv1kwsPkS"
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
X-List-Received-Date: Tue, 24 May 2016 13:03:39 -0000


--=-Y1kYDXMLMutDv1kwsPkS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-05-19 at 15:44 +1000, Cyril Bur wrote:
> > Building with this patch and native GCC* gives errors:
> >=C2=A0
> >=C2=A0=C2=A0=C2=A0=C2=A0 $ KERNEL_HEADERS=3D../../linux/ast2400/include/=
uapi/ make
> >=C2=A0=C2=A0=C2=A0=C2=A0 cc=C2=A0=C2=A0-Wall -O2 -g -I../../linux/ast240=
0/include/uapi/=C2=A0=C2=A0=C2=A0=C2=A0btbridged.c=C2=A0=C2=A0-lsystemd -o =
btbridged
> >=C2=A0=C2=A0=C2=A0=C2=A0 btbridged.c: In function =E2=80=98main=E2=80=99=
:
> >=C2=A0=C2=A0=C2=A0=C2=A0 btbridged.c:590:6: warning: =E2=80=98r=E2=80=99=
 may be used uninitialized in this function [-Wmaybe-uninitialized]
> >=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0if (r < 0)
> >=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
> >=C2=A0=C2=A0=C2=A0=C2=A0 btbridged.c:342:6: note: =E2=80=98r=E2=80=99 wa=
s declared here
> >=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 int r, len;
> >=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
> >=C2=A0
> > That's weird, because the note isn't relevant to the function of line
> > that generated the warning. However, the 'r' defined in=C2=A0bt_host_wr=
ite()
> > suffers the same initialisation issue. Initialising it gives me a build
> > with no warnings so maybe it's worth doing that here also?
> >=C2=A0
>=20
> Yeah, GCC seems to be getting a bit confused. I'm usually not in favour o=
f
> putting in stuff to shut the warnings up but these are just so odd that I=
'm at
> a loss.
>=20
> Your suggestion works, lets just do that and forget about it.

So, just out of interest I ran scan-build over it. Turns out it leads
to a bug. Here's the reasoning:

339	static int bt_host_write(struct btbridged_context *context, struct bt_q=
ueue *bt_msg)
340	{
341		struct bt_queue *head;
342		uint8_t data[BT_MAX_MESSAGE] =3D { 0 };
343		sd_bus_message *msg =3D NULL;
344		int r, len;
=09
1	'r' declared without an initial value	=E2=86=92
345	=C2=A0
346		assert(context);
347	=C2=A0
348		if (!bt_msg)
=09
2=E2=86=90	Assuming 'bt_msg' is non-null	=E2=86=92
=09
3=E2=86=90	Taking false branch	=E2=86=92
349			return -EINVAL;
350	=C2=A0
351		head =3D bt_q_get_head(context);
352		if (bt_msg =3D=3D head) {
=09
4=E2=86=90	Assuming 'bt_msg' is not equal to 'head'	=E2=86=92
=09
5=E2=86=90	Taking false branch	=E2=86=92
353			struct itimerspec ts;
354			/* Need to adjust the timer */
355			ts.it_interval.tv_sec =3D 0;
356			ts.it_interval.tv_nsec =3D 0;
357			if (head->next) {
358				ts.it_value =3D head->next->start;
359				ts.it_value.tv_sec +=3D BT_HOST_TIMEOUT_SEC;
360				MSG_OUT("Adjusting timer for next element\n");
361			} else {
362				ts.it_value.tv_nsec =3D 0;
363				ts.it_value.tv_sec =3D 0;
364				MSG_OUT("Disabling timer, no elements remain in queue\n");
365			}
366			r =3D timerfd_settime(context->fds[TIMER_FD].fd, TFD_TIMER_ABSTIME, &=
ts, NULL);
367			if (r =3D=3D -1)
368				MSG_ERR("Couldn't set timerfd\n");
369		}
370		data[1] =3D (bt_msg->rsp.netfn << 2) | (bt_msg->rsp.lun & 0x3);
371		data[2] =3D bt_msg->rsp.seq;
372		data[3] =3D bt_msg->rsp.cmd;
373		data[4] =3D bt_msg->rsp.cc;
374		if (bt_msg->rsp.data_len > sizeof(data) - 5) {
=09
6=E2=86=90	Taking false branch	=E2=86=92
375			MSG_ERR("Response message size (%zu) too big, truncating\n", bt_msg->=
rsp.data_len);
376			bt_msg->rsp.data_len =3D sizeof(data) - 5;
377		}
378		/* netfn/len + seq + cmd + cc =3D 4 */
379		data[0] =3D bt_msg->rsp.data_len + 4;
380		if (bt_msg->rsp.data_len)
=09
7=E2=86=90	Taking false branch	=E2=86=92
381			memcpy(data + 5, bt_msg->rsp.data, bt_msg->rsp.data_len);
382		/* Count the data[0] byte */
383		len =3D write(context->fds[BT_FD].fd, data, data[0] + 1);
384		if (len =3D=3D -1) {
=09
8=E2=86=90	Taking false branch     =E2=86=92
385			r =3D errno;
386			MSG_ERR("Error writing to %s: %s\n", BT_HOST_PATH, strerror(errno));
387			if (bt_msg->call) {
388				r =3D sd_bus_message_new_method_errno(bt_msg->call, &msg, r, NULL);
389				if (r < 0)
390					MSG_ERR("Couldn't create response error\n");
391			}
392			goto out;
393		} else {
394			if (len !=3D data[0] + 1)
=09
9=E2=86=90	Taking false branch	=E2=86=92
395				MSG_ERR("Possible short write to %s, desired len: %d, written len: %=
d\n", BT_HOST_PATH, data[0] + 1, len);
396			else
397				MSG_OUT("Successfully wrote %d of %d bytes to %s\n", len, data[0] + =
1, BT_HOST_PATH);
398	=C2=A0
399			if (bt_msg->call) {
=09
10=E2=86=90	Taking false branch	=E2=86=92
400				r =3D sd_bus_message_new_method_return(bt_msg->call, &msg);
401				if (r < 0) {
402					MSG_ERR("Couldn't create response message\n");
403					goto out;
404				}
405				r =3D 0; /* Just to be explicit about what we're sending back */
406				r =3D sd_bus_message_append(msg, "x", r);
407				if (r < 0) {
408					MSG_ERR("Couldn't append result to response\n");
409					goto out;
410				}
411	=C2=A0
412			}
413		}
414	=C2=A0
415	out:
416		if (bt_msg->call) {
=09
11=E2=86=90	Taking false branch	=E2=86=92
417			if (sd_bus_send(context->bus, msg, NULL) < 0)
418				MSG_ERR("Couldn't send response message\n");
419			sd_bus_message_unref(msg);
420		}
421		bt_q_drop(context, bt_msg);
422	=C2=A0
423		/*
424		=C2=A0* There isn't another message ready to be sent so turn off POLLO=
UT
425		=C2=A0*/
426		if (!bt_q_get_msg(context)) {
=09
12=E2=86=90	Taking false branch	=E2=86=92
427			MSG_OUT("Turning off POLLOUT for the BT in poll()\n");
428			context->fds[BT_FD].events =3D POLLIN;
429		}
430	=C2=A0
431		return r;
=09
13=E2=86=90	Undefined or garbage value returned to caller
432	}
433
--=-Y1kYDXMLMutDv1kwsPkS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXRFEaAAoJEJ0dnzgO5LT5qAkP/2tbwdeSZSXinP3Ng2DDmNdp
rnO/+Pn0vDZG/J0drRNje/Jam3XMGBuVIMMSvfVW5hrDO7bsftiXkUDDA3kKaxs5
NJ7L2LNJeOuDjgwVnbtNkcuEnYBzYLB0LmpVK20fCzRqMI8Nx/gEmuvBBwKO6nG8
NoOemyAM0cUKLJZll6HmlDJepNtVNEO5bElfBPrHGUHqUtS9S8Ixqtz9OuU39E06
n9h4jp9ChHYBgQoXxgiHEFIwZd5SFgAEKZ3xY8e4e5kCsgTO7896dWsS5GHmJSGD
n25dtHJHXyvViZpz/rHerU0mKXnpyQDSP4QF6tG7OlMwgPGvyFyewCrBnU25Jcj2
pCQ4Fy5J0T24qSo3PBcCzlERhxeB+QiZH2kzIPHdFz3Px30KlRp79L0Wth0p5aIp
ASFvuhWcH51cairnXUNpb3P0+M6tFuX/RyPzXQAxAvpZOKXm2mBTnl7xiqB2eHKs
J85UuABCKfMZf8DnyY+2k6AneDpBJ1GYLz7dkzLnZiySUfP4POjQp6gDUui0M7LP
RfX4z/t6vlFKWZEB37b3QRfyw51vRUEL9gKY5adIlmimcQucOTFnp/74NJxQKRBI
VqAQDv4oOq+jXQiLSa0XnWNhVMfUwf+yYS59ke8lxthRENkNJuC8MOj7nCc7NbRi
6n+FF7MMDmasNuewYQGG
=Uzml
-----END PGP SIGNATURE-----

--=-Y1kYDXMLMutDv1kwsPkS--
