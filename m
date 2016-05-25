Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDtZc1cL5zDqPX
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 10:34:32 +1000 (AEST)
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Wed, 25 May 2016 10:34:30 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 25 May 2016 10:34:27 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 606212BB0054
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 10:34:26 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4P0YIfO7274856
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 10:34:26 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4P0Xrq5014471
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2016 10:33:54 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4P0XrJ0014033; Wed, 25 May 2016 10:33:53 +1000
Received: from camb691 (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6C908A0146;
 Wed, 25 May 2016 10:33:27 +1000 (AEST)
Date: Wed, 25 May 2016 10:33:26 +1000
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH btbridge v4 1/6] Initialise variable to avoid using it
 uninitialised
Message-ID: <20160525103326.1f22dfc8@camb691>
In-Reply-To: <1464095002.20948.5.camel@aj.id.au>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462324208-11150-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1463627449.2703.140.camel@aj.id.au>
 <20160519154450.3a1c5c0a@camb691>
 <1464095002.20948.5.camel@aj.id.au>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16052500-1618-0000-0000-000045EB81CD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Wed, 25 May 2016 00:34:32 -0000

On Tue, 24 May 2016 22:33:22 +0930
Andrew Jeffery <andrew@aj.id.au> wrote:

> On Thu, 2016-05-19 at 15:44 +1000, Cyril Bur wrote:
> > > Building with this patch and native GCC* gives errors:
> > >=C2=A0
> > >=C2=A0=C2=A0=C2=A0=C2=A0 $ KERNEL_HEADERS=3D../../linux/ast2400/includ=
e/uapi/ make
> > >=C2=A0=C2=A0=C2=A0=C2=A0 cc=C2=A0=C2=A0-Wall -O2 -g -I../../linux/ast2=
400/include/uapi/=C2=A0=C2=A0=C2=A0=C2=A0btbridged.c=C2=A0=C2=A0-lsystemd -=
o btbridged
> > >=C2=A0=C2=A0=C2=A0=C2=A0 btbridged.c: In function =E2=80=98main=E2=80=
=99:
> > >=C2=A0=C2=A0=C2=A0=C2=A0 btbridged.c:590:6: warning: =E2=80=98r=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
> > >=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0if (r < 0)
> > >=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
> > >=C2=A0=C2=A0=C2=A0=C2=A0 btbridged.c:342:6: note: =E2=80=98r=E2=80=99 =
was declared here
> > >=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 int r, len;
> > >=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^
> > >=C2=A0
> > > That's weird, because the note isn't relevant to the function of line
> > > that generated the warning. However, the 'r' defined in=C2=A0bt_host_=
write()
> > > suffers the same initialisation issue. Initialising it gives me a bui=
ld
> > > with no warnings so maybe it's worth doing that here also?
> > >=C2=A0 =20
> >=20
> > Yeah, GCC seems to be getting a bit confused. I'm usually not in favour=
 of
> > putting in stuff to shut the warnings up but these are just so odd that=
 I'm at
> > a loss.
> >=20
> > Your suggestion works, lets just do that and forget about it. =20
>=20
> So, just out of interest I ran scan-build over it. Turns out it leads
> to a bug. Here's the reasoning:
>=20

Well well well, found it! I'll hurry long the series which solves anyway.

Thanks!!

