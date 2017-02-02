Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDx2g1CDszDqBX
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 10:26:18 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v12NJnwP076300
 for <openbmc@lists.ozlabs.org>; Thu, 2 Feb 2017 18:26:17 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28ccstty5w-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 18:26:17 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 2 Feb 2017 16:26:15 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Feb 2017 16:26:12 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 467A33E4003E;
 Thu,  2 Feb 2017 16:26:12 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v12NQCwb14680554; Thu, 2 Feb 2017 16:26:12 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2809B78038;
 Thu,  2 Feb 2017 16:26:12 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id AE3E478059;
 Thu,  2 Feb 2017 16:26:11 -0700 (MST)
From: eajames@linux.vnet.ibm.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, alistair@popple.id.au, benh@kernel.crashing.org,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v1 5/8] drivers: fsi: i2c: Add engine access wrappers
Date: Thu,  2 Feb 2017 17:25:58 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020223-0016-0000-0000-0000060E2DD0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006545; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816378; UDB=6.00398659; IPR=6.00593813; 
 BA=6.00005112; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014159; XFM=3.00000011;
 UTC=2017-02-02 23:26:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020223-0017-0000-0000-000037103AB6
Message-Id: <1486077964-11346-3-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-02_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702020219
X-Mailman-Approved-At: Fri, 03 Feb 2017 11:12:45 +1100
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
X-List-Received-Date: Thu, 02 Feb 2017 23:26:19 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/i2c/iic-fsi.c |  84 +++++++++++++
 drivers/fsi/i2c/iic-fsi.h |  87 +++++++++++++
 drivers/fsi/i2c/iic-int.h | 315 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 486 insertions(+)

diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
index 51a15a4..53be538 100644
--- a/drivers/fsi/i2c/iic-fsi.c
+++ b/drivers/fsi/i2c/iic-fsi.c
@@ -41,6 +41,90 @@ static const char iic_fsi_version[] = "3.0";
 int iic_fsi_probe(struct device *dev);
 int iic_fsi_remove(struct device *dev);
 
