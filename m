Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9LXX5fXTzDqHm
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 16:20:28 +1000 (AEST)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Thu, 19 May 2016 16:20:27 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 19 May 2016 16:20:24 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id EEA422BB0066
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 16:20:23 +1000 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4J6KAMk60948680
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 16:20:23 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4J6J9tG003651
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 16:19:09 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4J6J9Ij003022; Thu, 19 May 2016 16:19:09 +1000
Received: from camb691 (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 157B7A0196;
 Thu, 19 May 2016 16:18:19 +1000 (AEST)
Date: Thu, 19 May 2016 16:18:18 +1000
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH btbridge v4 4/6] Initial set of test.
Message-ID: <20160519161818.7be3b500@camb691>
In-Reply-To: <1463635546.2703.172.camel@aj.id.au>
References: <1462324208-11150-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462324208-11150-5-git-send-email-openbmc-patches@stwcx.xyz>
 <1463635546.2703.172.camel@aj.id.au>
Organization: IBM
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051906-0021-0000-0000-000009B04280
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
X-List-Received-Date: Thu, 19 May 2016 06:20:29 -0000

On Thu, 19 May 2016 14:55:46 +0930
Andrew Jeffery <andrew@aj.id.au> wrote:

> Hey Cyril,
>=20
> The main queries I had are near the bottom, regarding the system bus
> and what alternatives we might have.
>=20
> A few typos: 'test' in the subject should be 'tests'? Probably drop the
> full-stop as well.

Yeah looks better.

>=20
> On Tue, 2016-05-03 at 20:10 -0500, OpenBMC Patches wrote:
> > From: Cyril Bur <cyril.bur@au1.ibm.com> =20
>=20
>=20
> > Very simple tests which can hopefully be extended in the future.
> >=20
> > The main purpose of this is to be able to use travis-ci to automatate =
=20
>=20
> 'automate'
>=20

Heh thanks.

