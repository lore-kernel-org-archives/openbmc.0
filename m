Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdHGX1wVkzDqBJ
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 03:17:24 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4VHDrfI100790
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 13:17:14 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2at0xpu81t-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 13:17:14 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 31 May 2017 13:17:13 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 31 May 2017 13:17:08 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4VHH87B11534838; Wed, 31 May 2017 17:17:08 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CECEF112040;
 Wed, 31 May 2017 13:17:11 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 1D4A4112034;
 Wed, 31 May 2017 13:17:10 -0400 (EDT)
Subject: Re: [PATCH v7 00/23] FSI device driver implementation
To: Greg KH <gregkh@linuxfoundation.org>, rostedt@goodmis.org,
 mingo@redhat.com, gregkh@linuxfoundation.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20170511210101.78409-1-cbostic@linux.vnet.ibm.com>
Cc: joel@jms.id.au, andrew@aj.id.au, jk@ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk,
 rostedt@goodmis.org, mingo@redhat.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, joel@jms.id.au,
 linux-kernel@vger.kernel.org, andrew@aj.id.au, alistair@popple.id.au,
 benh@kernel.crashing.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 31 May 2017 12:17:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170511210101.78409-1-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17053117-2213-0000-0000-000001CAFB23
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007149; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00868286; UDB=6.00431490; IPR=6.00648165; 
 BA=6.00005388; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015657; XFM=3.00000015;
 UTC=2017-05-31 17:17:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17053117-2214-0000-0000-000056520D0B
Message-Id: <305bc7b6-30eb-a44d-28da-f90f9a973acf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-31_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705310311
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
X-List-Received-Date: Wed, 31 May 2017 17:17:24 -0000

Hi Greg,

Are there any further changes you require for this patch set? This has 
been extensively tested internally and all is working as expected.   
Would it be possible to move forward with integration in the near 
future?   Any input would be appreciated.

Thanks,
Chris


