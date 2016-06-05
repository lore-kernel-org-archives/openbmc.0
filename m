Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rN3K31h7bzDq7w
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 02:32:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=UdXaNMYP; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=cuE7p4Rr; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id l185so6916358qkc.2
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 09:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=S/0nGWBLOwGHHmpT4KnNWwsdCxwiV9zvjqKAaWClXz8=;
 b=UdXaNMYPq6ktlGXT7tZrL1SS7WlBgMvZJcJAKO1h1eEfNE+KQzBT6NERKG4qS+NKzY
 WQZIpkMLhI58two4cXK8traF/D0mIrWbMykC0mnIiNv1kbmhplz2ZecV5+ZegSAxYhQu
 AUWymc/lZvMXG5Tub5TUqCw1h7q5SfXEuNcc6zKeXmrvwdiqrrNkA/JpC1fyYUQQcxBN
 7qHaa2J92C4WnvlohH1VKoANyPhOKxcxtfdX7byVPt6bLrJZUo8ux6JReIdPITt1zbA4
 tpVXNDahaDeQI0rUTXHUvzr+2beeKwxTszTK2HTkaLAS4nqMKYWmDk6Fx4IlavuGDTsl
 g/OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=S/0nGWBLOwGHHmpT4KnNWwsdCxwiV9zvjqKAaWClXz8=;
 b=cuE7p4RrLXZhk2ZR3Ls3z/kVXP5gA4XgP9ggcBeUcP5OQnN8zzuFtgRGpOSoF/41K9
 fRARXkJroa4c1+UH2bsS/hVc6k8hJw9kP3xGal0F2TltGKMx2/Ij/SzASEr9W7ZWFY8e
 m7zqvow4UJbheIuyYsBW1T7YdNAeIQfnY8lUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=S/0nGWBLOwGHHmpT4KnNWwsdCxwiV9zvjqKAaWClXz8=;
 b=HvG5DOT8B0pbZ///mYfd4PWLNSKr3yMA3PGGh1XREqMKlMs1/WqSaeCvY6ivMD6ceS
 AEFQ+kJV8e1rjZJ9Sp2q+06Rl5BlCVY120eGQxRw3GRq3JZm0tGctKdSl4akxJInst+s
 Ekk6YnbBoQUB94lhRVOkbijl853+KkI70tbH1sXnP7iTBg39UDDc1WJknX145B+EpQGp
 zCn1Rshmib5pwHzS/CsX6SyQ35PYe0Bn6ZDpjsMabexGuKPqtKApCUVrDn/bvowPxl9j
 xSjffCZp8hYlOUetpdHViyKx3RGFMoCgg3Rd0NbezGHgmNzbz+LN10WcZZFe4XhAApOX
 bi9Q==
X-Gm-Message-State: ALyK8tK523K8NqEC3fF2YKu6gJfexUHV1yJcMhO69UaBgXSXGnbNSvcR7/CDRbIg5DAlWwJxa1ZB5BQk4cpP0g==
X-Received: by 10.55.94.7 with SMTP id s7mr11902026qkb.181.1465144356695; Sun,
 05 Jun 2016 09:32:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.44.196 with HTTP; Sun, 5 Jun 2016 09:32:17 -0700 (PDT)
In-Reply-To: <20160604052039.6581-4-openbmc-patches@stwcx.xyz>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-4-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 5 Jun 2016 11:32:17 -0500
X-Google-Sender-Auth: bE2z5gc_q2go4NBfdJ1OCnrw2Wk
Message-ID: <CACPK8XfE=S+FanzQn7WgV+NBsK23KAzioPWvFU48qx68p30VKw@mail.gmail.com>
Subject: Re: [PATCH openbmc 03/10] Remove empty devtrees
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Sun, 05 Jun 2016 16:32:40 -0000

On Sat, Jun 4, 2016 at 12:20 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> At the moment the in-tree devtrees are used.  Remove these to
> minimize confusion.

To clarify for others, we mean in the Linux kernel tree device trees are used.

>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts         | 1 -
>  .../meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts  | 1 -
>  .../meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts  | 1 -
>  3 files changed, 3 deletions(-)
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
>  delete mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
>
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
> deleted file mode 100644
> index 3b5e0f1..0000000
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
> +++ /dev/null
> @@ -1 +0,0 @@
> -# use in-tree devtree
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
> deleted file mode 100644
> index 3b5e0f1..0000000
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
> +++ /dev/null
> @@ -1 +0,0 @@
> -# use in-tree devtree
> diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
> deleted file mode 100644
> index 3b5e0f1..0000000
> --- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
> +++ /dev/null
> @@ -1 +0,0 @@
> -# use in-tree devtree
> --
> 2.8.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