+int readb_wrap(iic_eng_t* eng, unsigned int addr, unsigned char *val, 
+	       iic_ffdc_t** ffdc)
+{
+	int rc;
+	struct fsi_device *fsi_dev = to_fsi_dev(eng->dev);
+	rc = fsi_device_read(fsi_dev, addr, val, 1);
+	if(rc)
+	{
+		IFLDe(3, "eng[%08x]: fsi_readb_ffdc(%p)=%d\n", eng->id,
+				addr, rc);
+	}
+	return rc;
+};
+
+int readh_wrap(iic_eng_t* eng, unsigned int addr, unsigned short *val, 
+	       iic_ffdc_t** ffdc)
+{
+	int rc;
+	struct fsi_device *fsi_dev = to_fsi_dev(eng->dev);
+	rc = fsi_device_read(fsi_dev, addr, val, 2);
+	if(rc)
+	{
+		IFLDe(3, "eng[%08x]: fsi_readh_ffdc(%p)=%d\n", eng->id,
+				addr, rc);
+	}
+	return rc;
+};
+
+int readw_wrap(iic_eng_t* eng, unsigned int addr, unsigned long *val, 
+	       iic_ffdc_t** ffdc)
+{
+	int rc;
+	struct fsi_device *fsi_dev = to_fsi_dev(eng->dev);
+	rc = fsi_device_read(fsi_dev, addr, val, 4);
+	if(rc)
+	{
+		IFLDe(3, "eng[%08x]: fsi_readw_ffdc(%p)=%d\n", eng->id,
+				addr, rc);
+	}
+	return rc;
+};
+
+int writeb_wrap(iic_eng_t* eng, unsigned int addr, unsigned char val, 
+		iic_ffdc_t** ffdc)
+{
+	int rc;
+	struct fsi_device *fsi_dev = to_fsi_dev(eng->dev);
+	rc = fsi_device_write(fsi_dev, addr, &val, 1);
+	if(rc)
+	{
+		IFLDe(3, "eng[%08x]: fsi_writeb_ffdc(%p)=%d\n", eng->id,
+				addr, rc);
+	}
+	return rc;
+};
+
+int writeh_wrap(iic_eng_t* eng, unsigned int addr, unsigned short val,
+	       	iic_ffdc_t** ffdc)
+{
+	int rc;
+	struct fsi_device *fsi_dev = to_fsi_dev(eng->dev);
+	rc = fsi_device_write(fsi_dev, addr, &val, 2);
+	if(rc)
+	{
+		IFLDe(3, "eng[%08x]: fsi_writeh_ffdc(%p)=%d\n", eng->id,
+				addr, rc);
+	}
+	return rc;
+};
+
+int writew_wrap(iic_eng_t* eng, unsigned int addr, unsigned long val, 
+		iic_ffdc_t** ffdc)
+{
+	int rc;
+	struct fsi_device *fsi_dev = to_fsi_dev(eng->dev);
+	rc = fsi_device_write(fsi_dev, addr, &val, 4);
+	if(rc)
+	{
+		IFLDe(3, "eng[%08x]: fsi_writew_ffdc(%p)=%d\n", eng->id,
+				addr, rc);
+	}
+	return rc;
+};
+
 struct iic_reg_access fsi_reg_access =
 {
 	.bus_readb = readb_wrap,
diff --git a/drivers/fsi/i2c/iic-fsi.h b/drivers/fsi/i2c/iic-fsi.h
index 4decb2c..792803a 100644
--- a/drivers/fsi/i2c/iic-fsi.h
+++ b/drivers/fsi/i2c/iic-fsi.h
@@ -19,6 +19,31 @@
 #ifndef IIC_FSI_H
 #define IIC_FSI_H
 
+#define IIC_BUS_BITS 6
+#define IIC_ENG_BITS 5
+#define IIC_CFAM_BITS 2
+#define IIC_LINK_BITS 6
+#define IIC_PCFAM_BITS 2
+#define IIC_PLINK_BITS 6
+#define IIC_MAX_BUS (1U << IIC_BUS_BITS)
+#define IIC_MAX_ENG (1U << IIC_ENG_BITS)
+#define IIC_MAX_CFAM (1U << IIC_CFAM_BITS)
+#define IIC_MAX_LINK (1U << IIC_LINK_BITS)
+#define IIC_MAX_PCFAM (1U << IIC_PCFAM_BITS)
+#define IIC_MAX_PLINK (1U << IIC_PLINK_BITS)
+#define IIC_BUS_MASK ((1U << IIC_BUS_BITS) - 1U)
+#define IIC_ENG_MASK (((1U << IIC_ENG_BITS) - 1U) << IIC_BUS_BITS)
+#define IIC_CFAM_MASK (((1U << IIC_CFAM_BITS) - 1U) << \
+			(IIC_BUS_BITS + IIC_ENG_BITS))
+#define IIC_LINK_MASK (((1U << IIC_LINK_BITS) - 1U) << \
+			(IIC_BUS_BITS + IIC_ENG_BITS + IIC_CFAM_BITS))
+#define IIC_PCFAM_MASK (((1U << IIC_PCFAM_BITS) - 1U) << \
+			(IIC_BUS_BITS + IIC_ENG_BITS + \
+			IIC_CFAM_BITS + IIC_LINK_BITS))
+#define IIC_PLINK_MASK (((1U << IIC_PLINK_BITS) - 1U) << \
+			(IIC_BUS_BITS + IIC_ENG_BITS + IIC_CFAM_BITS + \
+			 IIC_LINK_BITS + IIC_PCFAM_BITS))
+
 /*
  * we don't know ahead of time how many minors will be needed as this is based 
  * on platform type and the possibility of sparsely populated FRU's on special 
@@ -26,4 +51,66 @@
  */
 #define IIC_FSI_MAX_DEVS	1024
 
