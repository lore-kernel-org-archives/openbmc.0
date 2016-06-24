Return-Path: <clg@kaod.org>
Received: from 9.mo1.mail-out.ovh.net (9.mo1.mail-out.ovh.net [178.32.108.172])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rblKR5qvRzDqlD
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 03:13:31 +1000 (AEST)
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id D5C56FF92D7
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 19:13:23 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 96B972C009F;
 Fri, 24 Jun 2016 19:13:21 +0200 (CEST)
Subject: Re: [linux 1/2] drivers/net/ftgmac100: Make EDO{R,T}R bits
 configurable
To: Joel Stanley <joel@jms.id.au>, andrew@aj.id.au
References: <1466753146-2916-1-git-send-email-joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1ef664a3-c5c8-683c-6a8b-18ff3d6d4efb@kaod.org>
Date: Fri, 24 Jun 2016 19:13:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466753146-2916-1-git-send-email-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7652460195387706114
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdekgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Fri, 24 Jun 2016 17:13:32 -0000

On 06/24/2016 09:25 AM, Joel Stanley wrote:
> From: Andrew Jeffery <andrew@aj.id.au>
> 
> These bits are #defined at a fixed location. In order to support future
> hardware that has chosen to move these bits around move the bits into a
> member of the struct ftgmac100.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: Cédric Le Goater <clg@kaod.org>


C.

> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 39 ++++++++++++++++++++------------
>  drivers/net/ethernet/faraday/ftgmac100.h |  2 --
>  2 files changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 818477bbd491..2c2675d6ee3b 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -79,6 +79,9 @@ struct ftgmac100 {
>  
>  	bool use_ncsi;
>  	bool enabled;
> +
> +	uint32_t rxdes0_edorr_mask;
> +	uint32_t txdes0_edotr_mask;
>  };
>  
>  static int ftgmac100_alloc_rx_page(struct ftgmac100 *priv,
> @@ -268,10 +271,11 @@ static bool ftgmac100_rxdes_packet_ready(struct ftgmac100_rxdes *rxdes)
>  	return rxdes->rxdes0 & cpu_to_le32(FTGMAC100_RXDES0_RXPKT_RDY);
>  }
>  
> -static void ftgmac100_rxdes_set_dma_own(struct ftgmac100_rxdes *rxdes)
> +static void ftgmac100_rxdes_set_dma_own(const struct ftgmac100 *priv,
> +		struct ftgmac100_rxdes *rxdes)
>  {
>  	/* clear status bits */
> -	rxdes->rxdes0 &= cpu_to_le32(FTGMAC100_RXDES0_EDORR);
> +	rxdes->rxdes0 &= cpu_to_le32(priv->rxdes0_edorr_mask);
>  }
>  
>  static bool ftgmac100_rxdes_rx_error(struct ftgmac100_rxdes *rxdes)
> @@ -309,9 +313,10 @@ static bool ftgmac100_rxdes_multicast(struct ftgmac100_rxdes *rxdes)
>  	return rxdes->rxdes0 & cpu_to_le32(FTGMAC100_RXDES0_MULTICAST);
>  }
>  
> -static void ftgmac100_rxdes_set_end_of_ring(struct ftgmac100_rxdes *rxdes)
> +static void ftgmac100_rxdes_set_end_of_ring(const struct ftgmac100 *priv,
> +		struct ftgmac100_rxdes *rxdes)
>  {
> -	rxdes->rxdes0 |= cpu_to_le32(FTGMAC100_RXDES0_EDORR);
> +	rxdes->rxdes0 |= cpu_to_le32(priv->rxdes0_edorr_mask);
>  }
>  
>  static void ftgmac100_rxdes_set_dma_addr(struct ftgmac100_rxdes *rxdes,
> @@ -401,7 +406,7 @@ ftgmac100_rx_locate_first_segment(struct ftgmac100 *priv)
>  		if (ftgmac100_rxdes_first_segment(rxdes))
>  			return rxdes;
>  
> -		ftgmac100_rxdes_set_dma_own(rxdes);
> +		ftgmac100_rxdes_set_dma_own(priv, rxdes);
>  		ftgmac100_rx_pointer_advance(priv);
>  		rxdes = ftgmac100_current_rxdes(priv);
>  	}
> @@ -472,7 +477,7 @@ static void ftgmac100_rx_drop_packet(struct ftgmac100 *priv)
>  		if (ftgmac100_rxdes_last_segment(rxdes))
>  			done = true;
>  
> -		ftgmac100_rxdes_set_dma_own(rxdes);
> +		ftgmac100_rxdes_set_dma_own(priv, rxdes);
>  		ftgmac100_rx_pointer_advance(priv);
>  		rxdes = ftgmac100_current_rxdes(priv);
>  	} while (!done && ftgmac100_rxdes_packet_ready(rxdes));
> @@ -564,10 +569,10 @@ static bool ftgmac100_rx_packet(struct ftgmac100 *priv, int *processed)
>  /******************************************************************************
>   * internal functions (transmit descriptor)
>   *****************************************************************************/
> -static void ftgmac100_txdes_reset(struct ftgmac100_txdes *txdes)
> +static void ftgmac100_txdes_reset(const struct ftgmac100 *priv, struct ftgmac100_txdes *txdes)
>  {
>  	/* clear all except end of ring bit */
> -	txdes->txdes0 &= cpu_to_le32(FTGMAC100_TXDES0_EDOTR);
> +	txdes->txdes0 &= cpu_to_le32(priv->txdes0_edotr_mask);
>  	txdes->txdes1 = 0;
>  	txdes->txdes2 = 0;
>  	txdes->txdes3 = 0;
> @@ -588,9 +593,10 @@ static void ftgmac100_txdes_set_dma_own(struct ftgmac100_txdes *txdes)
>  	txdes->txdes0 |= cpu_to_le32(FTGMAC100_TXDES0_TXDMA_OWN);
>  }
>  
> -static void ftgmac100_txdes_set_end_of_ring(struct ftgmac100_txdes *txdes)
> +static void ftgmac100_txdes_set_end_of_ring(const struct ftgmac100 *priv,
> +		struct ftgmac100_txdes *txdes)
>  {
> -	txdes->txdes0 |= cpu_to_le32(FTGMAC100_TXDES0_EDOTR);
> +	txdes->txdes0 |= cpu_to_le32(priv->txdes0_edotr_mask);
>  }
>  
>  static void ftgmac100_txdes_set_first_segment(struct ftgmac100_txdes *txdes)
> @@ -709,7 +715,7 @@ static bool ftgmac100_tx_complete_packet(struct ftgmac100 *priv)
>  
>  	dev_kfree_skb(skb);
>  
> -	ftgmac100_txdes_reset(txdes);
> +	ftgmac100_txdes_reset(priv, txdes);
>  
>  	ftgmac100_tx_clean_pointer_advance(priv);
>  
> @@ -800,7 +806,7 @@ static int ftgmac100_alloc_rx_page(struct ftgmac100 *priv,
>  
>  	ftgmac100_rxdes_set_page(priv, rxdes, page);
>  	ftgmac100_rxdes_set_dma_addr(rxdes, map);
> -	ftgmac100_rxdes_set_dma_own(rxdes);
> +	ftgmac100_rxdes_set_dma_own(priv, rxdes);
>  	return 0;
>  }
>  
> @@ -847,7 +853,8 @@ static int ftgmac100_alloc_buffers(struct ftgmac100 *priv)
>  		return -ENOMEM;
>  
>  	/* initialize RX ring */
> -	ftgmac100_rxdes_set_end_of_ring(&priv->descs->rxdes[RX_QUEUE_ENTRIES - 1]);
> +	ftgmac100_rxdes_set_end_of_ring(priv,
> +			&priv->descs->rxdes[RX_QUEUE_ENTRIES - 1]);
>  
>  	for (i = 0; i < RX_QUEUE_ENTRIES; i++) {
>  		struct ftgmac100_rxdes *rxdes = &priv->descs->rxdes[i];
> @@ -857,7 +864,8 @@ static int ftgmac100_alloc_buffers(struct ftgmac100 *priv)
>  	}
>  
>  	/* initialize TX ring */
> -	ftgmac100_txdes_set_end_of_ring(&priv->descs->txdes[TX_QUEUE_ENTRIES - 1]);
> +	ftgmac100_txdes_set_end_of_ring(priv,
> +			&priv->descs->txdes[TX_QUEUE_ENTRIES - 1]);
>  	return 0;
>  
>  err:
> @@ -1350,6 +1358,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
>  		priv->use_ncsi = false;
>  	}
>  
> +	priv->rxdes0_edorr_mask = BIT(15);
> +	priv->txdes0_edotr_mask = BIT(15);
> +
>  	netdev->ethtool_ops = &ftgmac100_ethtool_ops;
>  	netdev->netdev_ops = &ftgmac100_netdev_ops;
>  	if (pdev->dev.of_node &&
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
> index 13408d448b05..c258586ce4a4 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.h
> +++ b/drivers/net/ethernet/faraday/ftgmac100.h
> @@ -189,7 +189,6 @@ struct ftgmac100_txdes {
>  } __attribute__ ((aligned(16)));
>  
>  #define FTGMAC100_TXDES0_TXBUF_SIZE(x)	((x) & 0x3fff)
> -#define FTGMAC100_TXDES0_EDOTR		(1 << 15)
>  #define FTGMAC100_TXDES0_CRC_ERR	(1 << 19)
>  #define FTGMAC100_TXDES0_LTS		(1 << 28)
>  #define FTGMAC100_TXDES0_FTS		(1 << 29)
> @@ -215,7 +214,6 @@ struct ftgmac100_rxdes {
>  } __attribute__ ((aligned(16)));
>  
>  #define FTGMAC100_RXDES0_VDBC		0x3fff
> -#define FTGMAC100_RXDES0_EDORR		(1 << 15)
>  #define FTGMAC100_RXDES0_MULTICAST	(1 << 16)
>  #define FTGMAC100_RXDES0_BROADCAST	(1 << 17)
>  #define FTGMAC100_RXDES0_RX_ERR		(1 << 18)
> 
