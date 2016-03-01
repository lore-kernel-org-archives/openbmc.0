Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E7DE41A0D0F
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2016 15:16:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Xi/i729y; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id y7so9712799paa.0
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 20:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AD+r+tg0wK8KIqWUuZLRYxH583lpVKBqePud3JpXDkA=;
 b=Xi/i729ysk7olen92k/vdnvVvf3WVTnuQhEB32Q1wTrX4Pajg9NYhrtzXEK472UJVW
 Bt6+vp8Ev1P6eYsZlDdJYjYdfYF503X6xdDPgrH9Z9408C/NKhcM/rnv3BaTTloD4PiQ
 /ho+YFxBtEtmtkteVfHXG9kCshk3w7Jz+G9/hgJKHCm/eliOKWHmn2pUjQraz8SmvFXc
 Z/bJiCbgJfbZbCMLlX+GZjFJEk5oEoqsos5rp8cHPCr2DFqNHNZxSqBUHQXV4vYpKjzU
 8O79poa9sHuhwx2AOXFbo2ko4S5VCWkdouz+BR1D76+9LWAqhmIda6daQGICiieP0B2y
 Uw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AD+r+tg0wK8KIqWUuZLRYxH583lpVKBqePud3JpXDkA=;
 b=nGmBSK26XcqG/PCORVeRZzduWG2J33f9uC89HAercyKt20vaPF5jLcJhOv33mr78dJ
 3/JSkv8NxbSk+H263yYnx+nUVSNIJYAh/8v407NMRpBFTUGSJh8qrxjzk4/HI8IvU4LR
 pkW7z43SM615csvZzhhZ+fd1FALYAVzLRTf0rDM5MkZBpI63zCyDQD5j/+5NxtruQl1U
 QPo6AdRIns1R/neBZePzE6eXGioxetcEaAt1dR6idGd+/QsjjznvRsJhp4im5Z16aK7p
 +HIpQbhDgjebhVobMqQfPT4Ch42nqFTAfVYx7gH+U6Gl8fWj///XbpMwlJzt89Vica28
 4bqg==
X-Gm-Message-State: AD7BkJKwoa4l06LSj9K2pLF4Xy1xGMeRE8GAsNwiSVFJK+43KPMSpVL7OvDMtobJxVbBOA==
X-Received: by 10.66.102.70 with SMTP id fm6mr27042981pab.98.1456805812002;
 Mon, 29 Feb 2016 20:16:52 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id i23sm41380381pfj.68.2016.02.29.20.16.49
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 29 Feb 2016 20:16:51 -0800 (PST)
Date: Tue, 1 Mar 2016 15:16:43 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Ratan Gupta <ratagupt@in.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v2 1/2] Fixing the Duplicate
 registration for NetFn [0x6], Cmd:[0xFF]
Message-ID: <20160301151643.77f21862@camb691>
In-Reply-To: <1456746032-24977-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456746032-24977-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456746032-24977-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
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
X-List-Received-Date: Tue, 01 Mar 2016 04:16:55 -0000

On Mon, 29 Feb 2016 05:40:31 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Ratan Gupta <ratagupt@in.ibm.com>
> 


Probably could have been one patch. Oh well.

Reviewed-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  globalhandler.C | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/globalhandler.C b/globalhandler.C
> index e68ea79..25ae26a 100644
> --- a/globalhandler.C
> +++ b/globalhandler.C
> @@ -164,8 +164,5 @@ void register_netfn_global_functions()
>      printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WARM_RESET);
>      ipmi_register_callback(NETFUN_APP, IPMI_CMD_WARM_RESET, NULL, ipmi_global_warm_reset);
>  
> -    printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN_APP, IPMI_CMD_WILDCARD);
> -    ipmi_register_callback(NETFUN_APP, IPMI_CMD_WILDCARD, NULL, ipmi_global_wildcard_handler);
> -
> -	return;
> +    return;
>  }