+#define IIC_SET_BUS(id, bus)  \
+( \
+ (id & ~IIC_BUS_MASK) | ((unsigned long)bus & IIC_BUS_MASK) \
+)
+
+#define IIC_SET_ENG(id, eng)  \
+( \
+ (id & ~IIC_ENG_MASK) | \
+ (((unsigned long)eng << IIC_BUS_BITS) & IIC_ENG_MASK) \
+)
+
+#define IIC_SET_CFAM(id, cfam)  \
+( \
+ (id & ~IIC_CFAM_MASK) | \
+ (((unsigned long)cfam << (IIC_BUS_BITS + IIC_ENG_BITS)) & IIC_CFAM_MASK) \
+)
+
+#define IIC_SET_LINK(id, link)  \
+( \
+ (id & ~IIC_LINK_MASK) | \
+ (((unsigned long)link << (IIC_BUS_BITS + IIC_ENG_BITS + IIC_CFAM_BITS)) & \
+  IIC_LINK_MASK) \
+)
+
+#define IIC_SET_PCFAM(id, pcfam) \
+( \
+ (id & ~IIC_PCFAM_MASK) | \
+ (((unsigned long)pcfam << \
+ (IIC_BUS_BITS + IIC_ENG_BITS + IIC_CFAM_BITS + IIC_LINK_BITS)) & \
+ IIC_PCFAM_MASK) \
+)
+
+#define IIC_SET_PLINK(id, plink) \
+( \
+ (id & ~IIC_PLINK_MASK) | \
+ (((unsigned long)plink << \
+ (IIC_BUS_BITS + IIC_ENG_BITS + IIC_CFAM_BITS + IIC_LINK_BITS + IIC_PCFAM_BITS)) & \
+ IIC_PLINK_MASK) \
+)
+
+#define IIC_MK_ENG_ID(plink, pcfam, link, cfam, eng) \
+(\
+	IIC_SET_BUS(IIC_SET_ENG(IIC_SET_CFAM(IIC_SET_LINK( \
+			      IIC_SET_PCFAM(IIC_SET_PLINK(0U, plink), \
+							  pcfam), \
+							  link), \
+							  cfam), \
+			                                  eng), \
+		                                          0U) \
+)
+
+#define IIC_GET_BUS(id) (id & IIC_BUS_MASK)
+#define IIC_GET_ENG(id) ((id & IIC_ENG_MASK) >> IIC_BUS_BITS)
+#define IIC_GET_CFAM(id) ((id & IIC_CFAM_MASK) >> (IIC_BUS_BITS + IIC_ENG_BITS))
+#define IIC_GET_LINK(id) \
+((id & IIC_LINK_MASK) >> (IIC_BUS_BITS + IIC_ENG_BITS + IIC_CFAM_BITS))
+#define IIC_GET_PCFAM(id) \
+((id & IIC_PCFAM_MASK) >> (IIC_BUS_BITS + IIC_ENG_BITS + \
+	                   IIC_CFAM_BITS + IIC_LINK_BITS))
+#define IIC_GET_PLINK(id) \
+((id & IIC_PLINK_MASK) >> (IIC_BUS_BITS + IIC_ENG_BITS + \
+			   IIC_CFAM_BITS + IIC_LINK_BITS + IIC_PCFAM_BITS))
 #endif
diff --git a/drivers/fsi/i2c/iic-int.h b/drivers/fsi/i2c/iic-int.h
index 545b2c3..b29ece6 100644
--- a/drivers/fsi/i2c/iic-int.h
+++ b/drivers/fsi/i2c/iic-int.h
@@ -67,6 +67,102 @@
 #define IFLDl(num, msg, args...)
 #endif
 
