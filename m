Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kCpmfh+p"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="YNXlqNPB"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404KZp4PrfzF1bf
 for <openbmc@lists.ozlabs.org>; Mon, 19 Mar 2018 13:22:09 +1100 (AEDT)
Received: by mail-qt0-x241.google.com with SMTP id a23so16524422qtm.4
 for <openbmc@lists.ozlabs.org>; Sun, 18 Mar 2018 19:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4z1K+ynhXQv6e8lSikQGeuZJCCEWfIXy1E1JucYxlDY=;
 b=kCpmfh+pd9GgZqfFufBANU8K+ooJqRDhNY+ltqNVnYmJOgYbb7PdDj5nD4T2EEe5JS
 NOaQyghMcFgHOqnj4JgfeKT4u9oKHAsmCz40HEo+6zxFSjcnVPjaHjaw32oh3nGG/PDn
 08dgl9kSqvvvcjwCXWmY1BVhyGMSepW3RX/qw6PkthGTUM5/fXY68a7N7rdc40NWJa/W
 m7Y89VJsZdXLk+1MC5hDoMdHR5WrQ0YCFDycalpOBMqnuntVofpL7K/n+a1FFqU9eeNW
 wLiMpCsQkIIsO2RIGmNK+chQ7ZkBh/rkMYEk4zdcFM/EGftC0/OxImqngzhFbcqvps2G
 uu4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4z1K+ynhXQv6e8lSikQGeuZJCCEWfIXy1E1JucYxlDY=;
 b=YNXlqNPB4U2gMbtfRj+4lj36uB8poJ4jGrdjS15eTw9Ed+aMbHQYdbZCIeBmYOi7yL
 cpZNnjTpND6OKnAj/pl9QFN18fx464CRS9J1IWlNFl9KN/d7LhEi1dya0Hc1qZLMiWOG
 sDBAmlvoD4sXSVZiczgAGnpnEb1FpOoQ8+1bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4z1K+ynhXQv6e8lSikQGeuZJCCEWfIXy1E1JucYxlDY=;
 b=jiXz7cabYPEkM4xrELFck9XcWQ13EZXp2rmmsrdP5vLLo5+8X61vo9djhJmZG53WzV
 bbK5VEkKCkrjRi+Ws2Qvqx08LAxK4eqAFIwtKnZEGK4wL8cePwR/hOg4NG/JCmBwM82v
 dsTJGoN2uVD7Rx8A3J/3qw84xwwcqX/ihnvjyY+LersazLaEqf087T7ytK/k2icsyoKz
 jm+T8IjT3qwXTFRtdUQZzi9M5wTg61eyof3/iMyEEsNlROcEYvsvDd6ChzE4R44MGdaY
 W4dRx5dEGtfJN4oOFLPVPHf/Fao1pKiEqiZDT7WG6tDGzDQNQw2nRQOAiIv/UUxB64ao
 6Tig==
X-Gm-Message-State: AElRT7G2CkbgAB/s3e4vFt3evabHBU7QtCJs+Hjn2E62EQWjo1Xi70u2
 pgdsHpkqzDoNHRNqdiG4NIXIseojQgSQx2jYlZo=
X-Google-Smtp-Source: AG47ELsUdrR7epvFWMDm2XIIAHZWh9uISTNEgx6WDNGnMdBqnunhjxguZOeifp8I6ZoeHhtFUHnQG2rRtw1lnvaxy60=
X-Received: by 10.200.57.132 with SMTP id v4mr15459373qte.204.1521426127268;
 Sun, 18 Mar 2018 19:22:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.63.197 with HTTP; Sun, 18 Mar 2018 19:21:46 -0700 (PDT)
In-Reply-To: <1521128897-13172-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1521128897-13172-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Mar 2018 12:51:46 +1030
X-Google-Sender-Auth: b65ylGF7WtCmdPuGyGuFXAIXcpo
Message-ID: <CACPK8Xe0Gfnaj-4MmTHCW8XsQ3FwT2UyXwxuJSLJpOG8retUtg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] watchdog: aspeed: Clear secondary boot
 flag before restart
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2018 02:22:12 -0000

On Fri, Mar 16, 2018 at 2:18 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> If a watchdog device is configured to boot from the secondary boot
> source upon timeout, and that watchdog is used as the restart device,
> then the system will switch chips on every reboot. This is not desired.
> Clear the secondary boot bit from the watchdog control register before
> restarting the system.
>
> Fixes: 30e055280e3a ("watchdog: aspeed: Allow configuring for alternate boot")
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>

Thanks, I merged in the upstream commit.

Cheers,

Joel

> ---
>  drivers/watchdog/aspeed_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index f41d246..a5b8eb2 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -159,6 +159,7 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>  {
>         struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
>
> +       wdt->ctrl &= ~WDT_CTRL_BOOT_SECONDARY;
>         aspeed_wdt_enable(wdt, 128 * WDT_RATE_1MHZ / 1000);
>
>         mdelay(1000);
> --
> 1.8.3.1
>
