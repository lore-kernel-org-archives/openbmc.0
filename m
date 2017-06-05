Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whPms3SJBzDqGr
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 05:21:01 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v55JJ9Db039834
 for <openbmc@lists.ozlabs.org>; Mon, 5 Jun 2017 15:20:58 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2awb7bw410-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 15:20:58 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 5 Jun 2017 15:20:58 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 5 Jun 2017 15:20:53 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v55JKsME40894606; Mon, 5 Jun 2017 19:20:54 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96DC911204B;
 Mon,  5 Jun 2017 15:20:58 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.195.117])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 6296D112040;
 Mon,  5 Jun 2017 15:20:49 -0400 (EDT)
Subject: Re: [PATCH v7 00/23] FSI device driver implementation
To: Greg KH <gregkh@linuxfoundation.org>
References: <20170511210101.78409-1-cbostic@linux.vnet.ibm.com>
 <305bc7b6-30eb-a44d-28da-f90f9a973acf@linux.vnet.ibm.com>
 <20170603100510.GA24053@kroah.com>
Cc: rostedt@goodmis.org, mingo@redhat.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, joel@jms.id.au, andrew@aj.id.au,
 jk@ozlabs.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 alistair@popple.id.au, benh@kernel.crashing.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 5 Jun 2017 14:20:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170603100510.GA24053@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 17060519-0052-0000-0000-00000217ABB4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007178; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00870601; UDB=6.00432918; IPR=6.00650582; 
 BA=6.00005398; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015711; XFM=3.00000015;
 UTC=2017-06-05 19:20:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060519-0053-0000-0000-000050D8E188
Message-Id: <c8e01894-1842-9bdf-158b-3d336cb0b7a7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-05_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706050366
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
X-List-Received-Date: Mon, 05 Jun 2017 19:21:02 -0000



