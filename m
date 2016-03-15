Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x241.google.com (mail-pf0-x241.google.com
 [IPv6:2607:f8b0:400e:c00::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPKp83pZjzDqGd
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 14:28:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ycs7DeKw; 
 dkim-atps=neutral
Received: by mail-pf0-x241.google.com with SMTP id n5so819521pfn.1
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2016 20:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6XtsplTtbKJoqm3Wu3Sd4Spbq1xk+VWkURgdYuwukvk=;
 b=ycs7DeKwFRVsQ0ICXByzUPhNtov0LwgKGk8xyXDXG6VVnuJYvUw7gUSogwTTj/NFWC
 H15tS9i7hO+SdVB2x2zlZJm7o9a2SIUvQeieR7DokVaMNlInNfgp7ya1TjHKeVNtgWMA
 1XvBLkBA9o3AAHkqmqbhyz61Y+OuhCFrVpYGrRMN+J+50v1+bcsUZekWsBe9lYEmOaL6
 Su/dY9HGHOBmPH2KlTnHd6wH+4T0rEm0TA6EdC3CQulcCM5t3eU4ImvLARdwrJ3185AG
 CcxmQied2Z1AKCzxxKNDx8o/XxdyKAgJ+KyZtkiF6VKJtZ/x9dUWtXJPwSls/d+DfWHv
 9esQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6XtsplTtbKJoqm3Wu3Sd4Spbq1xk+VWkURgdYuwukvk=;
 b=QW1VK440635E3ZKl5biDqwtgT0b0gKDdQyityTZmTjcwJumXnuqGCFnj9MTp9lto6m
 Pv0UJ8ens+Y5dNb2xISmlBi2D8x1LxBTBzr/8gS1aIVdZZPGhN2b5hbxaevhDSlrWjDW
 qCF0xZlD/0BghKZhLmWcTOtXm6e43e++HcITJLxMKCREXDm5w/2hl+6jmqpxy7NOp8r0
 aVS9ZiIm1hVuRE+26kGPuIP2ZxZA+0UM0pOA8iEmXjEozDnkP87UZZmVeR/+Lrd7rqP8
 bqVer5r9EUrJRnLf/us7r/m1d0pInWFTP3SFSz4WJ3Y9O6t26S2mm4HAP4/1Kc9L7RLJ
 p+Pw==
X-Gm-Message-State: AD7BkJKvOu9NAV1b53QR2P4ayiCDYXkUpFWMjsgBwhLtxR2aI7n+a5essKxnG8oKdjtCHw==
X-Received: by 10.66.144.4 with SMTP id si4mr43311061pab.0.1458012510406;
 Mon, 14 Mar 2016 20:28:30 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id qh8sm35341669pac.40.2016.03.14.20.28.28
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 14 Mar 2016 20:28:30 -0700 (PDT)
Date: Tue, 15 Mar 2016 14:28:21 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, Norman James <nkskjames@gmail.com>
Subject: Re: [PATCH u-boot] MAC needs to be stopped after starting
Message-ID: <20160315142821.4244f68e@camb691>
In-Reply-To: <1457706044-21613-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457706044-21613-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Mar 2016 03:28:33 -0000

On Fri, 11 Mar 2016 08:20:43 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

It would be nice if github informed us that the correct action has been taken
here.

I happened to check pull/3 and notice that it was closed, I'm sure if favour of
Miltons more robust fix.

Happy with that but it's just not clear by simply following the mailing list.

> We found that u-boot network was corrupting kernel memory.
> This is because aspeednic_init is called at startup,
> but if the u-boot network is not used, the network driver
> is not cleaned up.  This fix is a temporary hack and just calls
> the halt function after the init. This driver needs to be
> reworked to not start network initially and use set_hwaddr hook
> to setup MAC address.  
> 
> Signed-off-by: Norman James <nkskjames@gmail.com>
> 
> <!-- Reviewable:start -->
> ---
> This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Review on Reviewable"/>](https://reviewable.io/reviews/openbmc/u-boot/3)
> <!-- Reviewable:end -->
> 
> 
> https://github.com/openbmc/u-boot/pull/3
> 
> Norman James (1):
>   MAC needs to be stopped after starting
> 
>  drivers/net/aspeednic.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
