Return-Path: <clg@kaod.org>
Received: from 9.mo7.mail-out.ovh.net (9.mo7.mail-out.ovh.net [46.105.60.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tL0gN5yDFzDvwt
 for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2016 01:26:56 +1100 (AEDT)
Received: from player697.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 1E0801ED41
 for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2016 15:26:54 +0100 (CET)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 7C1B8480083;
 Fri, 18 Nov 2016 15:26:50 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 37/38] slirp: add a fake NCSI backend
Date: Fri, 18 Nov 2016 15:22:17 +0100
Message-Id: <1479478938-13267-38-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479478938-13267-1-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1129840558312622850
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
X-List-Received-Date: Fri, 18 Nov 2016 14:26:57 -0000

This only reverses the NCSI packets to make the Linux driver happy.

The NCSI header file <ncsi-pkt.h> comes from Linux.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/net/eth.h   |   1 +
 slirp/Makefile.objs |   2 +-
 slirp/ncsi-pkt.h    | 394 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 slirp/ncsi.c        |  95 +++++++++++++
 slirp/slirp.c       |   4 +
 slirp/slirp.h       |   3 +
 6 files changed, 498 insertions(+), 1 deletion(-)
 create mode 100644 slirp/ncsi-pkt.h
 create mode 100644 slirp/ncsi.c

diff --git a/include/net/eth.h b/include/net/eth.h
index 2013175857ba..6237004559bc 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -209,6 +209,7 @@ struct tcp_hdr {
 #define ETH_P_IPV6                (0x86dd)
 #define ETH_P_VLAN                (0x8100)
 #define ETH_P_DVLAN               (0x88a8)
+#define ETH_P_NCSI                (0x88f8)      /* NCSI protocol             */
 #define ETH_P_UNKNOWN             (0xffff)
 #define VLAN_VID_MASK             0x0fff
 #define IP_HEADER_VERSION_4       (4)
diff --git a/slirp/Makefile.objs b/slirp/Makefile.objs
index 1baa1f1c7cfb..28049b03cddc 100644
--- a/slirp/Makefile.objs
+++ b/slirp/Makefile.objs
@@ -2,4 +2,4 @@ common-obj-y = cksum.o if.o ip_icmp.o ip6_icmp.o ip6_input.o ip6_output.o \
                ip_input.o ip_output.o dnssearch.o dhcpv6.o
 common-obj-y += slirp.o mbuf.o misc.o sbuf.o socket.o tcp_input.o tcp_output.o
 common-obj-y += tcp_subr.o tcp_timer.o udp.o udp6.o bootp.o tftp.o arp_table.o \
-                ndp_table.o
+                ndp_table.o ncsi.o
diff --git a/slirp/ncsi-pkt.h b/slirp/ncsi-pkt.h
new file mode 100644
index 000000000000..20c787103ec2
--- /dev/null
+++ b/slirp/ncsi-pkt.h
@@ -0,0 +1,394 @@
+#ifndef NCSI_PKT_H
+#define NCSI_PKT_H
+
+#define __be32 uint32_t
+#define __be16 uint16_t
+
+struct ncsi_pkt_hdr {
+        unsigned char   mc_id;          /* Management controller ID */
+        unsigned char   revision;       /* NCSI version - 0x01      */
+        unsigned char   reserved;       /* Reserved                 */
+        unsigned char   id;             /* Packet sequence number   */
+        unsigned char   type;           /* Packet type              */
+        unsigned char   channel;        /* Network controller ID    */
+        __be16          length;         /* Payload length           */
+        __be32          reserved1[2];   /* Reserved                 */
+};
+
+struct ncsi_cmd_pkt_hdr {
+        struct ncsi_pkt_hdr     common;         /* Common NCSI packet header */
+};
+
+struct ncsi_rsp_pkt_hdr {
+        struct ncsi_pkt_hdr     common;         /* Common NCSI packet header */
+        __be16                  code;           /* Response code             */
+        __be16                  reason;         /* Response reason           */
+};
+
+struct ncsi_aen_pkt_hdr {
+        struct ncsi_pkt_hdr     common;         /* Common NCSI packet header */
+        unsigned char           reserved2[3];   /* Reserved                  */
+        unsigned char           type;           /* AEN packet type           */
+};
+
+/* NCSI common command and response packets */
+struct ncsi_cmd_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header */
+        __be32                  checksum;       /* Checksum       */
+        unsigned char           pad[26];
+};
+
+struct ncsi_rsp_pkt {
+        struct ncsi_rsp_pkt_hdr rsp;            /* Response header */
+        __be32                  checksum;       /* Checksum        */
+        unsigned char           pad[22];
+};
+
+/* Select Package */
+struct ncsi_cmd_sp_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header */
+        unsigned char           reserved[3];    /* Reserved       */
+        unsigned char           hw_arbitration; /* HW arbitration */
+        __be32                  checksum;       /* Checksum       */
+        unsigned char           pad[22];
+};
+
+/* Disable Channel */
+struct ncsi_cmd_dc_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header  */
+        unsigned char           reserved[3];    /* Reserved        */
+        unsigned char           ald;            /* Allow link down */
+        __be32                  checksum;       /* Checksum        */
+        unsigned char           pad[22];
+};
+
+/* Reset Channel */
+struct ncsi_cmd_rc_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header */
+        __be32                  reserved;       /* Reserved       */
+        __be32                  checksum;       /* Checksum       */
+        unsigned char           pad[22];
+};
+
+/* AEN Enable */
+struct ncsi_cmd_ae_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header   */
+        unsigned char           reserved[3];    /* Reserved         */
+        unsigned char           mc_id;          /* MC ID            */
+        __be32                  mode;           /* AEN working mode */
+        __be32                  checksum;       /* Checksum         */
+        unsigned char           pad[18];
+};
+
+/* Set Link */
+struct ncsi_cmd_sl_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header    */
+        __be32                  mode;           /* Link working mode */
+        __be32                  oem_mode;       /* OEM link mode     */
+        __be32                  checksum;       /* Checksum          */
+        unsigned char           pad[18];
+};
+
+/* Get Link Status */
+struct ncsi_rsp_gls_pkt {
+        struct ncsi_rsp_pkt_hdr rsp;            /* Response header   */
+        __be32                  status;         /* Link status       */
+        __be32                  other;          /* Other indications */
+        __be32                  oem_status;     /* OEM link status   */
+        __be32                  checksum;       /* Checksum          */
+        unsigned char           pad[10];
+};
+
+/* Set VLAN Filter */
+struct ncsi_cmd_svf_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header    */
+        __be16                  reserved;       /* Reserved          */
+        __be16                  vlan;           /* VLAN ID           */
+        __be16                  reserved1;      /* Reserved          */
+        unsigned char           index;          /* VLAN table index  */
+        unsigned char           enable;         /* Enable or disable */
+        __be32                  checksum;       /* Checksum          */
+        unsigned char           pad[14];
+};
+
+/* Enable VLAN */
+struct ncsi_cmd_ev_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header   */
+        unsigned char           reserved[3];    /* Reserved         */
+        unsigned char           mode;           /* VLAN filter mode */
+        __be32                  checksum;       /* Checksum         */
+        unsigned char           pad[22];
+};
+
+/* Set MAC Address */
+struct ncsi_cmd_sma_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header          */
+        unsigned char           mac[6];         /* MAC address             */
+        unsigned char           index;          /* MAC table index         */
+        unsigned char           at_e;           /* Addr type and operation */
+        __be32                  checksum;       /* Checksum                */
+        unsigned char           pad[18];
+};
+
+/* Enable Broadcast Filter */
+struct ncsi_cmd_ebf_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header */
+        __be32                  mode;           /* Filter mode    */
+        __be32                  checksum;       /* Checksum       */
+        unsigned char           pad[22];
+};
+
+/* Enable Global Multicast Filter */
+struct ncsi_cmd_egmf_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header */
+        __be32                  mode;           /* Global MC mode */
+        __be32                  checksum;       /* Checksum       */
+        unsigned char           pad[22];
+};
+
+/* Set NCSI Flow Control */
+struct ncsi_cmd_snfc_pkt {
+        struct ncsi_cmd_pkt_hdr cmd;            /* Command header    */
+        unsigned char           reserved[3];    /* Reserved          */
+        unsigned char           mode;           /* Flow control mode */
+        __be32                  checksum;       /* Checksum          */
+        unsigned char           pad[22];
+};
+
+/* Get Version ID */
+struct ncsi_rsp_gvi_pkt {
+        struct ncsi_rsp_pkt_hdr rsp;            /* Response header   */
+        __be32                  ncsi_version;   /* NCSI version      */
+        unsigned char           reserved[3];    /* Reserved          */
+        unsigned char           alpha2;         /* NCSI version      */
+        unsigned char           fw_name[12];    /* f/w name string   */
+        __be32                  fw_version;     /* f/w version       */
+        __be16                  pci_ids[4];     /* PCI IDs           */
+        __be32                  mf_id;          /* Manufacture ID    */
+        __be32                  checksum;
+};
+
+/* Get Capabilities */
+struct ncsi_rsp_gc_pkt {
+        struct ncsi_rsp_pkt_hdr rsp;            /* Response header   */
+        __be32                  cap;            /* Capabilities      */
+        __be32                  bc_cap;         /* Broadcast cap     */
+        __be32                  mc_cap;         /* Multicast cap     */
+        __be32                  buf_cap;        /* Buffering cap     */
+        __be32                  aen_cap;        /* AEN cap           */
+        unsigned char           vlan_cnt;       /* VLAN filter count */
+        unsigned char           mixed_cnt;      /* Mix filter count  */
+        unsigned char           mc_cnt;         /* MC filter count   */
+        unsigned char           uc_cnt;         /* UC filter count   */
+        unsigned char           reserved[2];    /* Reserved          */
+        unsigned char           vlan_mode;      /* VLAN mode         */
+        unsigned char           channel_cnt;    /* Channel count     */
+        __be32                  checksum;       /* Checksum          */
+};
+
+/* Get Parameters */
+struct ncsi_rsp_gp_pkt {
+        struct ncsi_rsp_pkt_hdr rsp;            /* Response header       */
+        unsigned char           mac_cnt;        /* Number of MAC addr    */
+        unsigned char           reserved[2];    /* Reserved              */
+        unsigned char           mac_enable;     /* MAC addr enable flags */
+        unsigned char           vlan_cnt;       /* VLAN tag count        */
+        unsigned char           reserved1;      /* Reserved              */
+        __be16                  vlan_enable;    /* VLAN tag enable flags */
+        __be32                  link_mode;      /* Link setting          */
+        __be32                  bc_mode;        /* BC filter mode        */
+        __be32                  valid_modes;    /* Valid mode parameters */
+        unsigned char           vlan_mode;      /* VLAN mode             */
+        unsigned char           fc_mode;        /* Flow control mode     */
+        unsigned char           reserved2[2];   /* Reserved              */
+        __be32                  aen_mode;       /* AEN mode              */
+        unsigned char           mac[6];         /* Supported MAC addr    */
+        __be16                  vlan;           /* Supported VLAN tags   */
+        __be32                  checksum;       /* Checksum              */
+};
+
+/* Get Controller Packet Statistics */
+struct ncsi_rsp_gcps_pkt {
+        struct ncsi_rsp_pkt_hdr rsp;            /* Response header            */
+        __be32                  cnt_hi;         /* Counter cleared            */
+        __be32                  cnt_lo;         /* Counter cleared            */
+        __be32                  rx_bytes;       /* Rx bytes                   */
+        __be32                  tx_bytes;       /* Tx bytes                   */
+        __be32                  rx_uc_pkts;     /* Rx UC packets              */
+        __be32                  rx_mc_pkts;     /* Rx MC packets              */
+        __be32                  rx_bc_pkts;     /* Rx BC packets              */
+        __be32                  tx_uc_pkts;     /* Tx UC packets              */
+        __be32                  tx_mc_pkts;     /* Tx MC packets              */
+        __be32                  tx_bc_pkts;     /* Tx BC packets              */
+        __be32                  fcs_err;        /* FCS errors                 */
+        __be32                  align_err;      /* Alignment errors           */
+        __be32                  false_carrier;  /* False carrier detection    */
+        __be32                  runt_pkts;      /* Rx runt packets            */
+        __be32                  jabber_pkts;    /* Rx jabber packets          */
+        __be32                  rx_pause_xon;   /* Rx pause XON frames        */
+        __be32                  rx_pause_xoff;  /* Rx XOFF frames             */
+        __be32                  tx_pause_xon;   /* Tx XON frames              */
+        __be32                  tx_pause_xoff;  /* Tx XOFF frames             */
+        __be32                  tx_s_collision; /* Single collision frames    */
+        __be32                  tx_m_collision; /* Multiple collision frames  */
+        __be32                  l_collision;    /* Late collision frames      */
+        __be32                  e_collision;    /* Excessive collision frames */
+        __be32                  rx_ctl_frames;  /* Rx control frames          */
+        __be32                  rx_64_frames;   /* Rx 64-bytes frames         */
+        __be32                  rx_127_frames;  /* Rx 65-127 bytes frames     */
+        __be32                  rx_255_frames;  /* Rx 128-255 bytes frames    */
+        __be32                  rx_511_frames;  /* Rx 256-511 bytes frames    */
+        __be32                  rx_1023_frames; /* Rx 512-1023 bytes frames   */
+        __be32                  rx_1522_frames; /* Rx 1024-1522 bytes frames  */
+        __be32                  rx_9022_frames; /* Rx 1523-9022 bytes frames  */
+        __be32                  tx_64_frames;   /* Tx 64-bytes frames         */
+        __be32                  tx_127_frames;  /* Tx 65-127 bytes frames     */
+        __be32                  tx_255_frames;  /* Tx 128-255 bytes frames    */
+        __be32                  tx_511_frames;  /* Tx 256-511 bytes frames    */
+        __be32                  tx_1023_frames; /* Tx 512-1023 bytes frames   */
+        __be32                  tx_1522_frames; /* Tx 1024-1522 bytes frames  */
+        __be32                  tx_9022_frames; /* Tx 1523-9022 bytes frames  */
+        __be32                  rx_valid_bytes; /* Rx valid bytes             */
+        __be32                  rx_runt_pkts;   /* Rx error runt packets      */
+        __be32                  rx_jabber_pkts; /* Rx error jabber packets    */
+        __be32                  checksum;       /* Checksum                   */
+};
+
+/* Get NCSI Statistics */
+struct ncsi_rsp_gns_pkt {
+        struct ncsi_rsp_pkt_hdr rsp;            /* Response header         */
+        __be32                  rx_cmds;        /* Rx NCSI commands        */
+        __be32                  dropped_cmds;   /* Dropped commands        */
+        __be32                  cmd_type_errs;  /* Command type errors     */
+        __be32                  cmd_csum_errs;  /* Command checksum errors */
+        __be32                  rx_pkts;        /* Rx NCSI packets         */
+        __be32                  tx_pkts;        /* Tx NCSI packets         */
+        __be32                  tx_aen_pkts;    /* Tx AEN packets          */
+        __be32                  checksum;       /* Checksum                */
+};
+
+/* Get NCSI Pass-through Statistics */
+struct ncsi_rsp_gnpts_pkt {
+        struct ncsi_rsp_pkt_hdr rsp;            /* Response header     */
+        __be32                  tx_pkts;        /* Tx packets          */
+        __be32                  tx_dropped;     /* Tx dropped packets  */
+        __be32                  tx_channel_err; /* Tx channel errors   */
+        __be32                  tx_us_err;      /* Tx undersize errors */
+        __be32                  rx_pkts;        /* Rx packets          */
+        __be32                  rx_dropped;     /* Rx dropped packets  */
+        __be32                  rx_channel_err; /* Rx channel errors   */
+        __be32                  rx_us_err;      /* Rx undersize errors */
+        __be32                  rx_os_err;      /* Rx oversize errors  */
+        __be32                  checksum;       /* Checksum            */
+};
+
+/* AEN: Link State Change */
+struct ncsi_aen_lsc_pkt {
+        struct ncsi_aen_pkt_hdr aen;            /* AEN header      */
+        __be32                  status;         /* Link status     */
+        __be32                  oem_status;     /* OEM link status */
+        __be32                  checksum;       /* Checksum        */
+        unsigned char           pad[14];
+};
+
+/* AEN: Configuration Required */
+struct ncsi_aen_cr_pkt {
+        struct ncsi_aen_pkt_hdr aen;            /* AEN header */
+        __be32                  checksum;       /* Checksum   */
+        unsigned char           pad[22];
+};
+
+/* AEN: Host Network Controller Driver Status Change */
+struct ncsi_aen_hncdsc_pkt {
+        struct ncsi_aen_pkt_hdr aen;            /* AEN header */
+        __be32                  status;         /* Status     */
+        __be32                  checksum;       /* Checksum   */
+        unsigned char           pad[18];
+};
+
+/* NCSI packet revision */
+#define NCSI_PKT_REVISION       0x01
+
+/* NCSI packet commands */
+#define NCSI_PKT_CMD_CIS        0x00    /* Clear Initial State              */
+#define NCSI_PKT_CMD_SP         0x01    /* Select Package                   */
+#define NCSI_PKT_CMD_DP         0x02    /* Deselect Package                 */
+#define NCSI_PKT_CMD_EC         0x03    /* Enable Channel                   */
+#define NCSI_PKT_CMD_DC         0x04    /* Disable Channel                  */
+#define NCSI_PKT_CMD_RC         0x05    /* Reset Channel                    */
+#define NCSI_PKT_CMD_ECNT       0x06    /* Enable Channel Network Tx        */
+#define NCSI_PKT_CMD_DCNT       0x07    /* Disable Channel Network Tx       */
+#define NCSI_PKT_CMD_AE         0x08    /* AEN Enable                       */
+#define NCSI_PKT_CMD_SL         0x09    /* Set Link                         */
+#define NCSI_PKT_CMD_GLS        0x0a    /* Get Link                         */
+#define NCSI_PKT_CMD_SVF        0x0b    /* Set VLAN Filter                  */
+#define NCSI_PKT_CMD_EV         0x0c    /* Enable VLAN                      */
+#define NCSI_PKT_CMD_DV         0x0d    /* Disable VLAN                     */
+#define NCSI_PKT_CMD_SMA        0x0e    /* Set MAC address                  */
+#define NCSI_PKT_CMD_EBF        0x10    /* Enable Broadcast Filter          */
+#define NCSI_PKT_CMD_DBF        0x11    /* Disable Broadcast Filter         */
+#define NCSI_PKT_CMD_EGMF       0x12    /* Enable Global Multicast Filter   */
+#define NCSI_PKT_CMD_DGMF       0x13    /* Disable Global Multicast Filter  */
+#define NCSI_PKT_CMD_SNFC       0x14    /* Set NCSI Flow Control            */
+#define NCSI_PKT_CMD_GVI        0x15    /* Get Version ID                   */
+#define NCSI_PKT_CMD_GC         0x16    /* Get Capabilities                 */
+#define NCSI_PKT_CMD_GP         0x17    /* Get Parameters                   */
+#define NCSI_PKT_CMD_GCPS       0x18    /* Get Controller Packet Statistics */
+#define NCSI_PKT_CMD_GNS        0x19    /* Get NCSI Statistics              */
+#define NCSI_PKT_CMD_GNPTS      0x1a    /* Get NCSI Pass-throu Statistics   */
+#define NCSI_PKT_CMD_OEM        0x50    /* OEM                              */
+
+/* NCSI packet responses */
+#define NCSI_PKT_RSP_CIS        (NCSI_PKT_CMD_CIS + 0x80)
+#define NCSI_PKT_RSP_SP         (NCSI_PKT_CMD_SP + 0x80)
+#define NCSI_PKT_RSP_DP         (NCSI_PKT_CMD_DP + 0x80)
+#define NCSI_PKT_RSP_EC         (NCSI_PKT_CMD_EC + 0x80)
+#define NCSI_PKT_RSP_DC         (NCSI_PKT_CMD_DC + 0x80)
+#define NCSI_PKT_RSP_RC         (NCSI_PKT_CMD_RC + 0x80)
+#define NCSI_PKT_RSP_ECNT       (NCSI_PKT_CMD_ECNT + 0x80)
+#define NCSI_PKT_RSP_DCNT       (NCSI_PKT_CMD_DCNT + 0x80)
+#define NCSI_PKT_RSP_AE         (NCSI_PKT_CMD_AE + 0x80)
+#define NCSI_PKT_RSP_SL         (NCSI_PKT_CMD_SL + 0x80)
+#define NCSI_PKT_RSP_GLS        (NCSI_PKT_CMD_GLS + 0x80)
+#define NCSI_PKT_RSP_SVF        (NCSI_PKT_CMD_SVF + 0x80)
+#define NCSI_PKT_RSP_EV         (NCSI_PKT_CMD_EV + 0x80)
+#define NCSI_PKT_RSP_DV         (NCSI_PKT_CMD_DV + 0x80)
+#define NCSI_PKT_RSP_SMA        (NCSI_PKT_CMD_SMA + 0x80)
+#define NCSI_PKT_RSP_EBF        (NCSI_PKT_CMD_EBF + 0x80)
+#define NCSI_PKT_RSP_DBF        (NCSI_PKT_CMD_DBF + 0x80)
+#define NCSI_PKT_RSP_EGMF       (NCSI_PKT_CMD_EGMF + 0x80)
+#define NCSI_PKT_RSP_DGMF       (NCSI_PKT_CMD_DGMF + 0x80)
+#define NCSI_PKT_RSP_SNFC       (NCSI_PKT_CMD_SNFC + 0x80)
+#define NCSI_PKT_RSP_GVI        (NCSI_PKT_CMD_GVI + 0x80)
+#define NCSI_PKT_RSP_GC         (NCSI_PKT_CMD_GC + 0x80)
+#define NCSI_PKT_RSP_GP         (NCSI_PKT_CMD_GP + 0x80)
+#define NCSI_PKT_RSP_GCPS       (NCSI_PKT_CMD_GCPS + 0x80)
+#define NCSI_PKT_RSP_GNS        (NCSI_PKT_CMD_GNS + 0x80)
+#define NCSI_PKT_RSP_GNPTS      (NCSI_PKT_CMD_GNPTS + 0x80)
+#define NCSI_PKT_RSP_OEM        (NCSI_PKT_CMD_OEM + 0x80)
+
+/* NCSI packet type: AEN */
+#define NCSI_PKT_AEN            0xFF    /* AEN Packet               */
+#define NCSI_PKT_AEN_LSC        0x00    /* Link status change       */
+#define NCSI_PKT_AEN_CR         0x01    /* Configuration required   */
+#define NCSI_PKT_AEN_HNCDSC     0x02    /* HNC driver status change */
+
+/* NCSI response code/reason */
+#define NCSI_PKT_RSP_C_COMPLETED        0x0000  /* Command Completed        */
+#define NCSI_PKT_RSP_C_FAILED           0x0001  /* Command Failed           */
+#define NCSI_PKT_RSP_C_UNAVAILABLE      0x0002  /* Command Unavailable      */
+#define NCSI_PKT_RSP_C_UNSUPPORTED      0x0003  /* Command Unsupported      */
+#define NCSI_PKT_RSP_R_NO_ERROR         0x0000  /* No Error                 */
+#define NCSI_PKT_RSP_R_INTERFACE        0x0001  /* Interface not ready      */
+#define NCSI_PKT_RSP_R_PARAM            0x0002  /* Invalid Parameter        */
+#define NCSI_PKT_RSP_R_CHANNEL          0x0003  /* Channel not Ready        */
+#define NCSI_PKT_RSP_R_PACKAGE          0x0004  /* Package not Ready        */
+#define NCSI_PKT_RSP_R_LENGTH           0x0005  /* Invalid payload length   */
+#define NCSI_PKT_RSP_R_UNKNOWN          0x7fff  /* Command type unsupported */
+
+/* NCSI AEN packet type */
+#define NCSI_PKT_AEN_LSC                0x00    /* Link status change        */
+#define NCSI_PKT_AEN_CR                 0x01    /* Configuration required    */
+#define NCSI_PKT_AEN_HNCDSC             0x02    /* Host driver status change */
+
+#endif /* NCSI_PKT_H */
diff --git a/slirp/ncsi.c b/slirp/ncsi.c
new file mode 100644
index 000000000000..8f8f4609eff5
--- /dev/null
+++ b/slirp/ncsi.c
@@ -0,0 +1,95 @@
+/*
+ * NCSI
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
+#include "qemu/osdep.h"
+#include <slirp.h>
+
+#include "ncsi-pkt.h"
+
+#if defined(_WIN32)
+/* Windows ntohl() returns an u_long value.
+ * Add a type cast to match the format strings. */
+# define ntohl(n) ((uint32_t)ntohl(n))
+#endif
+
+/*
+ * ncsi header + checksum + max payload (NCSI_PKT_CMD_GVI)
+ */
+#define NCSI_LEN (sizeof(struct ncsi_pkt_hdr) + 4 + 36)
+
+void ncsi_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
+{
+    struct ncsi_pkt_hdr *nh = (struct ncsi_pkt_hdr *)(pkt + ETH_HLEN);
+    uint8_t ncsi_reply[ETH_HLEN + NCSI_LEN];
+    struct ethhdr *reh = (struct ethhdr *)ncsi_reply;
+    struct ncsi_rsp_pkt_hdr *rnh = (struct ncsi_rsp_pkt_hdr *)
+        (ncsi_reply + ETH_HLEN);
+
+    memset(ncsi_reply, 0, sizeof(ncsi_reply));
+
+    memset(reh->h_dest, 0xff, ETH_ALEN);
+    memset(reh->h_source, 0xff, ETH_ALEN);
+    reh->h_proto = htons(ETH_P_NCSI);
+
+    rnh->common.mc_id        = nh->mc_id;
+    rnh->common.revision     = NCSI_PKT_REVISION;
+    rnh->common.reserved     = 0;
+    rnh->common.id           = nh->id;
+    rnh->common.type         = nh->type + 0x80;
+    rnh->common.channel      = nh->channel;
+    rnh->common.length       = htons(4);
+    rnh->common.reserved1[0] = 0;
+    rnh->common.reserved1[1] = 0;
+    rnh->code         = htons(NCSI_PKT_RSP_C_COMPLETED);
+    rnh->reason       = htons(NCSI_PKT_RSP_R_NO_ERROR);
+
+    switch (nh->type) {
+    case NCSI_PKT_CMD_SMA:
+        rnh->common.length = htons(4);
+        break;
+    case NCSI_PKT_CMD_GVI:
+        rnh->common.length = htons(36);
+        break;
+    case NCSI_PKT_CMD_GC: {
+        struct ncsi_rsp_gc_pkt *rsp = (struct ncsi_rsp_gc_pkt *) rnh;
+
+        rnh->common.length = htons(32);
+        rsp->cap = htonl(~0);
+        rsp->bc_cap = htonl(~0);
+        rsp->mc_cap = htonl(~0);
+        rsp->buf_cap = htonl(~0);
+        rsp->aen_cap = htonl(~0);
+        rsp->vlan_mode = 0xff;
+        rsp->uc_cnt = 2;
+        break;
+    }
+
+    case NCSI_PKT_CMD_GLS: {
+        struct ncsi_rsp_gls_pkt *rsp = (struct ncsi_rsp_gls_pkt *) rnh;
+
+        rnh->common.length = htons(16);
+        rsp->status = htonl(0x1);
+        break;
+    }
+    default:
+        break;
+    }
+
+    slirp_output(slirp->opaque, ncsi_reply, sizeof(ncsi_reply));
+}
diff --git a/slirp/slirp.c b/slirp/slirp.c
index 6e2b4e5a9010..c445c474e7e5 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -870,6 +870,10 @@ void slirp_input(Slirp *slirp, const uint8_t *pkt, int pkt_len)
         }
         break;
 
+    case ETH_P_NCSI:
+        ncsi_input(slirp, pkt, pkt_len);
+        break;
+
     default:
         break;
     }
diff --git a/slirp/slirp.h b/slirp/slirp.h
index a1f31391341d..ef75357d4d75 100644
--- a/slirp/slirp.h
+++ b/slirp/slirp.h
@@ -292,6 +292,9 @@ int tcp_emu(struct socket *, struct mbuf *);
 int tcp_ctl(struct socket *);
 struct tcpcb *tcp_drop(struct tcpcb *tp, int err);
 
+/* ncsi.c */
+void ncsi_input(Slirp *slirp, const uint8_t *pkt, int pkt_len);
+
 #ifndef _WIN32
 #define min(x,y) ((x) < (y) ? (x) : (y))
 #define max(x,y) ((x) > (y) ? (x) : (y))
-- 
2.7.4
