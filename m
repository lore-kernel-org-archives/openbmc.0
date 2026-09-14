Return-Path: <openbmc+bounces-2590-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EF0C88E75
	for <openbmc@archiver.kernel.org>; Tue, 15 Sep 2026 00:01:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hkMch64KGz2y8p;
	Tue, 15 Sep 2026 10:01:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.180.131 arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789380602;
	cv=pass; b=Wr1ZFStmyaFYZvqrAUVfCpx+ms8LNqeZZ16y9vVdFQsdNGG8Z/YTV/WrPhsHuOVbLwXq9g1vDxsEumfJU7B3HJPqFZTEAPIQCl80nrfjvoplJtl2V6DLXV99Z1kcx5a+NZVX4H2KS2jELnPR5WK0CUkb3wEkvv4lKbIZu0//5zib7eqdmbrNYzEeggkRrQw8H2U4xAQWPaz7aQWI5dalWaYxnAbOUAbU66ptVARNoTxHy05ZPqgZaBOgfhAj3Ww1U99JGaVBwIVW1z3kFAlSiQ4mMDacdDXVEHo5Z3ps/VH96tXUhf4v+wfYKeqE1xv1SOR4mjAYXNu2Hl6UUlIGgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789380602; c=relaxed/relaxed;
	bh=M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9y5ljRi6QMk8svlodV/CVf78i8J8OlT1JuTGdFb1KWxJvWnlunuOimVdPz7kgPGaeRAyZ46hJr8gOSFteVZl1bfZkSvMWgbERvN4hLo4MEjOFzX7VIh0+P7/1SCRzGrsfnX13dkV5GI1vui0nYeL0vlBIZrFUDfAZiLEsiUd9tu3kHk+1RFGcta3c4Gj5ndu61+rD9fDTe4mQSwJfJYO6O1x/27u/G8OKrig9EgKj5QNBEj3xRpuD1+Y68rfdrNhKs7mjHu3MhKv2sE+H63IVZrABOGZfo2osh4iF9u7PxYMaf/V3D5s3b3pVMpr2fk2xJ/6Y5UUAJAHGL+eAyyZA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cd1MyXOo; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iC2TZ167; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=ulf.hansson@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cd1MyXOo;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iC2TZ167;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=ulf.hansson@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hk19P4v9qz2xBK
	for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2026 20:09:56 +1000 (AEST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9no3r085578
	for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2026 10:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=; b=cd1MyXOoNTeupvMQ
	1vlzwu5O9fxeTHN1l64x7hYxAujJXzKCr2fbv9EZX3jztY8QgA3bEZef7KsAMG0Y
	TpweHent0/06oxXjwNiUy69cLhEs3kQa+1FH0mH6pmWttYiTZirymHZCQliftGJK
	xD/mTq439qWXuH534GY9JYVWAu9ZMnjUpgL9Mfhbyful2WZqAvrC8uES+ZxUGAGE
	Ns9w53JtZXdxDqMJwCIuhBgM/xW8vEWWGbQaDEjzKqx7a8UwaGrBeh0bD59fG0Wc
	qmpoz10K8tCCzLSstgxH7TdoWJ4m2zAJerQpmC4T7IM94HQn3vHbZG9Hvrs6Dse9
	3CyQTw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9de318-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2026 10:09:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso2837534a12.1
        for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2026 03:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789380591; cv=none;
        d=google.com; s=arc-20260327;
        b=Ihcfm54AbKBNHvH9mYZ15oF1uM2aO825VefUte1KZDBdLPSAoOnhjK0zq0LgwfbDM3
         3phAHNByL4pXLrP8WqLj1LasSeGXkemOn2tfunTUlyq2GmqV2lcGdkLY8K0c8T8Rp0rg
         KBeS9JwPOxcDgsG6WjaaX2nfziC+C75uIIMt6etRQydjMdcGXyzsiS1BahaceeytH5NE
         7vhxaWufqIzg1B4IzpjXg/+6cfextFQOkS5N36MZ2bk+XZTCIYpnNos5zOcFuV6JgceP
         +PBMygoV/6IJPa5hZQynA+r54w+hNA8Q6sb97RI9hI28NTRpXcsW0pxb7x7a/BhE8MZZ
         gbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=;
        fh=32qMyaVKOX5qDKoGH0LolOgTNGCCd+864qNEnm/NZHg=;
        b=UKYeDzM2Nvc/pH9/KriMUJfxakOCKVvA5tsreoOfXe0GgOu8lKa5uGF3LcWS2IbZKS
         jquW3IJgBy5PuAaloZje+b647fEBpDBcBT0kbO+BvvPttwoCrqt+8kR6THyGoX/4vpL3
         CEydtpnPjy481czmZUpeIOFatYl7EO/BlhrTt4+Vc6haQmgcf7BXcgWER3M+HdKuOFOW
         2VUvx5m4D2sLAeOF8A9NF1aFuJXmG44IvO6xhixbEthT/OfcLKCvlbsO7nMb4fFHqOmE
         9mXUls70m8Sd56sde57PYDG/RrH2YAN045TezYRLEdWs+VGgubl8Az9SIcrmGrLWc9zF
         j64w==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380591; x=1789985391; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=;
        b=iC2TZ167ghO1gmrB/6K3Ar3UVmHw/GwQP7w+0TwaI4qeCbe3l1Rn/uwXbTLuitU1zA
         LRZYhSIcyYefl5uHEFdPs6qgtOCCjqpT4hQNqUTpNgwi++A91BZ/DT435p9ne8BCiLH2
         J2Q8oCDW1lZa5t82n+UvVtRZsTDySNxO++2yedCih8Go4kLIcjecazEn03nwm/6WrN2w
         mvpIK8seH7MoIp22BjuW3j1pjGMQAcHAio+HJPXw0zqaZ2xw8O4rpGDHWigV1jYHqtYu
         sXoSepRiskM/JRFrSLnN0HWEY9IphcLlQdds+p1RtDA5CZdQ7EPsJJU7s/d/HWXXwyWx
         APoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380591; x=1789985391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M12Cwh3ZRT6ahFa1J+DXeT+ShEs3pxzKaObkmR8W2j4=;
        b=eqGUkP8phUK5hxyiI5CK1tB8zWs015nP5dLaM3gnfd8z+tek2qt3sgRMrYNVZj41l3
         OZZsRJYgzMPZF2UHZfXr1IvYKQzKTzE9jRQXZfetPZEjOgWhFq0E7yhJ1obawJKy/dLB
         4sBhjHvhTU2tV6EN4AuGHcv7wKSk6TxwiA9jHl9r8ei9LP1hdI5FVt2Px/Cy2lwNQNjE
         c7BSStKPa/ZvbCgjx/UjBkrxBUrLxejrOvFogDdQkmWgxP/9l3dk3yjNYX9XGTx3S6Zi
         ybVePxRQT/vqRKMScLCUlESx+ytgmB7102TH/PYtoQKbeXQGGNxyOonUJrHR0ao50GHE
         OkbQ==
X-Forwarded-Encrypted: i=1; AKwUvByR9yEcdL0IPlbDgSWdNU78LtG7qfderASmIU5OYppEm0PiJTL93Zp3ezngCD8HEsCZngD9YMOl@lists.ozlabs.org
X-Gm-Message-State: AFuF++k3fJDiOLEr/2c9RLKyrF/UV2SZuE5+GGfxxvCUeFW+23ffZ7D9
	DU4ZOzYFVpqbxeQVkZOr1brVBOggtRClLFfkVBzPXrCMlX5eQRh4jgdUykBaRxZcXR/tIiW3QR0
	6XO0U3UTOWRvGpViyhk9AfHcGrb1qAcDLg4ALtLcH6Ju2PTWU13ZvTShc5t5vkPqisWygvqc93M
	Vdyilaj+nRM4AvYeKhO7izSvw8yj4xI/ado002
X-Gm-Gg: AYBFou0vCzY7lNKeWOCb5plj/len5cjFvhjKKcCBKfqIeW49NpjtGAsNhuC39ZgCKaD
	4uJLuywwW8pWTthDI6yIn3/LGLg22q0cXi1DNR3waGVzlD6VcSDaZ8/YdcEps7kwAQakisvCYdh
	7x+juvn6j6hx4XmvJpgFeX44w64HrQNV6ywuppYCrfedAevsV5Sg+w5mTl7g==
X-Received: by 2002:a17:903:b8e:b0:2d8:d4d3:3fbb with SMTP id d9443c01a7336-2dd6c73445amr40754465ad.15.1789380591328;
        Mon, 14 Sep 2026 03:09:51 -0700 (PDT)
X-Received: by 2002:a17:903:b8e:b0:2d8:d4d3:3fbb with SMTP id
 d9443c01a7336-2dd6c73445amr40754055ad.15.1789380590927; Mon, 14 Sep 2026
 03:09:50 -0700 (PDT)
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
References: <20260913223538.91579-1-mhun512@gmail.com>
In-Reply-To: <20260913223538.91579-1-mhun512@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:09:39 +0200
X-Gm-Features: AcwNN1UKvtuQqttQbqd993vkvprGXBb1M6WJsKdk_G31r2WFSme_tK7rANZaz_8
Message-ID: <CAPx+jO-Vck8PzQjg4yn6ft4Rms2_9eSOLpbAQryMLChY87BPMA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-of-aspeed: Remove children before releasing
 SDC resources
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXwTk3+ztFMxTV
 lfIZkyDdUWDyEh5YR50i1f9fb5W7zGrD2dMMwPr8NSbjDzaVMqOAErkN/RngAZq3GuVi9BV0Wxj
 GzZSNB2ljrAc1yOQ6Nqa7gGVFjnsKvmwWogLIZJGMq1GJRFKPxQ/HWURq7HwMEI7SDxxRM1oioe
 1sLHq1fwEcQaA0JZmqyKv78KuJom+JK+ruEeVUGWqUhQ54tboimbsN414T0IPHoB5KB2nkY65q3
 pHWgFBTr4r/uuvI7QLrsKaxZLo2x3OpiZSNH510MBxHIBF6QdnfGG+Uy1+9J+NlUu2tVSb5fM0m
 UYlB2+XMyAPgakLVuSFuVJ+QPu3Jg6V9b5ZA7a2XP87IdxUoM1BUyjjpw/95887P0huNQbILLyY
 lBrMDFTFOeLj60m/aQ3JN0Pj5gYPDArq3tQGTzt9PBtlAUPz1Phz9EygA/lk7kJMf1ehKMvAosS
 k/ZxMCet6HN/Hg3N2RA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX9cwJb92tq73s
 uPjvDsr3o4SvwSnbe9f1dnr23O4rTE8hrwkCdV42dghm3o7fniZ9GFGnFYOT728yAbrpi939STP
 E1Ka1uUHbTk6GyNk9SG0hM/8oZJkS68=
X-Proofpoint-GUID: vhsEpA6Q5iqAwnZYnyDYe5bXFpO9ygJu
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa7c7f0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=_cOgsa2NosUwn6K3uuEA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: vhsEpA6Q5iqAwnZYnyDYe5bXFpO9ygJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140145

On Mon, Sep 14, 2026 at 12:35=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> =
wrote:
>
> Probe failure and removal leave SDHCI child devices registered after the
> parent clock and managed resources are released.
>
> Unregister the OF children in reverse order before disabling the parent
> clock on both paths. Use of_platform_device_destroy() because manual
> child creation does not set the flag required by of_platform_depopulate()=
.
>
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>
> Fixes: bb7b8ec62dfb ("mmc: sdhci-of-aspeed: Add support for the ASPEED SD=
 controller")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> Assisted-by: OpenAI:GPT-5.6

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> Validated with an ARM64 W=3D1 object build and strict checkpatch.
> No hardware runtime, probe-failure injection or unbind testing was done.
>
>  drivers/mmc/host/sdhci-of-aspeed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-=
of-aspeed.c
> index f5d973783c..d317626feb 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -560,12 +560,14 @@ static int aspeed_sdc_probe(struct platform_device =
*pdev)
>                 cpdev =3D of_platform_device_create(child, NULL, &pdev->d=
ev);
>                 if (!cpdev) {
>                         ret =3D -ENODEV;
> -                       goto err_clk;
> +                       goto err_children;
>                 }
>         }
>
>         return 0;
>
> +err_children:
> +       device_for_each_child_reverse(&pdev->dev, NULL, of_platform_devic=
e_destroy);
>  err_clk:
>         clk_disable_unprepare(sdc->clk);
>         return ret;
> @@ -575,6 +577,7 @@ static void aspeed_sdc_remove(struct platform_device =
*pdev)
>  {
>         struct aspeed_sdc *sdc =3D dev_get_drvdata(&pdev->dev);
>
> +       device_for_each_child_reverse(&pdev->dev, NULL, of_platform_devic=
e_destroy);
>         clk_disable_unprepare(sdc->clk);
>  }
>
> --
> 2.50.1

