Return-Path: <dja@axtens.net>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8CCAA1A009A
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 09:37:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=fVJsvS4/; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id n128so7811814pfn.3
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jan 2016 14:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:user-agent:date
 :message-id:mime-version:content-type;
 bh=cht7MkSTLm7IyuK8aDvF9jgkSn5JHT9KFm+EIX+ctoM=;
 b=fVJsvS4/3NocZR6p3fmthOjk6+K4Kzn2YieRp5+Oc99H5umtgSghhA3lwcfBeB6Jru
 TVaXHGbY8OauFtz3Nwc1ultc/5BzREm088yAnQr4plllPoE5ocF2ijuK82m7wm2rWqB6
 c3gskxKxHcbqR+swNtMgSqfEF+ovnkdkzhfMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=cht7MkSTLm7IyuK8aDvF9jgkSn5JHT9KFm+EIX+ctoM=;
 b=cyW0iKadpNrfNgvMZIZ5/qKqWKpU75rDQq4IKniz3cOfD9U9fWK0AVkg5banv30kIB
 u/y4AlsqELR3yMclmN5t7yv0crm40tiKPYDxTRa/pHzR2qx/2C1ykwT/uNOz321z+UKo
 fOPcSWuKa9787WjSsuCQ2+zwLiGmrvai6PpRLqzcQNdzIsyNZBP7Tpy920vdnin5od4R
 OF95u93tk3EsH/2NfbCAZ33/s8M3cHKo8bVxdPGxH8k7kqkiIR1i3BNcod0yxqBl6Jj1
 4CGzu0+99YfcswJqsaaomIxbsOENqQlLhahOxgAk93xjSRYriCuuNMkze731zO/KrDHq
 +Mzg==
X-Gm-Message-State: ALoCoQnSv5n4qt5QJ/8pN8jvJHekdVP9LN/2McE1PVaEBmSB9esI6JFVDYNOWA8VLXN3VoMcIV4b0bxp+5KyOnFU656Kzafo/A==
X-Received: by 10.98.80.76 with SMTP id e73mr9995272pfb.24.1452811045850;
 Thu, 14 Jan 2016 14:37:25 -0800 (PST)
Received: from localhost ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id u21sm11543110pfi.15.2016.01.14.14.37.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Jan 2016 14:37:25 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: Re: [PATCH btbridge 1/3] Initialise variable to avoid using it
 uninitialised
In-Reply-To: <1452750607-27095-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452750607-27095-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452750607-27095-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Fri, 15 Jan 2016 09:37:22 +1100
Message-ID: <87vb6v4wkd.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
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
X-List-Received-Date: Thu, 14 Jan 2016 22:37:28 -0000


Out of curiosity, how did you find this? I'm guessing inspection?

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Cyril Bur <cyril.bur@au1.ibm.com>
>
> ---
>  btbridged.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/btbridged.c b/btbridged.c
> index fe692bb..3e261a9 100644
> --- a/btbridged.c
> +++ b/btbridged.c
> @@ -489,7 +489,7 @@ static int dispatch_sd_bus(struct btbridged_context *context)
>  static int dispatch_bt(struct btbridged_context *context)
>  {
>  	int err = 0;
> -	int r;
> +	int r = 0;
>  
>  	assert(context);
>  
> -- 
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
