Return-Path: <openbmc+bounces-2162-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE7FC43458
	for <openbmc@archiver.kernel.org>; Sun,  5 Jul 2026 05:36:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gtGSC6hw2z2ygg;
	Sun, 05 Jul 2026 15:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783120372;
	cv=none; b=h1mYX8nLfFmTTzVJzwf7fK5/lZrihSeNBVmJwzbsttMv2YwJtEo0Z2nT/0Dwy07CvciOv3BWvSOPH3g3JZbqHlPdr6/f6aPByf7wetYEsPoatC33/bxrwXYgXK5Cca7oYIDr4nKA3HLQTLrTyKbEyaMNpAaGZ3Zi9cqGbPcuFXRyW82KnCm7tW2jfkHPhyaAmmVRb6cnbnDDXIY0j6YlN7D8JdwB853s0YvxXB32XmJGAaZmH5gGTR49qorJUHBA+5tNMQpLJ7ir1S5ag8yBagbHv/5mW58KmiYnECWDWf+rjrkh4VEVMNUbpnTVkY0UQPHlAeehAXXd6zwSsLEepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783120372; c=relaxed/relaxed;
	bh=ptvjiVFY55mHuzyR7IOPZN3qjRdO4GwgfZdidGQ+xdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmDqqKgVt+FMJLsp2MeE1jwVwVAZHy5tYTXb6dAxttC2OZBXY5CMpikLO8ZgSa4eqlGmDx/Jx9bmcW2HFUcaWfy0hZMdgEyWIYiHm2qavFEGY2FHKTnrQS1hzeirOmD1KnYFJq9EtS0BZCXFRrNO7W7xIw9KCuOz1H/U2SCTNck7oppKBbmZTzm5M9AzKimrSkfmqTBXf41jMDMutg56a+gK+WG/0MS8GzjETdcYtDkobC17E7v62SmyVC9y9OvJofO331iOg51wBpuf1wSPu9jmiIO4ZoyiPeP7PqGKZL54OMnVGlKHD3+mIFOHICQLeYOaxQMPvqk0xIi0jg+cBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MwuefZpS; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKcJicAM; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=dmitry.baryshkov@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MwuefZpS;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fKcJicAM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=dmitry.baryshkov@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gsV0H5FXtz2xF8
	for <openbmc@lists.ozlabs.org>; Sat, 04 Jul 2026 09:12:46 +1000 (AEST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPb1b1019684
	for <openbmc@lists.ozlabs.org>; Fri, 3 Jul 2026 23:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ptvjiVFY55mHuzyR7IOPZN3q
	jRdO4GwgfZdidGQ+xdk=; b=MwuefZpSFTvuNgJyrkHy6OEbxdQIh4zwoxkeV0v1
	SeNT+DdlpzYtM/NzLKO5cRhFyyJnebuIF5IKibnQH9YpiTNtspV6uDvHww+LUUZw
	Z26z8Ghqy1Bdy97MgjMlCybQAcNvxhH7AanAObFO0nN5IPodyrTpWh3DwjILH5JS
	lGZlFabkn+OlzqLPqxZPmZYtMum9AdRVSTRs/wP4GOzKS3Aj0HWCmra/f6MkDSMw
	qYaBJCD0DDY6/4P6Rd9xzPP5E3hUq7S5beve23YXYe29Mo8LO5BMBx2bJeVN/Pjr
	eFrVkDRH+FB3sjLbh5P/z/JAV4UUnzJ+/KZJdzBA5COZEg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj20ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 23:12:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso20865526d6.0
        for <openbmc@lists.ozlabs.org>; Fri, 03 Jul 2026 16:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783120363; x=1783725163; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ptvjiVFY55mHuzyR7IOPZN3qjRdO4GwgfZdidGQ+xdk=;
        b=fKcJicAMqk0nS6XCjY8aa7+50EJMVE0cSc+e+OcUjKvylnbgql7HtfDmgNTKTY7KFY
         oX/r1sLj6djSyvCYufXkVu56jamn6DWAblFHLTWS91FzdoJCP98i9IBtdSknOqDftbjt
         2SxYASk9MtHEhy6M7pp7GXoE+DasBY4ECXsrhmBIzC4VOEKUGyGm9upFPYyjax4DKqEf
         farxeJx9GOt9Y4JbciCPjluLkaLvo0rcO7MO4Vpr+PqaxAaJWmVtkNrAD3jiEl34dOKa
         gRoZXXNwy90ZR+xv7QCZ6GWXYrHPuSid40Rq6h0tYnPD9PJ7dGTFNY6K2mQm4Bd5fGLh
         iiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783120363; x=1783725163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptvjiVFY55mHuzyR7IOPZN3qjRdO4GwgfZdidGQ+xdk=;
        b=scewxQIsLQkKNhlZfPBUea9w7hjSgadtq9XQSRIckHDePerPU/xAVrLlOqM1hGNHn0
         d7gAE1u5FY9DR02fAY5/niGDvX102uvP983539FvNNJHcg5cQctY1iz42/LQk7pPulac
         JJWFXP12Fr38P/WzCwpHE20gP1mz8iSSm9q5fFqdCIz5mBtSy0mxMdLo90OJmXhvRrW9
         Ycy9A3QLk/OJPmbfy2TCSWQrzSNwjTsWFvjRAJton8r1D4qnfxbM5NMmPjkQeU7iFNAZ
         qE3rHggwAGE2rxBpnModLAEKB8qc6rc4haInq/bvldxISsAYmkAClcevrryzkY3YSwjR
         DIDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXihgHg6HvIUA+79H5KGJpxMdL1V/wMbBqlGDMUUTRkyweqyzbDcGtEFhsALaDNK/G5AQaFdfC@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0ynb/TG+bG8crgKBCfHybkUcisvRe/1/QutB1djpK9g/gHUXL
	lVIkFg9aJWCjf7v4EcY1jBNyOZXrKUn7ecRmw21kOSIWz5LYf+FhYZzbRH7KH4/lUFkRJHfowCC
	4PrEspxK/aTXiW8YuSLagcRFd0b9liJJAVi04ocpLnq7M80ny6DetYr6spteidA==
X-Gm-Gg: AfdE7cl7AReg2k/Ue/ji9s3XG5E67FSjWkPVZIm7ZBLj8++bC69CykcDINaUlwpZ2wS
	WQrr7ZnDCnRHqiho4o8lfg6Sv/7atNujD9UKVoKEbYIZaTDtd/B5FR7aCGrziVe6vfO87inml9d
	4JxSfzzwhU6VCZaA77OQsB1e2vxpjPLOvZxG1y6meV0y/h2PNIY+KqBBdf7B8rwivFW2awImXQp
	oMyC5dPgB91vjIumIgvb+3Ze9WoMEJHFjGh2ukPrIdQeof4ghqdiwGw2qhFB8pNI222nPyrh3Qy
	7ffisyFROwy8or5lD0ocML+PUOY7yAVkSOCsSKunY0Uz18OmSIEzel8l7TGJxbUulxyzQyJSlN2
	P1yAWopvaVVKRK6D+jlAUmMxDHAjWGzsDYdAZb8FAbYdvVYuWPdXZUwyRdwXuoxDOzJio5A75zT
	3/IN1izw7bM8HKF4PlRz8r+ka+
X-Received: by 2002:ad4:5c82:0:b0:8ea:efae:ab2c with SMTP id 6a1803df08f44-8f74c0a468cmr20755566d6.38.1783120363151;
        Fri, 03 Jul 2026 16:12:43 -0700 (PDT)
X-Received: by 2002:ad4:5c82:0:b0:8ea:efae:ab2c with SMTP id 6a1803df08f44-8f74c0a468cmr20754586d6.38.1783120362600;
        Fri, 03 Jul 2026 16:12:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a0asm815528e87.71.2026.07.03.16.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:12:40 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:12:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
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
        Fugang Duan <fugang.duan@cixtech.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
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
Subject: Re: [PATCH 03/42] firmware: qcom: scm: Use
 devm_of_reserved_mem_device_init()
Message-ID: <6ejxrh43bkhryudrxk3lkzf2knlgv3mxtfgzhrzujw7km4n5bq@4bd2ahopzs4j>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703193855.110619-4-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzMyBTYWx0ZWRfX0SttRkn4ty7W
 LTtcISpkn/8TiaInMTutAkNhQJeIWGQudSD1fm/byHmYOLeZkg2y72N6jnIYTOPxP0fNWwrmG6k
 0vpdOwZzDwVI2ixw4fWxHpvdr35xwN4=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a4841ec cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Dn8qeLIeI0d_esIdenwA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: D1DsPIJd3fTptus4ixzWxq5KyaVxC5w-
X-Proofpoint-GUID: D1DsPIJd3fTptus4ixzWxq5KyaVxC5w-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzMyBTYWx0ZWRfX4rM8FGr7t7Hj
 eQIiUJOomXAkTaSPyX8N+bZAqdfKrGl3XYpnkO1S+sRK4kBdHDIHndlIiZknouT9tJdhzM9DSzs
 A5E+2lg66nOQiOO070gvIoDq9bRGw/2o8l1l4L1dN3DUuDgo3C+cGZfazAi9EJvGlHD23VvOsGT
 XmJ6Q1nFDDYFwORE48pn4rxx4HobxGLBDMydzyUQZ8WU5ZygTC7hZp4/+681dE4/2z7c8XMvX+y
 7rx5mMFQl5pKKhM4tj0ZmWK5r8MN1tV+8J28vSC77JQ4sYx8uUjsJO/w64yDqg8Z1xWr9t0mj/0
 taUp1+dFBxb4rZmQctt8d4Dqck+w7nb+/9xoFLBtNB8oxOhBq45QI8uIG6HIHoofNfYAVtxdwGf
 0bGpyuH2n/GjISv7YzzysVUC2KH5i1199GxMD3BOmTL+p8CI48TeNm0RqCXKxHIvbE3XDZhsnp7
 RPPzsO2UTz9F3puj1Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030233

On Sat, Jul 04, 2026 at 01:08:16AM +0530, Mukesh Ojha wrote:
> Switch from of_reserved_mem_device_init() to the new resource managed
> devm_of_reserved_mem_device_init() so that the reserved memory region
> is released automatically on probe failure or device unbind. This
> eliminates the err_rmem cleanup label and the need to call
> of_reserved_mem_device_release() explicitly on error paths.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

