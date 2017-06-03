Return-Path: <rostedt@goodmis.org>
X-Greylist: delayed 428 seconds by postgrey-1.36 at bilbo;
 Sun, 04 Jun 2017 07:32:44 AEST
Received: from smtprelay.hostedemail.com (smtprelay0070.hostedemail.com
 [216.40.44.70])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wgDnm0MvQzDqFR
 for <openbmc@lists.ozlabs.org>; Sun,  4 Jun 2017 07:32:43 +1000 (AEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 36CDA5D986
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 21:25:36 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id D0889123;
 Sat,  3 Jun 2017 21:25:31 +0000 (UTC)
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, rostedt@goodmis.org,
 :::::::::::::::::::::::::::::,
 RULES_HIT:2:41:152:355:379:541:599:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1513:1515:1516:1518:1521:1535:1593:1594:1605:1730:1747:1777:1792:1801:2393:2553:2559:2562:2689:2892:2902:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4049:4119:4605:5007:6117:6119:6261:6609:6742:7875:7903:8603:9040:10004:10848:10967:11026:11232:11473:11657:11658:11914:12043:12296:12438:12555:12663:12740:12895:13138:13149:13230:13231:14659:21060:21080:21434:21451:21627:30054:30075:30080:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: idea04_12f827866032f
X-Filterd-Recvd-Size: 8304
Received: from vmware.local.home (ip65-46-187-134.z187-46-65.customer.algx.net
 [65.46.187.134]) (Authenticated sender: rostedt@goodmis.org)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Sat,  3 Jun 2017 21:25:30 +0000 (UTC)
Date: Sat, 3 Jun 2017 17:25:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, mingo@redhat.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 joel@jms.id.au, andrew@aj.id.au, jk@ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 mark.rutland@arm.com, linux@armlinux.org.uk, alistair@popple.id.au,
 benh@kernel.crashing.org
Subject: Re: [PATCH v7 00/23] FSI device driver implementation
Message-ID: <20170603172528.113ffe11@vmware.local.home>
In-Reply-To: <20170603100510.GA24053@kroah.com>
References: <20170511210101.78409-1-cbostic@linux.vnet.ibm.com>
 <305bc7b6-30eb-a44d-28da-f90f9a973acf@linux.vnet.ibm.com>
 <20170603100510.GA24053@kroah.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 04 Jun 2017 20:05:34 +1000
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
X-List-Received-Date: Sat, 03 Jun 2017 21:32:45 -0000

On Sat, 3 Jun 2017 19:05:10 +0900
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, May 31, 2017 at 12:17:05PM -0500, Christopher Bostic wrote:
> > Hi Greg,
> >=20
> > Are there any further changes you require for this patch set? This has =
been
> > extensively tested internally and all is working as expected.   Would i=
t be
> > possible to move forward with integration in the near future?   Any inp=
ut
> > would be appreciated. =20
>=20
> Sorry for the delay.  I just tried applying this to my tree, but got the
> following build warnings, and then errors:
>=20
> In file included from ./include/trace/define_trace.h:95:0,
>                  from ./include/trace/events/fsi.h:127,
>                  from drivers/fsi/fsi-core.c:27:
> ./include/trace/events/fsi.h: In function =E2=80=98trace_raw_output_fsi_m=
aster_write=E2=80=99:
> ./include/trace/events/fsi.h:58:12: warning: field width specifier =E2=80=
=98*=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument =
8 has type =E2=80=98size_t {aka long unsigned int}=E2=80=99 [-Wformat=3D]
>   TP_printk("fsi%d:%02d:%02d %08x[%zd] <=3D {%*ph}",

=46rom patch 16/23:

+TRACE_EVENT(fsi_master_write,
+	TP_PROTO(const struct fsi_master *master, int link, int id,
+			uint32_t addr, size_t size, const void *data),
+	TP_ARGS(master, link, id, addr, size, data),
+	TP_STRUCT__entry(
+		__field(int,	master_idx)
+		__field(int,	link)
+		__field(int,	id)
+		__field(__u32,	addr)
+		__field(size_t,	size)
+		__field(__u32,	data)
+	),
+	TP_fast_assign(
+		__entry->master_idx =3D master->idx;
+		__entry->link =3D link;
+		__entry->id =3D id;
+		__entry->addr =3D addr;
+		__entry->size =3D size;
+		__entry->data =3D 0;
+		memcpy(&__entry->data, data, size);
+	),
+	TP_printk("fsi%d:%02d:%02d %08x[%zd] <=3D {%*ph}",
+		__entry->master_idx,
+		__entry->link,
+		__entry->id,
+		__entry->addr,
+		__entry->size,
+		__entry->size, &__entry->data
+	)
+);

Looks like the second __entry->size, probably needs a type cast.

Would something like:

	__entry->size,
	(int)__entry->size, &__entry->data

work?

I haven't looked at the others, but I'm guessing they are probably
similar issues.

-- Steve

>             ^
> ./include/trace/trace_events.h:343:22: note: in definition of macro =E2=
=80=98DECLARE_EVENT_CLASS=E2=80=99
>   trace_seq_printf(s, print);     \
>                       ^~~~~
> ./include/trace/trace_events.h:65:9: note: in expansion of macro =E2=80=
=98PARAMS=E2=80=99
>          PARAMS(print));         \
>          ^~~~~~
> ./include/trace/events/fsi.h:37:1: note: in expansion of macro =E2=80=98T=
RACE_EVENT=E2=80=99
>  TRACE_EVENT(fsi_master_write,
>  ^~~~~~~~~~~
> ./include/trace/events/fsi.h:58:2: note: in expansion of macro =E2=80=98T=
P_printk=E2=80=99
>   TP_printk("fsi%d:%02d:%02d %08x[%zd] <=3D {%*ph}",
>   ^~~~~~~~~
> In file included from ./include/trace/trace_events.h:377:0,
>                  from ./include/trace/define_trace.h:95,
>                  from ./include/trace/events/fsi.h:127,
>                  from drivers/fsi/fsi-core.c:27:
> ./include/trace/events/fsi.h:58:44: note: format string is defined here
>   TP_printk("fsi%d:%02d:%02d %08x[%zd] <=3D {%*ph}",
>                                            ~^~
> In file included from ./include/trace/define_trace.h:95:0,
>                  from ./include/trace/events/fsi.h:127,
>                  from drivers/fsi/fsi-core.c:27:
> ./include/trace/events/fsi.h: In function =E2=80=98trace_raw_output_fsi_m=
aster_rw_resul
> =E2=80=99:
> ./include/trace/events/fsi.h:95:12: warning: field width specifier =E2=80=
=98*=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument =
9 has type =E2=80=98size_t {aka long unsigned int}=E2=80=99 [-Wformat=3D]
>   TP_printk("fsi%d:%02d:%02d %08x[%zd] %s {%*ph} ret %d",
>             ^
> ./include/trace/trace_events.h:343:22: note: in definition of macro =E2=
=80=98DECLARE_EVENT_CLASS=E2=80=99
>   trace_seq_printf(s, print);     \
>                       ^~~~~
> ./include/trace/trace_events.h:65:9: note: in expansion of macro =E2=80=
=98PARAMS=E2=80=99
>          PARAMS(print));         \
>          ^~~~~~
> ./include/trace/events/fsi.h:68:1: note: in expansion of macro =E2=80=98T=
RACE_EVENT=E2=80=99
>  TRACE_EVENT(fsi_master_rw_result,
>  ^~~~~~~~~~~
> ./include/trace/events/fsi.h:95:2: note: in expansion of macro =E2=80=98T=
P_printk=E2=80=99
>   TP_printk("fsi%d:%02d:%02d %08x[%zd] %s {%*ph} ret %d",
>   ^~~~~~~~~
> In file included from ./include/trace/trace_events.h:377:0,
>                  from ./include/trace/define_trace.h:95,
>                  from ./include/trace/events/fsi.h:127,
>                  from drivers/fsi/fsi-core.c:27:
> ./include/trace/events/fsi.h:95:44: note: format string is defined here
>   TP_printk("fsi%d:%02d:%02d %08x[%zd] %s {%*ph} ret %d",
>                                            ~^~
>   CHK     include/generated/uapi/linux/version.h
>   GEN     .version
>   CHK     include/generated/compile.h
>   UPD     include/generated/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      vmlinux.o
>   MODPOST vmlinux.o
>   KSYM    .tmp_kallsyms1.o
>   KSYM    .tmp_kallsyms2.o
>   LD      vmlinux
>   SORTEX  vmlinux
>   SYSMAP  System.map
>   CC      arch/x86/boot/version.o
>   Building modules, stage 2.
>   VOFFSET arch/x86/boot/compressed/../voffset.h
>   OBJCOPY arch/x86/boot/compressed/vmlinux.bin
>   RELOCS  arch/x86/boot/compressed/vmlinux.relocs
>   CC      arch/x86/boot/compressed/kaslr.o
>   GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
>   CC      arch/x86/boot/compressed/misc.o
>   MODPOST 476 modules
> WARNING: modpost: missing MODULE_LICENSE() in drivers/fsi/fsi-core.o
> see include/linux/module.h for more information
>   MKPIGGY arch/x86/boot/compressed/piggy.S
>   AS      arch/x86/boot/compressed/piggy.o
>   DATAREL arch/x86/boot/compressed/vmlinux
>   LD      arch/x86/boot/compressed/vmlinux
>   ZOFFSET arch/x86/boot/zoffset.h
>   OBJCOPY arch/x86/boot/vmlinux.bin
>   AS      arch/x86/boot/header.o
>   LD      arch/x86/boot/setup.elf
>   OBJCOPY arch/x86/boot/setup.bin
>   BUILD   arch/x86/boot/bzImage
> Setup is 17532 bytes (padded to 17920 bytes).
> System is 5445 kB
> CRC 56d8089d
> Kernel: arch/x86/boot/bzImage is ready  (#387)
> ERROR: "fsi_slave_claim_range" [drivers/fsi/fsi-master-hub.ko] undefined!
> ERROR: "fsi_slave_read" [drivers/fsi/fsi-master-hub.ko] undefined!
> ERROR: "fsi_slave_write" [drivers/fsi/fsi-master-hub.ko] undefined!
> ERROR: "fsi_slave_release_range" [drivers/fsi/fsi-master-hub.ko] undefine=
d!
> make[1]: *** [scripts/Makefile.modpost:91: __modpost] Error 1
> make: *** [Makefile:1214: modules] Error 2
>=20
>=20
> Note, I'm using gcc 7.1.1, which might be what is showing the build warni=
ngs,
> but that doesn't explain the build errors.
>=20
> So obviously, I can't take this as is :(
>=20
> thanks,
>=20
> greg k-h
