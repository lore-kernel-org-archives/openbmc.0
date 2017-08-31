Return-Path: <vernon.mauery@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xjmPZ1rNszDqF4
 for <openbmc@lists.ozlabs.org>; Fri,  1 Sep 2017 01:24:17 +1000 (AEST)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Aug 2017 08:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,453,1498546800"; d="scan'208";a="1009689937"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.85])
 by orsmga003.jf.intel.com with ESMTP; 31 Aug 2017 08:24:14 -0700
Date: Thu, 31 Aug 2017 08:24:14 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: Re: [PATCH net-next] net/ncsi: Define {add, kill}_vid callbacks for
 !CONFIG_NET_NCSI
Message-ID: <20170831152414.GB69617@mauery>
References: <20170831033846.23538-1-sam@mendozajonas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170831033846.23538-1-sam@mendozajonas.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 31 Aug 2017 15:24:18 -0000

On 31-Aug-2017 01:38 PM, Samuel Mendoza-Jonas wrote:
> Patch "net/ncsi: Configure VLAN tag filter" defined two new callback
> functions in include/net/ncsi.h, but neglected the !CONFIG_NET_NCSI
> case. This can cause a build error if these are referenced elsewhere
> without NCSI enabled, for example in ftgmac100:
> 
> >>> ERROR: "ncsi_vlan_rx_kill_vid" [drivers/net/ethernet/faraday/ftgmac100.ko] undefined!
> >>> ERROR: "ncsi_vlan_rx_add_vid" [drivers/net/ethernet/faraday/ftgmac100.ko] undefined!
> 
> Add definitions for !CONFIG_NET_NCSI to bring it into line with the rest
> of ncsi.h
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> ---
>  include/net/ncsi.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/net/ncsi.h b/include/net/ncsi.h
> index 1f96af46df49..2b13b6b91a4d 100644
> --- a/include/net/ncsi.h
> +++ b/include/net/ncsi.h
> @@ -36,6 +36,14 @@ int ncsi_start_dev(struct ncsi_dev *nd);
>  void ncsi_stop_dev(struct ncsi_dev *nd);
>  void ncsi_unregister_dev(struct ncsi_dev *nd);
>  #else /* !CONFIG_NET_NCSI */
> +int ncsi_vlan_rx_add_vid(struct net_device *dev, __be16 proto, u16 vid)
> +{
> +	return -ENOTTY;
> +}
> +int ncsi_vlan_rx_kill_vid(struct net_device *dev, __be16 proto, u16 vid)
> +{
> +	return -ENOTTY;
> +}

These should be static functions because they are defined in the header 
file or you will get multiple symbol definitions.

--Vernon

>  static inline struct ncsi_dev *ncsi_register_dev(struct net_device *dev,
>  					void (*notifier)(struct ncsi_dev *nd))
>  {
> -- 
> 2.14.1
> 
