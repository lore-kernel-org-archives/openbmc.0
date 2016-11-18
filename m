Return-Path: <clg@kaod.org>
X-Greylist: delayed 649 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Nov 2016 01:36:06 AEDT
Received: from 5.mo7.mail-out.ovh.net (5.mo7.mail-out.ovh.net [178.32.120.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0sy24NmzDrBx
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:36:05 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 0A7FE203D3
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:44 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 306C548009C;
 Fri, 18 Nov 2016 15:26:40 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 34/38] net: add FTGMAC100 support
Date: Fri, 18 Nov 2016 15:22:14 +0100
Message-Id: <1479478938-13267-35-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1127025810560944898
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrudekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 18 Nov 2016 14:36:06 -0000

The FTGMAC100 device is configured and controlled via a set of
registers available on AHB bus. Packets are transmitted and received
using DMA ring buffers.

The model is for the moment complete enough to satisfy U-Boot and the
Linux kernel but there are areas that need some more attention :

 - PHY support, this is a copy paste from the Coldfire model
 - Automatic receive/transmit polling, no timers are used to poll the
   ring buffers descriptors. We just expect the qemu nic backend to
   push packets when they arrive.
 - CRC

And some are still on the TODO list (not used today in the drivers) :

 - Ethernet Address Filtering
 - Multicast
 - High priority queues
 - VLAN
 - NCSI, may be we could add n/w filters
 - etc.

The code is based on the Coldfire Fast Ethernet Controller emulation.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/net/Makefile.objs            |   1 +
 hw/net/ftgmac100.c              | 900 ++++++++++++++++++++++++++++++++++++++++
 include/hw/net/ftgmac100.h      |  62 +++
 4 files changed, 964 insertions(+)
 create mode 100644 hw/net/ftgmac100.c
 create mode 100644 include/hw/net/ftgmac100.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index e3ac9e0ec104..81def25bfd54 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -29,6 +29,7 @@ CONFIG_LAN9118=y
 CONFIG_SMC91C111=y
 CONFIG_ALLWINNER_EMAC=y
 CONFIG_IMX_FEC=y
+CONFIG_FTGMAC100=y
 CONFIG_DS1338=y
 CONFIG_PFLASH_CFI01=y
 CONFIG_PFLASH_CFI02=y
diff --git a/hw/net/Makefile.objs b/hw/net/Makefile.objs
index 610ed3e7ae64..7ca51d85a672 100644
--- a/hw/net/Makefile.objs
+++ b/hw/net/Makefile.objs
@@ -26,6 +26,7 @@ common-obj-$(CONFIG_IMX_FEC) += imx_fec.o
 common-obj-$(CONFIG_CADENCE) += cadence_gem.o
 common-obj-$(CONFIG_STELLARIS_ENET) += stellaris_enet.o
 common-obj-$(CONFIG_LANCE) += lance.o
+common-obj-$(CONFIG_FTGMAC100) += ftgmac100.o
 
 obj-$(CONFIG_ETRAXFS) += etraxfs_eth.o
 obj-$(CONFIG_COLDFIRE) += mcf_fec.o
diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
new file mode 100644
index 000000000000..22573ff956fd
--- /dev/null
+++ b/hw/net/ftgmac100.c
@@ -0,0 +1,900 @@
+/*
+ * Faraday FTGMAC100 Gigabit Ethernet
+ *
+ * Copyright (C) 2016 IBM Corp.
+ *
+ * Based on Coldfire Fast Ethernet Controller emulation.
+ *
+ * Copyright (c) 2007 CodeSourcery.
+ *
+ *  This program is free software; you can redistribute it and/or modify it
+ *  under the terms of the GNU General Public License as published by the
+ *  Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful, but WITHOUT
+ *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ *  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ *  for more details.
+ *
+ *  You should have received a copy of the GNU General Public License along
+ *  with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/net/ftgmac100.h"
+#include "sysemu/dma.h"
+#include "qemu/log.h"
+
+/* For crc32 */
+#include <zlib.h>
+
+#ifdef FTGMAC100_DEBUG
+#define DEBUG(fmt, ...) do {         \
+        fprintf(stderr,  "%s: " fmt, __func__, ## __VA_ARGS__);  \
+    } while (0);
+#else
+    #define DEBUG(...) do {} while (0)
+#endif
+
+#ifdef FTGMAC100_PHY_DEBUG
+#define PHY_DEBUG(fmt, ...) do {         \
+        fprintf(stderr,  "%s: " fmt, __func__, ## __VA_ARGS__);  \
+    } while (0);
+#else
+    #define PHY_DEBUG(...) do {} while (0)
+#endif
+
+/*
+ * IFTGMAC100 registers
+ */
+#define FTGMAC100_ISR             0x00
+#define FTGMAC100_IER             0x04
+#define FTGMAC100_MAC_MADR        0x08
+#define FTGMAC100_MAC_LADR        0x0c
+
+#define FTGMAC100_NPTXPD          0x18
+#define FTGMAC100_RXPD            0x1C
+#define FTGMAC100_NPTXR_BADR      0x20
+#define FTGMAC100_RXR_BADR        0x24
+#define FTGMAC100_APTC            0x34
+#define FTGMAC100_RBSR            0x4c
+
+#define FTGMAC100_MACCR           0x50
+#define FTGMAC100_PHYCR           0x60
+#define FTGMAC100_PHYDATA         0x64
+
+/*
+ * Interrupt status register & interrupt enable register
+ */
+#define FTGMAC100_INT_RPKT_BUF    (1 << 0)
+#define FTGMAC100_INT_RPKT_FIFO   (1 << 1)
+#define FTGMAC100_INT_NO_RXBUF    (1 << 2)
+#define FTGMAC100_INT_RPKT_LOST   (1 << 3)
+#define FTGMAC100_INT_XPKT_ETH    (1 << 4)
+#define FTGMAC100_INT_XPKT_FIFO   (1 << 5)
+#define FTGMAC100_INT_NO_NPTXBUF  (1 << 6)
+#define FTGMAC100_INT_XPKT_LOST   (1 << 7)
+#define FTGMAC100_INT_AHB_ERR     (1 << 8)
+#define FTGMAC100_INT_PHYSTS_CHG  (1 << 9)
+#define FTGMAC100_INT_NO_HPTXBUF  (1 << 10)
+
+/*
+ * Automatic polling timer control register
+ */
+#define FTGMAC100_APTC_RXPOLL_CNT(x)        ((x) & 0xf)
+#define FTGMAC100_APTC_RXPOLL_TIME_SEL      (1 << 4)
+#define FTGMAC100_APTC_TXPOLL_CNT(x)        (((x) >> 8) & 0xf)
+#define FTGMAC100_APTC_TXPOLL_TIME_SEL      (1 << 12)
+
+/*
+ * PHY control register
+ */
+#define FTGMAC100_PHYCR_MIIRD               (1 << 26)
+#define FTGMAC100_PHYCR_MIIWR               (1 << 27)
+
+/*
+ * PHY data register
+ */
+#define FTGMAC100_PHYDATA_MIIWDATA(x)       ((x) & 0xffff)
+#define FTGMAC100_PHYDATA_MIIRDATA(phydata) (((phydata) >> 16) & 0xffff)
+
+
+/*
+ * MAC control register
+ */
+#define FTGMAC100_MACCR_TXDMA_EN         (1 << 0)
+#define FTGMAC100_MACCR_RXDMA_EN         (1 << 1)
+#define FTGMAC100_MACCR_TXMAC_EN         (1 << 2)
+#define FTGMAC100_MACCR_RXMAC_EN         (1 << 3)
+#define FTGMAC100_MACCR_RM_VLAN          (1 << 4)
+#define FTGMAC100_MACCR_HPTXR_EN         (1 << 5)
+#define FTGMAC100_MACCR_LOOP_EN          (1 << 6)
+#define FTGMAC100_MACCR_ENRX_IN_HALFTX   (1 << 7)
+#define FTGMAC100_MACCR_FULLDUP          (1 << 8)
+#define FTGMAC100_MACCR_GIGA_MODE        (1 << 9)
+#define FTGMAC100_MACCR_CRC_APD          (1 << 10)
+#define FTGMAC100_MACCR_RX_RUNT          (1 << 12)
+#define FTGMAC100_MACCR_JUMBO_LF         (1 << 13)
+#define FTGMAC100_MACCR_RX_ALL           (1 << 14)
+#define FTGMAC100_MACCR_HT_MULTI_EN      (1 << 15)
+#define FTGMAC100_MACCR_RX_MULTIPKT      (1 << 16)
+#define FTGMAC100_MACCR_RX_BROADPKT      (1 << 17)
+#define FTGMAC100_MACCR_DISCARD_CRCERR   (1 << 18)
+#define FTGMAC100_MACCR_FAST_MODE        (1 << 19)
+#define FTGMAC100_MACCR_SW_RST           (1 << 31)
+
+/*
+ * Transmit descriptor, aligned to 16 bytes
+ */
+struct ftgmac100_txdes {
+        unsigned int        txdes0;
+        unsigned int        txdes1;
+        unsigned int        txdes2;      /* not used by HW */
+        unsigned int        txdes3;      /* TXBUF_BADR */
+} __attribute__ ((aligned(16)));
+
+#define FTGMAC100_TXDES0_TXBUF_SIZE(x)   ((x) & 0x3fff)
+#define FTGMAC100_TXDES0_EDOTR           (1 << 15)
+#define FTGMAC100_TXDES0_CRC_ERR         (1 << 19)
+#define FTGMAC100_TXDES0_LTS             (1 << 28)
+#define FTGMAC100_TXDES0_FTS             (1 << 29)
+#define FTGMAC100_TXDES0_TXDMA_OWN       (1 << 31)
+
+#define FTGMAC100_TXDES1_VLANTAG_CI(x)   ((x) & 0xffff)
+#define FTGMAC100_TXDES1_INS_VLANTAG     (1 << 16)
+#define FTGMAC100_TXDES1_TCP_CHKSUM      (1 << 17)
+#define FTGMAC100_TXDES1_UDP_CHKSUM      (1 << 18)
+#define FTGMAC100_TXDES1_IP_CHKSUM       (1 << 19)
+#define FTGMAC100_TXDES1_LLC             (1 << 22)
+#define FTGMAC100_TXDES1_TX2FIC          (1 << 30)
+#define FTGMAC100_TXDES1_TXIC            (1 << 31)
+
+/*
+ * Receive descriptor, aligned to 16 bytes
+ */
+struct ftgmac100_rxdes {
+        unsigned int        rxdes0;
+        unsigned int        rxdes1;
+        unsigned int        rxdes2;      /* not used by HW */
+        unsigned int        rxdes3;      /* RXBUF_BADR */
+} __attribute__ ((aligned(16)));
+
+#define FTGMAC100_RXDES0_VDBC            0x3fff
+#define FTGMAC100_RXDES0_EDORR           (1 << 15)
+#define FTGMAC100_RXDES0_MULTICAST       (1 << 16)
+#define FTGMAC100_RXDES0_BROADCAST       (1 << 17)
+#define FTGMAC100_RXDES0_RX_ERR          (1 << 18)
+#define FTGMAC100_RXDES0_CRC_ERR         (1 << 19)
+#define FTGMAC100_RXDES0_FTL             (1 << 20)
+#define FTGMAC100_RXDES0_RUNT            (1 << 21)
+#define FTGMAC100_RXDES0_RX_ODD_NB       (1 << 22)
+#define FTGMAC100_RXDES0_FIFO_FULL       (1 << 23)
+#define FTGMAC100_RXDES0_PAUSE_OPCODE    (1 << 24)
+#define FTGMAC100_RXDES0_PAUSE_FRAME     (1 << 25)
+#define FTGMAC100_RXDES0_LRS             (1 << 28)
+#define FTGMAC100_RXDES0_FRS             (1 << 29)
+#define FTGMAC100_RXDES0_RXPKT_RDY       (1 << 31)
+
+#define FTGMAC100_RXDES1_VLANTAG_CI      0xffff
+#define FTGMAC100_RXDES1_PROT_MASK       (0x3 << 20)
+#define FTGMAC100_RXDES1_PROT_NONIP      (0x0 << 20)
+#define FTGMAC100_RXDES1_PROT_IP         (0x1 << 20)
+#define FTGMAC100_RXDES1_PROT_TCPIP      (0x2 << 20)
+#define FTGMAC100_RXDES1_PROT_UDPIP      (0x3 << 20)
+#define FTGMAC100_RXDES1_LLC             (1 << 22)
+#define FTGMAC100_RXDES1_DF              (1 << 23)
+#define FTGMAC100_RXDES1_VLANTAG_AVAIL   (1 << 24)
+#define FTGMAC100_RXDES1_TCP_CHKSUM_ERR  (1 << 25)
+#define FTGMAC100_RXDES1_UDP_CHKSUM_ERR  (1 << 26)
+#define FTGMAC100_RXDES1_IP_CHKSUM_ERR   (1 << 27)
+
+/*
+ * PHY values (to be defined elsewhere ...)
+ */
+#define PHY_INT_ENERGYON            (1 << 7)
+#define PHY_INT_AUTONEG_COMPLETE    (1 << 6)
+#define PHY_INT_FAULT               (1 << 5)
+#define PHY_INT_DOWN                (1 << 4)
+#define PHY_INT_AUTONEG_LP          (1 << 3)
+#define PHY_INT_PARFAULT            (1 << 2)
+#define PHY_INT_AUTONEG_PAGE        (1 << 1)
+
+/* Common Buffer Descriptor  */
+typedef struct {
+    uint32_t        des0;
+    uint32_t        des1;
+    uint32_t        des2;        /* not used by HW */
+    uint32_t        des3;        /* TXBUF_BADR */
+} Ftgmac100Desc  __attribute__ ((aligned(16)));
+
+/* max frame size is :
+ *
+ *   9216 for Jumbo frames (+ 4 for VLAN)
+ *   1518 for other frames (+ 4 for VLAN)
+ */
+#define FTGMAC100_MAX_FRAME_SIZE(s)                             \
+    ((s->maccr & FTGMAC100_MACCR_JUMBO_LF ? 9216 : 1518) + 4)
+
+static void ftgmac100_update_irq(Ftgmac100State *s);
+
+/*
+ * The MII phy could raise a GPIO to the processor which in turn
+ * could be handled as an interrpt by the OS.
+ * For now we don't handle any GPIO/interrupt line, so the OS will
+ * have to poll for the PHY status.
+ */
+static void phy_update_irq(Ftgmac100State *s)
+{
+    ftgmac100_update_irq(s);
+}
+
+static void phy_update_link(Ftgmac100State *s)
+{
+    /* Autonegotiation status mirrors link status.  */
+    if (qemu_get_queue(s->nic)->link_down) {
+        PHY_DEBUG("link is down\n");
+        s->phy_status &= ~0x0024;
+        s->phy_int |= PHY_INT_DOWN;
+    } else {
+        PHY_DEBUG("link is up\n");
+        s->phy_status |= 0x0024;
+        s->phy_int |= PHY_INT_ENERGYON;
+        s->phy_int |= PHY_INT_AUTONEG_COMPLETE;
+    }
+    phy_update_irq(s);
+}
+
+static void ftgmac100_set_link(NetClientState *nc)
+{
+    phy_update_link(FTGMAC100(qemu_get_nic_opaque(nc)));
+}
+
+static void phy_reset(Ftgmac100State *s)
+{
+    s->phy_status = 0x7809;
+    s->phy_control = 0x3000;
+    s->phy_advertise = 0x01e1;
+    s->phy_int_mask = 0;
+    s->phy_int = 0;
+    phy_update_link(s);
+}
+
+static uint32_t do_phy_read(Ftgmac100State *s, int reg)
+{
+    uint32_t val;
+
+    if (reg > 31) {
+        /* we only advertise one phy */
+        return 0;
+    }
+
+    switch (reg) {
+    case 0:     /* Basic Control */
+        val = s->phy_control;
+        break;
+    case 1:     /* Basic Status */
+        val = s->phy_status;
+        break;
+    case 2:     /* ID1 */
+        val = 0x0007;
+        break;
+    case 3:     /* ID2 */
+        val = 0xc0d1;
+        break;
+    case 4:     /* Auto-neg advertisement */
+        val = s->phy_advertise;
+        break;
+    case 5:     /* Auto-neg Link Partner Ability */
+        val = 0x0f71;
+        break;
+    case 6:     /* Auto-neg Expansion */
+        val = 1;
+        break;
+        val = 0x0800;
+        break;
+    case 29:    /* Interrupt source.  */
+        val = s->phy_int;
+        s->phy_int = 0;
+        phy_update_irq(s);
+        break;
+    case 30:    /* Interrupt mask */
+        val = s->phy_int_mask;
+        break;
+    case 0x0a: /* 1000BASE-T status  */
+    case 17:
+    case 18:
+    case 27:
+    case 31:
+        qemu_log_mask(LOG_UNIMP, "%s: reg %d not implemented\n",
+                      __func__, reg);
+        val = 0;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address at offset %d\n",
+                      __func__, reg);
+        val = 0;
+        break;
+    }
+
+    PHY_DEBUG("PHY read 0x%04x @%d\n", val, reg);
+    return val;
+}
+
+static void do_phy_write(Ftgmac100State *s, int reg, uint32_t val)
+{
+    PHY_DEBUG("PHY: write 0x%04x @%d\n", val, reg);
+
+    if (reg > 31) {
+        /* we only advertise one phy */
+        return;
+    }
+
+    switch (reg) {
+    case 0:     /* Basic Control */
+        if (val & 0x8000) {
+            phy_reset(s);
+        } else {
+            s->phy_control = val & 0x7980;
+            /* Complete autonegotiation immediately.  */
+            if (val & 0x1000) {
+                s->phy_status |= 0x0020;
+            }
+        }
+        break;
+    case 4:     /* Auto-neg advertisement */
+        s->phy_advertise = (val & 0x2d7f) | 0x80;
+        break;
+    case 30:    /* Interrupt mask */
+        s->phy_int_mask = val & 0xff;
+        phy_update_irq(s);
+        break;
+    case 17:
+    case 18:
+    case 27:
+    case 31:
+        qemu_log_mask(LOG_UNIMP, "%s: reg %d not implemented\n",
+                      __func__, reg);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad address at offset %d\n",
+                      __func__, reg);
+        break;
+    }
+}
+
+static void ftgmac100_read_bd(Ftgmac100Desc *bd, dma_addr_t addr)
+{
+    dma_memory_read(&address_space_memory, addr, bd, sizeof(*bd));
+    bd->des0 = le32_to_cpu(bd->des0);
+    bd->des1 = le32_to_cpu(bd->des1);
+    bd->des2 = le32_to_cpu(bd->des2);
+    bd->des3 = le32_to_cpu(bd->des3);
+}
+
+static void ftgmac100_write_bd(Ftgmac100Desc *bd, dma_addr_t addr)
+{
+    Ftgmac100Desc lebd;
+    lebd.des0 = cpu_to_le32(bd->des0);
+    lebd.des1 = cpu_to_le32(bd->des1);
+    lebd.des2 = cpu_to_le32(bd->des2);
+    lebd.des3 = cpu_to_le32(bd->des3);
+    dma_memory_write(&address_space_memory, addr, &lebd, sizeof(lebd));
+}
+
+static void ftgmac100_update_irq(Ftgmac100State *s)
+{
+    uint32_t active;
+    uint32_t changed;
+
+    active = s->isr & s->ier;
+    changed = active ^ s->irq_state;
+    if (changed) {
+        qemu_set_irq(s->irq, active);
+    }
+    s->irq_state = active;
+}
+
+/* Locate a possible first descriptor to transmit. When Linux resets
+ * the device, the indexes of ring buffers are cleared but the dma
+ * buffers are not, so we need to find a starting point.
+ */
+static uint32_t ftgmac100_find_txdes(Ftgmac100State *s, uint32_t addr)
+{
+    Ftgmac100Desc bd;
+
+    while (1) {
+        ftgmac100_read_bd(&bd, addr);
+        if (bd.des0 & (FTGMAC100_TXDES0_FTS | FTGMAC100_TXDES0_EDOTR)) {
+            break;
+        }
+        addr += sizeof(Ftgmac100Desc);
+    }
+    return addr;
+}
+
+static void ftgmac100_do_tx(Ftgmac100State *s)
+{
+    int frame_size = 0;
+    uint8_t frame[FTGMAC100_MAX_FRAME_SIZE(s)];
+    uint8_t *ptr = frame;
+    uint32_t addr;
+
+    addr = ftgmac100_find_txdes(s, s->tx_descriptor);
+
+    while (1) {
+        Ftgmac100Desc bd;
+        int len;
+
+        ftgmac100_read_bd(&bd, addr);
+        if ((bd.des0 & FTGMAC100_TXDES0_TXDMA_OWN) == 0) {
+            /* Run out of descriptors to transmit.  */
+            s->isr |= FTGMAC100_INT_NO_NPTXBUF;
+            break;
+        }
+        len = bd.des0 & 0x3FFF;
+        if (frame_size + len > FTGMAC100_MAX_FRAME_SIZE(s)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %d bytes\n",
+                          __func__, len);
+            len = FTGMAC100_MAX_FRAME_SIZE(s) - frame_size;
+        }
+        dma_memory_read(&address_space_memory, bd.des3, ptr, len);
+        ptr += len;
+        frame_size += len;
+        if (bd.des0 & FTGMAC100_TXDES0_LTS) {
+            /* Last buffer in frame.  */
+            qemu_send_packet(qemu_get_queue(s->nic), frame, len);
+            ptr = frame;
+            frame_size = 0;
+            if (bd.des1 & FTGMAC100_TXDES1_TXIC) {
+                s->isr |= FTGMAC100_INT_XPKT_ETH;
+            }
+        }
+
+        if (bd.des1 & FTGMAC100_TXDES1_TX2FIC) {
+            s->isr |= FTGMAC100_INT_XPKT_FIFO;
+        }
+        bd.des0 &= ~FTGMAC100_TXDES0_TXDMA_OWN;
+
+        /* Write back the modified descriptor.  */
+        ftgmac100_write_bd(&bd, addr);
+        /* Advance to the next descriptor.  */
+        if (bd.des0 & FTGMAC100_TXDES0_EDOTR) {
+            addr = s->tx_ring;
+        } else {
+            addr += sizeof(Ftgmac100Desc);
+        }
+    }
+
+    s->tx_descriptor = addr;
+
+    ftgmac100_update_irq(s);
+}
+
+static void ftgmac100_enable_rx(Ftgmac100State *s)
+{
+    Ftgmac100Desc bd;
+    uint32_t full;
+
+    /* Find an empty descriptor to use */
+    while (1) {
+        ftgmac100_read_bd(&bd, s->rx_descriptor);
+        full = (bd.des0 & FTGMAC100_RXDES0_RXPKT_RDY);
+        if (!full || bd.des0 & FTGMAC100_TXDES0_EDOTR) {
+            break;
+        }
+        s->rx_descriptor += sizeof(Ftgmac100Desc);
+    }
+
+    if (full) {
+        DEBUG("RX buffer full\n");
+    }
+
+    s->rx_enabled = (full == 0);
+    if (s->rx_enabled) {
+        qemu_flush_queued_packets(qemu_get_queue(s->nic));
+    }
+}
+
+/*
+ * This is purely informative. The HW can poll the RW (and RX) ring
+ * buffers for available descriptors but we don't need to trigger a
+ * timer for that in qemu.
+ */
+static uint32_t ftgmac100_rxpoll(Ftgmac100State *s)
+{
+    /* Polling times :
+     *
+     * Speed      TIME_SEL=0    TIME_SEL=1
+     *
+     *    10         51.2 ms      819.2 ms
+     *   100         5.12 ms      81.92 ms
+     *  1000        1.024 ms     16.384 ms
+     */
+    static const int div[] = { 20, 200, 1000 };
+
+    uint32_t cnt = 1024 * FTGMAC100_APTC_RXPOLL_CNT(s->aptcr);
+    uint32_t speed = (s->maccr & FTGMAC100_MACCR_FAST_MODE) ? 1 : 0;
+    uint32_t period;
+
+    if (s->aptcr & FTGMAC100_APTC_RXPOLL_TIME_SEL) {
+        cnt <<= 4;
+    }
+
+    if (s->maccr & FTGMAC100_MACCR_GIGA_MODE) {
+        speed = 2;
+    }
+
+    period = cnt / div[speed];
+
+    DEBUG("polling in %d ms\n", period);
+    return period;
+}
+
+static void ftgmac100_reset(DeviceState *d)
+{
+    Ftgmac100State *s = FTGMAC100(d);
+
+    /* Reset the FTGMAC100 */
+    s->isr = 0;
+    s->ier = 0;
+    s->rx_enabled = 0;
+    s->maccr = 0;
+    s->rx_ring = 0;
+    s->rx_descriptor = 0;
+    s->rbsr = 0x640; /* HW default according to u-boot driver */
+    s->tx_ring = 0;
+    s->tx_descriptor = 0;
+    s->phycr = 0;
+    s->phydata = 0;
+    s->aptcr = 0;
+
+    /* We also reset the PHY */
+    phy_reset(s);
+}
+
+static uint64_t ftgmac100_read(void *opaque, hwaddr addr, unsigned size)
+{
+    Ftgmac100State *s = FTGMAC100(opaque);
+
+    DEBUG("reading from @ 0x%" HWADDR_PRIx "\n", addr);
+
+    switch (addr & 0xff) {
+    case FTGMAC100_ISR:
+        return s->isr;
+    case FTGMAC100_IER:
+        return s->ier;
+    case FTGMAC100_MAC_MADR:
+        return (s->conf.macaddr.a[0] << 8)  | s->conf.macaddr.a[1];
+    case FTGMAC100_MAC_LADR:
+        return (s->conf.macaddr.a[2] << 24) | (s->conf.macaddr.a[3] << 16) |
+               (s->conf.macaddr.a[4] << 8)  |  s->conf.macaddr.a[5];
+    case FTGMAC100_MACCR:
+        return s->maccr;
+    case FTGMAC100_PHYCR:
+        return s->phycr;
+    case FTGMAC100_PHYDATA:
+        return s->phydata;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad address at offset 0x%"
+                      HWADDR_PRIx "\n", TYPE_FTGMAC100, __func__, addr);
+        return 0;
+    }
+}
+
+static void ftgmac100_write(void *opaque, hwaddr addr,
+                          uint64_t value, unsigned size)
+{
+    Ftgmac100State *s = FTGMAC100(opaque);
+
+    DEBUG("writing 0x%08x @ 0x%" HWADDR_PRIx "\n", (int)value, addr);
+
+    switch (addr & 0xff) {
+    case FTGMAC100_ISR: /* Interrupt status */
+        s->isr &= ~value;
+        break;
+    case FTGMAC100_IER:  /* Interrupt control */
+        s->ier = value;
+        break;
+    case FTGMAC100_MAC_MADR: /* MAC */
+        s->conf.macaddr.a[0] = value >> 8;
+        s->conf.macaddr.a[1] = value;
+        break;
+    case FTGMAC100_MAC_LADR:
+        s->conf.macaddr.a[2] = value >> 24;
+        s->conf.macaddr.a[3] = value >> 16;
+        s->conf.macaddr.a[4] = value >> 8;
+        s->conf.macaddr.a[5] = value;
+        break;
+
+    case FTGMAC100_RXR_BADR:  /* Ring buffer address */
+        s->rx_ring = value;
+        s->rx_descriptor = s->rx_ring;
+        break;
+
+    case FTGMAC100_RBSR: /* DMA buffer size */
+        s->rbsr = value;
+        break;
+
+    case FTGMAC100_NPTXR_BADR:  /* Transmit buffer address */
+        s->tx_ring = value;
+        s->tx_descriptor = s->tx_ring;
+        break;
+
+    case FTGMAC100_NPTXPD: /* Trigger transmit */
+        if (s->maccr & FTGMAC100_MACCR_TXDMA_EN) {
+            ftgmac100_do_tx(s);
+        }
+        break;
+
+    case FTGMAC100_RXPD: /* Receive Poll Demand Register */
+        if ((s->maccr & FTGMAC100_MACCR_RXDMA_EN) && !s->rx_enabled) {
+            /*
+             * TODO: This is required for u-boot but clearly, this is
+             * broken.
+             */
+            ftgmac100_enable_rx(s);
+        }
+        break;
+
+    case FTGMAC100_APTC: /* Automatic polling */
+        s->aptcr = value;
+
+        if (FTGMAC100_APTC_RXPOLL_CNT(s->aptcr)) {
+            ftgmac100_rxpoll(s);
+        }
+
+        if (FTGMAC100_APTC_TXPOLL_CNT(s->aptcr)) {
+            qemu_log_mask(LOG_UNIMP, "%s: no transmit polling\n", __func__);
+        }
+        break;
+
+    case FTGMAC100_MACCR: /* MAC Device control */
+        s->maccr = value;
+        if (value & FTGMAC100_MACCR_SW_RST) {
+            ftgmac100_reset(DEVICE(s));
+        }
+
+        if ((s->maccr & FTGMAC100_MACCR_RXDMA_EN) && !s->rx_enabled) {
+            ftgmac100_enable_rx(s);
+        }
+
+        if ((s->maccr & FTGMAC100_MACCR_RXDMA_EN) == 0) {
+            s->rx_enabled = 0;
+        }
+        break;
+
+    case FTGMAC100_PHYCR:  /* PHY Device control */
+        s->phycr = value;
+        if (value & FTGMAC100_PHYCR_MIIWR) {
+            do_phy_write(s, extract32(value, 21, 5), s->phydata & 0xffff);
+            s->phycr &= ~FTGMAC100_PHYCR_MIIWR;
+       } else {
+            s->phydata = do_phy_read(s, extract32(value, 21, 5)) << 16;
+            s->phycr &= ~FTGMAC100_PHYCR_MIIRD;
+       }
+        break;
+    case FTGMAC100_PHYDATA:
+        s->phydata = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad address at offset 0x%"
+                      HWADDR_PRIx "\n", TYPE_FTGMAC100, __func__, addr);
+        break;
+    }
+
+    ftgmac100_update_irq(s);
+}
+
+static bool packet_is_broadcast(const uint8_t *buf)
+{
+    static const unsigned char sa_bcast[6] = {0xff, 0xff, 0xff,
+                                              0xff, 0xff, 0xff};
+    return memcmp(buf, sa_bcast, 6) == 0;
+}
+
+static int ftgmac100_can_receive(NetClientState *nc)
+{
+    Ftgmac100State *s = FTGMAC100(qemu_get_nic_opaque(nc));
+
+    return s->rx_enabled;
+}
+
+static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
+                               size_t len)
+{
+    Ftgmac100State *s = FTGMAC100(qemu_get_nic_opaque(nc));
+    Ftgmac100Desc bd;
+    uint32_t flags = 0;
+    uint32_t addr;
+    uint32_t crc;
+    uint32_t buf_addr;
+    uint8_t *crc_ptr;
+    unsigned int buf_len;
+    size_t size = len;
+    uint32_t first = FTGMAC100_RXDES0_FRS;
+
+    DEBUG("len %d\n", (int)size);
+
+    if (!s->rx_enabled) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unexpected packet\n", __func__);
+        return 0;
+    }
+
+    /* FIXME: Pad short packets.  */
+
+    /* 4 bytes for the CRC.  */
+    size += 4;
+    crc = cpu_to_be32(crc32(~0, buf, size));
+    crc_ptr = (uint8_t *) &crc;
+
+    /* Huge frames are truncted.  */
+    if (size > FTGMAC100_MAX_FRAME_SIZE(s)) {
+        size = FTGMAC100_MAX_FRAME_SIZE(s);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %zd bytes\n",
+                      __func__, size);
+        flags |= FTGMAC100_RXDES0_FTL | FTGMAC100_RXDES0_RX_ERR;
+    }
+
+    if (packet_is_broadcast(buf)) {
+        flags |= FTGMAC100_RXDES0_BROADCAST;
+    }
+
+    addr = s->rx_descriptor;
+    while (size > 0) {
+        ftgmac100_read_bd(&bd, addr);
+        if (bd.des0 & FTGMAC100_RXDES0_RXPKT_RDY) {
+            /* No descriptors available.  Bail out.  */
+            /*
+             * FIXME: This is wrong. We should probably either
+             * save the remainder for when more RX buffers are
+             * available, or flag an error.
+             */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Lost end of frame\n",
+                          __func__);
+            s->isr |= FTGMAC100_INT_NO_RXBUF;
+            break;
+        }
+        buf_len = (size <= s->rbsr) ? size : s->rbsr;
+        bd.des0 |= buf_len & 0x3fff;
+        size -= buf_len;
+
+        /* The last 4 bytes are the CRC.  */
+        if (size < 4) {
+            buf_len += size - 4;
+        }
+        buf_addr = bd.des3;
+        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
+        buf += buf_len;
+        if (size < 4) {
+            dma_memory_write(&address_space_memory, buf_addr + buf_len,
+                             crc_ptr, 4 - size);
+            crc_ptr += 4 - size;
+        }
+
+        bd.des0 |= first | FTGMAC100_RXDES0_RXPKT_RDY;
+        first = 0;
+        if (size == 0) {
+            /* Last buffer in frame.  */
+            bd.des0 |= flags | FTGMAC100_RXDES0_LRS;
+            DEBUG("rx frame flags %04x\n", bd.des0);
+            s->isr |= FTGMAC100_INT_RPKT_BUF;
+        } else {
+            s->isr |= FTGMAC100_INT_RPKT_FIFO;
+        }
+        ftgmac100_write_bd(&bd, addr);
+        if (bd.des0 & FTGMAC100_RXDES0_EDORR) {
+            addr = s->rx_ring;
+        } else {
+            addr += sizeof(Ftgmac100Desc);
+        }
+    }
+    s->rx_descriptor = addr;
+
+    ftgmac100_enable_rx(s);
+    ftgmac100_update_irq(s);
+    return len;
+}
+
+static const MemoryRegionOps ftgmac100_ops = {
+    .read = ftgmac100_read,
+    .write = ftgmac100_write,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void ftgmac100_cleanup(NetClientState *nc)
+{
+    Ftgmac100State *s = FTGMAC100(qemu_get_nic_opaque(nc));
+
+    s->nic = NULL;
+}
+
+static NetClientInfo net_ftgmac100_info = {
+    .type = NET_CLIENT_DRIVER_NIC,
+    .size = sizeof(NICState),
+    .can_receive = ftgmac100_can_receive,
+    .receive = ftgmac100_receive,
+    .cleanup = ftgmac100_cleanup,
+    .link_status_changed = ftgmac100_set_link,
+};
+
+static void ftgmac100_realize(DeviceState *dev, Error **errp)
+{
+    Ftgmac100State *s = FTGMAC100(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(dev), &ftgmac100_ops, s,
+                          TYPE_FTGMAC100, 0x2000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+    qemu_macaddr_default_if_unset(&s->conf.macaddr);
+
+    s->conf.peers.ncs[0] = nd_table[0].netdev;
+
+    s->nic = qemu_new_nic(&net_ftgmac100_info, &s->conf,
+                          object_get_typename(OBJECT(dev)), DEVICE(dev)->id,
+                          s);
+    qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
+}
+
+static const VMStateDescription vmstate_ftgmac100 = {
+    .name = TYPE_FTGMAC100,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(irq_state, Ftgmac100State),
+        VMSTATE_UINT32(isr, Ftgmac100State),
+        VMSTATE_UINT32(ier, Ftgmac100State),
+        VMSTATE_UINT32(rx_enabled, Ftgmac100State),
+        VMSTATE_UINT32(rx_ring, Ftgmac100State),
+        VMSTATE_UINT32(rbsr, Ftgmac100State),
+        VMSTATE_UINT32(tx_ring, Ftgmac100State),
+        VMSTATE_UINT32(rx_descriptor, Ftgmac100State),
+        VMSTATE_UINT32(tx_descriptor, Ftgmac100State),
+        VMSTATE_UINT32(maccr, Ftgmac100State),
+        VMSTATE_UINT32(phycr, Ftgmac100State),
+        VMSTATE_UINT32(phydata, Ftgmac100State),
+        VMSTATE_UINT32(aptcr, Ftgmac100State),
+
+        VMSTATE_UINT32(phy_status, Ftgmac100State),
+        VMSTATE_UINT32(phy_control, Ftgmac100State),
+        VMSTATE_UINT32(phy_advertise, Ftgmac100State),
+        VMSTATE_UINT32(phy_int, Ftgmac100State),
+        VMSTATE_UINT32(phy_int_mask, Ftgmac100State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property ftgmac100_properties[] = {
+    DEFINE_NIC_PROPERTIES(Ftgmac100State, conf),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ftgmac100_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_ftgmac100;
+    dc->reset = ftgmac100_reset;
+    dc->props = ftgmac100_properties;
+    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+    dc->realize = ftgmac100_realize;
+    dc->desc = "Faraday FTGMAC100 Gigabit Ethernet emulation";
+}
+
+static const TypeInfo ftgmac100_info = {
+    .name = TYPE_FTGMAC100,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(Ftgmac100State),
+    .class_init = ftgmac100_class_init,
+};
+
+static void ftgmac100_register_types(void)
+{
+    type_register_static(&ftgmac100_info);
+}
+
+type_init(ftgmac100_register_types)
diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
new file mode 100644
index 000000000000..cc5cb4207a5c
--- /dev/null
+++ b/include/hw/net/ftgmac100.h
@@ -0,0 +1,62 @@
+/*
+ * Faraday FTGMAC100 Gigabit Ethernet
+ *
+ * Copyright (C) 2016 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#ifndef FTGMAC100_H
+#define FTGMAC100_H
+
+#define TYPE_FTGMAC100 "ftgmac100"
+#define FTGMAC100(obj) OBJECT_CHECK(Ftgmac100State, (obj), TYPE_FTGMAC100)
+
+#include "hw/sysbus.h"
+#include "net/net.h"
+
+typedef struct Ftgmac100State {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    NICState *nic;
+    NICConf conf;
+    qemu_irq irq;
+    MemoryRegion iomem;
+
+    uint32_t irq_state;
+    uint32_t isr;
+    uint32_t ier;
+    uint32_t rx_enabled;
+    uint32_t rx_ring;
+    uint32_t rbsr;
+    uint32_t rx_descriptor;
+    uint32_t tx_ring;
+    uint32_t tx_descriptor;
+    uint32_t maccr;
+    uint32_t phycr;
+    uint32_t phydata;
+    uint32_t aptcr;
+
+    uint32_t phy_status;
+    uint32_t phy_control;
+    uint32_t phy_advertise;
+    uint32_t phy_int;
+    uint32_t phy_int_mask;
+
+} Ftgmac100State;
+
+#endif
-- 
2.7.4