> 339	static int bt_host_write(struct btbridged_context *context, struct bt=
_queue *bt_msg)
> 340	{
> 341		struct bt_queue *head;
> 342		uint8_t data[BT_MAX_MESSAGE] =3D { 0 };
> 343		sd_bus_message *msg =3D NULL;
> 344		int r, len;
> =09
> 1	'r' declared without an initial value	=E2=86=92
> 345	=C2=A0
> 346		assert(context);
> 347	=C2=A0
> 348		if (!bt_msg)
> =09
> 2=E2=86=90	Assuming 'bt_msg' is non-null	=E2=86=92
> =09
> 3=E2=86=90	Taking false branch	=E2=86=92
> 349			return -EINVAL;
> 350	=C2=A0
> 351		head =3D bt_q_get_head(context);
> 352		if (bt_msg =3D=3D head) {
> =09
> 4=E2=86=90	Assuming 'bt_msg' is not equal to 'head'	=E2=86=92
> =09
> 5=E2=86=90	Taking false branch	=E2=86=92
> 353			struct itimerspec ts;
> 354			/* Need to adjust the timer */
> 355			ts.it_interval.tv_sec =3D 0;
> 356			ts.it_interval.tv_nsec =3D 0;
> 357			if (head->next) {
> 358				ts.it_value =3D head->next->start;
> 359				ts.it_value.tv_sec +=3D BT_HOST_TIMEOUT_SEC;
> 360				MSG_OUT("Adjusting timer for next element\n");
> 361			} else {
> 362				ts.it_value.tv_nsec =3D 0;
> 363				ts.it_value.tv_sec =3D 0;
> 364				MSG_OUT("Disabling timer, no elements remain in queue\n");
> 365			}
> 366			r =3D timerfd_settime(context->fds[TIMER_FD].fd, TFD_TIMER_ABSTIME,=
 &ts, NULL);
> 367			if (r =3D=3D -1)
> 368				MSG_ERR("Couldn't set timerfd\n");
> 369		}
> 370		data[1] =3D (bt_msg->rsp.netfn << 2) | (bt_msg->rsp.lun & 0x3);
> 371		data[2] =3D bt_msg->rsp.seq;
> 372		data[3] =3D bt_msg->rsp.cmd;
> 373		data[4] =3D bt_msg->rsp.cc;
> 374		if (bt_msg->rsp.data_len > sizeof(data) - 5) {
> =09
> 6=E2=86=90	Taking false branch	=E2=86=92
> 375			MSG_ERR("Response message size (%zu) too big, truncating\n", bt_msg=
->rsp.data_len);
> 376			bt_msg->rsp.data_len =3D sizeof(data) - 5;
> 377		}
> 378		/* netfn/len + seq + cmd + cc =3D 4 */
> 379		data[0] =3D bt_msg->rsp.data_len + 4;
> 380		if (bt_msg->rsp.data_len)
> =09
> 7=E2=86=90	Taking false branch	=E2=86=92
> 381			memcpy(data + 5, bt_msg->rsp.data, bt_msg->rsp.data_len);
> 382		/* Count the data[0] byte */
> 383		len =3D write(context->fds[BT_FD].fd, data, data[0] + 1);
> 384		if (len =3D=3D -1) {
> =09
> 8=E2=86=90	Taking false branch     =E2=86=92
> 385			r =3D errno;
> 386			MSG_ERR("Error writing to %s: %s\n", BT_HOST_PATH, strerror(errno));
> 387			if (bt_msg->call) {
> 388				r =3D sd_bus_message_new_method_errno(bt_msg->call, &msg, r, NULL);
> 389				if (r < 0)
> 390					MSG_ERR("Couldn't create response error\n");
> 391			}
> 392			goto out;
> 393		} else {
> 394			if (len !=3D data[0] + 1)
> =09
> 9=E2=86=90	Taking false branch	=E2=86=92
> 395				MSG_ERR("Possible short write to %s, desired len: %d, written len:=
 %d\n", BT_HOST_PATH, data[0] + 1, len);
> 396			else
> 397				MSG_OUT("Successfully wrote %d of %d bytes to %s\n", len, data[0] =
+ 1, BT_HOST_PATH);
> 398	=C2=A0
> 399			if (bt_msg->call) {
> =09
> 10=E2=86=90	Taking false branch	=E2=86=92
> 400				r =3D sd_bus_message_new_method_return(bt_msg->call, &msg);
> 401				if (r < 0) {
> 402					MSG_ERR("Couldn't create response message\n");
> 403					goto out;
> 404				}
> 405				r =3D 0; /* Just to be explicit about what we're sending back */
> 406				r =3D sd_bus_message_append(msg, "x", r);
> 407				if (r < 0) {
> 408					MSG_ERR("Couldn't append result to response\n");
> 409					goto out;
> 410				}
> 411	=C2=A0
> 412			}
> 413		}
> 414	=C2=A0
> 415	out:
> 416		if (bt_msg->call) {
> =09
> 11=E2=86=90	Taking false branch	=E2=86=92
> 417			if (sd_bus_send(context->bus, msg, NULL) < 0)
> 418				MSG_ERR("Couldn't send response message\n");
> 419			sd_bus_message_unref(msg);
> 420		}
> 421		bt_q_drop(context, bt_msg);
> 422	=C2=A0
> 423		/*
> 424		=C2=A0* There isn't another message ready to be sent so turn off POL=
LOUT
> 425		=C2=A0*/
> 426		if (!bt_q_get_msg(context)) {
> =09
> 12=E2=86=90	Taking false branch	=E2=86=92
> 427			MSG_OUT("Turning off POLLOUT for the BT in poll()\n");
> 428			context->fds[BT_FD].events =3D POLLIN;
> 429		}
> 430	=C2=A0
> 431		return r;
> =09
> 13=E2=86=90	Undefined or garbage value returned to caller
> 432	}
> 433
