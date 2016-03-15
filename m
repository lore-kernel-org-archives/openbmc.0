Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPFWB1518zDq6y
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 11:15:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=r1eLE7a+; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id q129so212547pfb.3
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2016 17:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tu9iFEjwhWfeaE5AX+gH95wdziiSMO58nC3FyI5LnxE=;
 b=r1eLE7a+hYtEnU2kZVCTNa51nAlSBHfEFb/sGUvy8bv1gPBbIzywKtfB8esR6gadpK
 FhNvcHGwfczEk0psKDEHOtVLd3zhPCwW6CfCJfJwr3Sm2dCRnCX5jGRjaypKJ5vYha8J
 Jk27gvvSkRg/bip+UpSraECrXXXhl62TzWZ9LVhGQexn7oD1nFIOJab6IipY9PzwsL8E
 BS5DzVgDowG9AO13MkpP223rsyQZuWRzAwqtdkuEni6HUjEPKSN+h6yN9Ol8mVYw1je1
 erqS3DTHL3dqRgUJEUjgM8oRn2FhWBoabma4Otmm699pYNt8w5MJW85rA41jLwEcpluQ
 Xp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tu9iFEjwhWfeaE5AX+gH95wdziiSMO58nC3FyI5LnxE=;
 b=kMHbjm1cCdTojbBMq+bOoLalL/PAli1OlYJYFzpu7pFzPEUwtBTDFJQefHuZQxnsJM
 WdFgOa5160FG0kPHjCUOc5xUdrBP1AeFqhN1K8TkoDNHVuvGPKIkgp48/JtWLbWMCLnM
 6xfxeAQYY7LrgKMNqAggX2gA8F+7qQv0KtWEsOx21oAX7talp1S3lj3H6GIDfDuiDaPG
 Nwhkdm+dYWypJkYHJOhogNp4jfWsIop9Y2Jya81118Gc275dYKQgs0TBylPnhjqBjf/8
 xbp4AdsrvSVuqo+XK0PS0VgFgsqRSsZ2R5OoOuGcVC0AgXULiEBEVH+lObfXkL1NCFQw
 IR2w==
X-Gm-Message-State: AD7BkJKGcw36aHvYxZqziF1GhH8gOg2+5Suka9SMusIAgPjFo3Ti59Ghyzu0ZTI+KUUnzg==
X-Received: by 10.98.72.8 with SMTP id v8mr23802629pfa.33.1458000916440;
 Mon, 14 Mar 2016 17:15:16 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id vy6sm34773932pac.38.2016.03.14.17.15.14
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 14 Mar 2016 17:15:16 -0700 (PDT)
Date: Tue, 15 Mar 2016 11:15:04 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: miltonm@us.ibm.com
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot 3/5] net: aspeednic: Remove extra spaces before
 assignments
Message-ID: <20160315111504.1612c3bb@camb691>
In-Reply-To: <1457721644-29871-4-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457721644-29871-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457721644-29871-4-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Mar 2016 00:15:18 -0000

On Fri, 11 Mar 2016 12:40:42 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> 
> The device method assignments had extra spaces before the =
> signs but all prior methods were 4 characters and so they
> were aligned.  Since write_hwaddr is significantly longer,
> the resulting spacing is not pleasing.  Since only a few other
> sites had simiar whitespace replace all multi-space sequences
> before an assignemnt with one space.
> 
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>

Reviewed-by: Cyril Bur <cyrilbur@gmail.com>

> ---
>  drivers/net/aspeednic.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
> index 90c0f0d..841df8b 100644
> --- a/drivers/net/aspeednic.c
> +++ b/drivers/net/aspeednic.c
> @@ -560,10 +560,10 @@ int aspeednic_initialize(bd_t *bis)
>    *(volatile u_long *)(SCU_BASE + SCU_SCRATCH_REGISTER) = cpu_to_le32((SCURegister & ~(0x3000)) | (CONFIG_MAC2_PHY_SETTING << 12));
>  
>  
> -  dev->init   = aspeednic_init;
> -  dev->halt   = aspeednic_halt;
> -  dev->send   = aspeednic_send;
> -  dev->recv   = aspeednic_recv;
> +  dev->init = aspeednic_init;
> +  dev->halt = aspeednic_halt;
> +  dev->send = aspeednic_send;
> +  dev->recv = aspeednic_recv;
>    dev->write_hwaddr = aspeednic_write_hwaddr;
>  
>    /* Ensure we're not sleeping. */
> @@ -1267,9 +1267,9 @@ static int aspeednic_send(struct eth_device* dev, volatile void *packet, int len
>  //            memset ((void *)cpu_to_le32((u32) (packet + length)), 0, 60 - length);
>      length = 60;
>    }
> -  tx_ring[tx_new].buf    = cpu_to_le32(((u32) packet));
> -  tx_ring[tx_new].status   &= (~(0x3FFF));
> -  tx_ring[tx_new].status   |= cpu_to_le32(LTS | FTS | length);
> +  tx_ring[tx_new].buf = cpu_to_le32(((u32) packet));
> +  tx_ring[tx_new].status &= (~(0x3FFF));
> +  tx_ring[tx_new].status |= cpu_to_le32(LTS | FTS | length);
>    tx_ring[tx_new].status |= cpu_to_le32(TXDMA_OWN);
>  
>    OUTL(dev, POLL_DEMAND, TXPD_REG);
> @@ -1297,7 +1297,7 @@ static int aspeednic_send(struct eth_device* dev, volatile void *packet, int len
>  static int aspeednic_recv(struct eth_device* dev)
>  {
>    s32   status;
> -  int   length    = 0;
> +  int   length = 0;
>  
>    for ( ; ; )
>    {
