Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMq7k5FQ3zDvNS
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 00:24:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BR5xCUs5"; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id u15so2690426oie.3
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Hv3UggBldHumB/VsO0+v2vcqQJFmb5Nf89HWDnr7b14=;
 b=BR5xCUs5dN3EFtx/1Ruk7DVCPwVxDg8pnVhjBu3dNrPjnQCJjAn3xYZauKrH0J/N/k
 CGJaxqc78O+97az0V6uN0HoeyigSYDDk71vVyP9JfDxbeyOGV09+LMr8lfRK+ikTnrSv
 64lBUsbi2kVmpE8ksjR+qv+Ed+7gODAYJok9uHFCCBi6ozdZnkQDMem4480b6m44Av0n
 D36ZhHk/Zadr22kmr8oiJu4rKPR4AATDNvp2HyeKsUEIduQlASrRwGS34Nfk9ZJg6ezd
 /VRzZax0+flzRGLwlLSvxfZ9Y7TpepeGQjwuKRAO9gAtJyccHGoserh6BxM5X6NSjwcD
 3faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Hv3UggBldHumB/VsO0+v2vcqQJFmb5Nf89HWDnr7b14=;
 b=LvQSTIA/NNaotZlW+y5z5bbDOkmnm5w2Q18jJxd1BGGt3CPSpnENqzuc+6cJ1dSUzu
 hckqsrciTWTERa5bvPpi/cqmwSRFnnGO2CJehHHVpN98WET44SU4Lgmu3+NaQ625nj6S
 NGLLYrkLO/Ta4Hxuer7k/Dx9RLQd5B3iiRfmAKHjXWdS6cpmXa5FfoHzXHy0C5VTVR6a
 quItN2kd1m9agLnCC4KunxbYgUHkgOfWMKO/Ibx2EzakuBYHEX+MfOfRydw89FfHf8U8
 H65MaGOyBf6SNMmD6vBpLCDznevYSfFK0G45HijHJ4pQVySBq35BD9ztLD4YYYhL+BIM
 8rUA==
X-Gm-Message-State: AKaTC01XH5YwwI6WtKESkksqsERDL63voLi984Mk1KZ6ALdWZzJ6WpelsrlRrri4x0+G0JidIFK6F8ZQbuAKkw==
X-Received: by 10.157.24.41 with SMTP id b38mr8262954ote.117.1479734656844;
 Mon, 21 Nov 2016 05:24:16 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Mon, 21 Nov 2016 05:23:56 -0800 (PST)
In-Reply-To: <4c0ef35c-ac85-4163-f874-1201460bcd80@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-31-git-send-email-clg@kaod.org>
 <4c0ef35c-ac85-4163-f874-1201460bcd80@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 23:53:56 +1030
X-Google-Sender-Auth: PUEguBuH--WSmnUr0-4qjnHtPPc
Message-ID: <CACPK8XeE4mKLWP5ep43UQA5dFv+Q4w9igJD=bbipTVCtu+5zjA@mail.gmail.com>
Subject: Re: [PATCH qemu 30/38] wdt: Add Aspeed watchdog device model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 21 Nov 2016 13:24:19 -0000

On Mon, Nov 21, 2016 at 11:33 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>> +
>> +#define WDT_IO_REGION_SIZE      0x1000
>> +
>> +#define WDT_STATUS              0x00
>> +#define WDT_RELOAD_VALUE        0x04
>> +#define WDT_RESTART             0x08
>> +#define WDT_CTRL                0x0C
>> +#define WDT_TIMEOUT_STATUS      0x10
>> +#define WDT_TIMEOUT_CLEAR       0x14
>> +#define WDT_RESET_WDITH         0x18
>
>
> May be we should reduce the size of WDT_IO_REGION_SIZE to 0x20
> to instantiate the three watchdog of the Aspeed AST2500 with
> one class ?

Yep I agree. This is how the kernel driver does it too.

Cheers,

Joel