+#define IIC_RESET_DELAY ( msecs_to_jiffies(100) ) /* 100ms in jiffies */
+
+struct iic_client;
+struct iic_bus;
+struct iic_eng;
+struct iic_xfr;
+struct iic_eng_ops;
+struct iic_reg_access;
+struct iic_lck;
+struct iic_lck_mgr;
+struct iic_slv;
+struct iicslv_client;
+struct iicslv_xfr;
+struct iic_ffdc {};
+struct iic_slv_ffdc;
+struct iic_mstr_ffdc;
+struct iic_eng_ffdc;
+struct dd_ffdc {}; //dummy to compile
+
+typedef struct iic_client iic_client_t;
+typedef struct iic_bus iic_bus_t;
+typedef struct iic_eng iic_eng_t;
+typedef struct iic_eng_ops iic_eng_ops_t;
+typedef struct iic_xfr iic_xfr_t;
+typedef struct iic_reg_access iic_reg_access_t;
+typedef struct iic_lck iic_lck_t;
+typedef struct iic_lck_mgr iic_lck_mgr_t;
+typedef struct iic_slv iicslv_t;
+typedef struct iicslv_client iicslv_client_t;
+typedef struct iicslv_xfr iicslv_xfr_t;
+typedef struct iic_ffdc iic_ffdc_t;
+typedef struct iic_slv_ffdc iic_slv_ffdc_t;
+typedef struct iic_mstr_ffdc iic_mstr_ffdc_t;
+typedef struct iic_eng_ffdc iic_eng_ffdc_t;
+typedef struct iic_trace_entry iic_trace_entry_t;
+typedef struct iicslv_zbuf_data iicslv_zbuf_data_t;
+typedef struct dd_ffdc dd_ffdc_t;
+
+struct iic_lck
+{
+	short addr;			//bus & address
+	unsigned short mask;            //bus & address mask
+	iic_client_t *client;		//requesting/owning client
+	iic_xfr_t *cur_xfr;		//transfer currently using this lock
+	unsigned long count;            //lock count
+	struct list_head list;          //node on locked or reqs list (below)
+};
+
+struct iic_lck_mgr
+{
+	struct list_head locked;        //list of granted locks
+	struct list_head reqs;          //list of yet-to-be granted locks
+};
+
+struct iic_xfr
+{
+    iic_client_t* client;
+    iic_lck_t* addr_lck;		// lock handle for this xfr
+    struct timer_list delay;		// pops when a write delay ends
+    struct list_head q_entry;		// entry on engine q
+    struct kiocb *iocb;
+    char* buf;				// Kernel space buffer
+    unsigned long num_pages;
+    unsigned long size;			// size of the transfer
+    unsigned long bytes_xfrd;		// bytes transfered so far
+    int status;				// return status of this transfer
+    unsigned long flags;		// miscellaneous transfer flags
+    iic_opts_t opts;			// client defined attributes
+    struct timer_list timeout;		// for xfr timeouts
+    unsigned short retry_count;		// # of attempted retries
+    iic_ffdc_t* ffdc;			// chain of ffdc
+    pid_t pid;
+    unsigned long offset_ffdc;		// 1st 4 bytes of write data
+};
+
+/* transfer flags definitions */
+enum {
+	IIC_XFR_RD,		// 1 = READ, 0 = WRITE
+	IIC_XFR_ASYNC,		// transfer is asynchronous
+	IIC_XFR_FAST,           // use 400khz for this transfer
+	IIC_XFR_CANCELLED,	// transfer has been cancelled
+	IIC_XFR_ABORT,		// transfer needs to be aborted
+	IIC_XFR_RECOVERY,	// transfer is stuck, recovery in progress
+	IIC_XFR_STARTED,	// transfer has been started at least once
+	IIC_XFR_DELAYED,	// delay next transfer to xfr address
+	IIC_XFR_ENDED,		// all processing  for xfr has completed 
+	IIC_XFR_ENG_COMPLETED,	// xfr completed on the engine
+	IIC_XFR_DMA,		// DMA will be used for this transfer
+	IIC_XFR_DMA_SUBMITTED,	// DMA xfr has been submitted
+	IIC_XFR_DMA_COMPLETED,	// DMA xfr has been completed 
+	IIC_XFR_OFFSET_PHASE,	// xfr is in offset phase
+	IIC_XFR_QUEUED,		// xfr has been queued at least once
+	IIC_XFR_SPECIAL_PHASE,  // xfr is in special phase (for pll/crc chips)
+	IIC_XFR_RETRY_IN_PROGRESS, // retry is in progress, (don't complete xfr)
+};
+
 struct iic_reg_access
 {
     int (*bus_readb)(iic_eng_t*, unsigned int, unsigned char*, iic_ffdc_t**);
@@ -77,4 +173,223 @@ struct iic_reg_access
     int (*bus_writew)(iic_eng_t*, unsigned int, unsigned long, iic_ffdc_t**);
 };
 
