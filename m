Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s2ss715GxzDqQ9
 for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2016 18:27:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Ycj7NXzE; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id g202so9973896pfb.1
 for <openbmc@lists.ozlabs.org>; Mon, 01 Aug 2016 01:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VDJag0FqcRzo0eTl7Seib/WCuy3iexYiYu5LccrUrrk=;
 b=Ycj7NXzEsB5alz7N1cfwK38eEWtW1d0TxjKMOe7N0/4tJZCV9XZ7iwyM6/T4TQ/jxA
 94xlXvw8KbW2nvv/xWRiWB5UDPwChphm8xQ0EgibNOWRdS9wjhW+D6B57ZVvhfc7AZDG
 1wXFFLvo51T0qFtKTxuxFe6PJRE02H4tShDpQryct8RSBkOnuoEHO1mvoRaj+ShfdBPi
 eM/WEXlqRf5E9KHRDEPQOO43AOFUKYlkPV4kMDqOOOKsu42gUQHBRx9+z7/mGO0+UGKs
 tfIV+CScD49EKB2EvCAV+3l/5EOfTx2jF89jPgHWAkJ2m8p8H9HzXzx7l8kcJtx7CNDu
 O1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VDJag0FqcRzo0eTl7Seib/WCuy3iexYiYu5LccrUrrk=;
 b=PhZe7290gpMr/xcyVXX3I5AGhtSWhhJ6JryaVbwFlUBkUjtast4xLMLU6KH1l2K45V
 Da2kkxWI4ccxltJ+C8FZ2HBiw0oaTy0u8vjg3Q5Kp3qisi8O8G7FwtMKryCafs933g7y
 q70PXhbwx1b9rbMyIIsKYBizYF1S0PyiHeSr744R72/yZ9KXumInClz5ZZlANJluxO0N
 KDM6O8zDNl3+FUwDIeTvMFSg6iV52P4yEZ6EV3dth/MhEkvMyDbyNbo9kBan2ooTqq9T
 otuDEZzRWXPlugKhXHGpO6ZbKf8DPMhlE2INuOwJv1F0r4dYkLQ2xu7jVihzOlpVoqN5
 2koQ==
X-Gm-Message-State: AEkoouv/oiBzTJMUuVeF7o3r/PiIJdQ9hBzZjoPQa272XV+vtUY4B+4KzvRMz8gha1QcfQ==
X-Received: by 10.98.32.138 with SMTP id m10mr93826288pfj.146.1470040057530;
 Mon, 01 Aug 2016 01:27:37 -0700 (PDT)
Received: from aurora ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id dz13sm43289458pac.44.2016.08.01.01.27.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Aug 2016 01:27:36 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1470040052.16990.9.camel@jms.id.au>
Subject: Re: [PATCH dev-4.7] net/faraday: Switch to use-ncsi device node
 property
From: Joel Stanley <joel@jms.id.au>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Mon, 01 Aug 2016 17:57:32 +0930
In-Reply-To: <1469673429-29042-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1469673429-29042-1-git-send-email-gwshan@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 01 Aug 2016 08:27:39 -0000

On Thu, 2016-07-28 at 12:37 +1000, Gavin Shan wrote:
> This uses "use-ncsi" device node property to enable NCSI interface
> as we do in upstream kernel. No functional change introduced.

Thanks. I've applied a version of this to my rebased dev-4.7 tree that
I will push out soon.

Cheers,

Joel

> 
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts   | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts    | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 2 +-
>  drivers/net/ethernet/faraday/ftgmac100.c         | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index 41ee12a..310a4ef 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -71,7 +71,7 @@
>  &mac0 {
>  	status = "okay";
>  
> -	use-nc-si;
> +	use-ncsi;
>  };
>  
>  &i2c0 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index 63b039c..d97f216 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -56,7 +56,7 @@
>  &mac0 {
>  	status = "okay";
>  
> -	use-nc-si;
> +	use-ncsi;
>  };
>  
>  &i2c4 {
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index 1ae3983..bd76100 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -70,7 +70,7 @@
>  &mac0 {
>  	status = "okay";
>  
> -	use-nc-si;
> +	use-ncsi;
>  	no-hw-checksum;
>  };
>  
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index bb5ec59..d5b9af9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -28,7 +28,7 @@
>  &mac0 {
>  	status = "okay";
>  
> -	use-nc-si;
> +	use-ncsi;
>  	no-hw-checksum;
>  };
>  
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c
> b/drivers/net/ethernet/faraday/ftgmac100.c
> index fc2852f..c67b670 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1352,7 +1352,7 @@ static int ftgmac100_probe(struct
> platform_device *pdev)
>  	priv = netdev_priv(netdev);
>  	SET_NETDEV_DEV(netdev, &pdev->dev);
>  	if (pdev->dev.of_node &&
> -	    of_get_property(pdev->dev.of_node, "use-nc-si", NULL)) {
> +	    of_get_property(pdev->dev.of_node, "use-ncsi", NULL)) {
>  		dev_info(&pdev->dev, "Using NCSI interface\n");
>  		netdev->phydev = NULL;
>  		priv->use_ncsi = true;
