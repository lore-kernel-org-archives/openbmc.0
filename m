Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPFRD1Fk7zDq6y
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 11:11:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=zkROalTU; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id n5so211645pfn.1
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2016 17:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0HKjtwV3UtwyB9WYkgA9H4CpJElTAoJN2wqrrSYmAWo=;
 b=zkROalTUh7DxbsAFO/CDGNykweyx1WZcc2GBCfQzMIpO1zRm3LNE0ggnUko7ri8gyM
 wXiQU9PqZre4j9pRwq3sSOfJ5dXwuQF3ZAg4RU28x4n3cU0ww7IA3+aJq/phpBp4Qr4l
 vzXy/HDgXtUcVRvnTSvUiLKoloiXvU6ahAJNWZjYw+ZqXi4WfRHOMmQNJMkz5UU5wN48
 gV0XTkIXIOsa8BK4hyxJv8UBsUaoXBEgz72vyAzgtYhrmqiPN8AmSQ9sZK0ikobKg2c9
 LFu23ZlVbwrPgxwbBgepvxYH9KS2FsqTdgp3k3+b2ajWRs2oPn942U4R2bWC6w4OOlJl
 orxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0HKjtwV3UtwyB9WYkgA9H4CpJElTAoJN2wqrrSYmAWo=;
 b=mMT/eb98PeYqiPHUpX8bEr0ObqCCL/ExTt7mjr8XBc5DtNOeVvGjV730Rgp2Y+7pPI
 Tq0hO1W/bFz14el3nD74i0sRmb/FqV3ENVbM6FmJHy332d4aEZBnRi8/ZFiYSJSzhdxB
 PtCfnItbm+UNU3KEiTkwbVMxYWYF62k1k8E/TimQolAi8dQPmgD8pkPbf6I7S2UM23fj
 YIRFLjSty/YV0HsekFifBbiF9Kr2Twn2beR5ScDHbiNDgxPjnfBXVHvOn/CD24Vug8pw
 5bj8X49B26fxlUzd4vGMUegs/sO4g3DX0jFAURL3uNPGgrnYvJ8swDbMO3TrMLTht5IF
 8bQQ==
X-Gm-Message-State: AD7BkJKZg9ZNL0s6J/dAnJntlOybDX+hDoeJZn7MdrEn/BCxj3V5qziknWRzeQU5bLIEVg==
X-Received: by 10.98.16.69 with SMTP id y66mr34203851pfi.86.1458000710075;
 Mon, 14 Mar 2016 17:11:50 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y27sm34699758pfi.82.2016.03.14.17.11.48
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 14 Mar 2016 17:11:49 -0700 (PDT)
Date: Tue, 15 Mar 2016 11:11:40 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: miltonm@us.ibm.com
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot 5/5] net: aspeednic: Do not fill in a random MAC
 address
Message-ID: <20160315111140.38b7562a@camb691>
In-Reply-To: <1457721644-29871-6-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457721644-29871-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457721644-29871-6-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Mar 2016 00:11:53 -0000

On Fri, 11 Mar 2016 12:40:44 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: "Milton D. Miller II" <miltonm@us.ibm.com>
> 

Hi Milton,

Series looks nice.

One question about this patch, should you also have removed the call to
aspeednick_write_hwaddr() from aspeednic_initialize() since the eth layer will
do it for you? Not a bit deal at all, the eth layer will also detect that it's
been done and just skip it?



> Do not check the u-boot environemnt or fill in a random address
> in the write_hwaddr hook, instead rely on the framework to do so.
> 
> The doc/README.ethaddr specifically states that random addresses
> are only to be assigned as part of a emergency such as a netboot
> recovery command.
> 
> The upstream commit created a config variable to assign a
> random mac when none is set leaving it zero and that has now
> been backported.
> 
> Note: The hardware address is reset to 0 as part of the ethernet
> reset performed at boot.  If no valid MAC address is found in
> the environment the hardware will contain zeros and the operating
> system will assign a valid random MAC address if u-boot is
> configured not to.
> 
> The net effect is an attempt to use the network will result in
> the ethernet address not set warning being printed if the ethaddr
> variable is not set, and a warning iwth the random mac address
> if the config is set.  If a valid ethernet address is set
> in the environment it will be programmed in the hardware and
> used by the operating system.
> 
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>
> ---
>  drivers/net/aspeednic.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/net/aspeednic.c b/drivers/net/aspeednic.c
> index 841df8b..e80561f 100644
> --- a/drivers/net/aspeednic.c
> +++ b/drivers/net/aspeednic.c
> @@ -1363,10 +1363,6 @@ static void aspeednic_halt(struct eth_device* dev)
>  
>  static int aspeednic_write_hwaddr(struct eth_device* dev)
>  {
> -  if (!eth_getenv_enetaddr_by_index("eth", 0, dev->enetaddr)) {
> -    eth_random_enetaddr(dev->enetaddr);
> -  }
> -
>    OUTL(dev, ((dev->enetaddr[2] << 24) | (dev->enetaddr[3] << 16)
>               | (dev->enetaddr[4] << 8) | dev->enetaddr[5]), MAC_LADR_REG);
>    OUTL(dev, ((dev->enetaddr[0] << 8) | dev->enetaddr[1]), MAC_MADR_REG);
