Return-Path: <openbmc+bounces-2628-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74ADDC982EE
	for <openbmc@archiver.kernel.org>; Mon, 21 Sep 2026 13:19:51 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hpP340x5rz2yK7;
	Mon, 21 Sep 2026 23:19:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789996783;
	cv=none; b=Zlj19zPIRm0Cr3ppBh+vZedV8+GqQ8Xfz24W25ig7TVu/j9G0WjisZ+0LGmlbsuGnYea7nKk5X6lTLRhOSp93dRySSdYCahxu7QmwEK2nH+k+ABYEiUyiyoS1mH/U98o7S5bxRNXdXRIy183mQmsepU9jeLvSbjsgpMpKvK5lqK9LmbjTfrBF2Z/M7m5jhuZCZIxcbBPiuAPy6aKeykztjOZTA4BT215lGeLMXumOuwJ90gnqWaj6UIRd1MeneAlNJp8YC5K5Rzr1DSsAGsC7f21wC5DILjEzUUn5YqsSt7qgwVdt2TJC5qN5ofKX0eRagHraCBm8eLHq+G+cXoLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789996783; c=relaxed/relaxed;
	bh=Z/oNC+/AuxWcl+979km6OR9BlslfcHKkKf5e0g/b3FA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jM4KQKZ4FpCrRCJ/nYlkU9l0iAJ6rHmj5OlMwV/CkgG/J8UYBeg9e9xKmy9tsBTx3hmUaDCLNvedYavjlLP0qNyDJNw2d3A7rjl6jVV/1Lt6GBzTs4O4Hu4vgYmL573avdYgsQlBtIJms5ADm5MAwpxCTaTU+No4NS9l3nRFJCpKQju+PH8fynaSYQHhjrGimJTJZEASZQTP3Od48WvXL804UPU4NVoAstSZqRyHKj8362nHrYL57urizYZ9owyUwoMKeJFxYL4ohaWcb6114mbHxNCQeW+TI5EwNmBFHTJR0uqAKlFqkST4rgg/vvaeXvuysgbFMhuNpaAsAnLZow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Vjf9U5Hn; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=Vjf9U5Hn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com; envelope-from=tan.siewert@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com [IPv6:2a00:1450:4864:31::11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hpP321K8yz2xk7
	for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2026 23:19:41 +1000 (AEST)
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so20505485e9.2
        for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2026 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1789996777; x=1790601577; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z/oNC+/AuxWcl+979km6OR9BlslfcHKkKf5e0g/b3FA=;
        b=Vjf9U5HnnfbXmFba16UAuW4nRPAsX/Mns0RRVNpP2PfaGNGoSumXNsCgAWGvHJTtm1
         nScBEVMlC2zbuA1Y1EiMm+aqL4ivae4YWoKazYZImCCT16CuIKFtH+FmI+EOMO4ATTiJ
         km9IsQ7lyTzt51zhi/PROg23UbeFMRavclOVUbrc5ff5ROMyTFTE1L3lABWC5GVAUVwq
         LRll7UIeUQ28G+5OENE3km7BvU9LF4Wu7ddFPgSfx+hZntpzIEMcVX3rmrNGYap0luUm
         dxc69ONag1Z2eeTSUL1JBMxPqG9K0dKs9g92JsBtNsDg9kEbc/e8ivhTLVmfz3clJo/R
         A57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996777; x=1790601577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/oNC+/AuxWcl+979km6OR9BlslfcHKkKf5e0g/b3FA=;
        b=ZlVjV6gge45/FB4K7dM4ikXvm78UdybDf6r4YysAgKgbb9mo+LS9Ld8RS4l+mzXbJI
         Zm9n/goTWoz5/goyL96eulc19amjBfPmlsf6rdaWDs7achYCQqL6uhSBsNet+Zh/j7Zr
         AHavpRgeskbKqKoyShg+XQ81WIyu3SvRkxeYbJIHK0WXMaPk/Z3tr76Ch/wiChkcgzLO
         uYOOgBJ0G2Cm4ys6EEBgmwNU/T3I68J4gPhUQkG3k++WZb2eiy0vHB1ffMjTCQ5M3n3n
         k6ve/3GzW42cgmhGI7jM0wG1QWCFKpStykdqGHg4s+zDPwzbe3Wm/1cf/UpFvhsPKHrM
         Ktuw==
X-Forwarded-Encrypted: i=1; AKwUvByPokXfbMc41Nq45xmkV4kTgJlekPQGa06cDfEd41YzCy4fNMh3ueQJmkTYbdAAs75h/qAr5S/o@lists.ozlabs.org
X-Gm-Message-State: AFuF++lE49zXGysDI8IomlBDhSJDsa4Nu4tmwOl33Jm0Xb3XO2hIeov5
	VrD4c1Ynxw9gyy/8Y00h/epYCsdREE6aR5q651qwKKmqMDLzxlr92jN16BR3rUSWMTk=
X-Gm-Gg: AYBFou3EqR/4ygnGCt23A3qZhI3ofECrimFD12YcQ7Hbc0+vpBogt6zUaM3kKqgCIuv
	7RLFRkFV+wJXHO9BqoRnpREzjY2y00ARzYOMED5pfiNPknvtY0iTzn8ddXdo01SpCEB0QsT6g5t
	dFebMbiGBk8g24rj7qj6RDiULZ4DjBKreYTv7QBZ3yPdXOiKn/k00tFtOI/jU2lRubwWeok90kP
	xelFlI/eoS5pqC5e2VUykdhaMWWmUVzBRPrVZ7ETATdI9DEIb5Yar7g7i0ozAgCxejzrPHaN4T+
	xg2M7plvwZy6+Dn6H2KtGHwxFx9vCl2FO8M1610iWKJD18TCXWz4yPok8Mk4LE4jj8I3a31Skyl
	FfEz3sMvByjWZnm0B+OF+Z54u2MFYY2E6jG66X77y7gKYuuITvx400R39g+QiQkvr7xuC16uisB
	ksy9LBS7NVxMXBtnyZuL0diPjKAUBhqV3FRIhJ5GHSXwbxmknZ54fKrzKptYhp/UZiCOAyhgziQ
	Ne1pVWGtRS72JrBII7HG9Y0C9uckdYI0MbyIg36kS1yf2jRHXbUfkPtFmfzZ8gd91BavhLIVm8E
	kG8epJGlyWALMbMRI/x9gvslcDsWbUCzJ8Dnl2mB
X-Received: by 2002:a05:600c:358c:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49fc56b4ebemr182338315e9.9.1789996777316;
        Mon, 21 Sep 2026 06:19:37 -0700 (PDT)
Received: from ?IPV6:2003:e6:6714:e500:bfe4:7b00:fa11:e276? (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0f8563sm262021005e9.6.2026.09.21.06.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:19:37 -0700 (PDT)
Message-ID: <7c2d3926-3d72-41cf-a47f-40225356c2d2@9elements.com>
Date: Mon, 21 Sep 2026 15:19:36 +0200
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH u-boot] ARM: dts: aspeed: Add Nvidia MGX Vera C2 BMC
To: Jacky Huang <jackyhuang@nvidia.com>, openbmc@lists.ozlabs.org
Cc: andrew@codeconstruct.com.au, joel@jms.id.au
References: <20260921085602.752144-1-jackyhuang@nvidia.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20260921085602.752144-1-jackyhuang@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 10:56 AM, Jacky Huang wrote:
> Add a device tree for the NVIDIA MGX Vera C2 BMC, which is equipped
> with the ASPEED AST2600 SoC.
> 
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
>   arch/arm/dts/Makefile                     |   1 +
>   arch/arm/dts/ast2600-vr-c2-bmc-nvidia.dts | 155 ++++++++++++++++++++++++++++++
>   2 files changed, 156 insertions(+)
>   create mode 100644 arch/arm/dts/ast2600-vr-c2-bmc-nvidia.dts
> 
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 51e1729eeb979afc3cb59960f3fe7639f6265fb9..b037ad286e614143f5f00749f98be9dcfd254d2d 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -703,6 +703,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	ast2600-tacoma.dtb \
>   	ast2600-tacoma.dtb \
>   	ast2600-vr-bmc-nvidia.dtb \
> +	ast2600-vr-c2-bmc-nvidia.dtb \
>   	ast2600-x4tf.dtb \
>   	ast2600a0-evb.dtb \
>   	ast2600a1-evb.dtb
> diff --git a/arch/arm/dts/ast2600-vr-c2-bmc-nvidia.dts b/arch/arm/dts/ast2600-vr-c2-bmc-nvidia.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..22c82794b2ae7d898cc453a06c50b2d69685f02e
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-vr-c2-bmc-nvidia.dts

This is  the same file as the VR-NVL system, except that the compatible 
is different.

Are there any plans that more hardware will be added that will not be 
available on VR-NVL? If not, then I'd ask you to add `nvidia,vr-c2-bmc` 
to the existing `vr-nvl` device-tree.

Tan

