Return-Path: <SRS0=wJXT=IG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE22C433E0
	for <openbmc@archiver.kernel.org>; Mon,  8 Mar 2021 05:40:12 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14DC364FAE
	for <openbmc@archiver.kernel.org>; Mon,  8 Mar 2021 05:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14DC364FAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dv6cV4r3kz3cZn
	for <openbmc@archiver.kernel.org>; Mon,  8 Mar 2021 16:40:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir;
 Mon, 08 Mar 2021 16:39:50 AEDT
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dv6c61GgLz30Qk
 for <openbmc@lists.ozlabs.org>; Mon,  8 Mar 2021 16:39:50 +1100 (AEDT)
IronPort-SDR: i2J9Bb0N74zf46cGg7bTaJLsIjniRtNW3UVZFih0GiFXPruN5FLvU3890rY2Vnmb44PzBlabz4
 9uqyfQYmPPGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="167879611"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; 
 d="scan'208,217";a="167879611"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 21:38:41 -0800
IronPort-SDR: qTJ049v2oxEAveZCJ5fpRRTn93O0nLJpMUU77nUL1hsL0OIXy4fV+NQXsuSU+bfTy4tvd06vI8
 6v6mOV77Cl9g==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; 
 d="scan'208,217";a="409171206"
Received: from rramakax-mobl.gar.corp.intel.com (HELO [10.252.168.58])
 ([10.252.168.58])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 21:38:39 -0800
Subject: Reg OpenBMC PMCI WG Meeting - Moving to Discord #PMCI Voice channel
 from Today
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
To: Andrew Jeffery <andrew@aj.id.au>, "Bhat, Sumanth"
 <sumanth.bhat@intel.com>, "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tom Joseph <tomjose@linux.vnet.ibm.com>, dkodihalli@nvidia.com,
 jk@codeconstruct.com.au
References: <68c64a4a-c655-31d8-7089-8d1cd507b34b@linux.intel.com>
Message-ID: <1f3308bf-a551-142a-e321-ac6e7eada70c@linux.intel.com>
Date: Mon, 8 Mar 2021 11:08:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <68c64a4a-c655-31d8-7089-8d1cd507b34b@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="------------CA7A6D9C2E25E2FF4F514DE6"
Content-Language: en-US
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------CA7A6D9C2E25E2FF4F514DE6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

Gentle reminder- From today we will be moving to discord #PMCI Voice 
channel for OpenBMC PMCI WG meeting.

Please connect to Discord(https://discord.gg/TMNFSSpE84 
<https://discord.gg/TMNFSSpE84>) Voice channel - PMCI (Note: Manually 
join to PMCI Voice channel).

Note: If you are facing issues in connecting to voice channel, please 
configure your VPN settings accordingly, or disconnect VPN.

Regards,

Richard

--------------CA7A6D9C2E25E2FF4F514DE6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi All,</p>
    <p>Gentle reminder- From today we will be moving to discord #PMCI
      Voice channel for OpenBMC PMCI WG meeting.</p>
    <p><span style="color: rgb(36, 41, 46); font-family: -apple-system,
        BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial,
        sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI
        Emoji&quot;; font-size: 16px; font-style: normal;
        font-variant-ligatures: normal; font-variant-caps: normal;
        font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: start; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(255, 255,
        255); text-decoration-thickness: initial; text-decoration-style:
        initial; text-decoration-color: initial; display: inline
        !important; float: none;">Please connect to Discord(</span><a
        href="https://discord.gg/TMNFSSpE84" rel="nofollow"
        style="box-sizing: border-box; background-color: rgb(255, 255,
        255); color: var(--color-text-link); text-decoration: none;
        font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe
        UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color
        Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;">
        https://discord.gg/TMNFSSpE84 </a><span style="color: rgb(36,
        41, 46); font-family: -apple-system, BlinkMacSystemFont,
        &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple
        Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: start; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;">) Voice
        channel - PMCI (Note: Manually join to PMCI Voice channel).</span></p>
    <p>Note: If you are facing issues in connecting to voice channel,
      please configure your VPN settings accordingly, or disconnect VPN.</p>
    <p>Regards,</p>
    Richard
  </body>
</html>

--------------CA7A6D9C2E25E2FF4F514DE6--