On 6/3/17 5:05 AM, Greg KH wrote:
> On Wed, May 31, 2017 at 12:17:05PM -0500, Christopher Bostic wrote:
>> Hi Greg,
>>
>> Are there any further changes you require for this patch set? This has been
>> extensively tested internally and all is working as expected.   Would it be
>> possible to move forward with integration in the near future?   Any input
>> would be appreciated.
> Sorry for the delay.  I just tried applying this to my tree, but got the
> following build warnings, and then errors:
>
> In file included from ./include/trace/define_trace.h:95:0,
>                   from ./include/trace/events/fsi.h:127,
>                   from drivers/fsi/fsi-core.c:27:
> ./include/trace/events/fsi.h: In function ‘trace_raw_output_fsi_master_write’:
> ./include/trace/events/fsi.h:58:12: warning: field width specifier ‘*’ expects argument of type ‘int’, but argument 8 has type ‘size_t {aka long unsigned int}’ [-Wformat=]
>    TP_printk("fsi%d:%02d:%02d %08x[%zd] <= {%*ph}",
>              ^
> ./include/trace/trace_events.h:343:22: note: in definition of macro ‘DECLARE_EVENT_CLASS’
>    trace_seq_printf(s, print);     \
>                        ^~~~~
> ./include/trace/trace_events.h:65:9: note: in expansion of macro ‘PARAMS’
>           PARAMS(print));         \
>           ^~~~~~
> ./include/trace/events/fsi.h:37:1: note: in expansion of macro ‘TRACE_EVENT’
>   TRACE_EVENT(fsi_master_write,
>   ^~~~~~~~~~~
> ./include/trace/events/fsi.h:58:2: note: in expansion of macro ‘TP_printk’
>    TP_printk("fsi%d:%02d:%02d %08x[%zd] <= {%*ph}",
>    ^~~~~~~~~
> In file included from ./include/trace/trace_events.h:377:0,
>                   from ./include/trace/define_trace.h:95,
>                   from ./include/trace/events/fsi.h:127,
>                   from drivers/fsi/fsi-core.c:27:
> ./include/trace/events/fsi.h:58:44: note: format string is defined here
>    TP_printk("fsi%d:%02d:%02d %08x[%zd] <= {%*ph}",
>                                             ~^~
> In file included from ./include/trace/define_trace.h:95:0,
>                   from ./include/trace/events/fsi.h:127,
>                   from drivers/fsi/fsi-core.c:27:
> ./include/trace/events/fsi.h: In function ‘trace_raw_output_fsi_master_rw_resul
> ’:
> ./include/trace/events/fsi.h:95:12: warning: field width specifier ‘*’ expects argument of type ‘int’, but argument 9 has type ‘size_t {aka long unsigned int}’ [-Wformat=]
>    TP_printk("fsi%d:%02d:%02d %08x[%zd] %s {%*ph} ret %d",
>              ^
> ./include/trace/trace_events.h:343:22: note: in definition of macro ‘DECLARE_EVENT_CLASS’
>    trace_seq_printf(s, print);     \
>                        ^~~~~
> ./include/trace/trace_events.h:65:9: note: in expansion of macro ‘PARAMS’
>           PARAMS(print));         \
>           ^~~~~~
> ./include/trace/events/fsi.h:68:1: note: in expansion of macro ‘TRACE_EVENT’
>   TRACE_EVENT(fsi_master_rw_result,
>   ^~~~~~~~~~~
> ./include/trace/events/fsi.h:95:2: note: in expansion of macro ‘TP_printk’
>    TP_printk("fsi%d:%02d:%02d %08x[%zd] %s {%*ph} ret %d",
>    ^~~~~~~~~
> In file included from ./include/trace/trace_events.h:377:0,
>                   from ./include/trace/define_trace.h:95,
>                   from ./include/trace/events/fsi.h:127,
>                   from drivers/fsi/fsi-core.c:27:
> ./include/trace/events/fsi.h:95:44: note: format string is defined here
>    TP_printk("fsi%d:%02d:%02d %08x[%zd] %s {%*ph} ret %d",
>                                             ~^~
>    CHK     include/generated/uapi/linux/version.h
>    GEN     .version
>    CHK     include/generated/compile.h
>    UPD     include/generated/compile.h
>    CC      init/version.o
>    LD      init/built-in.o
>    LD      vmlinux.o
>    MODPOST vmlinux.o
>    KSYM    .tmp_kallsyms1.o
>    KSYM    .tmp_kallsyms2.o
>    LD      vmlinux
>    SORTEX  vmlinux
>    SYSMAP  System.map
>    CC      arch/x86/boot/version.o
>    Building modules, stage 2.
>    VOFFSET arch/x86/boot/compressed/../voffset.h
>    OBJCOPY arch/x86/boot/compressed/vmlinux.bin
>    RELOCS  arch/x86/boot/compressed/vmlinux.relocs
>    CC      arch/x86/boot/compressed/kaslr.o
>    GZIP    arch/x86/boot/compressed/vmlinux.bin.gz
>    CC      arch/x86/boot/compressed/misc.o
>    MODPOST 476 modules
> WARNING: modpost: missing MODULE_LICENSE() in drivers/fsi/fsi-core.o
> see include/linux/module.h for more information
>    MKPIGGY arch/x86/boot/compressed/piggy.S
>    AS      arch/x86/boot/compressed/piggy.o
>    DATAREL arch/x86/boot/compressed/vmlinux
>    LD      arch/x86/boot/compressed/vmlinux
>    ZOFFSET arch/x86/boot/zoffset.h
>    OBJCOPY arch/x86/boot/vmlinux.bin
>    AS      arch/x86/boot/header.o
>    LD      arch/x86/boot/setup.elf
>    OBJCOPY arch/x86/boot/setup.bin
>    BUILD   arch/x86/boot/bzImage
> Setup is 17532 bytes (padded to 17920 bytes).
> System is 5445 kB
> CRC 56d8089d
> Kernel: arch/x86/boot/bzImage is ready  (#387)
> ERROR: "fsi_slave_claim_range" [drivers/fsi/fsi-master-hub.ko] undefined!
> ERROR: "fsi_slave_read" [drivers/fsi/fsi-master-hub.ko] undefined!
> ERROR: "fsi_slave_write" [drivers/fsi/fsi-master-hub.ko] undefined!
> ERROR: "fsi_slave_release_range" [drivers/fsi/fsi-master-hub.ko] undefined!
> make[1]: *** [scripts/Makefile.modpost:91: __modpost] Error 1
> make: *** [Makefile:1214: modules] Error 2
Hi Greg,

Was missing a few export symbols for module mode...  Sorry about that.
Will correct the trace warnings as well and get v8 sent out ASAP.

Thanks for the input.
Chris

>
> Note, I'm using gcc 7.1.1, which might be what is showing the build warnings,
> but that doesn't explain the build errors.
>
> So obviously, I can't take this as is :(
>
> thanks,
>
> greg k-h
>