+struct iic_eng_ops
+{
+    int (*use_dma)(iic_xfr_t*);
+    int (*start)(iic_xfr_t*);
+    int (*start_abort)(iic_eng_t*, iic_ffdc_t**);
+    int (*finish_abort)(iic_eng_t*, iic_ffdc_t**);
+    int (*start_rescue_timeout)(iic_eng_t*, iic_xfr_t*);
+    int (*finish_rescue_timeout)(iic_eng_t*, iic_xfr_t*);
+    int (*reset_bus)(iic_bus_t*, iic_ffdc_t**);
+    int (*reset_eng)(iic_eng_t*, iic_ffdc_t**);
+    int (*run_bat)(iic_eng_t*, iic_ffdc_t**);
+    int (*init)(iic_eng_t*, iic_ffdc_t**);
+    int (*enable_int)(iic_eng_t*, iic_ffdc_t**);
+    int (*disable_int)(iic_eng_t*, iic_ffdc_t**);
+    int (*int_handler)(int, void*);
+    int (*cleanup_eng)(iic_eng_t*);
+    int (*wait_for_idle)(iic_eng_t*, int, iic_ffdc_t**);
+    int (*slv_on)(iic_eng_t*, iic_ffdc_t**);
+    int (*slv_off)(iic_eng_t*, iic_ffdc_t**);
+    int (*slv_recv)(iic_eng_t*, char*, int*, iic_ffdc_t**);
+    int (*slv_cont)(iic_eng_t*, iic_ffdc_t**);
+    int (*slv_set_addr)(iic_eng_t*, unsigned long, iic_ffdc_t**);
+    int (*slv_get_addr)(iic_eng_t*, unsigned long*, iic_ffdc_t**);
+    void (*display_regs)(iic_eng_t*, iic_ffdc_t**);
+    int (*get_bus_state)(iic_bus_t*, unsigned long*, iic_ffdc_t**);
+    void (*get_ffdc)(iic_eng_t* eng, iic_ffdc_t* element);
+    int (*set_speed)(iic_bus_t* bus, int speed);
+    int (*get_speed)(iic_bus_t* bus);
+    int (*send)(iic_eng_t*, iic_ffdc_t**);
+};
+
+/*engine flags definitions */
+enum
+{
+	IIC_ENG_ABORT,
+	IIC_ENG_RESET,
+	IIC_ENG_BLOCK,			
+	IIC_ENG_THROTTLED, 
+	IIC_ENG_NEW_SEND_DATA,
+	IIC_ENG_INIT_FAILED,		//engine initialization failed 
+	IIC_ENG_CLEANUP_FAILED,		//cleanup of previous xfr failed
+	IIC_NO_ACCESS,
+	IIC_ENG_RESUMED, 		// off = suspended
+	IIC_ENG_REMOVED,
+	IIC_ENG_Z7PLUS,
+	IIC_ENG_P8_Z8_CENTAUR,
+	IIC_ENG_OPB,			// which parent bus we're on: opb/!fsi
+};
+
+struct iic_eng
+{
+    unsigned int id;			//unique id for this engine
+    iic_reg_access_t* ra;		//bus specific reg access methods
+    unsigned long base;			//ioremapped base address of registers
+    int irq;
+    struct device* dev;			//ldm structure from bus driver
+    iic_eng_ops_t* ops;			//engine specific operations
+    spinlock_t lock;
+    struct list_head xfrq;		//queue for xfrs waiting to run
+    iic_xfr_t* cur_xfr;			//The currently running xfr
+    iic_bus_t* busses;			//all busses attached to this engine
+    iic_bus_t* cur_bus;
+    struct iic_lck_mgr lck_mgr;		//address lock management
+    struct work_struct work;		//for freeing the bus
+    unsigned long flags;		//misc engine flags
+    wait_queue_head_t waitq;		//wait for engine events to occur
+    struct semaphore sem;
+    iicslv_t* slv;			//pointer to a slave object
+    unsigned long type;			//currently not used
+    void* private_data;			//currently not used
+    unsigned long bus_speed;		//parent bus speed in MHz
+    unsigned long fifo_size;		//size of the engine fifo
+    iic_ffdc_t* ffdc;			//ffdc data not associated with
+    					//a process or bus(i.e., init errors)
+    struct kobject kobj;		//for reference counting
+    unsigned long trace_sz;		//number of trace entries
+    atomic_t xfr_num;			//index to current trace entry
+    uint64_t enabled;
+};
+
+struct iic_bus
+{
+    unsigned char port;			//the port number of this bus
+    unsigned long bus_id;		//Unique ID for this bus
+    struct cdev cdev;
+    struct device* class_dev;
+    dev_t devnum;
+    iic_eng_t* eng;			//the engine this bus is connected to
+    iic_bus_t* next;			//the next bus connected to this engine
+    long i2c_hz;			//the i2c clock speed for this bus.
+};
+
+struct iic_client
+{
+    iic_bus_t* bus;
+    wait_queue_head_t wait;		//wait for locks and sync xfrs
+    iic_opts_t opts;
+    struct semaphore sem;
+    pid_t tgid;
+    char proc_name[16];
+    unsigned long flags;
+#define IIC_CLIENT_SOURCE_USER	(1 << 0)
+#define IIC_CLIENT_SOURCE_KERN  (1 << 1)
+#define IIC_CLIENT_EOD          (1 << 2)		/* End Of Data */
+};
+
+//--------------------------------------------------------------------
+// Specific header for repeated I/O
+//--------------------------------------------------------------------
+/*
+ * I2C Message - used for i2c transaction
+ */
+struct i2c_msg {
+        unsigned short addr;     /* slave address                        */
+        unsigned short flags;
+#define I2C_M_TEN       0x10    /* we have a ten bit chip address       */
+#define I2C_M_RD        0x01
+#define I2C_M_NOSTART   0x4000
+#define I2C_M_REV_DIR_ADDR      0x2000
+#define I2C_M_IGNORE_NAK        0x1000
+#define I2C_M_NO_RD_ACK         0x0800
+        unsigned short len;              /* msg length                           */
+        unsigned char *buf;              /* pointer to msg data                  */
+};
+/* This is the structure as used in the I2C_RDWR ioctl call */
+struct i2c_rdwr_ioctl_data {
+        struct i2c_msg  *msgs;    /* pointers to i2c_msgs */
+        unsigned int nmsgs;                    /* number of i2c_msgs */
+};
+
+int iic_register_eng_ops(iic_eng_ops_t* new_ops, unsigned long type);
+int iic_unregister_eng_ops(unsigned long type);
+iic_eng_ops_t* iic_get_eng_ops(unsigned long type);
+int iic_eng_ops_is_vaild(struct iic_eng_ops *ops);
+iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
+		                           dev_t devnum, char* name, 
+					   unsigned char port,
+					   unsigned long bus_id);
+void iic_delete_bus(struct class* classp, iic_bus_t* bus);
+void iic_register_bus(iic_bus_t * bus, unsigned long type);
+void iic_unregister_bus(iic_bus_t * bus, unsigned long type);
+void iic_init_eng(iic_eng_t* eng);
+int iic_reset(iic_bus_t* bus, int timeout, iic_ffdc_t** ffdc);  /* timeout is in milliseconds! */
+
+/* Engine specific code must call this function when a transfer completes
+ * and the engine is ready to start a new transfer
+ */
+void iic_xfr_complete(iic_xfr_t* xfr);
+
+void iic_delay_xfr(iic_xfr_t* xfr, unsigned long delay);
+void iic_abort_xfr(iic_xfr_t* xfr);
+int iic_abort_all(iic_eng_t* eng, iic_client_t* client, int status);
+int iic_start_next_xfr(iic_eng_t* eng);
+
+/* Name says it all!
+ */
+void iic_lck_mgr_init(iic_lck_mgr_t* mgr);
+
+/* Block waiting for an address lock to be granted until the timeout is
+ * reached.
+ *
+ * Return Values:
+ * SUCCESS: The requester owns the lock and the lock count is incremented.
+ * EINTR:   The request was interrupted.
+ * ETIME:   The request timed out, in jiffies.
+ */
+int iic_wait_lock(iic_lck_mgr_t *lm, short addr, short mask,
+		iic_client_t *client, unsigned long to);
+
+/* Try locking an address.  Never block.  If the address is already locked
+ * by another client, queue this request.  After a request is queued,
+ * handle->count can be checked to determine when the lock has been granted.
+ * If handle->count > 0, the lock has been granted.
+ *
+ * Return Values:
+ * SUCCESS: The requester owns the lock and the lock count is incremented.
+ * QUEUED:  The requester doesn't own the lock, but a lock request has been
+ *          queued.
+ */
+#define IIC_REQ_QUEUED 1
+int iic_req_lock(iic_lck_mgr_t *lm, short addr, unsigned short mask,
+		iic_client_t *client, iic_lck_t **handle);
+
+iic_lck_t* iic_find_handle(iic_lck_mgr_t *lm, iic_client_t *client, 
+		           short addr, short mask);
+
+/* Unlock the specified address lock.  If others are waiting for a lock, grant
+ * the next person in line.
+ */
+int iic_unlock(iic_lck_mgr_t *lm, iic_lck_t *lck);
+
+/* Unlock all locks associated with the specified client.
+ */
+int iic_unlock_all(iic_lck_mgr_t *lm, iic_client_t *client);
+
+
+#define iic_addr_is_locked(lck, xfr)\
+        (lck->count > 0 && (lck->cur_xfr == 0 || lck->cur_xfr == xfr))
+#define cdev_to_iic_bus(cdevp) container_of(cdevp, iic_bus_t, cdev)
+
+/*
+ * Exported for drivers needing 'sideways' kernel call access to IIC
+ * Currently only supports local OPB type IIC masters
+ */
+#define IIC_RESET_BUS   0
+#define IIC_RESET_ENG   1
+
+int iic_sideways_open(iic_client_t ** client, iic_bus_t * bus, int bus_num);
+int iic_sideways_read(iic_client_t * client, void * buf, size_t count,
+		    loff_t * offset, dd_ffdc_t ** ffdc);
+int iic_sideways_write(iic_client_t * client, void * buf, size_t count,
+		     loff_t * offset, dd_ffdc_t ** ffdc);
+int iic_sideways_release(iic_client_t * client);
+
+#define IIC_LOCK_ALL	0x7FF
+int iic_sideways_lock_bus(iic_client_t * client, unsigned short mask,
+			  unsigned short addr, unsigned long timeout);
+int iic_sideways_unlock_bus(iic_client_t * client, unsigned short addr,
+			    unsigned short mask);
 #endif
-- 
1.8.3.1
