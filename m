Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com
 [IPv6:2607:f8b0:400e:c03::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skRD10BNSzDrT1
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 15:32:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=t/miNuC9; 
 dkim-atps=neutral
Received: by mail-pa0-x242.google.com with SMTP id j3so1584802paj.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2016 22:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lV7FJNKUYUuCjayMGiQ00LxqEQvX1NPqwMVC9UE/hTI=;
 b=t/miNuC9/BleONTealYgnx/XZk0nmtl3VFuRSAHw1YWUACmLA+7PAaAFaXsQgMEpnq
 9MHRz5dJw+HdYoeP4Z0/brITw7he32pEAdIzfeEitySmXIcxgHPvY6mi8KHAcQCk4YPm
 S8C0hGpLrRjhTFhn7TEPAmH/p+s+GAm33w/vuWrtqBjKwZciQVI0liSI//qfOqkkoP6Z
 9/3Nzbmp0y4v861VPtVxF4uyRihNnZlXxuwk14BdQ6PgABpZeTMCtxf7L2ro3hNAP20l
 3p3AWRyqLNSXkVylpgdyYaWC4cd12NUjzfeIveFeV0fJ71BsNY+LsNj4r8j7Cp0Bu6Z1
 7p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lV7FJNKUYUuCjayMGiQ00LxqEQvX1NPqwMVC9UE/hTI=;
 b=ZCuFmPfvXcBh037fnuEsqGd3VaE0FpRhd/binhBNtHyRwYTtS8ML6UPf/VplmhFiVv
 kCScj02WPX20o+XDVsKvFxEEK7o0fy5grajq1/TkzcqQVCNdRVpq18eHfgni8czvNumk
 i7O3xwHBnru6EHurCgySeCqNQqstn/rPesG7mwiUZOvUwtUzweDFKZk9IuZGmoCOkloz
 rfVMtLN/psV0o/kLv7NtDT67y0TLZOhKuP97SR4s0cYdR4HeyxKBE/WaUs6tTpxbSxV7
 V5+bB3ApG0bDlfUNEYWrA7RPugTKKEOv2q6hs9pIeamxmH7I8QRuQtmGNRfnretBUfwu
 wAGQ==
X-Gm-Message-State: AA6/9Rmo9SqYtOHqeede6YW827IrEEmEIEFpHvuLk0tjOtx/yz7nDbYIYM4MIFLgGL3oDw==
X-Received: by 10.66.230.168 with SMTP id sz8mr20905114pac.13.1475040735483;
 Tue, 27 Sep 2016 22:32:15 -0700 (PDT)
Received: from aurora152 ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id w186sm8721891pfb.84.2016.09.27.22.32.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Sep 2016 22:32:14 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1475040731.9493.4.camel@jms.id.au>
Subject: Re: [PATCH v4.7 3/7] net/ncsi: Don't probe on the reserved channel
 ID (0x1f)
From: Joel Stanley <joel@jms.id.au>
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Date: Wed, 28 Sep 2016 15:02:11 +0930
In-Reply-To: <1475030915-9525-3-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475030915-9525-3-git-send-email-gwshan@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.21.91-1ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 28 Sep 2016 05:32:17 -0000

On Wed, 2016-09-28 at 12:48 +1000, Gavin Shan wrote:
> We needn't send CIS (Clear Initial State) command to the NCSI
> reserved channel (0x1f) in the enumeration. We shouldn't receive
> a valid response from CIS on NCSI channel 0x1f.
> 
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  net/ncsi/ncsi-manage.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> index b03d1df..8011d51 100644
> --- a/net/ncsi/ncsi-manage.c
> +++ b/net/ncsi/ncsi-manage.c
> @@ -887,12 +887,12 @@ static void ncsi_probe_channel(struct
> ncsi_dev_priv *ndp)
>  		nd->state = ncsi_dev_state_probe_cis;
>  		break;
>  	case ncsi_dev_state_probe_cis:
> -		ndp->pending_req_num = 32;
> +		ndp->pending_req_num = NCSI_RESERVED_CHANNEL;
>  
>  		/* Clear initial state */
>  		nca.type = NCSI_PKT_CMD_CIS;
>  		nca.package = ndp->active_package->id;
> -		for (index = 0; index < 0x20; index++) {
> +		for (index = 0; index < NCSI_RESERVED_CHANNEL;
> index++) {
>  			nca.channel = index;
>  			ret = ncsi_xmit_cmd(&nca);
>  			if (ret)
> 
