Return-Path: <jacek.anaszewski@gmail.com>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xgBmq3PJ5zDqg5
 for <openbmc@lists.ozlabs.org>; Sun, 27 Aug 2017 21:02:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XbdVvBM+"; 
 dkim-atps=neutral
Received: by mail-wm0-x241.google.com with SMTP id i76so4197674wme.1
 for <openbmc@lists.ozlabs.org>; Sun, 27 Aug 2017 04:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=eZIoc6/c883jINhvQ2T+OdTxpK85imGWPDffiMr24/I=;
 b=XbdVvBM+nEAxPicyGtIk/z7FuTxnwMoPfP9O5V3eoZD1WypmmZ7pthOBxe+2YakRh7
 3aG6Vv83NcBcwsIVykmpI0gQwcXlEBbISSIVcTXmLJrFYuSpYVIgoYcwy5mjPD5em9dr
 +8AjxGyqkV1S5CaCjH3WRoH/v+hEioN6dR1qswaoPHoBgJDyDm+m0FfDEYgcbZvlQZiu
 I6y2g38II9xQn++P5PQuzdIHlZd/Fm0vB6rgciv5ngYv0zwylIFB0VNHuLx6b+ADeGSC
 C/MKo1OPJrEV18N7SfRjbuAOTDoclPshIDzstbQfCyKxAaQ/Smr9Ap1E5hQLrwHJSY/J
 yKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=eZIoc6/c883jINhvQ2T+OdTxpK85imGWPDffiMr24/I=;
 b=VmdzvbIfXS0stZ4Der1Xn7lEdSawIyDVlJb+Wt8Rx9fTDvejHi7Yd1fH/G2zl7W7Go
 r5QHb87AoJuwKR6A6qabfArk8MqMXoYx+gxzKifZ/wr/A7Gcb8pIjjpMIm0DNiULS9U8
 c+OCnN8N365IfhkIhHMTwQwv88n9rlc7wFSRXV4hhYXlFkFhRO8Rf/jwR27WDJIhL8+s
 5vYlgP/3V1m5u2RC9m6EArG5pjaVoN9Ivb18guVyAGIVeixXuv1g/VirlSw0QYJ2dTYY
 WbG3VIBF7GDvhmdpmH/0jQaGNDMfh480akrr7l73LSiN8KqeZBm0E8pDeD4Fi7KOiZ58
 XxYg==
X-Gm-Message-State: AHYfb5jeCJMSlLrfg0YscwWVPD7Tm11S+H6YmUbG7b/OHDpaATsuY6Cs
 /x9zBkQIf7py3ZCAlYM=
X-Received: by 10.28.24.139 with SMTP id 133mr1133039wmy.87.1503831719375;
 Sun, 27 Aug 2017 04:01:59 -0700 (PDT)
Received: from [192.168.1.18] (ckm242.neoplus.adsl.tpnet.pl. [83.31.88.242])
 by smtp.gmail.com with ESMTPSA id n124sm4865944wmd.16.2017.08.27.04.01.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Aug 2017 04:01:58 -0700 (PDT)
Subject: Re: [PATCH 2/2] leds: gpio: Allow LED to retain state at shutdown
To: Andrew Jeffery <andrew@aj.id.au>
References: <20170825063503.31577-1-andrew@aj.id.au>
 <20170825063503.31577-3-andrew@aj.id.au> <20170825073239.GB15494@amd>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 rpurdie@rpsys.net, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au,
 openbmc@lists.ozlabs.org
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <3b89ad70-7024-b4ac-bf4e-49a02d12da51@gmail.com>
Date: Sun, 27 Aug 2017 13:01:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170825073239.GB15494@amd>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 28 Aug 2017 13:40:16 +1000
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
X-List-Received-Date: Sun, 27 Aug 2017 11:02:04 -0000

Hi Andrew,

On 08/25/2017 09:32 AM, Pavel Machek wrote:
> On Fri 2017-08-25 16:05:03, Andrew Jeffery wrote:
>> In some systems, such as BMCs, we want to retain the state of LEDs
>> across a reboot of the BMC whilst the host remains up.
> 
> I'd spell out what BMC is...

I agree with Pavel. Please give the expansion of the acronym
in both DT patch and the driver commit message.

> 
> Otherwise series looks good.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

-- 
Best regards,
Jacek Anaszewski
