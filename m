Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 91CA01A0CB8
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2016 15:17:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=qX5MIr6f; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id 184so4346190pff.1
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 20:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZNGafLtIjg83gN2zp/4PwoYijyTG+M8Xz1xQh6dJ5m4=;
 b=qX5MIr6fAMKk60FSXD3iEKnXRM2jUVstorSkvopzBdNPnM8d2/k4Y68REVRRLjANY9
 VkJuk35DJUC0ewdPS+E36jcyrP0kAwlZVqS2JER+rqtrOo5havAtmbWU2CQ5Cj3NzxAd
 ddhcCqSayO5VarOb656SfKRv/hbBNaUo4J5pPX3NVqaSSgHuJo5omtLY0t4hGX0tlZB1
 2oQ+KAeUSbHVUukA8Hfc99kEOXdcm+WIcQP9r+S9qOD1B47xhCYz1jd/5hr/6hgQNEzM
 ST8xbGKeeOV2AkBuwfzi97J/nuAh1FH8/wfptC+IrGCioXPDBD2POxNPTroU8Htvrk+A
 XR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZNGafLtIjg83gN2zp/4PwoYijyTG+M8Xz1xQh6dJ5m4=;
 b=ZNRn6HX4DtwNJZFwcgSdrPaanrPy3koEEPJC25vIg/KwdBQjs7R8ApEmC6M9VZRK6A
 1WK66h8hs+fK0To+UAI8rad5r+W6QQtIRtMPVM4wu7wMRUBimZ/qfeM7a3YZMxYe+y2I
 ZJr9i5WZ9OirqRPmp1hgCfPTvJpyjSfUTlQfZ/paNcw5LnJ1lwkhjP31ykdK0LAwsHRh
 vyUlq4Kcvyq1CrO1Aav1wrRyhj2kZzJWnothhQzS/mIHAyJOPtaJIJwsTpv7ipfUdJzk
 1Q/ObXes5eZwGkuPbuYUbYOOOMSGnrCQnMYuDIBnUcTJMvk6ZEI9CVZZ2+uew83rYAE9
 Bqnw==
X-Gm-Message-State: AD7BkJKD4v7I0C4rVCLUZdCNkk9fspNyW/ijNhh+pxQwLy9q6MaqeVSN9uKbtMO6PZuQMg==
X-Received: by 10.98.12.154 with SMTP id 26mr22101514pfm.20.1456805854595;
 Mon, 29 Feb 2016 20:17:34 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id ah10sm41504383pad.23.2016.02.29.20.17.32
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 29 Feb 2016 20:17:34 -0800 (PST)
Date: Tue, 1 Mar 2016 15:17:28 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Ratan Gupta <ratagupt@in.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v2 2/2] Removed the handler function
 of the wild card command enter the commit message for your changes. Lines
 starting
Message-ID: <20160301151728.64ced92d@camb691>
In-Reply-To: <1456746032-24977-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456746032-24977-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456746032-24977-3-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Mar 2016 04:17:37 -0000

On Mon, 29 Feb 2016 05:40:32 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Ratan Gupta <ratagupt@in.ibm.com>
> 


Probably could have been one patch. Oh well.

Reviewed-by: Cyril Bur <cyrilbur@gmail.com>

> ---
>  globalhandler.C | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/globalhandler.C b/globalhandler.C
> index 25ae26a..2d3af92 100644
> --- a/globalhandler.C
> +++ b/globalhandler.C
> @@ -142,22 +142,6 @@ ipmi_ret_t ipmi_global_warm_reset(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>      return rc;
>  }
>  
> -ipmi_ret_t ipmi_global_wildcard_handler(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
> -                              ipmi_request_t request, ipmi_response_t response,
> -                              ipmi_data_len_t data_len, ipmi_context_t context)
> -{
> -    printf("Handling WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",netfn, cmd);
> -
> -    // Status code.
> -    ipmi_ret_t rc = IPMI_CC_OK;
> -
> -    *data_len = strlen("THIS IS WILDCARD");
> -
> -    // Now pack actual response
> -    memcpy(response, "THIS IS WILDCARD", *data_len);
> -
> -    return rc;
> -}
>  
>  void register_netfn_global_functions()
>  {
