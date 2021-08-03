Return-Path: <SRS0=iKkM=M2=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A75C4338F
	for <openbmc@archiver.kernel.org>; Tue,  3 Aug 2021 14:29:53 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3896560ED6
	for <openbmc@archiver.kernel.org>; Tue,  3 Aug 2021 14:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3896560ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfHMM5NXvz3bn6
	for <openbmc@archiver.kernel.org>; Wed,  4 Aug 2021 00:29:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lyCUo5rR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lyCUo5rR; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfHLs0RYPz301q
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 00:29:24 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id a26so39995194lfr.11
 for <openbmc@lists.ozlabs.org>; Tue, 03 Aug 2021 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bEUj5pdRKviSMU2wAmJRXJmbWfFkZj1Fe7wcJ8eBh00=;
 b=lyCUo5rRtTvlNMw48UossO69TlKJyiRUrVfmk6DI62c/j+URywsQR4G3F+yWuazAh9
 M9bKdI5y/XVdicL02jvqhe+hghN7jb6bMBwzisZHVGeStbMccxpybh06elv9jD4Nkryt
 y18R5OG1IR+k367QUX/00vr1EC87EvOA+cjj/XHw5p7BhtikA4lkAtZ/OVfpfTPpozMm
 ErlYSAbLsR8xO73/NPtnOgMXGVSTPbi/8UcA34G03NdePJvVZs16zKcMl5cvCyFEtCTN
 NCEhZK09PiY1aA0vZxjKwgQMdRLeWlbqFQPwPcy6yr24eDs8hbEvaRyqeNPVWzQoyl/T
 8iGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bEUj5pdRKviSMU2wAmJRXJmbWfFkZj1Fe7wcJ8eBh00=;
 b=ImNpZEUwsGDVpZdeCpvPyhHJV/vyJT7eeFHaPTXlQRbbGbFABWWQlWr4KhHJxtGDjE
 PcMXjIlcNQ2jhPlo0b9IMNHy/lDZ4JIpa4I99Z12hjZcg4U8o+DkW3UXAXTkoxGeO0m5
 KcKM2W3pYCA4zWUHMCdzHAzRU7MTY5DmCvSm7M8JOyK8Wkm3VHFkWvy3upnNZFq+8T00
 iudWAr4fo5mJ0e+NiF+IqD00GDZP7mtm4oh+PUU+5rDv46LXT9RoR1tUb0T6xRWpZDRo
 SHRoA4Hq6Lll/jxBSKKBuASu850dnkTtC55HkeoH7H7kZc5YqA0qPWqlIdiZKWolC+AH
 Pnkg==
X-Gm-Message-State: AOAM530TasuO82TyoDttEGfjnKC0xeihYsJCg7K0XgHu5qlP2T6HffxJ
 8vK3iOegn79ZUMCbihsid7HEcOyh3NI30w==
X-Google-Smtp-Source: ABdhPJy3iiJhdb7GiyybvteE+xDiHFlU3qGAkUXe6YUc297dzR5/yClWrPNSIbB3mmz0i4K9URH0zA==
X-Received: by 2002:ac2:5e7a:: with SMTP id a26mr16720696lfr.446.1628000960355; 
 Tue, 03 Aug 2021 07:29:20 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id f2sm1109151ljq.131.2021.08.03.07.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:29:19 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 173ETGOw004548; Tue, 3 Aug 2021 17:29:17 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 173ETG3W004547;
 Tue, 3 Aug 2021 17:29:16 +0300
Date: Tue, 3 Aug 2021 17:29:15 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
Message-ID: <20210803142915.GP875@home.paul.comp>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru>
 <20210803133707.GO875@home.paul.comp>
 <1341627999924@mail.yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1341627999924@mail.yandex-team.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>,
 Maciej Lawniczak <maciej.lawniczak@linux.intel.com>,
 Thaj <tajudheenk@gmail.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Tue, Aug 03, 2021 at 05:17:52PM +0300, Konstantin Klubnichkin wrote:
>   Looks like a typo, s/image/partition/.
> 
> I don't think so as formatting partition would require play with losetup and
> probably some boot loader installation onto the image.

kpartx creates appropriate loop devices automatically, so if your
image has a partition table you can easily get the suitable loop
devices to run mkfs.vfat on them, then mount it etc.

For UEFI bootloader installation on removable media is just copying a
file to a FAT32 partition, nothing fancy.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
