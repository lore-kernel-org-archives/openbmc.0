Return-Path: <clg@kaod.org>
X-Greylist: delayed 575 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Nov 2016 01:36:09 AEDT
Received: from 6.mo7.mail-out.ovh.net (6.mo7.mail-out.ovh.net [188.165.39.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0t12khszDrBx
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:36:09 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 475F11EFA8
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:47 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 0E4AF480083;
 Fri, 18 Nov 2016 15:26:44 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 35/38] net/ftgmac100: add a 'aspeed' property
Date: Fri, 18 Nov 2016 15:22:15 +0100
Message-Id: <1479478938-13267-36-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1127870235736967938
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
X-List-Received-Date: Fri, 18 Nov 2016 14:36:10 -0000

Aspeed SOCs have different definitions for the end of ring bits. Add a
property to specify which set of bits should be used by the nic device
model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c         | 24 ++++++++++++++++++++----
 include/hw/net/ftgmac100.h |  2 ++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 22573ff956fd..0a8ab6b9e4d8 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -136,9 +136,11 @@ struct ftgmac100_txdes {
 
 #define FTGMAC100_TXDES0_TXBUF_SIZE(x)   ((x) & 0x3fff)
 #define FTGMAC100_TXDES0_EDOTR           (1 << 15)
+
 #define FTGMAC100_TXDES0_CRC_ERR         (1 << 19)
 #define FTGMAC100_TXDES0_LTS             (1 << 28)
 #define FTGMAC100_TXDES0_FTS             (1 << 29)
+#define FTGMAC100_TXDES0_EDOTR_ASPEED    (1 << 30)
 #define FTGMAC100_TXDES0_TXDMA_OWN       (1 << 31)
 
 #define FTGMAC100_TXDES1_VLANTAG_CI(x)   ((x) & 0xffff)
@@ -174,6 +176,7 @@ struct ftgmac100_rxdes {
 #define FTGMAC100_RXDES0_PAUSE_FRAME     (1 << 25)
 #define FTGMAC100_RXDES0_LRS             (1 << 28)
 #define FTGMAC100_RXDES0_FRS             (1 << 29)
+#define FTGMAC100_RXDES0_EDORR_ASPEED    (1 << 30)
 #define FTGMAC100_RXDES0_RXPKT_RDY       (1 << 31)
 
 #define FTGMAC100_RXDES1_VLANTAG_CI      0xffff
@@ -208,6 +211,18 @@ typedef struct {
     uint32_t        des3;        /* TXBUF_BADR */
 } Ftgmac100Desc  __attribute__ ((aligned(16)));
 
+static inline uint32_t ftgmac100_rxdes0_edorr(Ftgmac100State *s)
+{
+    return s->aspeed ?
+        FTGMAC100_RXDES0_EDORR_ASPEED : FTGMAC100_RXDES0_EDORR;
+}
+
+static inline uint32_t ftgmac100_txdes0_edotr(Ftgmac100State *s)
+{
+    return s->aspeed ?
+        FTGMAC100_TXDES0_EDOTR_ASPEED : FTGMAC100_TXDES0_EDOTR;
+}
+
 /* max frame size is :
  *
  *   9216 for Jumbo frames (+ 4 for VLAN)
@@ -405,7 +420,7 @@ static uint32_t ftgmac100_find_txdes(Ftgmac100State *s, uint32_t addr)
 
     while (1) {
         ftgmac100_read_bd(&bd, addr);
-        if (bd.des0 & (FTGMAC100_TXDES0_FTS | FTGMAC100_TXDES0_EDOTR)) {
+        if (bd.des0 & (FTGMAC100_TXDES0_FTS | ftgmac100_txdes0_edotr(s))) {
             break;
         }
         addr += sizeof(Ftgmac100Desc);
@@ -459,7 +474,7 @@ static void ftgmac100_do_tx(Ftgmac100State *s)
         /* Write back the modified descriptor.  */
         ftgmac100_write_bd(&bd, addr);
         /* Advance to the next descriptor.  */
-        if (bd.des0 & FTGMAC100_TXDES0_EDOTR) {
+        if (bd.des0 & ftgmac100_txdes0_edotr(s)) {
             addr = s->tx_ring;
         } else {
             addr += sizeof(Ftgmac100Desc);
@@ -480,7 +495,7 @@ static void ftgmac100_enable_rx(Ftgmac100State *s)
     while (1) {
         ftgmac100_read_bd(&bd, s->rx_descriptor);
         full = (bd.des0 & FTGMAC100_RXDES0_RXPKT_RDY);
-        if (!full || bd.des0 & FTGMAC100_TXDES0_EDOTR) {
+        if (!full || bd.des0 & ftgmac100_txdes0_edotr(s)) {
             break;
         }
         s->rx_descriptor += sizeof(Ftgmac100Desc);
@@ -784,7 +799,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
             s->isr |= FTGMAC100_INT_RPKT_FIFO;
         }
         ftgmac100_write_bd(&bd, addr);
-        if (bd.des0 & FTGMAC100_RXDES0_EDORR) {
+        if (bd.des0 & ftgmac100_rxdes0_edorr(s)) {
             addr = s->rx_ring;
         } else {
             addr += sizeof(Ftgmac100Desc);
@@ -869,6 +884,7 @@ static const VMStateDescription vmstate_ftgmac100 = {
 };
 
 static Property ftgmac100_properties[] = {
+    DEFINE_PROP_BOOL("aspeed", Ftgmac100State, aspeed, false),
     DEFINE_NIC_PROPERTIES(Ftgmac100State, conf),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
index cc5cb4207a5c..ee8975000260 100644
--- a/include/hw/net/ftgmac100.h
+++ b/include/hw/net/ftgmac100.h
@@ -57,6 +57,8 @@ typedef struct Ftgmac100State {
     uint32_t phy_int;
     uint32_t phy_int_mask;
 
+    bool aspeed;
+
 } Ftgmac100State;
 
 #endif
-- 
2.7.4
