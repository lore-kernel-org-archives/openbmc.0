Return-Path: <gregkh@linuxfoundation.org>
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wg32m6nhLzDqFH
 for <openbmc@lists.ozlabs.org>; Sun,  4 Jun 2017 00:13:20 +1000 (AEST)
Received: from localhost (mobile-166-177-187-107.mycingular.net
 [166.177.187.107])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 0280240A;
 Sat,  3 Jun 2017 14:13:16 +0000 (UTC)
Date: Sat, 3 Jun 2017 19:05:10 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: rostedt@goodmis.org, mingo@redhat.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, joel@jms.id.au,
 andrew@aj.id.au, jk@ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 linux@armlinux.org.uk, alistair@popple.id.au, benh@kernel.crashing.org
Subject: Re: [PATCH v7 00/23] FSI device driver implementation
Message-ID: <20170603100510.GA24053@kroah.com>
References: <20170511210101.78409-1-cbostic@linux.vnet.ibm.com>
 <305bc7b6-30eb-a44d-28da-f90f9a973acf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <305bc7b6-30eb-a44d-28da-f90f9a973acf@linux.vnet.ibm.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
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
X-List-Received-Date: Sat, 03 Jun 2017 14:13:21 -0000

On Wed, May 31, 2017 at 12:17:05PM -0500, Christopher Bostic wrote:
> Hi Greg,
> 
> Are there any further changes you require for this patch set? This has been
> extensively tested internally and all is working as expected.   Would it be
> possible to move forward with integration in the near future?   Any input
> would be appreciated.

Sorry for the delay.  I just tried applying this to my tree, but got the
following build warnings, and then errors:

In file included from ./include/trace/define_trace.h:95:0,
                 from ./include/trace/events/fsi.h:127,
                 from drivers/fsi/fsi-core.c:27:
./include/trace/events/fsi.h: In function ‘trace_raw_output_fsi_master_write’:
./include/trace/events/fsi.h:58:12: warning: field width specifier ‘*’ expects argument of type ‘int’, but argument 8 has type ‘size_t {aka long unsigned int}’ [-Wformat=]
  TP_printk("fsi%d:%02d:%02d %08x[%zd] <= {%*ph}",
            ^
./include/trace/trace_events.h:343:22: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  trace_seq_printf(s, print);     \
                      ^~~~~
./include/trace/trace_events.h:65:9: note: in expansion of macro ‘PARAMS’
         PARAMS(print));         \
         ^~~~~~
./include/trace/events/fsi.h:37:1: note: in expansion of macro ‘TRACE_EVENT’
 TRACE_EVENT(fsi_master_write,
 ^~~~~~~~~~~
./include/trace/events/fsi.h:58:2: note: in expansion of macro ‘TP_printk’
  TP_printk("fsi%d:%02d:%02d %08x[%zd] <= {%*ph}",
  ^~~~~~~~~
In file included from ./include/trace/trace_events.h:377:0,
                 from ./include/trace/define_trace.h:95,
                 from ./include/trace/events/fsi.h:127,
                 from drivers/fsi/fsi-core.c:27:
./include/trace/events/fsi.h:58:44: note: format string is defined here
  TP_printk("fsi%d:%02d:%02d %08x[%zd] <= {%*ph}",
                                           ~^~
In file included from ./include/trace/define_trace.h:95:0,
                 from ./include/trace/events/fsi.h:127,
                 from drivers/fsi/fsi-core.c:27:
./include/trace/events/fsi.h: In function ‘trace_raw_output_fsi_master_rw_resul
’:
./include/trace/events/fsi.h:95:12: warning: field width specifier ‘*’ expects argument of type ‘int’, but argument 9 has type ‘size_t {aka long unsigned int}’ [-Wformat=]
  TP_printk("fsi%d:%02d:%02d %08x[%zd] %s {%*ph} ret %d",
            ^
./include/trace/trace_events.h:343:22: note: in definition of macro ‘DECLARE_EVENT_CLASS’
  trace_seq_printf(s, print);     \
                      ^~~~~
./include/trace/trace_events.h:65:9: note: in expansion of macro ‘PARAMS’
         PARAMS(print));         \
         ^~~~~~
./include/trace/events/fsi.h:68:1: note: in expansion of macro ‘TRACE_EVENT’
 TRACE_EVENT(fsi_master_rw_result,
 ^~~~~~~~~~~
./include/trace/events/fsi.h:95:2: note: in expansion of macro ‘TP_printk’
  TP_printk("fsi%d:%02d:%02d %08x[%zd] %s {%*ph} ret %d",
  ^~~~~~~~~
In file included from ./include/trace/trace_events.h:377:0,
                 from ./include/trace/define_trace.h:95,
                 from ./include/trace/events/fsi.h:127,
                 from drivers/fsi/fsi-core.c:27:
./include/trace/events/fsi.h:95:44: note: format string is defined here
  TP_printk("fsi%d:%02d:%02d %08x[%zd] %s {%*ph} ret %d",
                                           ~^~
  CHK     include/generated/uapi/linux/version.h
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      vmlinux.o
  MODPOST vmlinux.o
  KSYM    .tmp_kallsyms1.o
  KSYM    .tmp_kallsyms2.o
  LD      vmlinux
  SORTEX  vmlinux
  SYSMAP  System.map
  CC      arch/x86/boot/version.o
  Building modules, stage 2.
  VOFFSET arch/x86/boot/compressed/../voffset.h
  OBJCOPY arch/x86/boot/compressed/vmlinux.bin
  RELOCS  arch/x86/boot/compressed/vmlinux.relocs
  CC      arch/x86/boot/compressed/kaslr.o
  GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
  CC      arch/x86/boot/compressed/misc.o
  MODPOST 476 modules
WARNING: modpost: missing MODULE_LICENSE() in drivers/fsi/fsi-core.o
see include/linux/module.h for more information
  MKPIGGY arch/x86/boot/compressed/piggy.S
  AS      arch/x86/boot/compressed/piggy.o
  DATAREL arch/x86/boot/compressed/vmlinux
  LD      arch/x86/boot/compressed/vmlinux
  ZOFFSET arch/x86/boot/zoffset.h
  OBJCOPY arch/x86/boot/vmlinux.bin
  AS      arch/x86/boot/header.o
  LD      arch/x86/boot/setup.elf
  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Setup is 17532 bytes (padded to 17920 bytes).
System is 5445 kB
CRC 56d8089d
Kernel: arch/x86/boot/bzImage is ready  (#387)
ERROR: "fsi_slave_claim_range" [drivers/fsi/fsi-master-hub.ko] undefined!
ERROR: "fsi_slave_read" [drivers/fsi/fsi-master-hub.ko] undefined!
ERROR: "fsi_slave_write" [drivers/fsi/fsi-master-hub.ko] undefined!
ERROR: "fsi_slave_release_range" [drivers/fsi/fsi-master-hub.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:91: __modpost] Error 1
make: *** [Makefile:1214: modules] Error 2


Note, I'm using gcc 7.1.1, which might be what is showing the build warnings,
but that doesn't explain the build errors.

So obviously, I can't take this as is :(

thanks,

greg k-h
