Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rg9lW26NpzDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:14:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wiB4RmMu; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id ts6so6455337pac.0
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 00:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t6EEw1yDAXdONbFqL4+pB6Mma4wS6Ghn9H+IEM9bN7M=;
 b=wiB4RmMuLHWRU1oyIty7QRAH9bbsh1gey+AnDVMeZVJa71x7ZTTueHxne0zrLYMc0l
 SHaiyRVB0pKQsAeZLN4UtuH5PJ4B19aIlOOD6qrai6cgscOM8+F8t2qH0jdU+mYus6Cq
 nLeER5Y/oqT+PCwW5ZcRYJ7Dc9e5Uj7j7dq5apOf0mU+8m94UAQj9DHDyAi2cZ7UMv5D
 ncCgOExuImOcPWFpaMZV09Ykt/lxF+P5M9xgawd1mvW+lVSPYM/Shuu271pzOc7kBxWz
 +vmLGLL7ROcc2Bb54D7Q96YMHpPco/zDSjwIfCS7tAE84XdpzzajDD2ZqJ6ePZyAyteH
 vEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=t6EEw1yDAXdONbFqL4+pB6Mma4wS6Ghn9H+IEM9bN7M=;
 b=cmQueO81LkoGObBgYAtNUPw7JyccfeELKu4CipHiSt5c+sKrIARejV0wW46tu+woK9
 gJCfL8/VpPxHHXqJ4Uz1yEnAV6JVnJ2+ftb2ETVZZaJPZ29r2OjYNTw5dJcFtNCA2Tdu
 veFQuXhRVfKkQYeTkkAuvyU2GsJaEzHQtlMP8fWjA4cgn08TLvx/uLddPCaZs0gomOPb
 ZTCxxVlLCTtrKGEIDjpW8+1icPbQltGhOtqRDCsaJy6JhX6zSWEX8UNO5uhgwtB+H6f+
 Qe6DnUunuFMZzw1o/bPTJbnGkh64ZwzjCaw2VKBolbazlVTBl2nLDSiSFlXLQvJi0b3R
 9zuA==
X-Gm-Message-State: ALyK8tISKKXc0l6ko5qJHuzqAxiaGjt49jxSSJkfPti3/b9FP8t3TvQzYqGlHNabHcq4BA==
X-Received: by 10.66.159.66 with SMTP id xa2mr18896681pab.20.1467270869733;
 Thu, 30 Jun 2016 00:14:29 -0700 (PDT)
Received: from aurora ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id um1sm2720611pac.41.2016.06.30.00.14.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2016 00:14:28 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1467270865.6386.32.camel@jms.id.au>
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc 5/9] aspeed/ast-g4: select
 the correct cpu
From: Joel Stanley <joel@jms.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Thu, 30 Jun 2016 16:44:25 +0930
In-Reply-To: <1467216591-8616-6-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
 <1467216591-8616-6-git-send-email-clg@kaod.org>
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
X-List-Received-Date: Thu, 30 Jun 2016 07:14:31 -0000

On Wed, 2016-06-29 at 18:09 +0200, Cédric Le Goater wrote:
> Else the default is a arm v4
> 

This is also set in the include/config headers, but I agree it belongs
here. We can remove it from the config headers now.

> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  arch/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 67a00fccd626..ee176be22979 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -755,6 +755,7 @@ config TARGET_WITHERSPOON_BMC
>  
>  config TARGET_AST_G4
>         bool "Support ast2400"
> +       select CPU_ARM926EJS
>  
>  endchoice
>  
