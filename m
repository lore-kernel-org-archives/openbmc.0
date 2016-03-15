Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPFSf388czDq6y
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 11:13:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=b4EDGnnu; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id n5so214993pfn.1
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2016 17:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KgIUMZDunFwQBN/nr57TlsOC9CObuHykMUBYrByHgBU=;
 b=b4EDGnnuTe7kH56+ukuSKU9iZ4e3znJ8IuW2uOMVmel4TVFMqG8dGFvbSVOrtJxIdm
 Cicnt4gWGmUMRBxmTcRGa1ctvEc+oeTGqsI1EhjFtpxXYIWw+XyK8+erXKPPN3xEzKSM
 gXWqf1Lr4R/2GdalMqgMyXcqW8raxYWQHUpk5zpOPHa9xQiLd6hhQyrmfbeFq0YrE/Q/
 acy7fN0EmE/qoUvL0eBq5MiOXl5aPmmpORnaWhn6EyEsD+4o157xa7N3FfVcKNyXG/0l
 A7AOMRgIkUJMTwVQZauTryGvXM+z0sCEmFfZjOYB2MoYh6IHP1N2l/3e8hjSWrHm6UsM
 CtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KgIUMZDunFwQBN/nr57TlsOC9CObuHykMUBYrByHgBU=;
 b=A4+G34D2C/vag2NZeVuUitR8FV6lBAVCN375H2RUmxLxixqbhheepoUlhPJ7l87hQy
 XCLyLP8kwqeO2sSess0b/0Ff4v2dEjuRCzjifVdXAvwDILT/r+CRTS3/5q0T6l7gCfYG
 WF982lAZkuLdFUjCLNuCp6OThcTwnIHtSD0YdDO+XRQJar6+unULpQqmImx5Roqqn7L2
 BEQ3GW7l3rO1YqpPOP6ywq2OnnnLQ/M7wC4uIn0o+LiiRXCGVie0yFzhhSUT4Fbl9l1X
 KVgq2jRd1MuRfV6v/U/F9/65vL9DUsnfRmLBPYAw6bFnANLiU2NrJVScYPB0cGlDOrHS
 vJmg==
X-Gm-Message-State: AD7BkJKkIaK6b/m+i6qytoRHf4wDNZDgF/iJlGTq4jeaXJgxH45Vx52NX63edshVSheeRA==
X-Received: by 10.98.12.8 with SMTP id u8mr34008604pfi.36.1458000782010;
 Mon, 14 Mar 2016 17:13:02 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id se8sm1749042pac.44.2016.03.14.17.12.59
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 14 Mar 2016 17:13:01 -0700 (PDT)
Date: Tue, 15 Mar 2016 11:12:52 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: miltonm@us.ibm.com
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot 1/5] net: aspeednic: Create aspeed_write_hwaddr
 from set_mac_address
Message-ID: <20160315111252.61bdea22@camb691>
In-Reply-To: <1457721644-29871-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457721644-29871-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457721644-29871-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2016 00:13:06 -0000

On Fri, 11 Mar 2016 12:40:40 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> 
> Tell the ethernet framework how to set the MAC address on the
> aspeed nic so it can be set at the expected points in the code.
> 
> Rename set_mac_address to aspeed_write_hwaddr.  Drop the unused
> argument, change the prototype to int, and return 0.
> 
> Assign the device write_hwaddr method to this new function.
> 
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>

Reviewed-by: Cyril Bur <cyrilbur@gmail.com>

> ---
>  drivers/net/aspeednic.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
> index d70c7ab..b8ce24c 100644
> --- a/drivers/net/aspeednic.c
> +++ b/drivers/net/aspeednic.c
> @@ -411,7 +411,7 @@ static int   aspeednic_init(struct eth_device* dev, bd_t* bis);
>  static int   aspeednic_send(struct eth_device* dev, volatile void *packet, int length);
>  static int   aspeednic_recv(struct eth_device* dev);
>  static void  aspeednic_halt(struct eth_device* dev);
> -static void  set_mac_address (struct eth_device* dev, bd_t* bis);
> +static int   aspeednic_write_hwaddr(struct eth_device* dev);
>  static void  phy_write_register (struct eth_device* dev, u8 PHY_Register, u8 PHY_Address, u16 PHY_Data);
>  static u16   phy_read_register (struct eth_device* dev, u8 PHY_Register, u8 PHY_Address);
>  #if defined(CONFIG_MII) || defined(CONFIG_CMD_MII)
> @@ -564,6 +564,7 @@ int aspeednic_initialize(bd_t *bis)
>    dev->halt   = aspeednic_halt;
>    dev->send   = aspeednic_send;
>    dev->recv   = aspeednic_recv;
> +  dev->write_hwaddr = aspeednic_write_hwaddr;
>  
>    /* Ensure we're not sleeping. */
>    if (CONFIG_ASPEED_MAC_PHY_SETTING >= 1) {
> @@ -1157,7 +1158,7 @@ static int aspeednic_init(struct eth_device* dev, bd_t* bis)
>  
>    aspeednic_probe_phy(dev);
>  
> -  set_mac_address (dev, bis);
> +  aspeednic_write_hwaddr(dev);
>    set_mac_control_register (dev);
>  
>    for (i = 0; i < NUM_RX_DESC; i++) {
> @@ -1362,7 +1363,7 @@ static void aspeednic_halt(struct eth_device* dev)
>    STOP_MAC(dev);
>  }
>  
> -static void set_mac_address (struct eth_device* dev, bd_t* bis)
> +static int aspeednic_write_hwaddr(struct eth_device* dev)
>  {
>    if (!eth_getenv_enetaddr_by_index("eth", 0, dev->enetaddr)) {
>      eth_random_enetaddr(dev->enetaddr);
> @@ -1374,6 +1375,8 @@ static void set_mac_address (struct eth_device* dev, bd_t* bis)
>    if (CONFIG_ASPEED_MAC_PHY_SETTING >= 1) {
>      memcpy(NCSI_Request.SA, dev->enetaddr, 6);
>    }
> +
> +  return 0;
>  }
>  
>  static u16 phy_read_register (struct eth_device* dev, u8 PHY_Register, u8 PHY_Address)