On 5/11/17 4:00 PM, Christopher Bostic wrote:
> Implementation of the IBM 'Flexible Support Interface' (FSI) bus device
> driver. FSI is a high fan out serial bus consisting of a clock and a serial
> data line capable of running at speeds up to 166 MHz.
>
> This set provides the basic framework to add FSI extensions to the
> Linux bus and device models. Master specific implementations are
> defined to utilize the core FSI function.
>
> In Linux, we have a core FSI "bus type", along with drivers for FSI
> masters and engines.
>
> The FSI master drivers expose a read/write interface to the bus address
> space. The master drivers are under drivers/fsi/fsi-master-*.c.
>
> The core handles probing and discovery of slaves and slave
> engines, using those read/write interfaces. It is responsible for
> creating the endpoint Linux devices corresponding to the discovered
> engines on each slave.
>
> Slave engines are identified by an 'engine' type, and an optional
> version. Engine, a.k.a. client, drivers are matched and bound to these
> engines during discovery.
>
> This patch set does not include extended FSI function such as:
>      *  Cascaded master support
>      *  Application layer hot plug notification
>      *  Application layer FSI bus status interface
>
> Common FSI terminology:
>
> * Master
>      Controller of the FSI bus.  Only the master is allowed to control the
>      clock line and is the initiator of all transactions on a bus.
>
> * Slave
>      The receiver or target of a master initiated transaction.  The slave
>      cannot initiate communications on a bus and must respond to any
>      master requests for data.
>
> * CFAM
>      Stands for Common Field replaceable unit Access Macro.  A CFAM is an
>      ASIC residing in any device requiring FSI communications. CFAMs
>      consist of an array of hardware 'engines' used for various purposes.
>      I2C masters, UARTs, General Purpose IO hardware are common types of
>      these engines.
>
> * Configuration Space / Table
>      A table contained at the beginning of each CFAM address space.
>      This table lists information such as the CFAM's ID, which engine types
>      and versions it has available, as well as its addressing range.
>
> * FSI Engine driver
>      A device driver that registers with the FSI core so that it can access
>      devices it owns on an FSI bus.
>
> * Hub
>      An FSI master that connects to an upstream 'primary' master allowing
>      high fanout of target devices.
>
> ----
> Changes in v7:
>     - Use GENMASK for bitmask definitions
>     - Move instances of dev_info to dev_dbg
>     - Add missing return code checks
>     - Add API details for fsi_device_read/write/peek()
>     - GPIO master: Unscan when unregistering master
>     - Document ABI sysfs files raw, term, break, rescan
>     - GPIO master: move global spinlock into struct fsi_master_gpio
>     - GPIO master: remove redundant checks for valid pin descriptors
>
> Changes in v6:
>     - Remove redundant 'depends on' specifiers in Kconfig for SCOM
>       GPIO master and Hub masters.
>
> Changes in v5:
>     - Remove explicit kfree of struct fsi_master in fsi_master_gpio.
>     - Remove Palmetto and Romulus dts device tree file udates for FSI gpio
>       master
>
> Changes in v4:
>     - endianness: the _read() and _write() APIs are now all *bus endian*,
>       so will be the same on all platforms (the previous fsi patches
>       exposed as (BMC/FSP) CPU endian, which is variable).
>     - device tree: Remove the "ibm," prefix for the fsi core and GPIO
>       master compatibility strings, as they're not describing
>       IBM-specific
>     - device model: Create separate struct devices for each FSI
>       master, which fits better with the Linux device model, and allows
>       addition of sysfs attributes that are implemented by the fsi core
>     - sysfs: there are now sysfs facilities for break and term. Raw
>       file supports reads and writes of arbitrary sizes.
>     - GPIO master: split the xfer() logic out a little, so that the
>       response handling & DPOLL retry mechanism is more obvious
>     - GPIO master: simplifications for message construction
>     - GPIO master: fixes for some CRC calculations
>     - GPIO master: issue TERM in response to DPOLL busy-loops
>     - Error handling: rather than handle errors on (potentially) an entire
>       cascaded read or write, the error handling is now down on a per-slave
>       basis, where we try to reestablish communication in a more "gradual"
>       manner, rather than sending a break immediately. May need to add a
>       hook to percolate error recovery up to a slave's master but no need
>       seen for that at present.
>     - Hub master: this is now implemented as a fsi engine driver, as the
>       fsi_slave_{read,write}() functions are exported (and the port count
>       is available in the hMFSI configuration register)
>       This means we need fewer special-cases in the fsi core.
>     - Tracepoints: Add tracepoints for FSI core read & write, and another
>       set for low-level GPIO in/out operations.
>
> Changes in v3:
>      - Patch set contained an invalid 18/18 test patch not
>        meant for community review, corrected.
>
> Changes in v2:
>     - Change from atomic global for master number to ida simple
>        interface.
>      - Add valid pointer checks on register and unregister utils.
>      - Move CRC calculation utilities out of driver to lib path.
>      - Clean up white space issues.
>      - Remove added list management of master devices and use
>        instead the device_for_each_child method available in the
>        bus.
>      - Add new patch to document FSI bus functionality.
>      - Add new patch documenting FSI gpio master.
>      - Rearrage patch set to have documentation earlier than code
>        implementing it.
>      - Document all compatible strings used in device tree bindings.
>      - Elaborate documentation definition of FSI GPIO master.
>      - Describe in more detail what each GPIO FSI master pin is for.
>      - Re-order compatible strings in example binding so that most
>        specific device comes first.
>      - Indicate proper activation order of all FSI GPIO master pins.
>      - Fix an unmatched '>' bracket in the example for binding.
>      - Bracket each element of the example bindings individually.
>      - Add new patch documenting sysfs-bus-fsi attributes.
>      - Merge FSI GPIO master init into probe function.
>      - Set pin initial values at time of pin request.
>      - Assign value of master->master.dev at probe time.
>      - Use get_optional interface for all optional GPIO pins.
>
> Christopher Bostic (9):
>    drivers/fsi: Document FSI master sysfs files in ABI
>    drivers/fsi: Set up links for slave communication
>    drivers/fsi: Set slave SMODE to init communication
>    drivers/fsi: Add master unscan
>    drivers/fsi: Add documentation for GPIO bindings
>    drivers/fsi: Add client driver register utilities
>    drivers/fsi: Add GPIO based FSI master
>    drivers/fsi: Add SCOM FSI client device driver
>    drivers/fsi: Add hub master support
>
> Jeremy Kerr (14):
>    drivers/fsi: Add fsi master definition
>    drivers/fsi: Add slave definition
>    drivers/fsi: Add empty master scan
>    lib: Add crc4 module
>    drivers/fsi: Add slave & master read/write APIs
>    drivers/fsi: Implement slave initialisation
>    drivers/fsi: scan slaves & register devices
>    drivers/fsi: Add device read/write/peek API
>    drivers/fsi: Add sysfs files for FSI master & slave accesses
>    drivers/fsi: expose direct-access slave API
>    drivers/fsi: Add tracepoints for low-level operations
>    drivers/fsi: Add error handling for slave
>    drivers/fsi/gpio: Add tracepoints for GPIO master
>    drivers/fsi: Use asynchronous slave mode
>
>   Documentation/ABI/testing/sysfs-bus-fsi            |  38 +
>   .../devicetree/bindings/fsi/fsi-master-gpio.txt    |  24 +
>   drivers/fsi/Kconfig                                |  26 +
>   drivers/fsi/Makefile                               |   3 +
>   drivers/fsi/fsi-core.c                             | 836 +++++++++++++++++++++
>   drivers/fsi/fsi-master-gpio.c                      | 604 +++++++++++++++
>   drivers/fsi/fsi-master-hub.c                       | 327 ++++++++
>   drivers/fsi/fsi-master.h                           |  43 ++
>   drivers/fsi/fsi-scom.c                             | 263 +++++++
>   include/linux/crc4.h                               |   8 +
>   include/linux/fsi.h                                |  35 +-
>   include/trace/events/fsi.h                         | 127 ++++
>   include/trace/events/fsi_master_gpio.h             |  68 ++
>   lib/Kconfig                                        |   8 +
>   lib/Makefile                                       |   1 +
>   lib/crc4.c                                         |  46 ++
>   16 files changed, 2456 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-fsi
>   create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
>   create mode 100644 drivers/fsi/fsi-master-gpio.c
>   create mode 100644 drivers/fsi/fsi-master-hub.c
>   create mode 100644 drivers/fsi/fsi-master.h
>   create mode 100644 drivers/fsi/fsi-scom.c
>   create mode 100644 include/linux/crc4.h
>   create mode 100644 include/trace/events/fsi.h
>   create mode 100644 include/trace/events/fsi_master_gpio.h
>   create mode 100644 lib/crc4.c
>
