Return-Path: <SRS0=CMIJ=KT=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CF0C04FF3
	for <openbmc@archiver.kernel.org>; Mon, 24 May 2021 16:12:31 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5AFF613B6
	for <openbmc@archiver.kernel.org>; Mon, 24 May 2021 16:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5AFF613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpj0Y101zz307Z
	for <openbmc@archiver.kernel.org>; Tue, 25 May 2021 02:12:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tUJPKUdu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tUJPKUdu; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpj012xVpz2yhF
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 02:12:00 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id j75so27473315oih.10
 for <openbmc@lists.ozlabs.org>; Mon, 24 May 2021 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e4xrrpgYOaF663BLSzK80qJc3I8m6lF7uJTKGMewavI=;
 b=tUJPKUduIb+eTeokDA0gUtGNaawPm5jxxgMZL0UCnQ1HBJ8NG06LKy7h1cKj+K0hCw
 YVWpCAvLmIk2p7NftqBLEDfmVq3AFaa77Yc844BCNP2Ixvkp9k9Sw05ZZN5PBl9d09So
 uxASaOI0PeZIEcocfnl1U/kBc+jIpoxYCqNSUURgXixOuLUPEX/i8GMB5PUga+jgjdWk
 zgHD2E/2Uva13KTGKXBXS1W7/DUoyfqBRRzRefQhHI6SoQZVTc0j1wcHzjM3JtJ/UtkE
 pk7UH+Il1CEfdWsWw1BtGOk75drQSCy1jHfgyo+sY8jx4p9WCpg8YWQNzI5EnQXP/yaW
 v0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e4xrrpgYOaF663BLSzK80qJc3I8m6lF7uJTKGMewavI=;
 b=BwIhogELclBIM84R648xbUVs+E+Tv1WCfNBuZR10gO4ys1GbRtuFDmVvZSHw1GdZS+
 WW3PsvuTw/CBU1MMEsNuK7yh92otyxGiugWs1oyi6goFf4Rg0h7ZRwBckqSMb/zZZDvW
 hdMiaYiKh6bvAB8nQcA6X6o7oKNIv60+NHkxs9JoyWnf0UoGHlfldmgIFQIU3rUX+tvc
 W0HJSR9iNzIbCpKVzgEbhbFHu4QW50DU1pa127rDjKmulXZ/5wVm9HyVz3yS3EZGnIDP
 CNBF7xqQcJNSAp63wVjrJatGlTF5V+1Xq89GLOuBPCuYvM9fmlpGAYmRmAgEZU/6oLVB
 a7CQ==
X-Gm-Message-State: AOAM5302zT7nhEfCqwcDfeSNDTJh2fu2lp41ZQY/KR5uSVQ54WZYq13f
 fBI3L7PCxTytndj6J53bNwQ=
X-Google-Smtp-Source: ABdhPJz+eqXwCBeepHSuqKLwbbGJNaDBkZj0hOraXcYQRD/+xlruXP/RDUCJDg2aBVd7NI4dDRLATg==
X-Received: by 2002:aca:1b15:: with SMTP id b21mr11543751oib.155.1621872716820; 
 Mon, 24 May 2021 09:11:56 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id l19sm989445otk.65.2021.05.24.09.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 09:11:56 -0700 (PDT)
Subject: Re: Quanta's CCLA Schedule A update 2021-05-24
To: =?UTF-8?B?QnVkZHkgSHVhbmcgKOm7g+Wkqem0uyk=?= <Buddy.Huang@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <HK0PR04MB2563DB4805E75C4AA929551C9D269@HK0PR04MB2563.apcprd04.prod.outlook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <2df91cab-1700-1283-52b0-dd3a66615a04@gmail.com>
Date: Mon, 24 May 2021 11:11:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <HK0PR04MB2563DB4805E75C4AA929551C9D269@HK0PR04MB2563.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=big5; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?B?Q29zbW8gQ2hvdSAo5ZGo5qW35Z+5KQ==?= <Cosmo.Chou@quantatw.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On 5/23/21 11:16 PM, Buddy Huang (¶À¤ÑÂE) wrote:
> Hi team,
> 
> Please find the attached file for updated Schedule A of CCLA from Quanta.

Your Schedule A has been received. Thanks for keeping it updated!

Kurt Taylor (krtaylor)

> 
> Sincerely,
> 
> Buddy
> 

