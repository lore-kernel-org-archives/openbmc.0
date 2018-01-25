Return-Path: <benh@kernel.crashing.org>
Authentication-Results: ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zSJrL1pvczF0QB
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jan 2018 10:57:53 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w0PNLqku017887;
 Thu, 25 Jan 2018 17:21:54 -0600
Message-ID: <1516922512.2312.47.camel@kernel.crashing.org>
Subject: Re: [PATCH linux dev-4.13 v1 2/2] net: npcm: add NPCM7xx Ethernet
 MAC controller
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Avi Fishman <avifishman70@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 26 Jan 2018 10:21:52 +1100
In-Reply-To: <CAKKbWA7YBMnAnj7kRffQqpgQ9VaX6McC8piL+qvRQ3w8t5eovw@mail.gmail.com>
References: <1515062046-11944-1-git-send-email-tmaimon77@gmail.com>
 <1515062046-11944-3-git-send-email-tmaimon77@gmail.com>
 <CACPK8XfF51CXzjujWN-Np3V6H4maYL-7eSzFjZqkAEoi_tJcdg@mail.gmail.com>
 <1515728973.31850.84.camel@kernel.crashing.org>
 <CAKKbWA7YBMnAnj7kRffQqpgQ9VaX6McC8piL+qvRQ3w8t5eovw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.4 (3.26.4-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jan 2018 23:57:56 -0000

On Thu, 2018-01-25 at 16:19 +0200, Avi Fishman wrote:
> Hi,
> 
> Thank you Joel and Benjamin/
> My inputs also on Joel remarks, if I didn't comment I accept the comment.
> My original driver was heavily tested by our customer. I am a little
> afraid of big changes.

You will have to do them if you want a chance to get upstream.

> Can you let me kow what is a must for now, and what can be done later.

No, this is not how things work. To get upstream, you need to write a
driver that complies to the various practices for such things. The way
you do your Tx reclaim is wrong and needs to be fixed for example.

> On Fri, Jan 12, 2018 at 5:49 AM, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > On Thu, 2018-01-11 at 15:11 -0800, Joel Stanley wrote:
> > > > +#define ETH_TRIGGER_RX do { __raw_writel(ENSTART, REG_RSDR); } while (0)
> > > 
> > > Get rid of these macros.
> > > 
> > > > +#define ETH_TRIGGER_TX do { __raw_writel(ENSTART, REG_TSDR); } while (0)
> > > > +#define ETH_ENABLE_TX  do { __raw_writel(__raw_readl(REG_MCMDR) | \
> > > > +                        MCMDR_TXON, REG_MCMDR); } while (0)
> > > > +#define ETH_ENABLE_RX  do { __raw_writel(__raw_readl(REG_MCMDR) | \
> > > > +                        MCMDR_RXON, REG_MCMDR); } while (0)
> > > > +#define ETH_DISABLE_TX do { __raw_writel(__raw_readl(REG_MCMDR) & \
> > > > +                       ~MCMDR_TXON, REG_MCMDR); } while (0)
> > > > +#define ETH_DISABLE_RX do { __raw_writel(__raw_readl(REG_MCMDR) & \
> > > > +                       ~MCMDR_RXON, REG_MCMDR); } while (0)
> > 
> > 
> > Why is __raw appropriate here ? It does two things in theory (though
> > I'm not 100% familiar with the ARM semantic for your cores), one is
> > bypass endian conversion which might not be a great idea in your case,
> > and one is bypass various ordering barriers, which also looks fishy
> > unless you put explicit barriers on the call sites.
> > 
> 
> OK - it was taken from old code, we will change
> 
> > 
> > > > +struct plat_npcm7xx_emc_data {
> > > > +       char *phy_bus_name;
> > > > +       int phy_addr;
> > > > +       unsigned char mac_addr[ETH_ALEN];
> > > > +};
> > > > +
> > > > +struct npcm7xx_rxbd {
> > > > +       unsigned int sl;
> > > > +       unsigned int buffer;
> > > > +       unsigned int reserved;
> > > > +       unsigned int next;
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG_EXT
> > > > +       unsigned int diff;
> > > > +       unsigned int ts;
> > > > +       unsigned int r2;
> > > > +       unsigned int r3;
> > > > +#endif
> > > > +};
> > > > +
> > > > +struct npcm7xx_txbd {
> > > > +       unsigned int mode;   /* Ownership bit and some other bits       */
> > > > +       unsigned int buffer; /* Transmit Buffer Starting Address        */
> > > > +       unsigned int sl;     /* Transmit Byte Count and status bits     */
> > > > +       unsigned int next;   /* Next Tx Descriptor Starting Address     */
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG_EXT
> > > > +       unsigned int diff;
> > > > +       unsigned int ts;
> > > > +       unsigned int t2;
> > > > +       unsigned int t3;
> > > > +#endif
> > > > +};
> > 
> > Are the above HW descriptor definitions ? Then use the appropriate
> > endian explicit and size explicit types such as __le32.
> > 
> 
> Is it fine to use __u32 or since it is HW we should use __le32?

__le32. Also build with endian checking enabled with sparse, to check
you aren't missing the varous accessors.

> > > > +
> > > > +struct  npcm7xx_ether {
> > > > +       struct sk_buff *rx_skb[RX_DESC_SIZE];
> > > > +       struct sk_buff *tx_skb[TX_DESC_SIZE];
> > > > +       spinlock_t lock;
> > 
> > You probably don't need that lock... Most ethernet drivers with a
> > private lock dont' actually need it. It depends what you use it for
> > mind you but often, all the rx/tx path is handled by the tx queue
> > lock, and there's a mutex in the PHY structure. Those two tend to be
> > all you need.
> > 
> > I suggest you look at how I did it in the current version of ftgmac100
> > and how the reset task synchronizes with both path.
> > 
> 
> So both npcm750_ether_start_xmit() and npcm750_poll() can't run at the
> same time, even in SMP mode?

They can, I've explained why things would work as long as you are
careful. start_xmit is run with the tx lock. poll shouldn't be touching
anything that start_xmit touches, with the main excpetion being when
poll() decides to restart the queue. This is typically when you "re-
check" by taking the lock.

You should look at how other network drivers do it. I pointed you to
ftgmac100 because this is a driver I reworked recently, but there are
many others.

> What about interrupts if they are accesing some shaered resources I
> still need to protect for example REG_MIEN register writing.

Why ? A register write is atomic. 

The way things typically work is that you have *either* poll or
interrupts. On the first interrupt, you start NAPI and mask interrupts.
You only re-enable interrupts when NAPI is done.

If there's any exclusion needed, use the queue TX lock.

> > > > +       struct npcm7xx_rxbd *rdesc;
> > > > +       struct npcm7xx_txbd *tdesc;
> > > > +       dma_addr_t rdesc_phys;
> > > > +       dma_addr_t tdesc_phys;
> > > > +       struct net_device_stats stats;
> > > > +       struct platform_device *pdev;
> > > > +       struct net_device *ndev;
> > > > +       struct resource *res;
> > > > +       //struct sk_buff *skb;
> > 
> > Get rid of that :-)
> > 
> > > > +       unsigned int msg_enable;
> > > > +       struct mii_bus *mii_bus;
> > > > +       struct phy_device *phy_dev;
> > > > +       struct napi_struct napi;
> > > > +       void __iomem *reg;
> > > > +       int rxirq;
> > > > +       int txirq;
> > > > +       unsigned int cur_tx;
> > > > +       unsigned int cur_rx;
> > > > +       unsigned int finish_tx;
> > > > +       unsigned int pending_tx;
> > > > +       unsigned int start_tx_ptr;
> > > > +       unsigned int start_rx_ptr;
> > > > +       unsigned int rx_berr;
> > > > +       unsigned int rx_err;
> > > > +       unsigned int rdu;
> > > > +       unsigned int rxov;
> > > > +       unsigned int camcmr;
> > > > +       unsigned int rx_stuck;
> > > > +       int link;
> > > > +       int speed;
> > > > +       int duplex;
> > > > +       int need_reset;
> > > > +       char *dump_buf;
> > > > +
> > > > +       // debug counters
> > > > +       unsigned int max_waiting_rx;
> > > > +       unsigned int rx_count_pool;
> > > > +       unsigned int count_xmit;
> > > > +       unsigned int rx_int_count;
> > > > +       unsigned int rx_err_count;
> > > > +       unsigned int tx_int_count;
> > > > +       unsigned int tx_tdu;
> > > > +       unsigned int tx_tdu_i;
> > > > +       unsigned int tx_cp_i;
> > > > +       unsigned int count_finish;
> > > > +};
> > > > +
> > > > +static void npcm7xx_ether_set_multicast_list(struct net_device *dev);
> > > > +static int  npcm7xx_info_dump(char *buf, int count, struct net_device *dev);
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG
> > > > +static void npcm7xx_info_print(struct net_device *dev);
> > > > +#endif
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG_EXT
> > > > +void npcm7xx_clk_GetTimeStamp(u32 time_quad[2]);
> > > > +#endif
> > > 
> > > Avoid forward declarations where you can.
> 
> Do you mean to put it at the beginning?
> BTW, I will probably get rid of all CONFIG_NPCM7XX_EMC_ETH_DEBUG_EXT
> 
> > 
> > Also avoid CamelCaps
> > 
> > > > +
> > > > +static void adjust_link(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct phy_device *phydev = ether->phy_dev;
> > > > +       unsigned int val;
> > > > +       bool status_change = false;
> > > > +       unsigned long flags;
> > > > +
> > > > +       // clear GPIO interrupt status whihc indicates PHY statu change?
> > > > +
> > > > +       spin_lock_irqsave(&ether->lock, flags);
> > > > +
> > > > +       if (phydev->link) {
> > > > +               if ((ether->speed != phydev->speed) ||
> > > > +                   (ether->duplex != phydev->duplex)) {
> > > > +                       ether->speed = phydev->speed;
> > > > +                       ether->duplex = phydev->duplex;
> > > > +                       status_change = true;
> > > > +               }
> > > > +       } else {
> > > > +               ether->speed = 0;
> > > > +               ether->duplex = -1;
> > > > +       }
> > > > +
> > > > +       if (phydev->link != ether->link) {
> > > > +
> > > > +               ether->link = phydev->link;
> > > > +
> > > > +               status_change = true;
> > > > +       }
> > > > +
> > > > +       spin_unlock_irqrestore(&ether->lock, flags);
> > > > +
> > > > +       if (status_change) {
> > > > +
> > > > +               val = __raw_readl(REG_MCMDR);
> > > > +
> > > > +               if (ether->speed == 100)
> > > > +                       val |= MCMDR_OPMOD;
> > > > +               else
> > > > +                       val &= ~MCMDR_OPMOD;
> > > > +
> > > > +               if (ether->duplex == DUPLEX_FULL)
> > > > +                       val |= MCMDR_FDUP;
> > > > +               else
> > > > +                       val &= ~MCMDR_FDUP;
> > > > +
> > > > +               __raw_writel(val, REG_MCMDR);
> > > > +       }
> > > > +}
> > > > +
> > > > +
> > > > +
> > > > +static void npcm7xx_write_cam(struct net_device *dev,
> > > > +                               unsigned int x, unsigned char *pval)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       unsigned int msw, lsw;
> > > > +
> > > > +       msw = (pval[0] << 24) | (pval[1] << 16) | (pval[2] << 8) | pval[3];
> > > > +
> > > > +       lsw = (pval[4] << 24) | (pval[5] << 16);
> > > > +
> > > > +       __raw_writel(lsw, REG_CAML_BASE + x * CAM_ENTRY_SIZE);
> > > > +       __raw_writel(msw, REG_CAMM_BASE + x * CAM_ENTRY_SIZE);
> > > > +       //EMC_DEBUG("REG_CAML_BASE = 0x%08X REG_CAMH_BASE = 0x%08X", lsw, msw);
> > > 
> > > Delete commented out code before submitting.
> > > 
> > > > +}
> > > > +
> > > > +
> > > 
> > > Whitespace.
> > > 
> > > > +static struct sk_buff *get_new_skb(struct net_device *dev, u32 i)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct sk_buff *skb = dev_alloc_skb(roundup(MAX_PACKET_SIZE_W_CRC, 4));
> > > > +
> > > > +       if (skb == NULL)
> > > > +               return NULL;
> > > > +
> > > > +       /* Do not unmark the following skb_reserve() Receive Buffer Starting
> > > > +        * Address must be aligned to 4 bytes and the following line
> > > > +        * if unmarked will make it align to 2 and this likely will
> > > > +        * hult the RX and crash the linux skb_reserve(skb, NET_IP_ALIGN);
> > > > +        */
> > > > +       skb->dev = dev;
> > > > +
> > > > +       (ether->rdesc + i)->buffer = dma_map_single(&dev->dev, skb->data,
> > > > +                                                   roundup(
> > > > +                                                       MAX_PACKET_SIZE_W_CRC,
> > > > +                                                       4), DMA_FROM_DEVICE);
> > > > +       ether->rx_skb[i] = skb;
> > > > +
> > > > +       return skb;
> > > > +}
> > > > +
> > > > +static int npcm7xx_init_desc(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether;
> > > > +       struct npcm7xx_txbd  *tdesc;
> > > > +       struct npcm7xx_rxbd  *rdesc;
> > > > +       struct platform_device *pdev;
> > > > +       unsigned int i;
> > > > +
> > > > +       ether = netdev_priv(dev);
> > > > +       pdev = ether->pdev;
> > > > +
> > > > +       if (ether->tdesc == NULL) {
> > > > +               ether->tdesc = (struct npcm7xx_txbd *)
> > > > +                               dma_alloc_coherent(&pdev->dev,
> > > > +                                                  sizeof(struct npcm7xx_txbd) *
> > > > +                                                  TX_DESC_SIZE,
> > > > +                                                  &ether->tdesc_phys,
> > > > +                                                  GFP_KERNEL);
> > > > +
> > > > +               if (!ether->tdesc) {
> > > > +                       dev_err(&pdev->dev, "Failed to allocate memory for "
> > > > +                                           "tx desc\n");
> > > > +                       return -ENOMEM;
> > > > +               }
> > > > +       }
> > > > +
> > > > +       if (ether->rdesc == NULL) {
> > > > +               ether->rdesc = (struct npcm7xx_rxbd *)
> > > > +                               dma_alloc_coherent(&pdev->dev,
> > > > +                                                  sizeof(struct npcm7xx_rxbd) *
> > > > +                                                  RX_DESC_SIZE,
> > > > +                                                  &ether->rdesc_phys,
> > > > +                                                  GFP_KERNEL);
> > > > +
> > > > +               if (!ether->rdesc) {
> > > > +                       dev_err(&pdev->dev, "Failed to allocate memory for "
> > > > +                                           "rx desc\n");
> > > > +                       dma_free_coherent(&pdev->dev,
> > > > +                                         sizeof(struct npcm7xx_txbd) *
> > > > +                                         TX_DESC_SIZE, ether->tdesc,
> > > > +                                         ether->tdesc_phys);
> > > > +                       ether->tdesc = NULL;
> > > > +                       return -ENOMEM;
> > > > +               }
> > > > +       }
> > > > +
> > > > +       for (i = 0; i < TX_DESC_SIZE; i++) {
> > > > +               unsigned int offset;
> > > > +
> > > > +               tdesc = (ether->tdesc + i);
> > > > +
> > > > +               if (i == TX_DESC_SIZE - 1)
> > > > +                       offset = 0;
> > > > +               else
> > > > +                       offset = sizeof(struct npcm7xx_txbd) * (i + 1);
> > > > +
> > > > +               tdesc->next = ether->tdesc_phys + offset;
> > > > +               tdesc->buffer = (unsigned int)NULL;
> > > > +               tdesc->sl = 0;
> > > > +               tdesc->mode = 0;
> > > > +       }
> > > > +
> > > > +       ether->start_tx_ptr = ether->tdesc_phys;
> > > > +
> > > > +       for (i = 0; i < RX_DESC_SIZE; i++) {
> > > > +               unsigned int offset;
> > > > +
> > > > +               rdesc = (ether->rdesc + i);
> > > > +
> > > > +               if (i == RX_DESC_SIZE - 1)
> > > > +                       offset = 0;
> > > > +               else
> > > > +                       offset = sizeof(struct npcm7xx_rxbd) * (i + 1);
> > > > +
> > > > +               rdesc->next = ether->rdesc_phys + offset;
> > > > +               rdesc->sl = RX_OWEN_DMA;
> > > > +
> > > > +               if (get_new_skb(dev, i) == NULL) {
> > > > +                       dev_err(&pdev->dev, "get_new_skb() failed\n");
> > > > +
> > > > +                       for (; i != 0; i--) {
> > > > +                               dma_unmap_single(&dev->dev, (dma_addr_t)
> > > > +                                                ((ether->rdesc + i)->buffer),
> > > > +                                                roundup(MAX_PACKET_SIZE_W_CRC,
> > > > +                                                        4), DMA_FROM_DEVICE);
> > > > +                               dev_kfree_skb_any(ether->rx_skb[i]);
> > > > +                               ether->rx_skb[i] = NULL;
> > > > +                       }
> > > > +
> > > > +                       dma_free_coherent(&pdev->dev,
> > > > +                                         sizeof(struct npcm7xx_txbd) *
> > > > +                                         TX_DESC_SIZE,
> > > > +                                         ether->tdesc, ether->tdesc_phys);
> > > > +                       dma_free_coherent(&pdev->dev,
> > > > +                                         sizeof(struct npcm7xx_rxbd) *
> > > > +                                         RX_DESC_SIZE,
> > > > +                                         ether->rdesc, ether->rdesc_phys);
> > > > +
> > > > +                       return -ENOMEM;
> > > > +               }
> > > > +       }
> > > > +
> > > > +       ether->start_rx_ptr = ether->rdesc_phys;
> > > > +       wmb();
> > > > +       for (i = 0; i < TX_DESC_SIZE; i++)
> > > > +               ether->tx_skb[i] = NULL;
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +// This API must call with Tx/Rx stopped
> > > 
> > > C style comments /* foo */
> > 
> > I would split things a bit. See ftgmac100. Also I would keep a scratch
> > pad to point RX to if you fail to allocate a packet in the rx path.
> 
> Do you mean that in error cases I should do somthing like 'goto free
> tdesc;' so the error cases will be at the end?

No, what I mean is that if you cannot allocate a RX buffer for that
ring entry, don't leaeve the descriptor stale, instead point it to some
scratch page so the HW has somewhere safe to write to. This is useful
when doing the dynamic reallocation of skbs in the RX path as it can be
that under memory pressure, you occasionally fail to allocate an skb. 
> > > 
> > > > +static void npcm7xx_free_desc(struct net_device *dev, bool free_also_descriptors)
> > > > +{
> > > > +       struct sk_buff *skb;
> > > > +       u32 i;
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct platform_device *pdev = ether->pdev;
> > > > +
> > > > +       for (i = 0; i < TX_DESC_SIZE; i++) {
> > > > +               skb = ether->tx_skb[i];
> > > > +               if (skb != NULL) {
> > > > +                       dma_unmap_single(&dev->dev, (dma_addr_t)((ether->tdesc +
> > > > +                                                                 i)->buffer),
> > > > +                                        skb->len, DMA_TO_DEVICE);
> > > > +                       dev_kfree_skb_any(skb);
> > > > +                       ether->tx_skb[i] = NULL;
> > > > +               }
> > > > +       }
> > > > +
> > > > +       for (i = 0; i < RX_DESC_SIZE; i++) {
> > > > +               skb = ether->rx_skb[i];
> > > > +               if (skb != NULL) {
> > > > +                       dma_unmap_single(&dev->dev, (dma_addr_t)((ether->rdesc +
> > > > +                                                                  i)->buffer),
> > > > +                                        roundup(MAX_PACKET_SIZE_W_CRC, 4),
> > > > +                                        DMA_FROM_DEVICE);
> > > > +                       dev_kfree_skb_any(skb);
> > > > +                       ether->rx_skb[i] = NULL;
> > > > +               }
> > > > +       }
> > > > +
> > > > +       if (free_also_descriptors) {
> > > > +               if (ether->tdesc)
> > > > +                       dma_free_coherent(&pdev->dev,
> > > > +                                         sizeof(struct npcm7xx_txbd) *
> > > > +                                         TX_DESC_SIZE,
> > > > +                                         ether->tdesc, ether->tdesc_phys);
> > > > +               ether->tdesc = NULL;
> > > > +
> > > > +               if (ether->rdesc)
> > > > +                       dma_free_coherent(&pdev->dev,
> > > > +                                         sizeof(struct npcm7xx_rxbd) *
> > > > +                                         RX_DESC_SIZE,
> > > > +                                         ether->rdesc, ether->rdesc_phys);
> > > > +               ether->rdesc = NULL;
> > > > +       }
> > > > +
> > > > +}
> > > > +
> > > > +static void npcm7xx_set_fifo_threshold(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       unsigned int val;
> > > > +
> > > > +       val = RXTHD | TXTHD | BLENGTH;
> > > > +       __raw_writel(val, REG_FFTCR);
> > > > +}
> > > > +
> > > > +static void npcm7xx_return_default_idle(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       unsigned int val;
> > > > +       unsigned int saved_bits;
> > > > +
> > > > +       val = __raw_readl(REG_MCMDR);
> > > > +       saved_bits = val & (MCMDR_FDUP | MCMDR_OPMOD);
> > > > +       //EMC_DEBUG("REG_MCMDR = 0x%08X\n", val);
> > > > +       val |= SWR;
> > > > +       __raw_writel(val, REG_MCMDR);
> > > > +
> > > > +       /* During the EMC reset the AHB will read 0 from all registers,
> > > > +        * so in order to see if the reset finished we can't count on
> > > > +        * REG_MCMDR.SWR to become 0, instead we read another
> > > > +        * register that its reset value is not 0, we choos REG_FFTCR.
> > > > +        */
> > > > +       do {
> > > > +               val = __raw_readl(REG_FFTCR);
> > > > +       } while (val == 0);
> > > > +
> > > > +       // Now we can verify if REG_MCMDR.SWR became 0 (probably it will be 0 on the first read).
> > > > +       do {
> > > > +               val = __raw_readl(REG_MCMDR);
> > > > +       } while (val & SWR);
> > > > +
> > > > +       //EMC_DEBUG("REG_MCMDR = 0x%08X\n", val);
> > > > +       // restore values
> > > > +       __raw_writel(saved_bits, REG_MCMDR);
> > > > +}
> > > > +
> > > > +
> > > > +static void npcm7xx_enable_mac_interrupt(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       unsigned int val;
> > > > +
> > > > +       val =   ENRXINTR |  // Start of RX interrupts
> > > > +               ENCRCE   |
> > > > +               EMRXOV   |
> > > > +#ifndef VLAN_SUPPORT
> > > > +               ENPTLE   |  // Since we don't support VLAN we want interrupt on long packets
> > > > +#endif
> > > > +               ENRXGD   |
> > > > +               ENALIE   |
> > > > +               ENRP     |
> > > > +               ENMMP    |
> > > > +               ENDFO    |
> > > > +               /*   ENDENI   |  */  // We don't need interrupt on DMA Early Notification
> > > > +               ENRDU    |    // We don't need interrupt on Receive Descriptor Unavailable Interrupt
> > > > +               ENRXBERR |
> > > > +               /*   ENCFR    |  */
> > > > +               ENTXINTR |  // Start of TX interrupts
> > > > +               ENTXEMP  |
> > > > +               ENTXCP   |
> > > > +               ENTXDEF  |
> > > > +               ENNCS    |
> > > > +               ENTXABT  |
> > > > +               ENLC     |
> > > > +               /* ENTDU    |  */  // We don't need interrupt on Transmit Descriptor Unavailable at start of operation
> > > > +               ENTXBERR;
> > > > +       __raw_writel(val, REG_MIEN);
> > > > +}
> > > > +
> > > > +static void npcm7xx_get_and_clear_int(struct net_device *dev,
> > > > +                                                       unsigned int *val, unsigned int mask)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +
> > > > +       *val = __raw_readl(REG_MISTA) & mask;
> > > > +       __raw_writel(*val, REG_MISTA);
> > > > +}
> > > > +
> > > > +static void npcm7xx_set_global_maccmd(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       unsigned int val;
> > > > +
> > > > +       val = __raw_readl(REG_MCMDR);
> > > > +    //EMC_DEBUG("REG_MCMDR = 0x%08X\n", val);
> > > > +
> > > > +       val |= MCMDR_SPCRC | MCMDR_ENMDC | MCMDR_ACP | MCMDR_NDEF;
> > > > +#ifdef VLAN_SUPPORT
> > > > +    // we set ALP accept long packets since VLAN packets are 4 bytes longer than 1518
> > > > +       val |= MCMDR_ALP;
> > > > +    // limit receive length to 1522 bytes due to VLAN
> > > > +       __raw_writel(MAX_PACKET_SIZE_W_CRC, REG_DMARFC);
> > > > +#endif
> > > > +       __raw_writel(val, REG_MCMDR);
> > > > +}
> > > > +
> > > > +static void npcm7xx_enable_cam(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       unsigned int val;
> > > > +
> > > > +       npcm7xx_write_cam(dev, CAM0, dev->dev_addr);
> > > > +
> > > > +       val = __raw_readl(REG_CAMEN);
> > > > +       val |= CAM0EN;
> > > > +       __raw_writel(val, REG_CAMEN);
> > > > +}
> > > > +
> > > > +
> > > > +static void npcm7xx_set_curdest(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +
> > > > +       __raw_writel(ether->start_rx_ptr, REG_RXDLSA);
> > > > +       __raw_writel(ether->start_tx_ptr, REG_TXDLSA);
> > > > +}
> > > > +
> > > > +static void npcm7xx_reset_mac(struct net_device *dev, int need_free)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +
> > > > +       netif_tx_lock(dev);
> > > > +
> > > > +       ETH_DISABLE_TX;
> > > > +       ETH_DISABLE_RX;
> > > > +
> > > > +       npcm7xx_return_default_idle(dev);
> > > > +       npcm7xx_set_fifo_threshold(dev);
> > > > +
> > > > +       /*if (!netif_queue_stopped(dev))
> > > > +               netif_stop_queue(dev);*/
> > > > +
> > > > +       if (need_free)
> > > > +               npcm7xx_free_desc(dev, false);
> > > > +
> > > > +       npcm7xx_init_desc(dev);
> > > > +
> > > > +       //dev->trans_start = jiffies; /* prevent tx timeout */
> > > 
> > > Remove commented out code.
> > > 
> > > > +       ether->cur_tx = 0x0;
> > > > +       ether->finish_tx = 0x0;
> > > > +       ether->pending_tx = 0x0;
> > > > +       ether->cur_rx = 0x0;
> > > > +       ether->tx_tdu = 0;
> > > > +       ether->tx_tdu_i = 0;
> > > > +       ether->tx_cp_i = 0;
> > > > +
> > > > +       npcm7xx_set_curdest(dev);
> > > > +       npcm7xx_enable_cam(dev);
> > > > +       npcm7xx_ether_set_multicast_list(dev);
> > > > +       npcm7xx_enable_mac_interrupt(dev);
> > > > +       npcm7xx_set_global_maccmd(dev);
> > > > +       ETH_ENABLE_TX;
> > > > +       ETH_ENABLE_RX;
> > > > +
> > > > +       ETH_TRIGGER_RX;
> > > > +
> > > > +       //dev->trans_start = jiffies; /* prevent tx timeout */
> > > > +
> > > > +       /*if (netif_queue_stopped(dev))
> > > > +               netif_wake_queue(dev);*/
> > > > +
> > > > +       //EMC_DEBUG("REG_MCMDR = 0x%08X\n", __raw_readl(REG_MCMDR));
> > > 
> > > Remove this.
> > > 
> > > > +
> > > > +       ether->need_reset = 0;
> > > > +
> > > > +       netif_wake_queue(dev);
> > > > +       netif_tx_unlock(dev);
> > > > +}
> > > > +
> > > > +static int npcm7xx_mdio_write(struct mii_bus *bus, int phy_id, int regnum,
> > > > +               u16 value)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = bus->priv;
> > > > +       unsigned long timeout = jiffies + msecs_to_jiffies(MII_TIMEOUT * 100);
> > > > +
> > > > +       __raw_writel(value,  REG_MIID);
> > > > +       __raw_writel((phy_id << 0x08) | regnum | PHYBUSY | PHYWR,  REG_MIIDA);
> > > > +
> > > > +
> > > > +       /* Wait for completion */
> > > > +       while (__raw_readl(REG_MIIDA) & PHYBUSY) {
> > > > +               if (time_after(jiffies, timeout)) {
> > > > +                       EMC_DEBUG("mdio read timed out\n"
> > > > +                                          "ether->reg = 0x%x phy_id=0x%x "
> > > > +                                          "REG_MIIDA=0x%x\n",
> > > > +                                 (unsigned int)ether->reg, phy_id
> > > > +                                 , __raw_readl(REG_MIIDA));
> > > > +                       return -ETIMEDOUT;
> > > > +               }
> > > > +               cpu_relax();
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +
> > > > +}
> > > > +
> > > > +static int npcm7xx_mdio_read(struct mii_bus *bus, int phy_id, int regnum)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = bus->priv;
> > > > +       unsigned long timeout = jiffies + msecs_to_jiffies(MII_TIMEOUT * 100);
> > > > +
> > > > +
> > > > +       __raw_writel((phy_id << 0x08) | regnum | PHYBUSY,  REG_MIIDA);
> > > > +
> > > > +       /* Wait for completion */
> > > > +       while (__raw_readl(REG_MIIDA) & PHYBUSY) {
> > > > +               if (time_after(jiffies, timeout)) {
> > > > +                       EMC_DEBUG("mdio read timed out\n"
> > > > +                                          "ether->reg = 0x%x phy_id=0x%x "
> > > > +                                          "REG_MIIDA=0x%x\n",
> > > > +                                 (unsigned int)ether->reg, phy_id
> > > > +                                 , __raw_readl(REG_MIIDA));
> > > > +                       return -ETIMEDOUT;
> > > > +               }
> > > > +               cpu_relax();
> > > > +       }
> > > > +
> > > > +       return __raw_readl(REG_MIID);
> > > > +}
> > > > +
> > > > +static int npcm7xx_mdio_reset(struct mii_bus *bus)
> > > > +{
> > > > +
> > > > +       // reser ENAC engine??
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int npcm7xx_set_mac_address(struct net_device *dev, void *addr)
> > > > +{
> > > > +       struct sockaddr *address = addr;
> > > > +
> > > > +       if (!is_valid_ether_addr((u8 *)address->sa_data))
> > > > +               return -EADDRNOTAVAIL;
> > > > +
> > > > +       memcpy(dev->dev_addr, address->sa_data, dev->addr_len);
> > > > +       npcm7xx_write_cam(dev, CAM0, dev->dev_addr);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int npcm7xx_ether_close(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +
> > > > +       if (ether->phy_dev)
> > > > +               phy_stop(ether->phy_dev);
> > > > +
> > > > +       npcm7xx_return_default_idle(dev);
> > > > +
> > > > +       msleep(10);
> > > > +
> > > > +       free_irq(ether->txirq, dev);
> > > > +       free_irq(ether->rxirq, dev);
> > > > +
> > > > +       netif_stop_queue(dev);
> > > > +       napi_disable(&ether->napi);
> > > > +
> > > > +       npcm7xx_free_desc(dev, true);
> > > > +
> > > > +       if (ether->dump_buf) {
> > > > +               kfree(ether->dump_buf);
> > > > +               ether->dump_buf = NULL;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static struct net_device_stats *npcm7xx_ether_stats(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether;
> > > > +
> > > > +       ether = netdev_priv(dev);
> > > > +
> > > > +       return &ether->stats;
> > > > +}
> > > > +
> > > > +
> > > > +static int npcm7xx_clean_tx(struct net_device *dev, bool from_xmit)
> > > > +{
> > 
> > This should be done from NAPI, see below or see other drivers.
> 
> I am calling this both from napi and from the xmit since there are
> cases that I miss the tx interrupt (due to HW issue) and nobady will
> clear the pending_tx counter so for xmit I also check to clean those

Under what precise circumstances do you miss the TX interrupts ? You
should just do it only in NAPI anyway, worst case, if you are in start
_xmit and think reclaim is necessary, you can restart NAPI.

> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct npcm7xx_txbd *txbd;
> > > > +       struct sk_buff *s;
> > > > +       unsigned int cur_entry, entry, sl;
> > > > +
> > > > +       if (ether->pending_tx == 0)
> > > > +               return (0);
> > > > +
> > > > +       cur_entry = __raw_readl(REG_CTXDSA);
> > > > +
> > > > +       // Release old used buffers
> > > > +       entry = ether->tdesc_phys + sizeof(struct npcm7xx_txbd) *
> > > > +               (ether->finish_tx);
> > > > +
> > > > +       while (entry != cur_entry) {
> > > > +               txbd = (ether->tdesc + ether->finish_tx);
> > > > +               s = ether->tx_skb[ether->finish_tx];
> > > > +               if (s == NULL)
> > > > +                       break;
> > > > +
> > > > +               ether->count_finish++;
> > > > +
> > > > +               dma_unmap_single(&dev->dev, txbd->buffer, s->len,
> > > > +                                DMA_TO_DEVICE);
> > > > +               consume_skb(s);
> > > > +               ether->tx_skb[ether->finish_tx] = NULL;
> > > > +
> > > > +               if (++ether->finish_tx >= TX_DESC_SIZE)
> > > > +                       ether->finish_tx = 0;
> > > > +               ether->pending_tx--;
> > > > +
> > > > +               sl = txbd->sl;
> > > > +               if (sl & TXDS_TXCP) {
> > > > +                       ether->stats.tx_packets++;
> > > > +                       ether->stats.tx_bytes += (sl & 0xFFFF);
> > > > +               } else {
> > > > +                       ether->stats.tx_errors++;
> > > > +               }
> > > > +
> > > > +               entry = ether->tdesc_phys + sizeof(struct npcm7xx_txbd) *
> > > > +                       (ether->finish_tx);
> > > > +       }
> > > > +
> > > > +       if (!from_xmit && unlikely(netif_queue_stopped(dev) &&
> > > > +                                  (TX_DESC_SIZE - ether->pending_tx) > 1)) {
> > > > +               netif_tx_lock(dev);
> > > > +               if (netif_queue_stopped(dev) &&
> > > > +                   (TX_DESC_SIZE - ether->pending_tx) > 1) {
> > > > +                       netif_wake_queue(dev);
> > > > +               }
> > > > +               netif_tx_unlock(dev);
> > > > +       }
> > > > +
> > > > +       return(0);
> > > > +}
> > > > +
> > > > +static int npcm7xx_ether_start_xmit(struct sk_buff *skb, struct net_device *dev)
> > > > +{
> > > >       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct npcm7xx_txbd *txbd;
> > > > +       unsigned long flags;
> > > > +
> > > > +       /* This is a hard error log it. */
> > > > +       if (ether->pending_tx >= (TX_DESC_SIZE-1)) {
> > > > +               dev_err(&ether->pdev->dev, "%s: BUG! Tx Ring full when queue "
> > > > +                                          "awake!\n", dev->name);
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG
> > > > +               npcm7xx_info_print(dev);
> > > > +#endif
> > > > +               netif_stop_queue(dev);
> > > > +               return NETDEV_TX_BUSY;
> > > > +       }
> > 
> > Did it ever happen ? Most drivers don't check that these days, it would
> > be a pretty gross SW bug.
> 
> It happend in the past maybe due to SW bug, indeed for a long time I
> didn't see it, I will remove.
> 
> > 
> > > > +       ether->count_xmit++;
> > 
> > You are duplicating existing counters here...
> 
> ether->count_xmit is a debug counter that always counts up and only
> clears after I print it.

I wouldn't keep these things in a release of the driver.

> > > > +    // Insert new buffer
> > > > +
> > > > +       txbd = (ether->tdesc + ether->cur_tx);
> > > > +
> > > > +       txbd->buffer = dma_map_single(&dev->dev, skb->data,
> > > > +                                     skb->len, DMA_TO_DEVICE);
> > > > +
> > > > +       ether->tx_skb[ether->cur_tx]  = skb;
> > 
> > You're HW can't do fragmented tx ? That's unfortunate as it will kill
> > performance. What about HW checksum ? VLAN injection ?
> 
> If fragmants meaning issuing an interrupt only on the last fragment
> than we can support (as said due to HW issue in rare cases we miss
> that interrupt)
> It does the checsum see CRCMODE bit below, no VLAN injection by HW
> (actually I am not sure what it is).

No, what I mean is if the packet can be sent using multiple
descriptors. As it is, your driver forces the nextwork stack to
linearize the packet into a single skb, which slows things down a lot.

If you support fragmented sends (aka scatter gather), then you can set
the NETIF_SG flag and you'll get fragmented packets in start_xmit. The
main skb will have typically the header and the frags will point to the
pages where the packet data is.
> 
> > 
> > > > +       if (skb->len > MAX_PACKET_SIZE)
> > > > +               dev_err(&ether->pdev->dev, "skb->len (= %d) > MAX_PACKET_SIZE "
> > > > +                                          "(= %d)\n", skb->len,
> > > > +                       MAX_PACKET_SIZE);
> > > > +
> > > > +       txbd->sl = skb->len > MAX_PACKET_SIZE ? MAX_PACKET_SIZE : skb->len;
> > > > +       wmb();
> > > > +
> > > > +       txbd->mode = TX_OWEN_DMA | PADDINGMODE | CRCMODE;
> > > > +       wmb();
> > 
> > Do you need two wmb's ? I would think all you need is one dma_wmb()
> > before setting the OWN (not OWEN !) bit. If you don't use the __raw
> > accessors you should be fine.
> 
> I guess you are right if I will remove the __raw.
> 
> > 
> > > > +       ETH_TRIGGER_TX;
> > > > +
> > > > +       if (++ether->cur_tx >= TX_DESC_SIZE)
> > > > +               ether->cur_tx = 0;
> > > > +       spin_lock_irqsave(&ether->lock, flags);
> > 
> > Why the lock ? The network stack is holding a tx lock for you
> 
> Here for example I want to protect ether->pending_tx and
> ether->finish_tx, if you are sure that the napi poll and the xmit
> can't run in parallel, I can remove that.

They can and you do't need to protect, in part because you shouldn't be
doing reclaim in start_xmit. You should do reclaim ony from NAPI which
means that you have a clean consumer/producer model and the lock is
only necessary in the edge condition when you try to restart the queue
from the relaim path.

> I will still need to protect with lock resources that are changed both
> by interrupt and non-interrupt code.

No. Mostly you don't. As I said, look at other drivers.

> I see that  your driver at 4.10 you still had locks, are you sure that
> network stack tx lock also locked the poll in 4.10?

Look at upstream. The only lock taken here is the queue TX lock and
only in very specific circumstances.

> > 
> > > > +       ether->pending_tx++;
> > > > +
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG_EXT
> > > > +       {
> > > > +               static u32 last_iUsCnt1[2] = {0};
> > > > +               u32 iUsCnt2[2];
> > > > +
> > > > +               //spin_lock_irqsave(&ether->lock, flags);
> > > > +               npcm7xx_clk_GetTimeStamp(iUsCnt2);
> > > > +               //pin_unlock_irqrestore(&ether->lock, flags);
> > > > +               txbd->diff =  (_1MHz_ * (iUsCnt2[1] - last_iUsCnt1[1])) +
> > > > +                       iUsCnt2[0]/25 - last_iUsCnt1[0]/25;
> > > > +               txbd->ts =  (_1MHz_ * iUsCnt2[1]) + iUsCnt2[0]/25;
> > > > +               txbd->t2 = __raw_readl(REG_MISTA);
> > > > +               txbd->t3 = __raw_readl(REG_MIEN);
> > > > +               last_iUsCnt1[0] = iUsCnt2[0];
> > > > +               last_iUsCnt1[1] = iUsCnt2[1];
> > > > +       }
> > > > +#endif
> > > > +
> > > > +       npcm7xx_clean_tx(dev, true);
> > 
> > Why there ? TX cleaning should be done from NAPI only.
> 
> See above my comment on missed interrupts.
> 
> > 
> > > > +       if (ether->pending_tx >= TX_DESC_SIZE-1) {
> > > > +               unsigned int reg_mien;
> > > > +               unsigned int index_to_wake = ether->cur_tx + (TX_DESC_SIZE*3/4);
> > > > +
> > > > +               if (index_to_wake >= TX_DESC_SIZE)
> > > > +                       index_to_wake -= TX_DESC_SIZE;
> > 
> > Does it help at all to have that hysteresis on wakes ? If the cleaning
> > is done from NAPI as it should be you'll already be cleanning up in
> > bulks, so that doesn't look necessary.
> 
> What if there is a storm of TX before the NAPI will be scheduled, I am
> setting interrupt here to make ?

Sorry I'm not sure I understand what you mean. I don't see other
drivers needing the above, I would check things without it first and
only add that sort of mechanism if you can observe a problem. NAPI
should schedule fast enough, you should be masking the interrupt after
it occurs for the first time anyway.
> > 
> > > > +               txbd = (ether->tdesc + index_to_wake);
> > > > +               txbd->mode = TX_OWEN_DMA | PADDINGMODE | CRCMODE | MACTXINTEN;
> > > > +               wmb();
> > 
> > This is very fishy and allegedly racy.
> > 
> > Why can't you just turn TX interrupts off when doing NAPI and simply
> > keep NAPI going as long as either TX or RX isn't complete ?
> 
> Maybe I am missing somthing:
> Isn't the NAPI made for RX, for TX I can continue transmit untill I
> have no room and then only wait for interrupts that will inform me
> that I have new room for new packets.

No, this is very inefficient. You should be doing TX reclaim from NAPI
as well.

> Here I am stopping the transmit when I see that the pending transmits
> are becomming full, and also enable the TDU that triggers an interrupt
> when all packets had transmitted due to the HW issue that I might miss
> the last packet interrupt.
> 
> > 
> > > > +               __raw_writel(MISTA_TDU, REG_MISTA); // Clear TDU interrupt
> > > > +               reg_mien = __raw_readl(REG_MIEN);
> > > > +
> > > > +               if (reg_mien != 0)
> > > > +                       __raw_writel(reg_mien | ENTDU, REG_MIEN); // Enable TDU interrupt
> > > > +
> > > > +               ether->tx_tdu++;
> > > > +               netif_stop_queue(dev);
> > 
> > Once you remove your custom lock you need to use a construct like this
> > (from ftgmac100 but a lot of drivers do the same):
> > 
> > 
> >         /* If there isn't enough room for all the fragments of a new packet
> >          * in the TX ring, stop the queue. The sequence below is race free
> >          * vs. a concurrent restart in ftgmac100_poll()
> >          */
> >         if (unlikely(ftgmac100_tx_buf_avail(priv) < TX_THRESHOLD)) {
> >                 netif_stop_queue(netdev);
> >                 /* Order the queue stop with the test below */
> >                 smp_mb();
> >                 if (ftgmac100_tx_buf_avail(priv) >= TX_THRESHOLD)
> >                         netif_wake_queue(netdev);
> >         }
> > 
> > On the NAPI side, you need to take the tx queue lock.
> 
> Isn't my code is quite the same? I am calling netif_stop_queue() when
> getting full and in clean_tx() that is called from napi poll I am
> calling netif_wake_queue() (note that in that case only if the
> clean_tx() is called from poll, if it is called from xmit() I am not
> calling netif_wake_queue())

Yes but you need to handle the races. Drop your lock and handle the
races as shown above.

> > 
> > > > +       }
> > > > +
> > > > +       spin_unlock_irqrestore(&ether->lock, flags);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static irqreturn_t npcm7xx_tx_interrupt(int irq, void *dev_id)
> > > > +{
> > > > +       struct npcm7xx_ether *ether;
> > > > +       struct platform_device *pdev;
> > > > +       struct net_device *dev;
> > > > +       unsigned int status;
> > > > +       unsigned long flags;
> > > > +
> > > > +       dev = dev_id;
> > > > +       ether = netdev_priv(dev);
> > > > +       pdev = ether->pdev;
> > > > +
> > > > +       spin_lock_irqsave(&ether->lock, flags);
> > > > +       npcm7xx_get_and_clear_int(dev, &status, 0xFFFF0000);
> > > > +       spin_unlock_irqrestore(&ether->lock, flags);
> > 
> > I would handle all interrupts from the NAPI code. Lock is pointless.
> > 
> 
> Indeed I can remove the lock here since the status register is write 1
> to cleare.
> > For reset, schedule a reset task like ftgmac100 or sungem (or many
> > other drivers).
> 
> I see in ftgmac100 that it also does: priv->need_mac_restart = true;

This is specific to ftgmac to workaround a HW bug. We restart the MAC
when it hits an overflow condition.
> 
> > 
> > Also move the interrupt handler before the NAPI code, it's clearer that
> > way.
> 
> OK
> 
> > 
> > > > +       ether->tx_int_count++;
> > > > +
> > > > +       if (status & MISTA_EXDEF)
> > > > +               dev_err(&pdev->dev, "emc defer exceed interrupt status=0x%08X\n"
> > > > +                       , status);
> > > > +       else if (status & MISTA_TXBERR) {
> > > > +               dev_err(&pdev->dev, "emc bus error interrupt status=0x%08X\n",
> > > > +                       status);
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG
> > > > +               npcm7xx_info_print(dev);
> > > > +#endif
> > > > +               spin_lock_irqsave(&ether->lock, flags);
> > > > +               __raw_writel(0, REG_MIEN); // disable any interrupt
> > > > +               spin_unlock_irqrestore(&ether->lock, flags);
> > > > +               ether->need_reset = 1;
> > > > +       } else if (status & ~(MISTA_TXINTR | MISTA_TXCP | MISTA_TDU))
> > > > +               dev_err(&pdev->dev, "emc other error interrupt status=0x%08X\n",
> > > > +                       status);
> > > > +
> > > > +    // if we got MISTA_TXCP | MISTA_TDU remove those interrupt and call napi
> > > > +       if (status & (MISTA_TXCP | MISTA_TDU) & __raw_readl(REG_MIEN)) {
> > > > +               unsigned int reg_mien;
> > > > +
> > > > +               spin_lock_irqsave(&ether->lock, flags);
> > > > +               reg_mien = __raw_readl(REG_MIEN);
> > > > +               if (reg_mien & ENTDU)
> > > > +                       __raw_writel(reg_mien & (~ENTDU), REG_MIEN); // Disable TDU interrupt
> > > > +
> > > > +               spin_unlock_irqrestore(&ether->lock, flags);
> > > > +
> > > > +               if (status & MISTA_TXCP)
> > > > +                       ether->tx_cp_i++;
> > > > +               if (status & MISTA_TDU)
> > > > +                       ether->tx_tdu_i++;
> > > > +       } else
> > > > +               EMC_DEBUG("status=0x%08X\n", status);
> > > > +
> > > > +       napi_schedule(&ether->napi);
> > 
> > _irqoff
> 
> OK
> 
> > 
> > > > +       return IRQ_HANDLED;
> > > > +}
> > > > +
> > > > +static int npcm7xx_poll(struct napi_struct *napi, int budget)
> > > > +{
> > > > +       struct npcm7xx_ether *ether =
> > > > +               container_of(napi, struct npcm7xx_ether, napi);
> > > > +       struct npcm7xx_rxbd *rxbd;
> > > > +       struct net_device *dev = ether->ndev;
> > > > +       struct platform_device *pdev = ether->pdev;
> > > > +       struct sk_buff *skb, *s;
> > > > +       unsigned int length, status;
> > > > +       unsigned long flags;
> > > > +       int rx_cnt = 0;
> > > > +       int complete = 0;
> > > > +       unsigned int rx_offset = (__raw_readl(REG_CRXDSA) -
> > > > +                                 ether->start_rx_ptr)/
> > > > +                               sizeof(struct npcm7xx_txbd);
> > > > +       unsigned int local_count = (rx_offset >= ether->cur_rx) ?
> > > > +               rx_offset - ether->cur_rx : rx_offset +
> > > > +               RX_DESC_SIZE - ether->cur_rx;
> > > > +
> > > > +       if (local_count > ether->max_waiting_rx)
> > > > +               ether->max_waiting_rx = local_count;
> > > > +
> > > > +       if (local_count > (4*RX_POLL_SIZE))
> > > > +               // we are porbably in a storm of short packets and we don't want to get
> > > > +               // into RDU since short packets in RDU cause many RXOV which may cause
> > > > +               // EMC halt, so we filter out all comming packets
> > > > +               __raw_writel(0, REG_CAMCMR);
> > 
> > -ETOOMANYACRONYMS. Please explain.
> 
> Due to HW issue I want to avoid getting RDU, Recieve Descriptor
> Unavalable, since it cause a lot of RX overrun interrupts, so I block
> accepting new packets

I'm not sure how that helps other than kill traffic if you have a lot
of genuine short packtes. In general, if the driver is working properly
it shouldn't hit overruns anyway.

I'd say leave that out for now, and if you really have a problem with
RXOV, we can look into working around it differently.
> > 
> > > > +       if (local_count <= budget)
> > > > +               // we can restore accepting of packets
> > > > +               __raw_writel(ether->camcmr, REG_CAMCMR);
> > 
> > Not now. At the end, and only if you are also done with TX reclaims.
> 
> I blocked any RX and I have in my chain less than 'budget' of packets,
> I want to renew the recieving of packets as soon as possible.
> > 
> > > > +       spin_lock_irqsave(&ether->lock, flags);
> > 
> > Lock is pointless
> 
> Again, clean_tx is called in 2 places and has shared resources.
> > 
> > > > +       npcm7xx_clean_tx(dev, false);
> > > > +       spin_unlock_irqrestore(&ether->lock, flags);
> > > > +
> > > > +       rxbd = (ether->rdesc + ether->cur_rx);
> > > > +
> > > > +       while (rx_cnt < budget) {
> > 
> > Move the RX reclaim to a separate function.
> 
> OK
> 
> > 
> > > > +               status = rxbd->sl;
> > > > +               if ((status & RX_OWEN_DMA) == RX_OWEN_DMA) {
> > > > +                       complete = 1;
> > > > +                       break;
> > > > +               }
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG_EXT
> > > > +               {
> > > > +                       static u32 last_iUsCnt1[2] = {0};
> > > > +                       u32 iUsCnt2[2];
> > > > +
> > > > +                       spin_lock_irqsave(&ether->lock, flags);
> > > > +                       npcm7xx_clk_GetTimeStamp(iUsCnt2);
> > > > +                       spin_unlock_irqrestore(&ether->lock, flags);
> > > > +                       rxbd->diff = ((rx_cnt+1)<<28) +
> > > > +                               (_1MHz_ * (iUsCnt2[1] - last_iUsCnt1[1])) +
> > > > +                               iUsCnt2[0]/25 - last_iUsCnt1[0]/25;
> > > > +                       rxbd->ts =  (_1MHz_ * iUsCnt2[1]) + iUsCnt2[0]/25;
> > > > +                       last_iUsCnt1[0] = iUsCnt2[0];
> > > > +                       last_iUsCnt1[1] = iUsCnt2[1];
> > > 
> > > This chunk needs reworking.
> > 
> > Just remove that gunk.
> 
> I will remove the CONFIG_NPCM7XX_EMC_ETH_DEBUG_EXT code
> > 
> > > > +               }
> > > > +#endif
> > > > +               rxbd->reserved = status; // for debug puposes we save the previous value
> > > > +               s = ether->rx_skb[ether->cur_rx];
> > > > +               length = status & 0xFFFF;
> > > > +
> > > > +#ifdef VLAN_SUPPORT
> > > 
> > > Remove these guards.
> > > 
> > > Is there a reason you can't have vlan always enabled?
> > > 
> > > > +               if (likely((status & (RXDS_RXGD|RXDS_CRCE|RXDS_ALIE|RXDS_RP))
> > > > +                          == RXDS_RXGD) && likely(length <= MAX_PACKET_SIZE)) {
> > > > +#else
> > > > +               if (likely((status & (RXDS_RXGD|RXDS_CRCE|RXDS_ALIE|RXDS_RP
> > > > +                                     |RXDS_PTLE)) == RXDS_RXGD) &&
> > > > +                   likely(length <= MAX_PACKET_SIZE)) {
> > > > +#endif
> > > > +                       dma_unmap_single(&dev->dev, (dma_addr_t)rxbd->buffer,
> > > > +                                        roundup(MAX_PACKET_SIZE_W_CRC, 4),
> > > > +                                        DMA_FROM_DEVICE);
> > > > +
> > > > +                       skb_put(s, length);
> > > > +                       s->protocol = eth_type_trans(s, dev);
> > > > +                       netif_receive_skb(s);
> > > > +                       ether->stats.rx_packets++;
> > > > +                       ether->stats.rx_bytes += length;
> > > > +                       rx_cnt++;
> > > > +                       ether->rx_count_pool++;
> > > > +
> > > > +                       // now we allocate new skb instead if the used one.
> > > > +                       skb = dev_alloc_skb(roundup(MAX_PACKET_SIZE_W_CRC, 4));
> > > > +
> > > > +                       if (!skb) {
> > > > +                               dev_err(&pdev->dev, "get skb buffer error\n");
> > > > +                               ether->stats.rx_dropped++;
> > > > +                               goto rx_out;
> > > > +                       }
> > > > +
> > > > +                       /* Do not unmark the following skb_reserve() Receive
> > > > +                        * Buffer Starting Address must be aligned
> > > > +                        * to 4 bytes and the following line if unmarked
> > > > +                        * will make it align to 2 and this likely
> > > > +                        * will hult the RX and crash the linux
> > > > +                        * skb_reserve(skb, NET_IP_ALIGN);
> > > > +                        */
> > > > +                       skb->dev = dev;
> > > > +
> > > > +                       rxbd->buffer = dma_map_single(&dev->dev, skb->data,
> > > > +                                                     roundup(MAX_PACKET_SIZE_W_CRC, 4),
> > > > +                                                     DMA_FROM_DEVICE);
> > > > +                       ether->rx_skb[ether->cur_rx] = skb;
> > > > +               } else {
> > > > +                       ether->rx_err_count++;
> > > > +                       ether->stats.rx_errors++;
> > > > +                       EMC_DEBUG("rx_errors = %lu status = 0x%08X\n",
> > > > +                                 ether->stats.rx_errors, status);
> > > > +
> > > > +                       if (status & RXDS_RP) {
> > > > +                               ether->stats.rx_length_errors++;
> > > > +                               EMC_DEBUG("rx_length_errors = %lu\n",
> > > > +                                         ether->stats.rx_length_errors);
> > > > +                       } else if (status & RXDS_CRCE) {
> > > > +                               ether->stats.rx_crc_errors++;
> > > > +                               EMC_DEBUG("rx_crc_errors = %lu\n",
> > > > +                                         ether->stats.rx_crc_errors);
> > > > +                       } else if (status & RXDS_ALIE) {
> > > > +                               ether->stats.rx_frame_errors++;
> > > > +                               EMC_DEBUG("rx_frame_errors = %lu\n",
> > > > +                                         ether->stats.rx_frame_errors);
> > > > +                       }
> > > > +#ifndef VLAN_SUPPORT
> > > > +                       else if (status & RXDS_PTLE) {
> > > > +                               ether->stats.rx_length_errors++;
> > > > +                               EMC_DEBUG("rx_length_errors = %lu\n",
> > > > +                                         ether->stats.rx_length_errors);
> > > > +                       }
> > > > +#endif
> > > > +                       else if (length > MAX_PACKET_SIZE) {
> > > > +                               ether->stats.rx_length_errors++;
> > > > +                               EMC_DEBUG("rx_length_errors = %lu\n",
> > > > +                                         ether->stats.rx_length_errors);
> > > > +                       }
> > > > +               }
> > > > +
> > > > +               wmb();
> > > > +               rxbd->sl = RX_OWEN_DMA;
> > > > +               wmb();
> > > > +
> > > > +               if (++ether->cur_rx >= RX_DESC_SIZE)
> > > > +                       ether->cur_rx = 0;
> > > > +
> > > > +               rxbd = (ether->rdesc + ether->cur_rx);
> > > > +
> > > > +       }
> > > > +
> > > > +       if (complete) {
> > > > +               napi_complete(napi);
> > > > +
> > > > +               if (ether->need_reset) {
> > > > +                       EMC_DEBUG("Reset\n");
> > > > +                       npcm7xx_reset_mac(dev, 1);
> > > > +               }
> > > > +
> > > > +               spin_lock_irqsave(&ether->lock, flags);
> > > > +               __raw_writel(__raw_readl(REG_MIEN) | ENRXGD,  REG_MIEN);
> > > > +               spin_unlock_irqrestore(&ether->lock, flags);
> > > > +       } else {
> > > > +               rx_offset = (__raw_readl(REG_CRXDSA)-ether->start_rx_ptr)/
> > > > +                       sizeof(struct npcm7xx_txbd);
> > > > +               local_count = (rx_offset >= ether->cur_rx) ? rx_offset -
> > > > +                       ether->cur_rx : rx_offset + RX_DESC_SIZE -
> > > > +                       ether->cur_rx;
> > > > +
> > > > +               if (local_count > ether->max_waiting_rx)
> > > > +                       ether->max_waiting_rx = local_count;
> > > > +
> > > > +               if (local_count > (3*RX_POLL_SIZE))
> > > > +                       // we are porbably in a storm of short packets and we don't want to get
> > > > +                       // into RDU since short packets in RDU cause many RXOV which may cause
> > > > +                       // EMC halt, so we filter out all comming packets
> > > > +                       __raw_writel(0, REG_CAMCMR);
> > > > +               if (local_count <= RX_POLL_SIZE)
> > > > +                       // we can restore accepting of packets
> > > > +                       __raw_writel(ether->camcmr, REG_CAMCMR);
> > > > +       }
> > > > +rx_out:
> > > > +
> > > > +       ETH_TRIGGER_RX;
> > > > +       return rx_cnt;
> > > > +}
> > > > +
> > > > +static irqreturn_t npcm7xx_rx_interrupt(int irq, void *dev_id)
> > > > +{
> > > > +       struct net_device *dev = (struct net_device *)dev_id;
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct platform_device *pdev = ether->pdev;
> > > > +       unsigned int status;
> > > > +       unsigned long flags;
> > > > +       unsigned int any_err = 0;
> > > > +       u32 RXFSM;
> > > > +
> > > > +       spin_lock_irqsave(&ether->lock, flags);
> > > > +       npcm7xx_get_and_clear_int(dev, &status, 0xFFFF);
> > > > +       spin_unlock_irqrestore(&ether->lock, flags);
> > 
> > Lock is probably pointless.
> 
> I agreed above for that
> 
> > 
> > > > +       ether->rx_int_count++;
> > > > +
> > > > +
> > > > +       if (unlikely(status & MISTA_RXBERR)) {
> > > > +               ether->rx_berr++;
> > > > +               dev_err(&pdev->dev, "emc rx bus error status=0x%08X\n", status);
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG
> > > > +               npcm7xx_info_print(dev);
> > > > +#endif
> > > > +               spin_lock_irqsave(&ether->lock, flags);
> > > > +               __raw_writel(0, REG_MIEN); // disable any interrupt
> > > > +               spin_unlock_irqrestore(&ether->lock, flags);
> > > > +               ether->need_reset = 1;
> > > > +               napi_schedule(&ether->napi);
> > > > +               return IRQ_HANDLED;
> > > > +       }
> > > > +
> > > > +       if (unlikely(status & (MISTA_RXOV | MISTA_RDU))) {
> > > > +               // filter out all received packets until we have enough avaiable buffer descriptors
> > > > +               __raw_writel(0, REG_CAMCMR);
> > > > +               any_err = 1;
> > > > +               if (status & (MISTA_RXOV))
> > > > +                       ether->rxov++;
> > > > +               if (status & (MISTA_RDU))
> > > > +                       ether->rdu++;
> > > > +
> > > > +               // workaround Errata 1.36: EMC Hangs on receiving 253-256 byte packet
> > > > +               RXFSM = __raw_readl(REG_RXFSM);
> > > > +
> > > > +               if ((RXFSM & 0xFFFFF000) == 0x08044000) {
> > > > +                       int i;
> > > > +                       for (i = 0; i < 32; i++) {
> > > > +                               RXFSM = __raw_readl(REG_RXFSM);
> > > > +                               if ((RXFSM & 0xFFFFF000) != 0x08044000)
> > > > +                                       break;
> > > > +                       }
> > > > +                       if (i == 32) {
> > > > +                               ether->rx_stuck++;
> > > > +                               spin_lock_irqsave(&ether->lock, flags);
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG
> > > > +                               npcm7xx_info_print(dev);
> > > > +#endif
> > > > +                               __raw_writel(0,  REG_MIEN);
> > > > +                               spin_unlock_irqrestore(&ether->lock, flags);
> > > > +                               ether->need_reset = 1;
> > > > +                                   napi_schedule(&ether->napi);
> > > > +                               dev_err(&pdev->dev, "stuck on REG_RXFSM = "
> > > > +                                                   "0x%08X status=%08X doing "
> > > > +                                                   "reset!\n", RXFSM, status);
> > > > +                               return IRQ_HANDLED;
> > > > +                       }
> > > > +               }
> > > > +       }
> > > > +
> > > > +       // echo MISTA status on unexpected flags although we don't do anithing with them
> > > > +       if (unlikely(status & (
> > > > +                              // MISTA_RXINTR | // Receive - all RX interrupt set this
> > > > +                              MISTA_CRCE   | // CRC Error
> > > > +                              // MISTA_RXOV   | // Receive FIFO Overflow - we alread handled it
> > > > +#ifndef VLAN_SUPPORT
> > > > +                              MISTA_PTLE   | // Packet Too Long is needed since VLAN is not supported
> > > > +#endif
> > > > +                              // MISTA_RXGD   | // Receive Good - this is the common good case
> > > > +                              MISTA_ALIE   | // Alignment Error
> > > > +                              MISTA_RP     | // Runt Packet
> > > > +                              MISTA_MMP    | // More Missed Packet
> > > > +                              MISTA_DFOI   | // Maximum Frame Length
> > > > +                              // MISTA_DENI   | // DMA Early Notification - every packet get this
> > > > +                              // MISTA_RDU    | // Receive Descriptor Unavailable
> > > > +                              // MISTA_RXBERR | // Receive Bus Error Interrupt - we alread handled it
> > > > +                              // MISTA_CFR    | // Control Frame Receive - not an error
> > > > +                               0))) {
> > > > +               EMC_DEBUG("emc rx MISTA status=0x%08X\n", status);
> > > > +               any_err = 1;
> > > > +               ether->rx_err++;
> > > > +       }
> > > > +
> > > > +       if ((any_err == 0) && ((status & MISTA_RXGD) == 0))
> > > > +               dev_err(&pdev->dev, "emc rx MISTA status=0x%08X\n", status);
> > > > +
> > > > +       spin_lock_irqsave(&ether->lock, flags);
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG_EXT
> > > > +       {
> > > > +               struct npcm7xx_rxbd *rxbd = (ether->rdesc + ether->cur_rx);
> > > > +               static u32 last_iUsCnt1[2] = {0};
> > > > +               u32 iUsCnt2[2];
> > > > +
> > > > +               npcm7xx_clk_GetTimeStamp(iUsCnt2);
> > > > +               /* rxbd->r2 =  (_1MHz_ * (iUsCnt2[1] - last_iUsCnt1[1])) +
> > > > +                *iUsCnt2[0]/25 - last_iUsCnt1[0]/25;
> > > > +                */
> > > > +               rxbd->r2 =  status;
> > > > +               rxbd->r3 =  (_1MHz_ * iUsCnt2[1]) + iUsCnt2[0]/25;
> > > > +               last_iUsCnt1[0] = iUsCnt2[0];
> > > > +               last_iUsCnt1[1] = iUsCnt2[1];
> > > > +       }
> > > > +#endif
> > > > +       __raw_writel(__raw_readl(REG_MIEN) & ~ENRXGD,  REG_MIEN);
> > > > +       spin_unlock_irqrestore(&ether->lock, flags);
> > > > +       napi_schedule(&ether->napi);
> > > > +
> > > > +       return IRQ_HANDLED;
> > > > +}
> > > > +
> > > > +
> > > > +static int npcm7xx_ether_open(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether;
> > > > +       struct platform_device *pdev;
> > > > +
> > > > +       ether = netdev_priv(dev);
> > > > +       pdev = ether->pdev;
> > > > +
> > > > +       ether->need_reset = 1;
> > > > +       npcm7xx_reset_mac(dev, 0);
> > 
> > What's the logic between that need_reset and a function called  "reset"
> >  ?
> 
> Agree it is pointless here.
> 
> > 
> > > > +       if (request_irq(ether->txirq, npcm7xx_tx_interrupt,
> > > > +                                               0x0, pdev->name, dev)) {
> > > > +               dev_err(&pdev->dev, "register irq tx failed\n");
> > > > +               return -EAGAIN;
> > > > +       }
> > > > +
> > > > +       if (request_irq(ether->rxirq, npcm7xx_rx_interrupt,
> > > > +                                               0x0, pdev->name, dev)) {
> > > > +               dev_err(&pdev->dev, "register irq rx failed\n");
> > > > +               free_irq(ether->txirq, dev);
> > > > +               return -EAGAIN;
> > > > +       }
> > > > +
> > > > +       if (ether->phy_dev)
> > > > +               phy_start(ether->phy_dev);
> > > > +
> > > > +       netif_start_queue(dev);
> > > > +       napi_enable(&ether->napi);
> > > > +
> > > > +       ETH_TRIGGER_RX;
> > > > +
> > > > +       dev_info(&pdev->dev, "%s is OPENED\n", dev->name);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static void npcm7xx_ether_set_multicast_list(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether;
> > > > +       unsigned int rx_mode;
> > > > +
> > > > +       ether = netdev_priv(dev);
> > > > +
> > > > +       EMC_DEBUG("%s CAMCMR_AUP\n", (dev->flags & IFF_PROMISC) ?
> > > > +                 "Set" : "Clear");
> > > > +       if (dev->flags & IFF_PROMISC)
> > > > +               rx_mode = CAMCMR_AUP | CAMCMR_AMP | CAMCMR_ABP | CAMCMR_ECMP;
> > > > +       else if ((dev->flags & IFF_ALLMULTI) || !netdev_mc_empty(dev))
> > > > +               rx_mode = CAMCMR_AMP | CAMCMR_ABP | CAMCMR_ECMP;
> > > > +       else
> > > > +               rx_mode = CAMCMR_ECMP | CAMCMR_ABP;
> > > > +       __raw_writel(rx_mode, REG_CAMCMR);
> > > > +       ether->camcmr = rx_mode;
> > > > +}
> > 
> > Name this set_rx_mode. You can't do better in your "CAM" for multicast
> > filtering ? Usual comment about use of __raw MMIO accessors. You may
> > also want to make sure the interface is running before writing to the
> > HW.
> 
> I see in ftgmac100_set_rx_mode()  that it does some more things than
> just setting the CAM options, sould I do the same? (note that I don't
> have the spec of ftgmac100 so I don't know what each register does).

Well, it calculates the multicast hash and programs it, that's about
it.

> > > > +static int npcm7xx_ether_ioctl(struct net_device *dev,
> > > > +                                               struct ifreq *ifr, int cmd)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct phy_device *phydev = ether->phy_dev;
> > > > +
> > > > +       if (!netif_running(dev))
> > > > +               return -EINVAL;
> > > > +
> > > > +       if (!phydev)
> > > > +               return -ENODEV;
> > > > +
> > > > +       return phy_mii_ioctl(phydev, ifr, cmd);
> > > > +}
> > > > +
> > > > +static void npcm7xx_get_drvinfo(struct net_device *dev,
> > > > +                                       struct ethtool_drvinfo *info)
> > > > +{
> > > > +       strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
> > > > +       strlcpy(info->version, DRV_MODULE_VERSION, sizeof(info->version));
> > > > +       strlcpy(info->fw_version, "N/A", sizeof(info->fw_version));
> > > > +       strlcpy(info->bus_info, "N/A", sizeof(info->bus_info));
> > > > +}
> > > > +
> > > > +static int npcm7xx_get_settings(struct net_device *dev,
> > > > +                               struct ethtool_link_ksettings *cmd)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct phy_device *phydev = ether->phy_dev;
> > > > +
> > > > +       if (phydev == NULL)
> > > > +               return -ENODEV;
> > > > +
> > > > +       pr_info("\n\nnpcm7xx_get_settings\n");
> > > > +       phy_ethtool_ksettings_get(phydev, cmd);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int npcm7xx_set_settings(struct net_device *dev,
> > > > +                               const struct ethtool_link_ksettings *cmd)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct phy_device *phydev = ether->phy_dev;
> > > > +       int ret;
> > > > +       unsigned long flags;
> > > > +
> > > > +       if (phydev == NULL)
> > > > +               return -ENODEV;
> > > > +
> > > > +       pr_info("\n\nnpcm7xx_set_settings\n");
> > > > +       spin_lock_irqsave(&ether->lock, flags);
> > > > +       ret =  phy_ethtool_ksettings_set(p
> > > > hydev, cmd);
> > > > +       spin_unlock_irqrestore(&ether->lock, flags);
> > 
> > Ditch the lock. You can directly hookup phy_ethtool_ksettings_set and
> > get into the ethtool_ops without wrappers.
> > 
> 
> OK
> 
> > 
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static u32 npcm7xx_get_msglevel(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +
> > > > +       return ether->msg_enable;
> > > > +}
> > > > +
> > > > +static void npcm7xx_set_msglevel(struct net_device *dev, u32 level)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +
> > > > +       ether->msg_enable = level;
> > > > +}
> > > > +
> > > > +static const struct ethtool_ops npcm7xx_ether_ethtool_ops = {
> > > > +       .get_link_ksettings     = npcm7xx_get_settings,
> > > > +       .set_link_ksettings     = npcm7xx_set_settings,
> > > > +       .get_drvinfo    = npcm7xx_get_drvinfo,
> > > > +       .get_msglevel   = npcm7xx_get_msglevel,
> > > > +       .set_msglevel   = npcm7xx_set_msglevel,
> > > > +       .get_link       = ethtool_op_get_link,
> > > > +};
> > > > +
> > > > +static const struct net_device_ops npcm7xx_ether_netdev_ops = {
> > > > +       .ndo_open               = npcm7xx_ether_open,
> > > > +       .ndo_stop               = npcm7xx_ether_close,
> > > > +       .ndo_start_xmit         = npcm7xx_ether_start_xmit,
> > > > +       .ndo_get_stats          = npcm7xx_ether_stats,
> > > > +       .ndo_set_rx_mode        = npcm7xx_ether_set_multicast_list,
> > > > +       .ndo_set_mac_address    = npcm7xx_set_mac_address,
> > > > +       .ndo_do_ioctl           = npcm7xx_ether_ioctl,
> > > > +       .ndo_validate_addr      = eth_validate_addr,
> > > > +       .ndo_change_mtu         = eth_change_mtu,
> > > > +};
> > > > +
> > > > +#ifndef CONFIG_OF
> > > > +static unsigned char char2hex(unsigned char c)
> > > > +{
> > > > +       if (c >= '0' && c <= '9')
> > > > +               return c - '0';
> > > > +       if (c >= 'a' && c <= 'f')
> > > > +               return c - 'a' + 10;
> > > > +       if (c >= 'A' && c <= 'F')
> > > > +               return c - 'A' + 10;
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static void _mac_setup(char *line, u8 *mac)
> > > > +{
> > > > +       int i;
> > > > +
> > > > +       for (i = 0; i < 6; i++)
> > > > +               mac[i] = (char2hex(line[i*3])<<4) + char2hex(line[i*3+1]);
> > > > +}
> > > > +
> > > > +static int find_option(char *str, char *mac)
> > > > +{
> > > > +       extern char *saved_command_line;
> > > > +       char *p;
> > > > +
> > > > +       p = strstr(saved_command_line, str)
> > > > +
> > > > +       if (!p)
> > > > +               return 0;
> > > > +
> > > > +       p += strlen(str);
> > > > +       _mac_setup(p, mac);
> > > > +
> > > > +       return 1;
> > > > +}
> > > 
> > > These above options can be done with common helpers. Take a look at
> > > another driver such as the ftgmac100.c.
> 
> I will try
> 
> > > 
> > > > +#endif
> > > > +
> > > > +static void get_mac_address(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct platform_device *pdev = ether->pdev;
> > > > +       struct device_node *np = ether->pdev->dev.of_node;
> > > > +       const u8 *mac_address = NULL;
> > > > +#ifndef CONFIG_OF
> > > > +       struct plat_npcm7xx_emc_data *plat_dat = pdev->dev.platform_data;
> > > > +#endif
> > > > +
> > > > +#ifdef CONFIG_OF
> > > > +       mac_address = of_get_mac_address(np);
> > > > +
> > > > +       if (mac_address != 0)
> > > > +               ether_addr_copy(dev->dev_addr, mac_address);
> > > > +#else
> > > > +       if (find_option("basemac=", mac_address)) {
> > > 
> > > See above comment.
> > > 
> > > > +               memcpy(dev->dev_addr, mac_address, ETH_ALEN);
> > > > +               if (pdev->id == 1)
> > > > +                       dev->dev_addr[5] += 1;
> > > > +       } else
> > > > +               memcpy(dev->dev_addr, (const void *)plat_dat->mac_addr,
> > > > +                      ETH_ALEN);
> > > > +#endif
> > > > +
> > > > +       if (is_valid_ether_addr(dev->dev_addr)) {
> > > > +               pr_info("%s: device MAC address : %pM\n", pdev->name,
> > > > +                       dev->dev_addr);
> > > > +       } else {
> > > > +               eth_hw_addr_random(dev);
> > > > +               pr_info("%s: device MAC address (random generator) %pM\n",
> > > > +                       dev->name, dev->dev_addr);
> > > > +       }
> > > > +
> > > > +}
> > 
> > As Joel says, look at other drivers, this is too messy.
> > 
> > > > +
> > > > +static int npcm7xx_mii_setup(struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct platform_device *pdev;
> > > > +       struct phy_device *phydev = NULL;
> > > > +       int i, err = 0;
> > > > +
> > > > +       pdev = ether->pdev;
> > > > +
> > > > +       ether->mii_bus = mdiobus_alloc();
> > > > +       if (!ether->mii_bus) {
> > > > +               err = -ENOMEM;
> > > > +               dev_err(&pdev->dev, "mdiobus_alloc() failed\n");
> > > > +               goto out0;
> > > > +       }
> > > > +
> > > > +       ether->mii_bus->name = "npcm7xx_rmii";
> > > > +       ether->mii_bus->read = &npcm7xx_mdio_read;
> > > > +       ether->mii_bus->write = &npcm7xx_mdio_write;
> > > > +       ether->mii_bus->reset = &npcm7xx_mdio_reset;
> > > > +       snprintf(ether->mii_bus->id, MII_BUS_ID_SIZE, "%s-%x",
> > > > +                ether->pdev->name, ether->pdev->id);
> > > > +       EMC_DEBUG("%s ether->mii_bus->id=%s\n", __func__, ether->mii_bus->id);
> > > > +       ether->mii_bus->priv = ether;
> > > > +       ether->mii_bus->parent = &ether->pdev->dev;
> > > > +
> > > > +       for (i = 0; i < PHY_MAX_ADDR; i++)
> > > > +               ether->mii_bus->irq[i] = PHY_POLL;
> > > > +
> > > > +       platform_set_drvdata(ether->pdev, ether->mii_bus);
> > > > +
> > > > +       /* Enable MDIO Clock */
> > > > +       __raw_writel(__raw_readl(REG_MCMDR) | MCMDR_ENMDC, REG_MCMDR);
> > 
> > Why raw ?
> > 
> > > > +
> > > > +       if (mdiobus_register(ether->mii_bus)) {
> > > > +               dev_err(&pdev->dev, "mdiobus_register() failed\n");
> > > > +               goto out2;
> > > > +       }
> > > > +
> > > > +
> > > > +       phydev = phy_find_first(ether->mii_bus);
> > > > +       if (phydev == NULL) {
> > > > +               dev_err(&pdev->dev, "phy_find_first() failed\n");
> > > > +               goto out3;
> > > > +       }
> > > > +
> > > > +       dev_info(&pdev->dev, " name = %s ETH-Phy-Id = 0x%x\n",
> > > > +                phydev_name(phydev), phydev->phy_id);
> > > > +
> > > > +       phydev = phy_connect(dev, phydev_name(phydev),
> > > > +                            &adjust_link,
> > > > +                            PHY_INTERFACE_MODE_RMII);
> > > > +
> > > > +       dev_info(&pdev->dev, " ETH-Phy-Id = 0x%x name = %s\n",
> > > > +                phydev->phy_id, phydev->drv->name);
> > > > +
> > > > +       if (IS_ERR(phydev)) {
> > > > +               err = PTR_ERR(phydev);
> > > > +               dev_err(&pdev->dev, "phy_connect() failed - %d\n", err);
> > > > +               goto out3;
> > > > +       }
> > > > +
> > > > +       phydev->supported &= PHY_BASIC_FEATURES;
> > > > +       phydev->advertising = phydev->supported;
> > > > +       ether->phy_dev = phydev;
> > > > +
> > > > +       return 0;
> > > > +
> > > > +out3:
> > > > +       mdiobus_unregister(ether->mii_bus);
> > > > +out2:
> > > > +       kfree(ether->mii_bus->irq);
> > > > +       mdiobus_free(ether->mii_bus);
> > > > +out0:
> > > > +
> > > > +       return err;
> > > > +}
> > > > +
> > > > +#include <linux/seq_file.h>
> > > > +#include <linux/proc_fs.h>
> > > > +
> > > > +#define PROC_FILENAME "driver/npcm7xx_emc"
> > > 
> > > I think use debugfs for these internal details, or omit them.
> 
> I will try
> 
> > > 
> > > > +
> > > > +#define REG_PRINT(reg_name) {t = scnprintf(next, size, "%-10s = %08X\n", \
> > > > +       #reg_name, __raw_readl(reg_name)); size -= t;   next += t; }
> > > > +#define PROC_PRINT(f, x...) {t = scnprintf(next, size, f, ## x); size -= t; \
> > > > +       next += t; }
> > > > +
> > > > +static int npcm7xx_info_dump(char *buf, int count, struct net_device *dev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       struct npcm7xx_txbd *txbd;
> > > > +       struct npcm7xx_rxbd *rxbd;
> > > > +       unsigned long flags;
> > > > +       unsigned int i, cur, txd_offset, rxd_offset;
> > > > +       char *next = buf;
> > > > +       unsigned int size = count;
> > > > +       int t;
> > > > +       int is_locked = spin_is_locked(&ether->lock);
> > > > +
> > > > +       if (!is_locked)
> > > > +               spin_lock_irqsave(&ether->lock, flags);
> > > > +
> > > > +       /* ------basic driver information ---- */
> > > > +       PROC_PRINT("NPCM7XX EMC %s driver version: %s\n", dev->name,
> > > > +                  DRV_MODULE_VERSION);
> > > > +
> > > > +       REG_PRINT(REG_CAMCMR);
> > > > +       REG_PRINT(REG_CAMEN);
> > > > +       REG_PRINT(REG_CAMM_BASE);
> > > > +       REG_PRINT(REG_CAML_BASE);
> > > > +       REG_PRINT(REG_TXDLSA);
> > > > +       REG_PRINT(REG_RXDLSA);
> > > > +       REG_PRINT(REG_MCMDR);
> > > > +       REG_PRINT(REG_MIID);
> > > > +       REG_PRINT(REG_MIIDA);
> > > > +       REG_PRINT(REG_FFTCR);
> > > > +       REG_PRINT(REG_TSDR);
> > > > +       REG_PRINT(REG_RSDR);
> > > > +       REG_PRINT(REG_DMARFC);
> > > > +       REG_PRINT(REG_MIEN);
> > > > +       REG_PRINT(REG_MISTA);
> > > > +       REG_PRINT(REG_MGSTA);
> > > > +       REG_PRINT(REG_MPCNT);
> > > > +       __raw_writel(0x7FFF, REG_MPCNT);
> > > > +       REG_PRINT(REG_MRPC);
> > > > +       REG_PRINT(REG_MRPCC);
> > > > +       REG_PRINT(REG_MREPC);
> > > > +       REG_PRINT(REG_DMARFS);
> > > > +       REG_PRINT(REG_CTXDSA);
> > > > +       REG_PRINT(REG_CTXBSA);
> > > > +       REG_PRINT(REG_CRXDSA);
> > > > +       REG_PRINT(REG_CRXBSA);
> > > > +       REG_PRINT(REG_RXFSM);
> > > > +       REG_PRINT(REG_TXFSM);
> > > > +       REG_PRINT(REG_FSM0);
> > > > +       REG_PRINT(REG_FSM1);
> > > > +       REG_PRINT(REG_DCR);
> > > > +       REG_PRINT(REG_DMMIR);
> > > > +       REG_PRINT(REG_BISTR);
> > > > +       PROC_PRINT("\n");
> > > > +
> > > > +       PROC_PRINT("netif_queue %s\n\n", netif_queue_stopped(dev) ?
> > > > +                                       "Stopped" : "Running");
> > > > +       if (ether->rdesc)
> > > > +               PROC_PRINT("napi is %s\n\n", test_bit(NAPI_STATE_SCHED,
> > > > +                                                     &ether->napi.state) ?
> > > > +                                                       "scheduled" :
> > > > +                                                       "not scheduled");
> > > > +
> > > > +       txd_offset = (__raw_readl(REG_CTXDSA) -
> > > > +                     __raw_readl(REG_TXDLSA))/sizeof(struct npcm7xx_txbd);
> > > > +       PROC_PRINT("TXD offset    %6d\n", txd_offset);
> > > > +       PROC_PRINT("cur_tx        %6d\n", ether->cur_tx);
> > > > +       PROC_PRINT("finish_tx     %6d\n", ether->finish_tx);
> > > > +       PROC_PRINT("pending_tx    %6d\n", ether->pending_tx);
> > > > +       /* debug counters */
> > > > +       PROC_PRINT("tx_tdu        %6d\n", ether->tx_tdu);
> > > > +       ether->tx_tdu = 0;
> > > > +       PROC_PRINT("tx_tdu_i      %6d\n", ether->tx_tdu_i);
> > > > +       ether->tx_tdu_i = 0;
> > > > +       PROC_PRINT("tx_cp_i       %6d\n", ether->tx_cp_i);
> > > > +        ether->tx_cp_i = 0;
> > > > +       PROC_PRINT("tx_int_count  %6d\n", ether->tx_int_count);
> > > > +       ether->tx_int_count = 0;
> > > > +       PROC_PRINT("count_xmit tx %6d\n", ether->count_xmit);
> > > > +       ether->count_xmit = 0;
> > > > +       PROC_PRINT("count_finish  %6d\n", ether->count_finish);
> > > > +       ether->count_finish = 0;
> > > > +       PROC_PRINT("\n");
> > > > +
> > > > +       rxd_offset = (__raw_readl(REG_CRXDSA)-__raw_readl(REG_RXDLSA))
> > > > +                       /sizeof(struct npcm7xx_txbd);
> > > > +       PROC_PRINT("RXD offset    %6d\n", rxd_offset);
> > > > +       PROC_PRINT("cur_rx        %6d\n", ether->cur_rx);
> > > > +       PROC_PRINT("rx_err        %6d\n", ether->rx_err);
> > > > +       ether->rx_err = 0;
> > > > +       PROC_PRINT("rx_berr       %6d\n", ether->rx_berr);
> > > > +       ether->rx_berr = 0;
> > > > +       PROC_PRINT("rx_stuck      %6d\n", ether->rx_stuck);
> > > > +       ether->rx_stuck = 0;
> > > > +       PROC_PRINT("rdu           %6d\n", ether->rdu);
> > > > +       ether->rdu = 0;
> > > > +       PROC_PRINT("rxov rx       %6d\n", ether->rxov);
> > > > +       ether->rxov = 0;
> > > > +       // debug counters
> > > > +       PROC_PRINT("rx_int_count  %6d\n", ether->rx_int_count);
> > > > +       ether->rx_int_count = 0;
> > > > +       PROC_PRINT("rx_err_count  %6d\n", ether->rx_err_count);
> > > > +       ether->rx_err_count = 0;
> > > > +       PROC_PRINT("rx_count_pool %6d\n", ether->rx_count_pool);
> > > > +       ether->rx_count_pool = 0;
> > > > +       PROC_PRINT("max_waiting_rx %5d\n", ether->max_waiting_rx);
> > > > +       ether->max_waiting_rx = 0;
> > > > +       PROC_PRINT("\n");
> > > > +       PROC_PRINT("need_reset    %5d\n", ether->need_reset);
> > > > +
> > > > +       if (ether->tdesc && ether->rdesc) {
> > > > +               cur = ether->finish_tx - 2;
> > > > +               for (i = 0; i < 3; i++) {
> > > > +                       cur = (cur + 1)%TX_DESC_SIZE;
> > > > +                       txbd = (ether->tdesc + cur);
> > > > +                       PROC_PRINT("finish %3d txbd mode %08X buffer %08X sl "
> > > > +                                  "%08X next %08X tx_skb %p\n", cur,
> > > > +                                  txbd->mode, txbd->buffer, txbd->sl,
> > > > +                                  txbd->next, ether->tx_skb[cur]);
> > > > +               }
> > > > +               PROC_PRINT("\n");
> > > > +
> > > > +               cur = txd_offset - 2;
> > > > +               for (i = 0; i < 3; i++) {
> > > > +                       cur = (cur + 1)%TX_DESC_SIZE;
> > > > +                       txbd = (ether->tdesc + cur);
> > > > +                       PROC_PRINT("txd_of %3d txbd mode %08X buffer %08X sl "
> > > > +                                  "%08X next %08X\n", cur, txbd->mode,
> > > > +                                  txbd->buffer, txbd->sl, txbd->next);
> > > > +               }
> > > > +               PROC_PRINT("\n");
> > > > +
> > > > +               cur = ether->cur_tx - 63;
> > > > +               for (i = 0; i < 64; i++) {
> > > > +                       cur = (cur + 1)%TX_DESC_SIZE;
> > > > +                       txbd = (ether->tdesc + cur);
> > > > +                       PROC_PRINT("cur_tx %3d txbd mode %08X buffer %08X sl "
> > > > +                                  "%08X next %08X ", cur, txbd->mode,
> > > > +                                  txbd->buffer, txbd->sl, txbd->next);
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG_EXT
> > > > +                       PROC_PRINT("diff %08X ts %08X  MISTA %08X MIEN %08X\n",
> > > > +                                  txbd->diff, txbd->ts, txbd->t2, txbd->t3);
> > > > +#else
> > > > +                       PROC_PRINT("\n");
> > > > +#endif
> > > > +               }
> > > > +               PROC_PRINT("\n");
> > > > +
> > > > +               cur = ether->cur_rx - 63;
> > > > +               for (i = 0; i < 64; i++) {
> > > > +                       cur = (cur + 1)%RX_DESC_SIZE;
> > > > +                       rxbd = (ether->rdesc + cur);
> > > > +                       PROC_PRINT("cur_rx %3d rxbd sl   %08X buffer %08X sl "
> > > > +                                  "%08X next %08X ", cur, rxbd->sl,
> > > > +                                  rxbd->buffer, rxbd->reserved, rxbd->next);
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG_EXT
> > > > +                       PROC_PRINT("diff %08X ts %08X i_diff %08X i_ts %08X\n",
> > > > +                                  rxbd->diff, rxbd->ts, rxbd->r2, rxbd->r3);
> > > > +#else
> > > > +                       PROC_PRINT("\n");
> > > > +#endif
> > > > +               }
> > > > +               PROC_PRINT("\n");
> > > > +
> > > > +               cur = rxd_offset - 2;
> > > > +               for (i = 0; i < 3; i++) {
> > > > +                       cur = (cur + 1)%RX_DESC_SIZE;
> > > > +                       rxbd = (ether->rdesc + cur);
> > > > +                       PROC_PRINT("rxd_of %3d rxbd sl %08X buffer %08X sl %08X"
> > > > +                                  " next %08X\n", cur, rxbd->sl, rxbd->buffer,
> > > > +                                  rxbd->reserved, rxbd->next);
> > > > +               }
> > > > +               PROC_PRINT("\n");
> > > > +       }
> > > > +
> > > > +       if (!is_locked)
> > > > +               spin_unlock_irqrestore(&ether->lock, flags);
> > > > +
> > > > +       return count - size;
> > > > +}
> > > > +
> > > > +#ifdef CONFIG_NPCM7XX_EMC_ETH_DEBUG
> > > > +static void npcm7xx_info_print(struct net_device *dev)
> > > > +{
> > > > +       char *emc_dump_buf;
> > > > +       int count;
> > > > +       struct npcm7xx_ether *ether;
> > > > +       struct platform_device *pdev;
> > > > +       const size_t print_size = 5*PAGE_SIZE;
> > > > +
> > > > +       ether = netdev_priv(dev);
> > > > +       pdev = ether->pdev;
> > > > +
> > > > +       emc_dump_buf = kmalloc(print_size, GFP_KERNEL);
> > > > +       if (!emc_dump_buf)
> > > > +               dev_err(&pdev->dev, "emc_dump_buf = kmalloc(PAGE_SIZE, "
> > > > +                                   "GFP_KERNEL) failed\n");
> > > > +       else {
> > > > +               char c;
> > > > +               char *tmp_buf = emc_dump_buf;
> > > > +
> > > > +               count = npcm7xx_info_dump(emc_dump_buf, print_size, dev);
> > > > +               while (count > 512) {
> > > > +                       c = tmp_buf[512];
> > > > +                       tmp_buf[512] = 0;
> > > > +                       pr_info("%s", tmp_buf);
> > > > +                       tmp_buf += 512;
> > > > +                       tmp_buf[0] = c;
> > > > +                       count -= 512;
> > > > +               }
> > > > +               printk("%s", tmp_buf);
> > > > +               kfree(emc_dump_buf);
> > > > +       }
> > > > +}
> > > > +#endif
> > > > +
> > > > +static int npcm7xx_proc_read(struct seq_file *sf, void *v)
> > > > +{
> > > > +       struct net_device *dev = (struct net_device *)sf->private;
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       const size_t print_size = 5*PAGE_SIZE;
> > > > +
> > > > +       if (ether->dump_buf == NULL) {
> > > > +               ether->dump_buf = kmalloc(print_size, GFP_KERNEL);
> > > > +               if (!ether->dump_buf)
> > > > +                       return -1;
> > > > +               npcm7xx_info_dump(ether->dump_buf, print_size, dev);
> > > > +       }
> > > > +
> > > > +       seq_printf(sf, "%s", ether->dump_buf);
> > > > +
> > > > +       if (sf->count < sf->size) {
> > > > +               kfree(ether->dump_buf);
> > > > +               ether->dump_buf = NULL;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int npcm7xx_ether_proc_open(struct inode *inode, struct file *file)
> > > > +{
> > > > +       return single_open(file, npcm7xx_proc_read, PDE_DATA(inode));
> > > > +}
> > > > +
> > > > +static const struct file_operations npcm7xx_ether_proc_fops = {
> > > > +       .open           = npcm7xx_ether_proc_open,
> > > > +       .read           = seq_read,
> > > > +       .llseek         = seq_lseek,
> > > > +       .release        = single_release,
> > > > +};
> > > > +
> > > > +static int npcm7xx_proc_reset(struct seq_file *sf, void *v)
> > > > +{
> > > > +       struct net_device *dev = (struct net_device *)sf->private;
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       unsigned long flags;
> > > > +
> > > > +       seq_printf(sf, "Ask to reset the module\n");
> > > > +       spin_lock_irqsave(&ether->lock, flags);
> > > > +       __raw_writel(0,  REG_MIEN);
> > > > +       spin_unlock_irqrestore(&ether->lock, flags);
> > > > +       ether->need_reset = 1;
> > > > +       napi_schedule(&ether->napi);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int npcm7xx_ether_proc_reset(struct inode *inode, struct file *file)
> > > > +{
> > > > +       return single_open(file, npcm7xx_proc_reset, PDE_DATA(inode));
> > > > +}
> > > > +
> > > > +static const struct file_operations npcm7xx_ether_proc_fops_reset = {
> > > > +       .open           = npcm7xx_ether_proc_reset,
> > > > +       .read           = seq_read,
> > > > +       .llseek         = seq_lseek,
> > > > +       .release        = single_release,
> > > > +};
> > 
> > Get rid of all the proc stuff. Use ethtool for register dumps if
> > needed.
> 
> Is it a must? iit means I will have to count on eth tool existance.
> 
> > 
> > 
> > > > +static const struct of_device_id emc_dt_id[] = {
> > > > +       { .compatible = "nuvoton,npcm750-emc",  },
> > > > +       {},
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, emc_dt_id);
> > > > +
> > > > +static int npcm7xx_ether_probe(struct platform_device *pdev)
> > > > +{
> > > > +       struct npcm7xx_ether *ether;
> > > > +       struct net_device *dev;
> > > > +       int error;
> > > > +       char proc_filename[32];
> > > > +
> > > > +
> > > > +#ifdef CONFIG_OF
> > > 
> > > Remove these guards. We will be using OF to probe the driver in the common case.
> 
> OK
> 
> > > 
> > > > +       struct clk *emc_clk = NULL;
> > > > +       const struct of_device_id *of_id;
> > > > +       struct device_node *np = pdev->dev.of_node;
> > > > +
> > > > +       pdev->id = of_alias_get_id(np, "ethernet");
> > > > +       if (pdev->id < 0)
> > > > +               pdev->id = 0;
> > > > +
> > > > +       emc_clk = devm_clk_get(&pdev->dev, NULL);
> > > > +
> > > > +       if (IS_ERR(emc_clk))
> > > > +               return PTR_ERR(emc_clk);
> > > > +
> > > > +       /* Enable Clock */
> > > > +       clk_prepare_enable(emc_clk);
> > > > +#endif
> > > > +
> > > > +
> > > > +       /* disable for now - need to check if necessary */
> > > > +       gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
> > > > +       if (IS_ERR(gcr_regmap)) {
> > > > +               pr_err("%s: failed to find nuvoton,npcm750-gcr\n", __func__);
> > > > +               return IS_ERR(gcr_regmap);
> > > > +       }
> > > 
> > > Remove the GCR and muxing code. This will be handled by your pinmux driver.
> 
> OK
> 
> > > 
> > > > +
> > > > +       rst_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-rst");
> > > > +       if (IS_ERR(rst_regmap)) {
> > > > +               pr_err("%s: failed to find nuvoton,npcm750-rst\n", __func__);
> > > > +               return IS_ERR(rst_regmap);
> > > > +       }
> > > > +
> > > > +       /* Muxing RMII MDIO */
> > > > +       if (pdev->id == 0) {
> > > > +               regmap_update_bits(gcr_regmap, MFSEL3_OFFSET, (0x1 << 9),
> > > > +                                  (0x1 << 9));
> > > > +               regmap_update_bits(gcr_regmap, MFSEL1_OFFSET, (0x1 << 13),
> > > > +                                  (0x1 << 13));
> > > > +               regmap_update_bits(gcr_regmap, MFSEL1_OFFSET, (0x1 << 12),
> > > > +                                  (0x1 << 12));
> > > > +               regmap_update_bits(gcr_regmap, INTCR_OFFSET, (0x1 << 5),
> > > > +                                  (0x1 << 5));
> > > > +       }
> > > > +       if (pdev->id == 1) {
> > > > +               regmap_update_bits(gcr_regmap, MFSEL1_OFFSET, (0x1 << 14),
> > > > +                                  (0x1 << 14));
> > > > +               regmap_update_bits(gcr_regmap, MFSEL1_OFFSET, (0x1 << 16),
> > > > +                                  (0x1 << 16));
> > > > +               regmap_update_bits(gcr_regmap, MFSEL1_OFFSET, (0x1 << 15),
> > > > +                                  (0x1 << 15));
> > > > +       }
> > > > +
> > > > +       /* Reset EMC module */
> > > > +       if (pdev->id == 0) {
> > > > +               regmap_update_bits(rst_regmap, IPSRST1_OFFSET, (0x1 << 6),
> > > > +                                  (0x1 << 6));
> > > > +               regmap_update_bits(rst_regmap, IPSRST1_OFFSET, (0x1 << 6), 0);
> > > > +       }
> > > > +       if (pdev->id == 1) {
> > > > +               regmap_update_bits(rst_regmap, IPSRST1_OFFSET, (0x1 << 21),
> > > > +                                  (0x1 << 21));
> > > > +               regmap_update_bits(rst_regmap, IPSRST1_OFFSET, (0x1 << 21), 0);
> > > > +       }
> > 
> > A reset or clk driver should take care of the above.
> 
> OK
> > 
> > > > +       #ifdef CONFIG_OF
> > 
> > As Joel says, remove all the CONFIG_OF.
> > 
> > > > +       of_id = of_match_device(emc_dt_id, &pdev->dev);
> > > > +       if (!of_id) {
> > > > +               dev_err(&pdev->dev, "Error: No device match found\n");
> > > > +               return -ENODEV;
> > > > +       }
> > > > +       /*
> > 
> > Why do you need that ? You've already been matched.
> 
> OK.
> 
> > 
> > > > +        * Right now device-tree probed devices don't get dma_mask set.
> > > > +        * Since shared usb code
> > 
> > USB ?
> > 
> > > > relies on it, set it here for now.
> > > > +        * Once we have dma capability bindings this can go away.
> > > > +        */
> > > > +       error = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> > > > +       if (error)
> > > > +               return -ENODEV;
> > > > +       #endif
> > 
> > That looks odd... Joel, I fogot now, how do we get the dma_mask
> > established on aspeed ? I don't remember the need to use the "coerce"
> > forms.
> > 
> > > > +       dev = alloc_etherdev(sizeof(struct npcm7xx_ether));
> > > > +       if (!dev)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       snprintf(dev->name, IFNAMSIZ, "eth%d", pdev->id);
> > 
> > That might cause you surprises if another ethernet driver has picked up
> > those numbers already... I wouldn't do that, I would just leave the
> > network stack pick a name.
> 
> OK.
> > 
> > > > +       ether = netdev_priv(dev);
> > > > +
> > > > +       ether->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > > +       if (ether->res == NULL) {
> > > > +               dev_err(&pdev->dev, "failed to get I/O memory\n");
> > > > +               error = -ENXIO;
> > > > +               goto failed_free;
> > > > +       }
> > > > +
> > > > +       if (!request_mem_region(ether->res->start,
> > > > +                               resource_size(ether->res), pdev->name)) {
> > > > +               dev_err(&pdev->dev, "failed to request I/O memory\n");
> > > > +               error = -EBUSY;
> > > > +               goto failed_free;
> > > > +       }
> > > > +
> > > > +       ether->reg = ioremap(ether->res->start, resource_size(ether->res));
> > > > +       EMC_DEBUG(" ether->reg = 0x%x\n", __func__, (unsigned int)ether->reg);
> > > > +
> > > > +       if (ether->reg == NULL) {
> > > > +               dev_err(&pdev->dev, "failed to remap I/O memory\n");
> > > > +               error = -ENXIO;
> > > > +               goto failed_free_mem;
> > > > +       }
> > > > +
> > > > +       ether->txirq = platform_get_irq(pdev, 0);
> > > > +       if (ether->txirq < 0) {
> > > > +               dev_err(&pdev->dev, "failed to get ether tx irq\n");
> > > > +               error = -ENXIO;
> > > > +               goto failed_free_io;
> > > > +       }
> > > > +
> > > > +       ether->rxirq = platform_get_irq(pdev, 1);
> > > > +       if (ether->rxirq < 0) {
> > > > +               dev_err(&pdev->dev, "failed to get ether rx irq\n");
> > > > +               error = -ENXIO;
> > > > +               goto failed_free_txirq;
> > > > +       }
> > > > +
> > > > +       SET_NETDEV_DEV(dev, &pdev->dev);
> > > > +       platform_set_drvdata(pdev, dev);
> > > > +       ether->ndev = dev;
> > > > +
> > > > +       ether->pdev = pdev;
> > > > +       ether->msg_enable = NETIF_MSG_LINK;
> > > > +
> > > > +       dev->netdev_ops = &npcm7xx_ether_netdev_ops;
> > > > +       dev->ethtool_ops = &npcm7xx_ether_ethtool_ops;
> > > > +
> > > > +       dev->tx_queue_len = TX_DESC_SIZE;
> > 
> > The name is ambiguous ... is it a queue lenght or a descriptor size ...
> 
> I will change
> > 
> > > > +       dev->dma = 0x0;
> > > > +       dev->watchdog_timeo = TX_TIMEOUT;
> > > > +
> > > > +       get_mac_address(dev);
> > > > +
> > > > +       ether->cur_tx = 0x0;
> > > > +       ether->cur_rx = 0x0;
> > > > +       ether->finish_tx = 0x0;
> > > > +       ether->pending_tx = 0x0;
> > > > +       ether->link = 0;
> > > > +       ether->speed = 100;
> > > > +       ether->duplex = DUPLEX_FULL;
> > > > +       ether->need_reset = 0;
> > > > +       ether->dump_buf = NULL;
> > > > +       ether->rx_berr = 0;
> > > > +       ether->rx_err = 0;
> > > > +       ether->rdu = 0;
> > > > +       ether->rxov = 0;
> > > > +       ether->rx_stuck = 0;
> > > > +       // debug counters
> > > > +       ether->max_waiting_rx = 0;
> > > > +       ether->rx_count_pool = 0;
> > > > +       ether->count_xmit = 0;
> > > > +       ether->rx_int_count = 0;
> > > > +       ether->rx_err_count = 0;
> > > > +       ether->tx_int_count = 0;
> > > > +       ether->count_finish = 0;
> > > > +       ether->tx_tdu = 0;
> > > > +       ether->tx_tdu_i = 0;
> > > > +       ether->tx_cp_i = 0;
> > > > +
> > > > +       spin_lock_init(&ether->lock);
> > > > +
> > > > +       netif_napi_add(dev, &ether->napi, npcm7xx_poll, RX_POLL_SIZE);
> > > > +
> > > > +       ether_setup(dev);
> > 
> > Do you need that ether_setup ? Normally drivers don't need that,
> > alloc_etherdev does it.
> 
> If you are sure I will try to remove that.
> > 
> > > > +       error = npcm7xx_mii_setup(dev);
> > > > +       if (error < 0) {
> > > > +               dev_err(&pdev->dev, "npcm7xx_mii_setup err\n");
> > > > +               goto failed_free_rxirq;
> > > > +       }
> > > > +
> > > > +       error = register_netdev(dev);
> > > > +       if (error != 0) {
> > > > +               dev_err(&pdev->dev, "register_netdev() failed\n");
> > > > +               error = -ENODEV;
> > > > +               goto failed_free_rxirq;
> > > > +       }
> > > > +       snprintf(proc_filename, sizeof(proc_filename), "%s.%d", PROC_FILENAME,
> > > > +                pdev->id);
> > > > +       proc_create_data(proc_filename, 0000, NULL, &npcm7xx_ether_proc_fops,
> > > > +                        dev);
> > > > +
> > > > +       snprintf(proc_filename, sizeof(proc_filename), "%s.%d.reset",
> > > > +                PROC_FILENAME, pdev->id);
> > > > +       proc_create_data(proc_filename, 0000, NULL,
> > > > +                        &npcm7xx_ether_proc_fops_reset, dev);
> > 
> > Kill the proc gunk.
> > 
> > > > +       return 0;
> > > > +
> > > > +failed_free_rxirq:
> > > > +       free_irq(ether->rxirq, pdev);
> > > > +       platform_set_drvdata(pdev, NULL);
> > > > +failed_free_txirq:
> > > > +       free_irq(ether->txirq, pdev);
> > > > +failed_free_io:
> > > > +       iounmap(ether->reg);
> > > > +failed_free_mem:
> > > > +       release_mem_region(ether->res->start, resource_size(ether->res));
> > > > +failed_free:
> > > > +       free_netdev(dev);
> > > > +
> > > > +       return error;
> > > > +}
> > > > +
> > > > +static int npcm7xx_ether_remove(struct platform_device *pdev)
> > > > +{
> > > > +       struct net_device *dev = platform_get_drvdata(pdev);
> > > > +       struct npcm7xx_ether *ether = netdev_priv(dev);
> > > > +       char proc_filename[32];
> > > > +
> > > > +       snprintf(proc_filename, sizeof(proc_filename), "%s.%d", PROC_FILENAME,
> > > > +                pdev->id);
> > > > +       remove_proc_entry(proc_filename, NULL);
> > > > +       snprintf(proc_filename, sizeof(proc_filename), "%s.%d.reset",
> > > > +                PROC_FILENAME, pdev->id);
> > > > +       remove_proc_entry(proc_filename, NULL);
> > > > +
> > > > +       unregister_netdev(dev);
> > > > +
> > > > +
> > > > +       free_irq(ether->txirq, dev);
> > > > +       free_irq(ether->rxirq, dev);
> > > > +
> > > > +       if (ether->phy_dev)
> > > > +               phy_disconnect(ether->phy_dev);
> > > > +
> > > > +       mdiobus_unregister(ether->mii_bus);
> > > > +       kfree(ether->mii_bus->irq);
> > > > +       mdiobus_free(ether->mii_bus);
> > > > +
> > > > +       platform_set_drvdata(pdev, NULL);
> > > > +
> > > > +       free_netdev(dev);
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static struct platform_driver npcm7xx_ether_driver = {
> > > > +       .probe          = npcm7xx_ether_probe,
> > > > +       .remove         = npcm7xx_ether_remove,
> > > > +       .driver         = {
> > > > +               .name   = DRV_MODULE_NAME,
> > > > +               .owner  = THIS_MODULE,
> > > > +               .of_match_table = of_match_ptr(emc_dt_id),
> > > > +       },
> > > > +};
> > > > +
> > > > +#ifdef CONFIG_OF
> > > > +module_platform_driver(npcm7xx_ether_driver);
> > > > +#else
> > > > +static int __init npcm7xx_ether_init(void)
> > > > +{
> > > > +
> > > > +       return platform_driver_register(&npcm7xx_ether_driver);
> > > > +}
> > > > +
> > > > +static void __exit npcm7xx_ether_exit(void)
> > > > +{
> > > > +       platform_driver_unregister(&npcm7xx_ether_driver);
> > > > +}
> > > > +
> > > > +module_init(npcm7xx_ether_init);
> > > > +module_exit(npcm7xx_ether_exit);
> > > > +#endif
> > > 
> > > platform_driver_register(npcm7xx_ether_driver);
> > > 
> > > Cheers,
