Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYvhx5nzbzDw1d
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 10:24:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="I2lH1qtO"; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 12so40775107uas.3
 for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2016 15:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=4GX8mbcqpcODaAdW+FjM4dN9ZKM0/3GaLbVr6p4u/vE=;
 b=I2lH1qtOdgYyomdIz3K2QMmoUlTcailW8nMSG0rmrtuZ9iXfJJK9rRSPBIa/HQFWU1
 4SjmHjKB2DHNaAMWdSVg2ccEwwj25OBOhQn4TzPNDZgvzVubrbcRmJ7UxiG+fji/RSS7
 /atj/2bjFFYW7exZ00yMw69fRQKNLYL87FnlF6DMdGTDcTUDsZNRH7GzdsNIcm10UlKC
 xXEvL9gkxyKLcm/uktqXT8TRA1LQHdUks1pFaxOUx+xcvyYG2yFOS0yjQ56/5oEOgFGC
 9sMzLiskEvjjkKgNs/FtR3r9PuE8ssiUufRnfECKHzGi+ySYpxodb3P881HRQr5q+yjw
 OCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=4GX8mbcqpcODaAdW+FjM4dN9ZKM0/3GaLbVr6p4u/vE=;
 b=HiE8E/Dsv7ImLPEaS13dBjUm+HdQ8pJM1AHjYA+MOFpBGCIkh4isytSiFrRo6c+E92
 fmNZddpeEKv9CWsmUgS0hypU+znzuM0CxbwdT/Rj3jgnONzUCpX7OTxIO+ja8MTzThbt
 06kttS3NrUye6DYoHo6NbJsBVgUUKgxPARXWLKUtySMvVVp0qOJNvjLJxB4MC188vEyg
 axT8eB1Qjye3ALf4dgHugstbEKxQ1WhMeOBMCd5473BVPaPcx1GIqj4x+RRu3tV14Z/z
 5gI76GuCVqKtRVfLeQ73n/+SoQY2EJFJriaNNGsiZ4kNZll9JNftSCiMgBU75FusvImc
 hD8g==
X-Gm-Message-State: AKaTC01fzTNvFQRtR85wyIGk7gNsDDcrO94+VgIX5t/7PrbVdi9nrM8HHfI37YTK1T0zPPiTh9TDfhV2XwLuNQ==
X-Received: by 10.176.84.207 with SMTP id q15mr45223873uaa.177.1481153070227; 
 Wed, 07 Dec 2016 15:24:30 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Wed, 7 Dec 2016 15:24:09 -0800 (PST)
In-Reply-To: <02df3e2c-86e7-ead5-4ae4-252fdf94495e@kaod.org>
References: <1481133996-29973-1-git-send-email-raltherr@google.com>
 <1481133996-29973-3-git-send-email-raltherr@google.com>
 <02df3e2c-86e7-ead5-4ae4-252fdf94495e@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Dec 2016 09:54:09 +1030
X-Google-Sender-Auth: X6R2qIy6lhwdxzvQx6CY1wnjPpg
Message-ID: <CACPK8XeTiqrsgzeRztfonH3YpTbVBnMEKtS6tHvBr9=Kg9G6QQ@mail.gmail.com>
Subject: Re: [PATCH u-boot][PATCH v4 2/3] bootm: relocate ramdisk if
 CONFIG_SYS_BOOT_RAMDISK_HIGH set
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Mailing List <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 07 Dec 2016 23:24:34 -0000

On Thu, Dec 8, 2016 at 4:54 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 12/07/2016 07:06 PM, Rick Altherr wrote:
>> In 35fc84f, bootm was refactored so plain 'bootm' and
>> 'bootm <subcommand>' shared a common implementation.
>> The 'bootm ramdisk' command implementation is now part of the common
>> implementation but not invoke by plain 'bootm' since the original
>> implementation never did ramdisk relocation.  Instead, ramdisk
>> relocation happened in image_setup_linux() which is typically called
>> during the OS portion of 'bootm'.
>>
>> On ARM, parameters to the Linux kernel can either be passed by FDT or
>> ATAGS. When using FDT, image_setup_linux() is called which also triggers
>> ramdisk relocation.  When using ATAGS, image_setup_linux() is _not_
>> called because it mostly does FDT setup.
>>
>> Instead of calling image_setup_linux() in both FDT and ATAGS cases,
>> include BOOTM_STATE_RAMDISK in the requested states during a plain
>> 'bootm' if CONFIG_SYS_BOOT_RAMDISK_HIGH is set and remove the ramdisk
>> relocation from image_setup_linux().  This causes ramdisk relocation to
>> happen on any system where CONFIG_SYS_BOOT_RAMDISK_HIGH regardless of
>> the OS being booted. Also remove IMAGE_ENABLE_RAMDISK_HIGH as it was
>> only used by the now-removed code from image_setup_linux().
>>
>> Signed-off-by: Rick Altherr <raltherr@google.com>
>> Reviewed-by: Simon Glass <sjg@chromium.org>
>
> looks good.
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Rick, can you please submit this one upstream too?

Please keep all of our reviewed-by tags but drop the version when you do so=
.

Cheers,

Joel
