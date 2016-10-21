Return-Path: <f.fainelli@gmail.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0zKJ5N6rzDt2S
 for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2016 08:27:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=o8lA6sSE; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id s8so63188126pfj.2
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 14:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=y8BtzKr1WSu30C9gw7vc9Dc0X/EyOb4i9brlSjPvd40=;
 b=o8lA6sSEMx0mkQjhDLB021rz4fLHl0kA8sN1yGUBB3UIJikl6dPDZ7OedYoBqEsXSX
 YYeRlpQlzT+sYOK1WvMXBqVu/hYXbtMs+sXD+h5as0GTfsGhFaCOVbzozaLAZVpu8V+Q
 YfGWMDeJncBAPHJWKc+l8vae2QmAAacOOHTR9qjaUTmNtmJJAWoVDoqfKOGxBlfvbK26
 g11Fzjv+sTIS7BW4bL9L5AQl8eUyqIB9bVdAYFAL6EPLG6lhAh3ECQqO3NRkB6WAFNg+
 TjtjWtr6LQV2pbcPLHV9phJyCNNob0+S1ZYxhenTNp/JWYHOcEPqLH3esfvDVULCUFNB
 FF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=y8BtzKr1WSu30C9gw7vc9Dc0X/EyOb4i9brlSjPvd40=;
 b=RHhdV595uhiqtpskW2F0ZQ+81uYoSpuOCyq/7heyywSV5Ot597fpnLNUxfbNlqdXVC
 vz2rsaXPu2I4QZ8O4Gh2z6henhzir2Uh7ayaAqED1PPtpLDx/u7IpzmrTez4pZUMtnqE
 VoRW7nO/lC6GuxU4b4hRiRZv1DBSEB4GEkVb+koyXI2hfy8z5k2i7/TuyxMnKCLYa431
 kSDUiF1I8eUVkzJIwBKn3NmJWdNAklpZE/Z4ZifrWsmPYg1GPbkBZk2jkxzLfVYrtaZT
 gyJEc4LqjjHyYDLvevnsl20X3nEUBFIaZFBWDemV+lvSmAki72/uLDNdVPSf1uHf/F82
 VzBg==
X-Gm-Message-State: ABUngvcqRTn65XYNrulwqUdSKvgP9rvLjM7p9bAOA155SM4UUJqxR7dcQyriiS4UdBcuhQ==
X-Received: by 10.99.39.130 with SMTP id n124mr4194206pgn.85.1477085233981;
 Fri, 21 Oct 2016 14:27:13 -0700 (PDT)
Received: from [10.112.156.244] ([192.19.255.250])
 by smtp.googlemail.com with ESMTPSA id j63sm7269168pfj.70.2016.10.21.14.27.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Oct 2016 14:27:13 -0700 (PDT)
Subject: Re: [PATCH 1/2] net: phy: broadcom: Update Auxiliary Control Register
 macros
To: Xo Wang <xow@google.com>
References: <1477070413-92621-1-git-send-email-xow@google.com>
 <1477070413-92621-2-git-send-email-xow@google.com>
Cc: davem@davemloft.net, jaedon.shin@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <24327979-0ff4-c4ed-d1c4-8724c65860b8@gmail.com>
Date: Fri, 21 Oct 2016 14:27:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1477070413-92621-2-git-send-email-xow@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 22 Oct 2016 11:42:42 +1100
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
X-List-Received-Date: Fri, 21 Oct 2016 21:27:17 -0000

On 10/21/2016 10:20 AM, Xo Wang wrote:
> Add the RXD-to-RXC skew (delay) time bit in the Miscellaneous Control
> shadow register and a mask for the shadow selector field.
> 
> Remove a re-definition of MII_BCM54XX_AUXCTL_SHDWSEL_AUXCTL.
> 
> Signed-off-by: Xo Wang <xow@google.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
