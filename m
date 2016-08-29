Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sN0zx5FzKzDrgb
 for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2016 15:47:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=SJXIFjx6; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 49so1157995uat.0
 for <openbmc@lists.ozlabs.org>; Sun, 28 Aug 2016 22:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=0JSu1ZjbYYO8xr29nEpwSk9FkIc+byTRt9gadXC00oY=;
 b=SJXIFjx6ikxk/6/zz28fLY+PJFDUbx7R8FZX3BieH2EMcSJ6y9xG9t/qV+c/HRJols
 XKcrSPw+rjdBRuCmXCPOtw6+ALI5JWQ9w/FtTr9llUdlWVMjU623KCpWGN4+uZoqIQWX
 Hu1aytcA4aanw7scuAt/FOZXW2kooXMM+0TnUYz+9Xmqvq0Z2LfyKEnRCFpTIE2lQHpk
 +kr6XMiWemhnczW8zT0DJTj8ht3Pmdcel28+pACppbIRPi0CjS4KOt+PcOZDmYGoV8Bu
 +9RPTz2fgdVTB6WeBs6vi7Q4Wg76jDTcsAHUs+Mv7aICkW/QFcNM07t0Ezjx3wezMv09
 yBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=0JSu1ZjbYYO8xr29nEpwSk9FkIc+byTRt9gadXC00oY=;
 b=lysEim/3xeHx69Qd8g+6jzjyeep54pgc0n1e+Kjm6xR3xxoGXYDgZYPZLUx1Al0EAZ
 N8ujYYMBFc1Qf86jSoW7ZFkHJNV58ECfyZoGsGAO3+XPM21obADMeG6vbb9poccHeC2g
 Q+ykxpp2tX0VpmQ/NmhUobrPiE37oXcO8oB/LaNTBqnyPUQA38Wuo0rbnt6DEf7Khqto
 B1J945rwBl+ae42iY7rMb/SFVCM935anizA7UQ1gBi50cBTOZyH+mC8NYxDyppF54rep
 BHHPKEcA2ocGfRqcr/2XbKWXmqkGQ6f8FySWQZWLT6yFUTMXQ1eVJtkrLyeByZ1brQC7
 rWYg==
X-Gm-Message-State: AE9vXwMbdlJrzHu0UD8v1Io9esOrUzU8sAGGPa+xv0pdr/1JiKbteW79cttToS59rBdiVi1gCR57H9S323xx/A==
X-Received: by 10.31.146.10 with SMTP id u10mr8899439vkd.14.1472449675458;
 Sun, 28 Aug 2016 22:47:55 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Sun, 28 Aug 2016 22:47:35 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Aug 2016 15:17:35 +0930
X-Google-Sender-Auth: z70L63MTAhNL1PyxgEsQAwzXQMg
Message-ID: <CACPK8XeWuKOy-FwpU1dLwGz6woRQ3SGhpOr-S4pQmd1h8B0t1Q@mail.gmail.com>
Subject: Repository integrity (Re: OpenBMC v1.0.5 released.)
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Stewart Smith <stewart@linux.vnet.ibm.com>, 
 Jeremy Kerr <jk@ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Mon, 29 Aug 2016 05:47:58 -0000

Hey Patrick,

On Wed, Aug 24, 2016 at 6:33 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> Due to a major regression, I re-tagged v1.0.5 with the kernel updates
> removed.  The change log is therefore just:

I don't think we should ever overwrite a tag that has hit the public
repository. There's no harm in doing a quick second tag.

This is particularity important in the context of Brad's account
becoming compromised recently.

Can tags be pushed to Gerrit and reviewed through it's interface?

Would Github's protected branches feature have stopped you from being
able to make this change?

 https://help.github.com/articles/about-protected-branches/

Cheers,

Joel

>      * Cache all inventory properties and preserve inventory during BMC
>        firmware update (openbmc/openbmc#487)
>      * Update the power button behavior on Barreleye to:
>          * Short press: Only power on. Remove the power off action.
>          * Long press (>3 seconds): Hard power off.
>
> On Mon, Aug 22, 2016 at 12:57:34PM -0500, Patrick Williams wrote:
>> Another fix release for the v1.0.x stable tree was tagged today.
>>
>> https://github.com/openbmc/openbmc/releases/tag/v1.0.5
>>
>> Changes since v1.0.4:
>>     * Cache all inventory properties and preserve inventory during BMC
>>       firmware update (openbmc/openbmc#487)
>>     * Update the power button behavior on Barreleye to:
>>         * Short press: Only power on. Remove the power off action.
>>         * Long press (>3 seconds): Hard power off.
>>     * Kernel version update:
>>         * Stable release 4.4.18
>>         * Ensure the LEDs stay at the same state on boot (openbmc/linux#98)
> --
> Patrick Williams
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