> >  the
> > running of the tests and being able to fake /dev/bt-host.
> >=20
> > Signed-off-by: Cyril Bur <cyril.bur@au1.ibm.com>
> > ---
> > =C2=A0Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A07 +
> > =C2=A0bt-host.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 235 ++++++++++++++++++++++++=
++++++++++
> > =C2=A0ipmi-bouncer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| 131 +++++++++++++++++++
> > =C2=A0travis/build.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A09 ++
> > =C2=A0travis/org.openbmc.HostIpmi.conf.test |=C2=A0=C2=A020 +++
> > =C2=A0travis/run_tests.sh=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=
=A0=C2=A015 +++
> > =C2=A06 files changed, 417 insertions(+)
> > =C2=A0create mode 100644 bt-host.c
> > =C2=A0create mode 100644 ipmi-bouncer.c
> > =C2=A0create mode 100644 travis/org.openbmc.HostIpmi.conf.test
> > =C2=A0create mode 100755 travis/run_tests.sh
> >=20
> > diff --git a/Makefile b/Makefile
> > index 7ffbc01..1cf1a21 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -9,5 +9,12 @@ EXE =3D btbridged
> > =C2=A0
> > =C2=A0all: $(EXE)
> > =C2=A0
> > +.PHONY +=3D test
> > +test: $(EXE) ipmi-bouncer bt-host
> > +
> > +bt-host: bt-host.c
> > +	gcc -shared -fPIC -ldl $(CFLAGS) $^ -o $@.so
> > +
> > =C2=A0clean:
> > =C2=A0	rm -rf *.o $(EXE)
> > +	rm -rf bt-host.so ipmi-bouncer
> > diff --git a/bt-host.c b/bt-host.c
> > new file mode 100644
> > index 0000000..65bf6bb
> > --- /dev/null
> > +++ b/bt-host.c
> > @@ -0,0 +1,235 @@
> > +#define _GNU_SOURCE
> > +#include=20
> > +#include=20
> > +#include=20
> > +#include=20
> > +#include=20
> > +#include=20
> > +#include =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/=
* See NOTES */
> > +#include=20
> > +
> > +#include=20
> > +
> > +struct bttest_data {
> > +	int status;
> > +	const char msg[64];
> > +};
> > +
> > +static int bt_host_fd;
> > +static int timer_fd;
> > +
> > +static int stop;
> > +static int sent_id =3D -1;
> > +static int recv_id;
> > +
> > +/*
> > + * btbridged doesn't care about the message EXCEPT the first byte must=
 be
> > + * correct.
> > + * The first byte is the size not including the length byte its self.
> > + * A len less than 4 will constitute an invalid message according to t=
he BT
> > + * protocol, btbridged will care.
> > + */
> > +static struct bttest_data data[] =3D {
> > +	/*
> > +	=C2=A0* Note, the 4th byte is cmd, the ipmi-bouncer will put cmd in c=
c so
> > +	=C2=A0* in this array always duplicate the command
> > +	=C2=A0*
> > +	=C2=A0* Make the first message look like:
> > +	=C2=A0* seq =3D 1, netfn =3D 2, lun =3D 3 and cmd=3D 4
> > +	=C2=A0* (thats how btbridged will print it)
> > +	=C2=A0*/
> > +	{ 0, { 4, 0xb, 1, 4, 4 }},
> > +	{ 0, { 4, 0xff, 0xee, 0xdd, 0xdd, 0xbb }},
> > +	/*
> > +	=C2=A0* A bug was found in bt_q_drop(), write a test!
> > +	=C2=A0* Simply send the same seq number a bunch of times
> > +	=C2=A0*/
> > +	{ 0, { 4, 0xaa, 0xde, 0xaa, 0xaa }},
> > +	{ 0, { 4, 0xab, 0xde, 0xab, 0xab }},
> > +	{ 0, { 4, 0xac, 0xde, 0xac, 0xac }},
> > +	{ 0, { 4, 0xad, 0xde, 0xad, 0xad }},
> > +	{ 0, { 4, 0xae, 0xde, 0xae, 0xae }},
> > +	{ 0, { 4, 0xaf, 0xde, 0xaf, 0xaf }},
> > +	{ 0, { 4, 0xa0, 0xde, 0xa0, 0xa0 }},
> > +	{ 0, { 4, 0xa1, 0xde, 0xa1, 0xa1 }},
> > +	{ 0, { 4, 0xa2, 0xde, 0xa2, 0xa2 }},
> > +	{ 0, { 4, 0xa3, 0xde, 0xa3, 0xa3 }},
> > +	{ 0, { 4, 0xa4, 0xde, 0xa4, 0xa4 }},
> > +	{ 0, { 4, 0xa5, 0xde, 0xa5, 0xa5 }},
> > +	{ 0, { 4, 0xa6, 0xde, 0xa6, 0xa6 }},
> > +	{ 0, { 4, 0xa7, 0xde, 0xa7, 0xa7 }},
> > +	{ 0, { 4, 0xa8, 0xde, 0xa8, 0xa8 }},
> > +	{ 0, { 4, 0xa9, 0xde, 0xa9, 0xa9 }},
> > +	{ 0, { 4, 0xaa, 0x88, 0xaa, 0xaa }},
> > +	{ 0, { 4, 0xab, 0x88, 0xab, 0xab }},
> > +	{ 0, { 4, 0xac, 0x88, 0xac, 0xac }},
> > +	{ 0, { 4, 0xad, 0x88, 0xad, 0xad }},
> > +	{ 0, { 4, 0xae, 0x88, 0xae, 0xae }},
> > +	{ 0, { 4, 0xaf, 0x88, 0xaf, 0xaf }},
> > +	{ 0, { 4, 0xa0, 0x88, 0xa0, 0xa0 }},
> > +	{ 0, { 4, 0xa1, 0x88, 0xa1, 0xa1 }},
> > +	{ 0, { 4, 0xa2, 0x88, 0xa2, 0xa2 }},
> > +	{ 0, { 4, 0xa3, 0x88, 0xa3, 0xa3 }},
> > +	{ 0, { 4, 0xa4, 0x88, 0xa4, 0xa4 }},
> > +	{ 0, { 4, 0xa5, 0x88, 0xa5, 0xa5 }},
> > +	{ 0, { 4, 0xa6, 0x88, 0xa6, 0xa6 }},
> > +	{ 0, { 4, 0xa7, 0x88, 0xa7, 0xa7 }},
> > +	{ 0, { 4, 0xa8, 0x88, 0xa8, 0xa8 }},
> > +	{ 0, { 4, 0xa9, 0x88, 0xa9, 0xa9 }},
> > +};
> > +#define BTTEST_NUM (sizeof(data)/sizeof(struct bttest_data))
> > +#define PREFIX "[BTHOST] "
> > +
> > +#define MSG_OUT(f_, ...) do { printf(PREFIX); printf((f_), ##__VA_ARGS=
__); } while(0)
> > +#define MSG_ERR(f_, ...) do { fprintf(stderr,PREFIX); fprintf(stderr, =
(f_), ##__VA_ARGS__); } while(0)
> > +
> > +typedef int (*orig_open_t)(const char *pathname, int flags);
> > +typedef int (*orig_poll_t)(struct pollfd *fds, nfds_t nfds, int timeou=
t);
> > +typedef int (*orig_read_t)(int fd, void *buf, size_t count);
> > +typedef ssize_t (*orig_write_t)(int fd, const void *buf, size_t count);
> > +typedef int (*orig_ioctl_t)(int fd, unsigned long request, char *p);
> > +typedef int (*orig_timerfd_create_t)(int clockid, int flags);
> > +
> > +int ioctl(int fd, unsigned long request, char *p)
> > +{
> > +	if (fd =3D=3D bt_host_fd) {
> > +		MSG_OUT("ioctl(%d, %lu, %p)\n", fd, request, p);
> > +		/* TODO Check the request number */
> > +		return 0;
> > +	}
> > +
> > +	orig_ioctl_t orig_ioctl;
> > +	orig_ioctl =3D (orig_ioctl_t)dlsym(RTLD_NEXT, "ioctl");
> > +	return orig_ioctl(fd, request, p);
> > +}
> > +
> > +int poll(struct pollfd *fds, nfds_t nfds, int timeout)
> > +{
> > +	int i, j;
> > +	int ret =3D 0;
> > +	int dropped =3D 0;
> > +	struct pollfd *new_fds =3D calloc(nfds, sizeof(struct pollfd));
> > +	j =3D 0;
> > +	for (i =3D 0; i=C2=A0=C2=A0< nfds; i++) {
> > +		if (fds[i].fd =3D=3D bt_host_fd) {
> > +			short revents =3D fds[i].events;
> > +
> > +			MSG_OUT("poll() on bt_host fd\n");
> > +
> > +			if (stop)
> > +				revents &=3D ~POLLIN;
> > +			if (sent_id =3D=3D -1)
> > +				revents &=3D ~POLLOUT;
> > +			fds[i].revents =3D revents;
> > +			ret++;
> > +			dropped++;
> > +		} else if(fds[i].fd =3D=3D timer_fd) {
> > +			MSG_OUT("poll() on timerfd fd, dropping request\n");
> > +
> > +			fds[i].revents =3D 0;
> > +			dropped++;
> > +		} else {
> > +			new_fds[j].fd =3D fds[i].fd;
> > +			new_fds[j].events =3D fds[i].events;
> > +			/* Copy this to be sure */
> > +			new_fds[j].revents =3D fds[i].revents;
> > +			j++;
> > +		}
> > +	}
> > +	orig_poll_t orig_poll;
> > +	orig_poll =3D (orig_poll_t)dlsym(RTLD_NEXT, "poll");
> > +	ret +=3D orig_poll(new_fds, nfds - dropped, timeout);
> > +	j =3D 0;
> > +	for (i =3D 0; i < nfds; i++) {
> > +		if (fds[i].fd !=3D bt_host_fd && fds[i].fd !=3D timer_fd) {
> > +			fds[i].fd =3D new_fds[j].fd;
> > +			fds[i].revents =3D new_fds[j].revents;
> > +			j++;
> > +		}
> > +	}
> > +	free(new_fds);
> > +	return ret;
> > +}
> > +
> > +int open(const char *pathname, int flags)
> > +{
> > +	if (strcmp("/dev/bt-host", pathname) =3D=3D 0) {
> > +		MSG_OUT("open(%s, %x)\n", pathname, flags);
> > +		bt_host_fd =3D socket(AF_UNIX, SOCK_STREAM, 0);
> > +		return bt_host_fd;
> > +	}
> > +	orig_open_t orig_open;
> > +	orig_open =3D (orig_open_t)dlsym(RTLD_NEXT, "open");
> > +	return orig_open(pathname, flags);
> > +}
> > +
> > +int read(int fd, void *buf, size_t count)
> > +{
> > +	if (fd =3D=3D bt_host_fd) {
> > +		MSG_OUT("read(%d, %p, %ld)\n", fd, buf, count);
> > +
> > +		if (sent_id =3D=3D -1)
> > +			sent_id =3D 0;
> > +		else
> > +			sent_id++; =20
>=20
> Why are we treating sent_id =3D=3D -1 as a special case?
>=20

Honestly your guess is as good as mine at this point, I wrote this so long =
ago.
Probably artefact of how I was trying to track what I'd sent before I did it
this way. I'll remove.

> > +
> > +		MSG_OUT("Send msg id %d\n", sent_id);
> > +
> > +		if (count < data[sent_id].msg[0] + 1) {
> > +			/*
> > +			=C2=A0* TODO handle this, not urgent, the real driver also gets it
> > +			=C2=A0* wrong
> > +			=C2=A0*/
> > +			MSG_ERR("Read size was too small\n");
> > +			errno =3D ENOMEM;
> > +			return -1;
> > +		}
> > +		if (sent_id =3D=3D BTTEST_NUM - 1)
> > +			stop =3D 1; =20
>=20
> It's a personal thing so I'm not bothered about changing it, but
> conditionally assigning booleans always irks me. We could instead do:
>=20
>     stop =3D (sent_id =3D=3D (BTTEST_NUM - 1));
>=20

Looks nicer thanks.

> > +
> > +		memcpy(buf, data[sent_id].msg, data[sent_id].msg[0] + 1);
> > +		return data[sent_id].msg[0] + 1; =20
>=20
> It seems we compute 'data[sent_id].msg[0] + 1' several times. Might be
> worth making a local variable of it?
>=20

Sure

> > +	}
> > +
> > +	orig_read_t orig_read;
> > +	orig_read =3D (orig_read_t)dlsym(RTLD_NEXT, "read");
> > +	return orig_read(fd, buf, count);
> > +}
> > +
> > +int write(int fd, const void *buf, size_t count)
> > +{
> > +	if (fd =3D=3D bt_host_fd) {
> > +		MSG_OUT("write(%d, %p, %ld)\n", fd, buf, count);
> > +		if (count =3D=3D 5 && ((char *)buf)[4] =3D=3D 0xce) {
> > +			MSG_ERR("CAUGHT A TIMEOUT!!!! 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x\n"=
,=C2=A0=C2=A0((char *)buf)[0], ((char *)buf)[1], ((char *)buf)[2], ((char *=
)buf)[3], ((char *)buf)[4]);
> > +			exit(1);
> > +		}
> > +		if (memcmp(buf + 1, data[recv_id].msg + 1, count - 2) !=3D 0) {
> > +			int j;
> > +
> > +			MSG_ERR("Bad response/inconsistent message index: %d\n", recv_id);
> > +			for (j =3D 0; j < count - 2; j++)
> > +				MSG_ERR("0x%02x vs 0x%02x\n", data[recv_id].msg[j + 1], ((char *)b=
uf)[1 + j]);
> > +		} else {
> > +			MSG_OUT("Good response to message index: %d\n", recv_id);
> > +			data[recv_id].status =3D 2;
> > +		}
> > +		if (recv_id =3D=3D BTTEST_NUM - 1) {
> > +			MSG_OUT("recieved a response to all messages, tentative success\n")=
; =20
>=20
> Typo: received
>=20
> > +			exit(0); =20
>=20
> Is there a nicer way to do this than to exit the process from an
> LD_PRELOAD library?

So, there's always a way. This exit achieves 2 things. 1 reporting success =
(or
fail in the case of other exits) and to end the btbridge process.

At the moment there isn't really a nice way to end the btbridge process, an=
d if
we did it would probably be signal based, I don't like the sending ourselve=
s a
signal from an LD_PRELOAD library solution either.

A nice solution would be to have another thread that the LD_PRELOAD code co=
uld
report to and on pass results to and then it would be in charge of cleaning=
 up
btbridge, that solution is more work though.

I have thought that a kind of test runner thread might be a good idea, maybe
one day.

>=20
> > +		}
> > +		recv_id++;
> > +		return count;
> > +	}
> > +	orig_write_t orig_write;
> > +	orig_write =3D (orig_write_t)dlsym(RTLD_NEXT, "write");
> > +	return orig_write(fd, buf, count);
> > +}
> > +
> > +int timerfd_create(int clockid, int flags)
> > +{
> > +	orig_timerfd_create_t orig_timerfd_create;
> > +	orig_timerfd_create =3D (orig_timerfd_create_t)dlsym(RTLD_NEXT, "time=
rfd_create");
> > +	timer_fd =3D orig_timerfd_create(clockid, flags);
> > +	return timer_fd; =20
>=20
> What is the reason for wrapping timerfd_create()?

Yeah wasn't thrilled about having to do this. So obviously I've wrapped it
purely to know the FD that is going to get passed back to poll(). In poll I
catch it and drop. Because the travisci environment isn't particularly quic=
k I
was getting timing related problems.

I don't want to claim we've really tuned the timeouts in btbridged but the
tradeoff of upping the timeouts just for tests VS increasing the test
complexity, well, I went with removing those timing problems by not reporti=
ng
the time to btbridged.

>=20
> > +} =20
>=20
> Overall the wrapping seems like a lot of effort :/
>=20

Maybe rather than do it the way I did it, I could have simply increased the
timeout in the timerfd_create wrapper... just occurred to me now, still, th=
en
we get the problem of how much more... although it would allow us to test
timeout pathes...

> > diff --git a/ipmi-bouncer.c b/ipmi-bouncer.c
> > new file mode 100644
> > index 0000000..030cffb
> > --- /dev/null
> > +++ b/ipmi-bouncer.c
> > @@ -0,0 +1,131 @@
> > +#include=20
> > +#include=20
> > +
> > +#include=20
> > +
> > +#define PREFIX "[IPMI] "
> > +
> > +#define MSG_OUT(f_, ...) do { printf(PREFIX); printf((f_), ##__VA_ARGS=
__); } while(0)
> > +#define MSG_ERR(f_, ...) do { fprintf(stderr,PREFIX); fprintf(stderr, =
(f_), ##__VA_ARGS__); } while(0)
> > +
> > +sd_bus *bus;
> > +
> > +static int bttest_ipmi(sd_bus_message *req,
> > +		void *user_data, sd_bus_error *ret_error)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0sd_bus_error error =3D SD_BUS_ERROR_NULL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0sd_bus_message *reply =3D NULL, *m=3DNULL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0const char *dest, *path;
> > +=C2=A0=C2=A0=C2=A0=C2=A0int r, pty;
> > +	unsigned char seq, netfn, lun, cmd;
> > +	uint8_t buf[1];
> > +
> > +	MSG_OUT("Got DBUS message\n");
> > +
> > +	r =3D sd_bus_message_read(req, "yyyy",=C2=A0=C2=A0&seq, &netfn, &lun,=
 &cmd);
