Return-Path: <SRS0=QLWA=IZ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1361C433C1
	for <openbmc@archiver.kernel.org>; Sat, 27 Mar 2021 22:18:41 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1209B6192B
	for <openbmc@archiver.kernel.org>; Sat, 27 Mar 2021 22:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1209B6192B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7Csq37Hrz30Cv
	for <openbmc@archiver.kernel.org>; Sun, 28 Mar 2021 09:18:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hEIX0oPf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hEIX0oPf; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7CsL5M0fz2yyx;
 Sun, 28 Mar 2021 09:18:12 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id h8so2607944plt.7;
 Sat, 27 Mar 2021 15:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TfAEx42ev3o6ArqZhaNIyJVqiP9OCV2R4A7TGL7rtCQ=;
 b=hEIX0oPfFAcrO/k2kHkBhcRtyqj0FD8mWIVQTlxw0OI+uaj1TI1YX6ADQim1U0iOZW
 GuL0cAthlpIezO6y+IRAKjh6xXQTNQKBxgHSTmG4tnmf78nGsxPtZ3dC2UDFWBAt3eEG
 rl0eyQgCNjLI9L76/2PPYxRLs9DJkSmB4HB1bjINsGI/kKTUm/NrrypRdfdN7BFwYzF+
 jewrygWiUtD/GptSIm9w+FsGIsNA3FMxcua0D1JMHJU+va2wrmTH6l2P8YsydoAkAgmE
 q4NTr0kcCPcJVnRsSNN+hrlpRL8/QluboOjTnotPEFTSygMmBHUZyPvikhMck07XnRuU
 doug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TfAEx42ev3o6ArqZhaNIyJVqiP9OCV2R4A7TGL7rtCQ=;
 b=uECZ0snogqXNLeMEERHSWFiX5zEwTPc8iRLbA/2F/Btex31aL6WluL0ISEq3bBGSap
 2VY5t5ELs2S1iFPQolk6Mdy6ruCftbBARNynpChQR98opWqyb1Kxsa/IpO9EAlT0eFaJ
 R0+Wq5QfhAEWAdlzPxfL/e0VecHD4BTrOxhXGLEML/wszgePZBgY2Yu/4wSfAchxkf1i
 rF+wQdeyLyavUIT4Ttsc7FuSNHn/Nvz/bn8buXgJdjqEHFz66AM8Vut7X0DiWCn6W/NN
 gEItlULurFq4XzVJ/Wd4eeNnto3fn/eipA2UY+T47lA9FMsfxaHLjXORiqHUmEmsdIek
 ND3g==
X-Gm-Message-State: AOAM530ssU5BT4Q5eRlf5quoPPvjsRdUupKHuvN5Y6zPvgm81U2/RL6r
 IDYII2zP9Lu9IsJMgCQ5DUg=
X-Google-Smtp-Source: ABdhPJzeFGmdx4jE/ciUSpsHKE6xAr8FYqvdR4DTlTaf3eq386gCWxZiN00dRBITxd0uK38fOjOKcQ==
X-Received: by 2002:a17:902:ce8d:b029:e4:bc38:c4 with SMTP id
 f13-20020a170902ce8db02900e4bc3800c4mr21203549plg.48.1616883487619; 
 Sat, 27 Mar 2021 15:18:07 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id b10sm12555994pgm.76.2021.03.27.15.18.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 27 Mar 2021 15:18:07 -0700 (PDT)
Date: Sat, 27 Mar 2021 15:17:59 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] usb: gadget: aspeed: set port_dev dma mask
Message-ID: <20210327221759.GA2997@taoren-ubuntu-R90MNF91>
References: <20210326070214.6719-1-rentao.bupt@gmail.com>
 <10920f34-289c-feac-79b6-71bff2aea67d@arm.com>
 <20210326120526.GA14169@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326120526.GA14169@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Sasha Levin <sashal@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, kernel test robot <lkp@intel.com>,
 linux-aspeed@lists.ozlabs.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-usb@vger.kernel.org,
 Tao Ren <taoren@fb.com>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Robin Murphy <robin.murphy@arm.com>,
 Thomas Tai <thomas.tai@oracle.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, Mar 26, 2021 at 01:05:26PM +0100, Christoph Hellwig wrote:
> On Fri, Mar 26, 2021 at 12:03:03PM +0000, Robin Murphy wrote:
> > This might happen to work out, but is far from correct. Just wait until you 
> > try it on a platform where the USB controller is behind an IOMMU...
> >
> > It looks like something is more fundamentally wrong here - the device 
> > passed to DMA API calls must be the actual hardware device performing the 
> > DMA, which in USB-land I believe means the controller's sysdev.
> 
> The shiny new usb_intf_get_dma_device API provides the device to use.

Thanks Robin and Christoph for the feedback.

If I understand correctly, usb_intf_get_dma_device API is mainly for usb
host drivers? I just found usb_gadget_map_request_by_dev API: does it
make sense to replace usb_gadget_map_request with
usb_gadget_map_request_by_dev so we can pass the actual DMA-capable
hardware device (aspeed-vhub platform device) to the API?


Cheers,

Tao
