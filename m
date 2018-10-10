Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MOjfBykH"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VFZh5G3XzF31W
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 11:38:36 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id i4-v6so1630985pgq.9
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 17:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1REk2Thtc35WCm2s8+CzJaxzmqAZYxprZzgzkYzfyHQ=;
 b=MOjfBykHj0F7FNxZwAaqH2CazfY+tW0/gy8v9CvrzfOR/n2yfe+oHVJwP07buo1SRm
 QbU1Ap3843tcXvZ1YRLRAr5LkJCxvhP+41cYmvLIRsg8mpWR4OwvvolliMExNSWXzGJM
 Xr6QQS3tR/v/vQKg55XoBv9byw0LlE1mlHkd5Ni5s4l57zJJDhgWFOY+wLQR94nadUH2
 hi+huxXfVLaeY1uud/Zaj1iz4d3fuLPdXD2UyW2Rz+MDZvaMhZ76F3+k9wym8YkRpRQO
 AfDKfR7ToytNBMOmk/D50HleRRCrSDdrvQ/yOEZKny6aaKAYeobRuJCLhbnw0k+T02TF
 p56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=1REk2Thtc35WCm2s8+CzJaxzmqAZYxprZzgzkYzfyHQ=;
 b=hJJqAXIMvgXBtcof/khhtHXKt0qgwiQTNVHVyJukG/D1SEmWMR3UhwNi2HmSsowLlF
 n13wKmVmey0NOpjp1gi81JvNzVsfm+WL6nMy16oKw8Q0WDarjgWFRhe/R1y4Oc1KZDya
 UNqwHgcIRSOJ8YdDK9gr4x+cYQf7qjQqonvm7aGlTw6ab7SYnH+6owTJfZXdQqBvclBX
 0bFox9cgpnk96rYq3wHVzB6sXSd5M4Zw1cXHyInBRBOq1B973eMH4UgTOmuyby8HX6po
 vq1qQfJ9ozHlM5ZznAsxhc3LZpL1G28/DFJaosPLHoPPU+5nM2U5kDu2riimsFblPN6O
 fi9g==
X-Gm-Message-State: ABuFfogOBt4C8MlUCFCmTZVh4Y7sI+sui+Pl+rPdE8klR0CXG4QDwn6h
 CX1ryboiuLjUHQVSBBkFhdc=
X-Google-Smtp-Source: ACcGV62qiqsxEz8jpu2GAp2M8ochfWFA4LK83NyfwqKLvQYtgbt7isRdPuK3U160cpYC9IssXDuL/A==
X-Received: by 2002:a62:1d16:: with SMTP id
 d22-v6mr32840131pfd.159.1539131914374; 
 Tue, 09 Oct 2018 17:38:34 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net.
 [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id 189-v6sm33944376pfe.121.2018.10.09.17.38.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Oct 2018 17:38:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Oct 2018 17:38:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kun Yi <kunyi@google.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, jdelvare@suse.com,
 openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
 rlippert@google.com, benjaminfair@google.com
Subject: Re: [PATCH] hwmon: (npcm-750-pwm-fan): Change initial pwm target to
 255
Message-ID: <20181010003832.GA21971@roeck-us.net>
References: <20181008214925.86281-1-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181008214925.86281-1-kunyi@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2018 00:38:37 -0000

On Mon, Oct 08, 2018 at 02:49:25PM -0700, Kun Yi wrote:
> Change initial PWM target to 255 to prevent overheating, for example
> when BMC hangs in userspace or when userspace fan control application is
> not implemented yet.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>

Makes sense to me, and in line with other drivers. Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/npcm750-pwm-fan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
> index 96634fd54e0b..c0fab54c0094 100644
> --- a/drivers/hwmon/npcm750-pwm-fan.c
> +++ b/drivers/hwmon/npcm750-pwm-fan.c
> @@ -52,7 +52,7 @@
>  
>  /* Define the Counter Register, value = 100 for match 100% */
>  #define NPCM7XX_PWM_COUNTER_DEFAULT_NUM		255
> -#define NPCM7XX_PWM_CMR_DEFAULT_NUM		127
> +#define NPCM7XX_PWM_CMR_DEFAULT_NUM		255
>  #define NPCM7XX_PWM_CMR_MAX			255
>  
>  /* default all PWM channels PRESCALE2 = 1 */
