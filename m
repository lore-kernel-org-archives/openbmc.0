Return-Path: <openbmc+bounces-2209-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E60C43458
	for <openbmc@archiver.kernel.org>; Mon,  6 Jul 2026 12:00:07 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gv2wd1yHnz3bqV;
	Mon, 06 Jul 2026 22:00:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783326766;
	cv=none; b=LaFOpi4HloL824s/udCA3rGBJ8bDbatmATLrY5/tYVEHSay5eHdsrU/3tNqtZ5n/ii9yYCv022P5u58fmbmhakb6dKpMOQU8kiIxYoNfXPFVegHLWGOwixNTQcmLe7lTjn8zuPR5kr80yEk+rz8FwNL/p2bMOL94V7wKXE1aXjn16E5/SB4kX8VfjKlvdcM3UnZUkVuM9rtXfW6S4RNveXeM0RYCF9WiVEBJuMOF583Iv9gNDk1++KD03piv0p9Rc+ukkht8ZGoAuXUh5nJ6AM/MEyfTPa3aePNbBASw7vFgBoGvyZeUsMenXurfLtBCdKI/bbld4rEtkbWTFaVbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783326766; c=relaxed/relaxed;
	bh=u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXZKPQFhMoSj5VBNWXm8PjpvBYGrMGgbKQGuEiw2cradVvfgFQ0Gs6teqVgCtG1/B3gENbh7LzZTjwLwQU28wa8xhrLTu9oeJaI4LU6/G6T1kdbqP048RaWiCqoEXFOqpy95GB/z2kmSNkWX0QuWnJDYUpH7WOz7jUWfStJtiDYWm+kLSA1bzji5GFi76iSMebOuc6gA96sq6bKxmnTKrOiFrAkcGYRl368MXIllEu0cemqm6nyagVxjppNlRVJmmurEOgofFJ5zFvWNyMQNHeuHUWE7O4eq82q17tCsIemtMinjvC3J0Rfp5uUTARlh/UoipNK7ky6VMjzxmMcbGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tt1g9aWR; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WIwDA1cL; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=konrad.dybcio@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tt1g9aWR;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WIwDA1cL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=konrad.dybcio@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gtyKT0Gx6z3bqD
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 18:32:44 +1000 (AEST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66642DJF3618367
	for <openbmc@lists.ozlabs.org>; Mon, 6 Jul 2026 08:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=; b=Tt1g9aWRdhyI3BpO
	bvxcoGq7kYOipwI8sI86zxkmNdiblCbEIIy0D6ekqZISLjLM2a33y7RzY76GbicN
	Opq7MS5ZQyamKmgeZkedVYAFfw1KRPYi8hl3Y7h7kuir3yf0DUot7pMFqfcV2RX7
	X6ly6HXPcg70fqU+dH3N/iuMe5KE0DqLRF0s4qeJ6w03zgeEubZlkFJyH6FDUo2t
	Et+Ig2j6kpZC/v51lNaj0P+xbzzB2QuKkvGbM4AuZdQSxZloAH/4eroeiJwOgPxx
	kOehTF0x3+rZPy9CPDosN5R/kMP09AyBofAR6Pe/VMGVWMs1S1vCPm7OD23UZkSl
	ZSPxow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s64ndwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 08:32:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c27616421so10786431cf.2
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jul 2026 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326758; x=1783931558; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=;
        b=WIwDA1cL4PaI6QW8flEPPuWYp0UpI8gRPHswhm8Fp7KiWcURSzrntCz1SQh2yVkJ54
         99KPoi6tZuz4jXtuUQzjn50pKEtM88ED3rn9Pn2evgD+V+2k7I6KOjt51A1ZGPZ2AsPx
         WaixoRfZcbDqKMzN1aNGcgz7+nWZ8x6e+6S3Zt7fVzzlIdp3LpZ1j3+ru2bDTC/vT5+3
         lK0lKvgfJjDeYJ2feizbSw2VBvpaMIpYqAN165Bv1Krr6qqtAXk+67rJnXr4IZiBvmma
         FkxUcjbpSY9LCprqUOdWJKC951jsq0YeozV80YvH3BQ9DKIvLUum4h7LwlhnaaS+eEax
         MAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326758; x=1783931558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u0chLt5mv9z2EayzuLPxsiMUHQpTGQFKrRQIdFhdccs=;
        b=KXu4PE+IZPk1TBCuzy9pxu0XwM4u9oYv2jwxQ7bRscTOkt5uqCEgtjwNzqdQ1TMqKM
         e+CKs11WBVnzGq+ecOfFpGYto+Lt1Adbw7whswYC64V95Y3Tka3+Kn2jf50+4/9BIU6I
         Mw67CRa8NA9uQlzYiIIsQmhPlNEG+D+67sI7Xf18MTq7Q9c9q0V+Dpu+wdC/CMQdsyTB
         MzpajN1nH2gG5YOiZmQf3eEnzkqjpcQ3oTra74VSDFO4AXzw4C7oYm/3j1wEr1d1avTy
         wWsKZJaT/tAM2ZW0tFDxT62eLojSKZhVRzHG7atZHZ+Oei6DsfxwrZH28aXFDfrE3EH7
         1KJw==
X-Forwarded-Encrypted: i=1; AHgh+RqaYGuCczw9pMlrm90zyh1XxRVCkiLeFoUPR8LWA9kcWP4nba/yaDX4OOB7YjIDnswxxrV7Msmh@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzaB+MiMxCPKYTlklHqHYNNhCjwtGYfdN3mOBoKS2QFRmS/knM2
	j32Z7Q1Cjwb1/H5tgEcc2mvFatjXmCKtxqRe2EfTSj4oqWsPZRidM8OhLBe5nDCdCqk4fFFK8Rw
	F3+2+k7GJYnErI4cufuQB8WaBWmWoWo/j6rETRaaUs9KcABFeqcS6B5rz6RFjaQ==
X-Gm-Gg: AfdE7cnZ43REFW1tTbIX65PWCOqgat5umMmaqNILIREgHUPfoyWJcvdyZSOmG76g7GM
	TQF8rio1EnT01d2UTqQMZozdoiPYLmB5YGa+UrqanczTGM+q6Qbbwjsez6T2m7v7DY+yGIk9BKr
	XnLrHlM1i26wMyELO6jEo6uRXsXIAD5ysrQmEb1XG/oMxm4puNHzaEnbT5jc5frsI8CSzgqvaMx
	fklgyfD6Uz2k1ny4+xfJLQLYwW6N2G8Fydp2mwhUFff0/N5E9/dwDAdwiukyndHzEkDJdLoxc/Y
	/lNPbIwsSRLl8OA6LAuMfFVMnm4TDsrHXT61AsHU5nLCp/FCQscRs/H6XjA30QY12VYzGrvV8El
	wmwUrBF8b2p8P7pE53OpkYDvITKDPZqpoPAo=
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr79016581cf.5.1783326757970;
        Mon, 06 Jul 2026 01:32:37 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51c4be04aeemr79016281cf.5.1783326757507;
        Mon, 06 Jul 2026 01:32:37 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6093786sm694743966b.20.2026.07.06.01.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:32:36 -0700 (PDT)
Message-ID: <f1e7ef14-7186-4854-a832-a34596d3313f@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:32:27 +0200
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
Subject: Re: [PATCH 03/42] firmware: qcom: scm: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin
 <abrodkin@synopsys.com>,
        Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon
 <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX7HV0iYjEX4gD
 RZ3o9dPqt79K8WkxTz82ieq+8elhHlehfWHPA7ZSejYrn8jN5mVDLNDEg/VhmK9H3IwxR8tL9J9
 +b6Oz48pnIHz4qUXaL/gRjWKpduqyuaxB+MpqpfBS2h6qrUq2BT9sdrQLvQgQaXpNtkXTCxJlEU
 6x9QF/lm29dlQPSAC82VSN+J8nL8RXKmIgm3cxVKpkE3bYsGxpfhkR8ACO5uKDxVNd97H+NxKXE
 6LYfYgQ6Vt4x0bAM/oz9FRG1paAwfipdvS5QLdnlAzsRfp8acr8wS45LuoDCemHf7RFfOhC2ij4
 sp7XJpxEqOFLoTLcccs1EyLcFDvnftSO7Em8NfSWMKR5fQ1y165TRFrUMFFD1n6irGqPxwgt5E7
 CW7jJssssv9dRzINbj9bnVCQ2Z6PKHrAaa7RkzoCk4pQ0c0bvgGSuCxMiVW0r4i3OehFyUU5zNy
 5GxR1ZEk4vRLSAY1/8A==
X-Authority-Analysis: v=2.4 cv=VvITxe2n c=1 sm=1 tr=0 ts=6a4b6829 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7yxQZbK4ublJ3xJh_1MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 9FjaG9ojIf7qYxbTOjkH9u6-ahElHcbO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX8lNw2UM/eLls
 HdYOCEXvi1uyibXZZvKJZA3riB+5X59FCGvBWdCXozFn/jMFKzFU1SQNmEyglIMR8vMo/V3RjLF
 tTyNqESs+jeSt4k5qMJQMwiHKUaHw98=
X-Proofpoint-GUID: 9FjaG9ojIf7qYxbTOjkH9u6-ahElHcbO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060083

On 7/3/26 9:38 PM, Mukesh Ojha wrote:
> Switch from of_reserved_mem_device_init() to the new resource managed
> devm_of_reserved_mem_device_init() so that the reserved memory region
> is released automatically on probe failure or device unbind. This
> eliminates the err_rmem cleanup label and the need to call
> of_reserved_mem_device_release() explicitly on error paths.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Thanks!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