> > +	if (r < 0) {
> > +		MSG_ERR("FAIL ");
> > +		errno =3D -r;
> > +		perror("Couldn't read DBUS message");
> > +		return -1;
> > +	}
> > +
> > +	dest =3D sd_bus_message_get_sender(req);
> > +	path =3D sd_bus_message_get_path(req);
> > +
> > +	r =3D sd_bus_message_new_method_call(bus, &m, dest, path,
> > +			"org.openbmc.HostIpmi", "sendMessage");
> > +	if (r < 0) {
> > +		MSG_ERR("FAIL ");
> > +		errno =3D -r;
> > +		perror("Failed to add the method object");
> > +		return -1;
> > +	}
> > +
> > +	/* Send CMD twice */
> > +	r =3D sd_bus_message_append(m, "yyyyy", seq, netfn, lun, cmd, cmd);
> > +	if (r < 0) {
> > +		MSG_ERR("FAIL ");
> > +		errno =3D -r;
> > +		perror("Failed add the netfn and others");
> > +		return -1;
> > +	}
> > +
> > +	r =3D sd_bus_message_append_array(m, 'y', buf, 1);
> > +	if (r < 0) {
> > +		MSG_ERR("FAIL ");
> > +		errno =3D -r;
> > +		perror("Failed to add the string of response bytes");
> > +		return -1;
> > +	}
> > +
> > +	r =3D sd_bus_call(bus, m, 0, &error, &reply);
> > +	if (r < 0) {
> > +		MSG_ERR("FAIL ");
> > +		errno =3D -r;
> > +		perror("Failed to call the method");
> > +		return -1;
> > +	}
> > +
> > +	r =3D sd_bus_message_read(reply, "x", &pty);
> > +	if (r < 0) {
> > +		MSG_ERR("FAIL ");
> > +		errno =3D -r;
> > +		perror("Failed to get a rc from the method");
> > +	}
> > +
> > +	sd_bus_error_free(&error);
> > +	sd_bus_message_unref(m);
> > +
> > +	return 0;
> > +}
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +	sd_bus_slot *slot;
> > +	int r;
> > +
> > +	/* Connect to system bus */
> > +	r =3D sd_bus_open_system(&bus); =20
>=20
> Maybe we can avoid the system bus? See comment dbus-run-
> session/sd_bus_new comments below.
>=20
> > +	if (r < 0) {
> > +		MSG_ERR("FAIL");
> > +		errno =3D -r;
> > +		perror("Failed to connect to system bus");
> > +		return 1;
> > +	}
> > +
> > +	r =3D sd_bus_add_match(bus, &slot, "type=3D'signal',"
> > +			"interface=3D'org.openbmc.HostIpmi',"
> > +			"member=3D'ReceivedMessage'", bttest_ipmi, NULL);
> > +	if (r < 0) {
> > +		MSG_ERR("FAIL");
> > +		errno =3D -r;
> > +		perror("Failed: sd_bus_add_match");
> > +		goto finish;
> > +	}
> > +
> > +
> > +	for (;;) {
> > +		r =3D sd_bus_process(bus, NULL);
> > +		if (r < 0) {
> > +			MSG_ERR("FAIL");
> > +			errno =3D -r;
> > +			perror("Failed to process bus");
> > +			goto finish;
> > +		}
> > +
> > +		r =3D sd_bus_wait(bus, (uint64_t) - 1);
> > +		if (r < 0) {
> > +			MSG_ERR("FAIL");
> > +			errno =3D -r;
> > +			perror("Failed to wait on bus");
> > +			goto finish;
> > +		}
> > +	}
> > +
> > +finish:
> > +	sd_bus_slot_unref(slot);
> > +	sd_bus_unref(bus);
> > +
> > +	return 0;
> > +}
> > diff --git a/travis/build.sh b/travis/build.sh
> > index 79b0b5c..e330afd 100755
> > --- a/travis/build.sh
> > +++ b/travis/build.sh
> > @@ -1,9 +1,11 @@
> > =C2=A0#!/bin/bash
> > +set -evx
> > =C2=A0
> > =C2=A0Dockerfile=3D$(cat << EOF
> > =C2=A0FROM ubuntu:15.10
> > =C2=A0RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get update && apt-get up=
grade -yy
> > =C2=A0RUN DEBIAN_FRONTEND=3Dnoninteractive apt-get install --no-install=
-recommends -yy make gcc libsystemd-dev libc6-dev pkg-config
> > +RUN mkdir /var/run/dbus
> > =C2=A0RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${U=
ID} -g ${GROUPS} ${USER}
> > =C2=A0USER ${USER}
> > =C2=A0ENV HOME ${HOME}
> > @@ -14,6 +16,9 @@ EOF
> > =C2=A0docker pull ubuntu:15.10
> > =C2=A0docker build -t temp - <<< "${Dockerfile}"
> > =C2=A0
> > +sudo cp ./travis/org.openbmc.HostIpmi.conf.test /etc/dbus-1/system.d/o=
rg.openbmc.HostIpmi.conf
> > +sudo service dbus restart =20
>=20
> Can we instead run under dbus-run-session(1)? Or maybe use
> sd_bus_new()/sd_bus_start()? If so we might not have to install the
> conf under /etc/dbus-1/system.d/... either?
>=20

So I struggled to get any dbus going and I did initially think that a sessi=
on
bus was the way to go but it just never worked. I will revisit now that I k=
now
a bit more about it

> > +
> > =C2=A0gcc --version
> > =C2=A0
> > =C2=A0mkdir -p linux
> > @@ -21,3 +26,7 @@ wget https://raw.githubusercontent.com/openbmc/linux/=
dev-4.3/include/uapi/linux/
> > =C2=A0
> > =C2=A0docker run --cap-add=3Dsys_admin --net=3Dhost --rm=3Dtrue --user=
=3D"${USER}" \
> > =C2=A0 -w "${PWD}" -v "${HOME}":"${HOME}" -t temp make KERNEL_HEADERS=
=3D$PWD
> > +
> > +docker run --cap-add=3Dsys_admin --net=3Dhost -v /var/run/dbus:/var/ru=
n/dbus --rm=3Dtrue --user=3D"${USER}" \
> > + -w "${PWD}" -v "${HOME}":"${HOME}" -t temp ./travis/run_tests.sh
> > +
> > diff --git a/travis/org.openbmc.HostIpmi.conf.test b/travis/org.openbmc=
.HostIpmi.conf.test
> > new file mode 100644
> > index 0000000..196945f
> > --- /dev/null
> > +++ b/travis/org.openbmc.HostIpmi.conf.test
> > @@ -0,0 +1,20 @@
> > +=20
> > +
> > +1.0//EN" =20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"http://www.freedeskto=
p.org/standards/dbus/1.0/busconfig.dtd">; =20
> > +
> > +
> > +	This file is need to run openbmc bt bridge daemon.
> > +	Place this file in /etc/dbus-1/system.d/
> > +-->
> > +
> > +
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > +
> > +
> > +
> > diff --git a/travis/run_tests.sh b/travis/run_tests.sh
> > new file mode 100755
> > index 0000000..a391798
> > --- /dev/null
> > +++ b/travis/run_tests.sh
> > @@ -0,0 +1,15 @@
> > +#!/bin/bash
> > +set -evx
> > +make KERNEL_HEADERS=3D${PWD} test
> > +LD_PRELOAD=3D${PWD}/bt-host.so ./btbridged --vv &
> > +bridge_pid=3D$!
> > +
> > +./ipmi-bouncer &
> > +ipmi_pid=3D$!
> > +
> > +wait $bridge_pid
> > +exit_status=3D$?
> > +
> > +kill -9 $ipmi_pid =20
>=20
> If we play our cards right with using a non-system-bus, sd_bus_wait()
> looks like it would give us an -ENOTCONN if the bus is closed, at which
> point ipmi-bouncer would exit gracefully rather than being SIGKILLed.
> Thoughts?

ipmi-bouncer knowing to cleanup would be a nice win!

>=20
> > +
> > +exit $exit_status =20
>=20
> Cheers,
>=20

Thanks for the review,

Cyril

> Andrew
