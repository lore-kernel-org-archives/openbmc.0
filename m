Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OfAS5u5/"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43X7M965SVzDqFB
 for <openbmc@lists.ozlabs.org>; Sun,  6 Jan 2019 04:05:25 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id n2so18831163pgm.3
 for <openbmc@lists.ozlabs.org>; Sat, 05 Jan 2019 09:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/u1mHL7e6w51BOxko9o8h9oQMBHmxcyQg7i9O9Ftpoc=;
 b=OfAS5u5/RDBHie26LMyfKbug6odTXDnFrFYzxRY7O5v3e/NfRQOYEBkcnn/WI1vLOA
 TcKa3MYyoj3JVj3AKBKshK8HFm3Af9xIjQNaSfe4nrY9fxM/HY1stovmaUpkuxOfq12b
 LIihL8+6VwYqMO2Pf0aLT8mLD8knVZaE0h9hR/hrj0cBGerMHtfF1g5ujel068ZNVFMw
 N92gleCWZflhPu3ajRFJVO9DQsGzdeSjgdQOcJMWA+DJwKo8w5SSV3TiyW2IXy1Mgz4f
 I6Z8J8AAVRspkfOIU19S1h5nUd0hf2V9+jz6PAqh+QGSfASq3UBYs1AdcMyv8BCrMgwu
 MFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=/u1mHL7e6w51BOxko9o8h9oQMBHmxcyQg7i9O9Ftpoc=;
 b=KvaYx5WmB3ceVhyUIoRiSgLdAohNb7krwtFhwvblGKYDpOwyaeYIcFhrS2alP3jS4G
 PkcF8eFeEf2D4xe23huV/sVL+aLgaSHV0j8PqYGE1FAkCySpsjyho6ALdMwcmkqwtYUX
 ODX8tKZ1Vo1PeUHlf+atuUPSDwiF9JNHY6MqgqI4BFVeOTGwjiwwHI+mSpuNyCbCMOjn
 ro0fweSd9JAE7Qlav71xDUXZlm8S77XFRgFZDnqdr89rXlyQjq7uQuj3gkf1GRwFvBWW
 5LM+pxvTMu6Hm5vLXtrc9cdkd3V0ASxXTLX82aaJjgTRCtEJBBDgyhd/wE26eJIb2PpB
 +SYw==
X-Gm-Message-State: AJcUukdpvxHPZsEKBjnSl8zO8miqblStKwRUNdxk2y5EpZPoYbZMwzLy
 iXOdvLAR7F+7qOWy1N3E1ZU=
X-Google-Smtp-Source: AFSGD/UXryu3ATsRy5D+w9ZzlEUUuyYFxOV0R8a6VVnhXfzvdnTjoHClaSn+lvmXMljTSLbXfLIjPQ==
X-Received: by 2002:a62:53c5:: with SMTP id
 h188mr56032408pfb.190.1546707921105; 
 Sat, 05 Jan 2019 09:05:21 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 196sm249254319pfc.77.2019.01.05.09.05.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 Jan 2019 09:05:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 5 Jan 2019 09:05:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
 openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, shunyong.yang@hxt-semitech.com,
 dongsheng.wang@hxt-semitech.com
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
Message-ID: <20190105170518.GA1879@roeck-us.net>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8540dfc96a75a6aa4bd1a7d5f24db7d36a71282c.1546591275.git.xiaoting.liu@hxt-semitech.com>
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
X-List-Received-Date: Sat, 05 Jan 2019 17:05:26 -0000

On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:
> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
> 

Misleading subject. While the DPS650AB may ber a power supply,
it is a PMBus hwmon driver, and should be marked accordingly in the subject.

Guenter

> Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
> ---
>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> --
> 1.8.3.1
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain information that is confidential/private, legally privileged, or copyright-protected, and you should handle it accordingly. If you are not the intended recipient, you do not have legal rights to retain, copy, or distribute this email or its contents, and should promptly delete the email and all electronic copies in your system; do not retain copies in any media. If you have received this email in error, please notify the sender promptly. Thank you.
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> new file mode 100644
> index 000000000000..bbd601100e66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> @@ -0,0 +1,11 @@
> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
> +
> +Required properties:
> +- compatible : "dps650ab"
> +- reg        : I2C address, one of 0x58, 0x59.
> +
> +Example:
> +       dps650ab@58 {
> +                   compatible = "dps650ab";
> +                   reg = <0x58>;
> +       };
